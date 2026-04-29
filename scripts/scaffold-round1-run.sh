#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scaffold-round1-run.sh --slot SLOT --slug SLUG --task-type TYPE --title TITLE [--date YYYY-MM-DD] [--root PATH]

Example:
  scaffold-round1-run.sh \
    --slot I2 \
    --slug i2-runtime-scaffold \
    --task-type "Implementation / Remediation" \
    --title "运行记录脚手架与 capture 维护辅助实现"
EOF
}

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DATE_OVERRIDE=""
SLOT=""
SLUG=""
TASK_TYPE=""
TITLE=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --slot)
      SLOT="${2:-}"
      shift 2
      ;;
    --slug)
      SLUG="${2:-}"
      shift 2
      ;;
    --task-type)
      TASK_TYPE="${2:-}"
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
[[ -n "$SLUG" ]] || { echo "--slug is required" >&2; exit 1; }
[[ -n "$TASK_TYPE" ]] || { echo "--task-type is required" >&2; exit 1; }
[[ -n "$TITLE" ]] || { echo "--title is required" >&2; exit 1; }

RUN_DATE="${DATE_OVERRIDE:-$(date +%F)}"
SLOT_LOWER="$(printf '%s' "$SLOT" | tr '[:upper:]' '[:lower:]')"

ARTIFACT_DIR="$ROOT_DIR/docs/evals/round-01-artifacts/$SLUG"
RUN_FILE="$ROOT_DIR/docs/evals/round-01-runs/${SLOT_LOWER}-${SLUG}.md"
CAPTURE_FILE="$ROOT_DIR/skill/complex-task-orchestrator/runtime/captures/${RUN_DATE}-${SLUG}.md"

for path in "$ARTIFACT_DIR" "$ROOT_DIR/docs/evals/round-01-runs" "$ROOT_DIR/skill/complex-task-orchestrator/runtime/captures"; do
  mkdir -p "$path"
done

for file in \
  "$ARTIFACT_DIR/01-requirement-consensus.md" \
  "$ARTIFACT_DIR/02-task-execution-prompt.md" \
  "$ARTIFACT_DIR/03-self-review-and-summary.md" \
  "$RUN_FILE" \
  "$CAPTURE_FILE"; do
  if [[ -e "$file" ]]; then
    echo "Refusing to overwrite existing file: $file" >&2
    exit 1
  fi
done

cat >"$ARTIFACT_DIR/01-requirement-consensus.md" <<EOF
# 需求共识

## 当前任务

$TITLE

## 目标

[待补充]

## 范围

[待补充]

## 关键约束

[待补充]

## 交付物

- 01-requirement-consensus.md
- 02-task-execution-prompt.md
- 03-self-review-and-summary.md
- 任务评分卡
- runtime capture

## 验收标准

[待补充]
EOF

cat >"$ARTIFACT_DIR/02-task-execution-prompt.md" <<EOF
# 任务执行指令

\`\`\`md
# $TITLE

## 角色

[待补充]

## 核心任务

[待补充]

## 上下文

[待补充]

## 输入

[待补充]

## 执行原则

[待补充]

## 实施步骤

[待补充]

## 输出要求

[待补充]

## 自检要求

[待补充]
\`\`\`
EOF

cat >"$ARTIFACT_DIR/03-self-review-and-summary.md" <<EOF
# 自检与总结

## 评分

[待补充]

## 扣分原因

[待补充]

## 自检后已做修订

[待补充]

## 目前的问题是什么

[待补充]

## 本质原因是什么

[待补充]

## 具体解决方案是什么

[待补充]

## 当前方案的信心

[待补充]

## 是否主任务完成

[待补充]
EOF

cat >"$RUN_FILE" <<EOF
# $TITLE

## Task Type

$TASK_TYPE

## Date

$RUN_DATE

## Input Summary

[待补充]

## Trigger Assessment

- Did the skill trigger?
- Was the trigger appropriate?

## Path Selection

- Quick Path or Full Path?
- Was that choice correct?

## Alignment Quality

- Did the requirement become clearer before execution?
- Did the consensus confirmation reduce ambiguity?

## Execution Outcome

- Did the final output solve the real problem?
- Did the process reduce rework risk?

## Runtime Use

- Did this run read any existing runtime asset?
- If yes, which one?
- Did that reuse help?

## Runtime Output

- Was a capture produced?
- Was anything worth promoting?

## Score

- Alignment
- Path selection
- Output quality
- Reuse value
- Overall

## Final Judgment

- Clearly helpful / Marginal / Not worth the process

## Notes

[待补充]
EOF

cat >"$CAPTURE_FILE" <<EOF
# $TITLE Capture

## Task Type

[待补充]

## Summary

[待补充]

## What Worked

[待补充]

## What Failed

[待补充]

## Reuse Hint

[待补充]

## Source Artifacts

- docs/evals/round-01-artifacts/$SLUG/01-requirement-consensus.md
- docs/evals/round-01-artifacts/$SLUG/02-task-execution-prompt.md
- docs/evals/round-01-artifacts/$SLUG/03-self-review-and-summary.md
EOF

printf 'Scaffolded Round 1 run assets:\n'
printf '  %s\n' \
  "$ARTIFACT_DIR/01-requirement-consensus.md" \
  "$ARTIFACT_DIR/02-task-execution-prompt.md" \
  "$ARTIFACT_DIR/03-self-review-and-summary.md" \
  "$RUN_FILE" \
  "$CAPTURE_FILE"
