#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_files=(
  "$ROOT_DIR/README.md"
  "$ROOT_DIR/README_EN.md"
  "$ROOT_DIR/CHANGELOG.md"
  "$ROOT_DIR/docs/claude-code-compatibility.md"
  "$ROOT_DIR/docs/runtime-asset-boundary.md"
  "$ROOT_DIR/docs/first-run-example.md"
  "$ROOT_DIR/docs/why-this-helps.md"
  "$ROOT_DIR/docs/runtime-memory-spec.md"
  "$ROOT_DIR/docs/runtime-governance.md"
  "$ROOT_DIR/docs/smoke-checklist.md"
  "$ROOT_DIR/docs/validation-matrix.md"
  "$ROOT_DIR/docs/cases/README.md"
  "$ROOT_DIR/docs/evals/README.md"
  "$ROOT_DIR/docs/evals/ai-native-judgment-2026-04-16.md"
  "$ROOT_DIR/docs/evals/round-01-execution-plan.md"
  "$ROOT_DIR/docs/evals/round-01-new-task-definitions.md"
  "$ROOT_DIR/docs/evals/task-run-scorecard-template.md"
  "$ROOT_DIR/docs/evals/scaffold-usage.md"
  "$ROOT_DIR/docs/evals/runtime-reuse-log.md"
  "$ROOT_DIR/docs/evals/round-01-task-board.md"
  "$ROOT_DIR/docs/evals/round-01-runs/README.md"
  "$ROOT_DIR/docs/evals/round-02-client-validation-plan.md"
  "$ROOT_DIR/docs/evals/round-02-task-board.md"
  "$ROOT_DIR/docs/evals/round-02-assessment.md"
  "$ROOT_DIR/docs/evals/ai-native-decision-2026-04-17.md"
  "$ROOT_DIR/docs/evals/session-handoff-2026-04-17.md"
  "$ROOT_DIR/docs/evals/client-trigger-log.md"
  "$ROOT_DIR/docs/evals/round-02-runs/README.md"
  "$ROOT_DIR/docs/evals/round-02-scaffold-usage.md"
  "$ROOT_DIR/docs/evals/codex-client-runner.md"
  "$ROOT_DIR/docs/evals/claude-code-unblock-checklist.md"
  "$ROOT_DIR/docs/evals/round-01-runs/r1-research-review-baseline.md"
  "$ROOT_DIR/docs/evals/round-01-runs/p1-skill-bootstrap-baseline.md"
  "$ROOT_DIR/docs/evals/round-01-runs/i1-project-remediation-baseline.md"
  "$ROOT_DIR/docs/evals/round-01-runs/p2-v0.2.0-release-gate.md"
  "$ROOT_DIR/docs/evals/round-01-runs/i2-i2-runtime-scaffold.md"
  "$ROOT_DIR/docs/evals/round-01-runs/r2-r2-runtime-memory-research.md"
  "$ROOT_DIR/docs/evals/round-01-artifacts/p2-v0.2.0-release-gate/01-requirement-consensus.md"
  "$ROOT_DIR/docs/evals/round-01-artifacts/p2-v0.2.0-release-gate/02-task-execution-prompt.md"
  "$ROOT_DIR/docs/evals/round-01-artifacts/p2-v0.2.0-release-gate/03-self-review-and-summary.md"
  "$ROOT_DIR/docs/evals/round-01-artifacts/i2-runtime-scaffold/01-requirement-consensus.md"
  "$ROOT_DIR/docs/evals/round-01-artifacts/i2-runtime-scaffold/02-task-execution-prompt.md"
  "$ROOT_DIR/docs/evals/round-01-artifacts/i2-runtime-scaffold/03-self-review-and-summary.md"
  "$ROOT_DIR/docs/evals/round-01-artifacts/r2-runtime-memory-research/01-requirement-consensus.md"
  "$ROOT_DIR/docs/evals/round-01-artifacts/r2-runtime-memory-research/02-task-execution-prompt.md"
  "$ROOT_DIR/docs/evals/round-01-artifacts/r2-runtime-memory-research/03-self-review-and-summary.md"
  "$ROOT_DIR/docs/cases/case-01-research-review.md"
  "$ROOT_DIR/docs/cases/case-02-skill-bootstrap.md"
  "$ROOT_DIR/docs/cases/case-03-project-remediation.md"
  "$ROOT_DIR/docs/cases/before-after-comparison.md"
  "$ROOT_DIR/docs/releases/v0.2.0-release-gate.md"
  "$ROOT_DIR/docs/releases/v0.2.0-readiness-assessment.md"
  "$ROOT_DIR/docs/releases/v0.2.0-release-notes.md"
  "$ROOT_DIR/docs/research/ai-native-runtime-memory-patterns-study.md"
  "$ROOT_DIR/skill/complex-task-orchestrator/SKILL.md"
  "$ROOT_DIR/skill/complex-task-orchestrator/references/failure-handling.md"
  "$ROOT_DIR/skill/complex-task-orchestrator/references/success-criteria.md"
  "$ROOT_DIR/skill/complex-task-orchestrator/runtime/README.md"
  "$ROOT_DIR/skill/complex-task-orchestrator/runtime/captures/2026-04-17-release-gate-design.md"
  "$ROOT_DIR/skill/complex-task-orchestrator/runtime/captures/2026-04-17-i2-runtime-scaffold.md"
  "$ROOT_DIR/skill/complex-task-orchestrator/runtime/captures/2026-04-17-r2-runtime-memory-research.md"
  "$ROOT_DIR/skill/complex-task-orchestrator/runtime/promoted/failure-modes/memory-friction-suppresses-capture.md"
  "$ROOT_DIR/skill/complex-task-orchestrator/runtime/promoted/failure-modes/over-extraction-causes-memory-drift.md"
  "$ROOT_DIR/skill/complex-task-orchestrator/runtime/state/runtime-memory-manifest.json"
  "$ROOT_DIR/scripts/install-codex-skill.sh"
  "$ROOT_DIR/scripts/install-claude-code-skill.sh"
  "$ROOT_DIR/scripts/scaffold-round1-run.sh"
  "$ROOT_DIR/scripts/scaffold-round2-client-run.sh"
  "$ROOT_DIR/scripts/run-codex-client-validation.sh"
)

