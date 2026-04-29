#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scaffold-round2-client-run.sh --slot SLOT --client CLIENT --mode MODE --slug SLUG --title TITLE [--date YYYY-MM-DD] [--root PATH]

Example:
  scaffold-round2-client-run.sh \
    --slot C1 \
    --client Codex \
    --mode full \
    --slug codex-full-path \
    --title "Codex Full Path Validation"
EOF
}

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DATE_OVERRIDE=""
SLOT=""
CLIENT=""
MODE=""
SLUG=""
TITLE=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --slot)
      SLOT="${2:-}"
      shift 2
      ;;
    --client)
      CLIENT="${2:-}"
      shift 2
      ;;
    --mode)
      MODE="${2:-}"
      shift 2
      ;;
    --slug)
      SLUG="${2:-}"
      shift 2
      ;;
    --title)
      TITLE="${2:-}"
      shift 2
      ;;
    --date)
      DATE_OVERRIDE="${2:-}"
      shift 2
      ;;
    --root)
      ROOT_DIR="${2:-}"
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

[[ -n "$SLOT" ]] || { echo "--slot is required" >&2; exit 1; }
[[ -n "$CLIENT" ]] || { echo "--client is required" >&2; exit 1; }
[[ -n "$MODE" ]] || { echo "--mode is required" >&2; exit 1; }
[[ -n "$SLUG" ]] || { echo "--slug is required" >&2; exit 1; }
[[ -n "$TITLE" ]] || { echo "--title is required" >&2; exit 1; }

RUN_DATE="${DATE_OVERRIDE:-$(date +%F)}"
SLOT_LOWER="$(printf '%s' "$SLOT" | tr '[:upper:]' '[:lower:]')"

ARTIFACT_DIR="$ROOT_DIR/docs/evals/round-02-artifacts/$SLUG"
RUN_FILE="$ROOT_DIR/docs/evals/round-02-runs/${SLOT_LOWER}-${SLUG}.md"

for path in "$ARTIFACT_DIR" "$ROOT_DIR/docs/evals/round-02-runs"; do
  mkdir -p "$path"
done

for file in \
  "$ARTIFACT_DIR/01-client-task.md" \
  "$ARTIFACT_DIR/02-observation-log.md" \
  "$ARTIFACT_DIR/03-outcome-summary.md" \
  "$RUN_FILE"; do
  if [[ -e "$file" ]]; then
    echo "Refusing to overwrite existing file: $file" >&2
    exit 1
  fi
done

cat >"$ARTIFACT_DIR/01-client-task.md" <<EOF
# Client Task

## Slot

$SLOT

## Client

$CLIENT

## Mode Target

$MODE

## Title

$TITLE

## Date

$RUN_DATE

## Raw User Input

[待补充]

## Expected Behavior

[待补充]
EOF

cat >"$ARTIFACT_DIR/02-observation-log.md" <<EOF
# Observation Log

## Trigger

[待补充]

## Stage Broadcast

[待补充]

## Path Selection

[待补充]

## Runtime Use

[待补充]

## Notes

[待补充]
EOF

cat >"$ARTIFACT_DIR/03-outcome-summary.md" <<EOF
# Outcome Summary

## Result

[待补充]

## Was The Skill Helpful

[待补充]

## What Broke Or Needed Intervention

[待补充]

## Follow-up Changes

[待补充]
EOF

cat >"$RUN_FILE" <<EOF
# $TITLE

## Client

$CLIENT

## Date

$RUN_DATE

## Intended Path

$MODE

## Trigger Assessment

- Did the skill trigger?
- Was the trigger automatic, hinted, or manual?
- Was the trigger appropriate?

## Stage Broadcast Quality

- Were stage changes clear?
- Did the client preserve the flow cleanly?

## Path Selection

- Did the run stay on the intended path?
- If it switched, was that correct?

## Runtime Reuse

- Which promoted assets were read?
- Did the recall help or distract?

## Output Quality

- Did the final result solve the actual task?
- Did the process reduce rework risk?

## Friction

- What required manual steering?
- What was client-specific?

## Final Judgment

- Clearly helpful / Marginal / Not worth the process

## Notes

[待补充]
EOF
