#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  run-codex-client-validation.sh \
    --prompt-file FILE \
    --output-dir DIR \
    [--root PATH] \
    [--timeout-seconds N] \
    [--model MODEL] \
    [--sandbox MODE]

Example:
  bash scripts/run-codex-client-validation.sh \
    --prompt-file /tmp/prompt.txt \
    --output-dir /tmp/codex-run \
    --root /Users/boyzcl/Documents/Complex_Task \
    --timeout-seconds 120 \
    --sandbox workspace-write
EOF
}

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROMPT_FILE=""
OUTPUT_DIR=""
TIMEOUT_SECONDS="120"
MODEL=""
SANDBOX_MODE="read-only"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --prompt-file)
      PROMPT_FILE="${2:-}"
      shift 2
      ;;
    --output-dir)
      OUTPUT_DIR="${2:-}"
      shift 2
      ;;
    --root)
      ROOT_DIR="${2:-}"
      shift 2
      ;;
    --timeout-seconds)
      TIMEOUT_SECONDS="${2:-}"
      shift 2
      ;;
    --model)
      MODEL="${2:-}"
      shift 2
      ;;
    --sandbox)
      SANDBOX_MODE="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

[[ -n "$PROMPT_FILE" ]] || { echo "--prompt-file is required" >&2; exit 1; }
[[ -f "$PROMPT_FILE" ]] || { echo "Prompt file not found: $PROMPT_FILE" >&2; exit 1; }
[[ -n "$OUTPUT_DIR" ]] || { echo "--output-dir is required" >&2; exit 1; }
[[ "$TIMEOUT_SECONDS" =~ ^[0-9]+$ ]] || { echo "--timeout-seconds must be an integer" >&2; exit 1; }
[[ "$SANDBOX_MODE" =~ ^(read-only|workspace-write|danger-full-access)$ ]] || {
  echo "--sandbox must be one of: read-only, workspace-write, danger-full-access" >&2
  exit 1
}

mkdir -p "$OUTPUT_DIR"

RUN_HOME="$(mktemp -d)"
mkdir -p "$RUN_HOME/.codex"

if [[ -f "$HOME/.codex/auth.json" ]]; then
  cp "$HOME/.codex/auth.json" "$RUN_HOME/.codex/"
fi

if [[ -f "$HOME/.codex/config.toml" ]]; then
  cp "$HOME/.codex/config.toml" "$RUN_HOME/.codex/"
fi

if [[ -d "$HOME/.codex/skills" ]]; then
  cp -R "$HOME/.codex/skills" "$RUN_HOME/.codex/"
fi

cat >"$OUTPUT_DIR/meta.json" <<EOF
{
  "root_dir": "$ROOT_DIR",
  "prompt_file": "$PROMPT_FILE",
  "timeout_seconds": $TIMEOUT_SECONDS,
  "model": "${MODEL:-default}",
  "sandbox": "$SANDBOX_MODE",
  "isolated_codex_home": "$RUN_HOME/.codex"
}
EOF

export RUN_HOME ROOT_DIR PROMPT_FILE OUTPUT_DIR TIMEOUT_SECONDS MODEL SANDBOX_MODE

python3 <<'PY'
import json
import os
import signal
import subprocess
import sys
from pathlib import Path

run_home = os.environ["RUN_HOME"]
root_dir = os.environ["ROOT_DIR"]
prompt_file = os.environ["PROMPT_FILE"]
output_dir = Path(os.environ["OUTPUT_DIR"])
timeout_seconds = int(os.environ["TIMEOUT_SECONDS"])
model = os.environ["MODEL"].strip()
sandbox_mode = os.environ["SANDBOX_MODE"].strip()

stdout_path = output_dir / "stdout.log"
stderr_path = output_dir / "stderr.log"
events_path = output_dir / "events.jsonl"
last_path = output_dir / "last.txt"
status_path = output_dir / "status.json"

cmd = [
    "codex",
    "exec",
    "-C",
    root_dir,
    "--sandbox",
    sandbox_mode,
    "--json",
    "-o",
    str(last_path),
]

if model:
    cmd.extend(["--model", model])

cmd.append("-")

env = os.environ.copy()
env["HOME"] = run_home

with open(prompt_file, "rb") as f:
    prompt_bytes = f.read()

with open(stdout_path, "wb") as stdout_f, open(stderr_path, "wb") as stderr_f:
    proc = subprocess.Popen(
        cmd,
        stdin=subprocess.PIPE,
        stdout=stdout_f,
        stderr=stderr_f,
        env=env,
        preexec_fn=os.setsid,
    )
    timed_out = False
    try:
        proc.communicate(prompt_bytes, timeout=timeout_seconds)
    except subprocess.TimeoutExpired:
        timed_out = True
        os.killpg(proc.pid, signal.SIGTERM)
        try:
            proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()

status = {
    "status": "timeout" if timed_out else ("completed" if proc.returncode == 0 else "failed"),
    "exit_code": proc.returncode,
    "timeout_seconds": timeout_seconds,
}

stdout_text = stdout_path.read_text(encoding="utf-8", errors="replace")
if stdout_text:
    events_path.write_text(stdout_text, encoding="utf-8")
else:
    events_path.write_text("", encoding="utf-8")

status["events_present"] = bool(stdout_text.strip())
status["last_message_present"] = last_path.exists() and bool(last_path.read_text(encoding="utf-8", errors="replace").strip())
status["stderr_present"] = bool(stderr_path.read_text(encoding="utf-8", errors="replace").strip())

status_path.write_text(json.dumps(status, ensure_ascii=True, indent=2) + "\n", encoding="utf-8")

if timed_out:
    sys.exit(124)
if proc.returncode != 0:
    sys.exit(proc.returncode)
PY