for path in "${required_files[@]}"; do
  [[ -f "$path" ]] || { echo "Missing required file: $path" >&2; exit 1; }
done

[[ -L "$ROOT_DIR/.claude/skills/complex-task-orchestrator" ]] || {
  echo "Project-level Claude entry must be a symlink" >&2
  exit 1
}

grep -q "^## 30 秒触发示例$" "$ROOT_DIR/README.md"
grep -q "^## What Happens On First Run$" "$ROOT_DIR/README_EN.md"
grep -q "^## 维护信号$" "$ROOT_DIR/README.md"
grep -q "^## Quick Path$" "$ROOT_DIR/skill/complex-task-orchestrator/SKILL.md"
grep -q "^## Runtime Reuse Rules$" "$ROOT_DIR/skill/complex-task-orchestrator/SKILL.md"
grep -q "^## Failure Handling$" "$ROOT_DIR/skill/complex-task-orchestrator/SKILL.md"
grep -q "^## Success Signals$" "$ROOT_DIR/skill/complex-task-orchestrator/SKILL.md"
grep -q "^## 当前状态$" "$ROOT_DIR/docs/evals/README.md"
grep -q "^## 5. 决策$" "$ROOT_DIR/docs/evals/ai-native-judgment-2026-04-16.md"
grep -q "^## 4. 执行顺序$" "$ROOT_DIR/docs/evals/round-01-execution-plan.md"
grep -q "^## 当前执行决策$" "$ROOT_DIR/docs/evals/round-01-new-task-definitions.md"
grep -q "^## 8. 当前执行决策$" "$ROOT_DIR/docs/evals/round-02-client-validation-plan.md"
grep -q "^## 任务位$" "$ROOT_DIR/docs/evals/round-02-task-board.md"
grep -q "^## 结论$" "$ROOT_DIR/docs/evals/round-02-assessment.md"
grep -q "^## 2. 决策$" "$ROOT_DIR/docs/evals/ai-native-decision-2026-04-17.md"
grep -q "^## 当前总判断$" "$ROOT_DIR/docs/evals/session-handoff-2026-04-17.md"
grep -q "^## 当前状态$" "$ROOT_DIR/docs/evals/client-trigger-log.md"
grep -q "^## 脚本$" "$ROOT_DIR/docs/evals/codex-client-runner.md"
grep -q "^## 最小解除阻塞步骤$" "$ROOT_DIR/docs/evals/claude-code-unblock-checklist.md"
grep -q "^## 目标$" "$ROOT_DIR/docs/runtime-governance.md"
grep -q "^## 3. Must-Pass 发布门槛$" "$ROOT_DIR/docs/releases/v0.2.0-release-gate.md"
grep -q "^## 结论$" "$ROOT_DIR/docs/releases/v0.2.0-readiness-assessment.md"
grep -q "^## 版本定位$" "$ROOT_DIR/docs/releases/v0.2.0-release-notes.md"
grep -q "^## Runtime Use$" "$ROOT_DIR/docs/evals/round-01-runs/p2-v0.2.0-release-gate.md"
grep -q "^## Path Selection$" "$ROOT_DIR/docs/evals/round-01-runs/i2-i2-runtime-scaffold.md"
grep -q "^## Runtime Use$" "$ROOT_DIR/docs/evals/round-01-runs/r2-r2-runtime-memory-research.md"
grep -q "^## 1. 研究目标$" "$ROOT_DIR/docs/research/ai-native-runtime-memory-patterns-study.md"

python3 - <<'PY' "$ROOT_DIR/skill/complex-task-orchestrator/runtime/state/runtime-memory-manifest.json"
import json
import sys

path = sys.argv[1]
with open(path, "r", encoding="utf-8") as f:
    data = json.load(f)

assert "captures" in data
assert "promoted_patterns" in data
assert "promoted_failure_modes" in data
assert "governance" in data
statuses = set(data["governance"]["statuses"])
assert statuses == {"active", "watch", "stale"}
assert data["governance"]["default_read_statuses"] == ["active"]
assert data["governance"]["conditional_read_statuses"] == ["watch"]
assert data["governance"]["default_skip_statuses"] == ["stale"]
for section in ("promoted_patterns", "promoted_failure_modes"):
    for item in data[section]:
        assert item["status"] in statuses
        assert "evidence_count" in item
        assert "last_confirmed_at" in item
print("runtime manifest ok")
PY

temp_home="$(mktemp -d)"
HOME="$temp_home" bash "$ROOT_DIR/scripts/install-codex-skill.sh" >/dev/null
[[ -L "$temp_home/.codex/skills/complex-task-orchestrator" ]] || { echo "Codex symlink missing" >&2; exit 1; }

HOME="$temp_home" bash "$ROOT_DIR/scripts/install-claude-code-skill.sh" >/dev/null
[[ -L "$temp_home/.claude/skills/complex-task-orchestrator" ]] || { echo "Claude symlink missing" >&2; exit 1; }

expected="../../skill/complex-task-orchestrator"
actual="$(readlink "$ROOT_DIR/.claude/skills/complex-task-orchestrator")"
[[ "$actual" == "$expected" ]] || { echo "Unexpected project-level Claude entry" >&2; exit 1; }

temp_root="$(mktemp -d)"
bash "$ROOT_DIR/scripts/scaffold-round1-run.sh" \
  --slot T9 \
  --slug temp-check \
  --task-type "Implementation / Remediation" \
  --title "Temporary Check" \
  --date 2026-04-17 \
  --root "$temp_root" >/dev/null

[[ -f "$temp_root/docs/evals/round-01-artifacts/temp-check/01-requirement-consensus.md" ]] || { echo "Scaffold requirement file missing" >&2; exit 1; }
[[ -f "$temp_root/docs/evals/round-01-runs/t9-temp-check.md" ]] || { echo "Scaffold scorecard missing" >&2; exit 1; }
[[ -f "$temp_root/skill/complex-task-orchestrator/runtime/captures/2026-04-17-temp-check.md" ]] || { echo "Scaffold capture missing" >&2; exit 1; }

bash "$ROOT_DIR/scripts/scaffold-round2-client-run.sh" \
  --slot C9 \
  --client Codex \
  --mode quick \
  --slug temp-client-check \
  --title "Temporary Client Check" \
  --date 2026-04-17 \
  --root "$temp_root" >/dev/null

[[ -f "$temp_root/docs/evals/round-02-artifacts/temp-client-check/01-client-task.md" ]] || { echo "Round 2 client task file missing" >&2; exit 1; }
[[ -f "$temp_root/docs/evals/round-02-runs/c9-temp-client-check.md" ]] || { echo "Round 2 scorecard missing" >&2; exit 1; }

prompt_file="$temp_root/prompt.txt"
cat >"$prompt_file" <<'EOF'
Reply with exactly: ok
EOF

runner_output="$temp_root/codex-runner"
bash "$ROOT_DIR/scripts/run-codex-client-validation.sh" \
  --prompt-file "$prompt_file" \
  --output-dir "$runner_output" \
  --root "$ROOT_DIR" \
  --timeout-seconds 60 >/dev/null

[[ -f "$runner_output/status.json" ]] || { echo "Codex runner status missing" >&2; exit 1; }
[[ -f "$runner_output/events.jsonl" ]] || { echo "Codex runner events missing" >&2; exit 1; }
grep -q '"status": "completed"' "$runner_output/status.json" || { echo "Codex runner did not complete" >&2; exit 1; }
grep -q '^ok$' "$runner_output/last.txt" || { echo "Codex runner last message mismatch" >&2; exit 1; }

echo "validate-skill-project.sh: PASS"
