#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scaffold-round3-real-task-run.sh \
    --slot SLOT \
    --type TYPE \
    --slug SLUG \
    --title TITLE \
    --prompt-target TARGET

Example:
  scaffold-round3-real-task-run.sh \
    --slot T1 \
    --type "high-ambiguity complex" \
    --slug productization-memo \
    --title "Productization Decision Memo" \
    --prompt-target "docs/evals/round-03-artifacts/t1-productization-memo/deliverable.md"
EOF
}

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DATE_OVERRIDE=""
SLOT=""
TYPE=""
SLUG=""
TITLE=""
PROMPT_TARGET=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --slot)
      SLOT="${2:-}"
      shift 2
      ;;
    --type)
      TYPE="${2:-}"
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
    --prompt-target)
      PROMPT_TARGET="${2:-}"
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
[[ -n "$TYPE" ]] || { echo "--type is required" >&2; exit 1; }
[[ -n "$SLUG" ]] || { echo "--slug is required" >&2; exit 1; }
[[ -n "$TITLE" ]] || { echo "--title is required" >&2; exit 1; }
[[ -n "$PROMPT_TARGET" ]] || { echo "--prompt-target is required" >&2; exit 1; }

RUN_DATE="${DATE_OVERRIDE:-$(date +%F)}"
SLOT_LOWER="$(printf '%s' "$SLOT" | tr '[:upper:]' '[:lower:]')"
ARTIFACT_DIR="$ROOT_DIR/docs/evals/round-03-artifacts/${SLOT_LOWER}-${SLUG}"
RUN_FILE="$ROOT_DIR/docs/evals/round-03-runs/${SLOT_LOWER}-${SLUG}.md"

mkdir -p "$ARTIFACT_DIR" "$ROOT_DIR/docs/evals/round-03-runs"

for file in \
  "$ARTIFACT_DIR/prompt.md" \
  "$ARTIFACT_DIR/observation-log.md" \
  "$ARTIFACT_DIR/outcome-summary.md" \
  "$RUN_FILE"; do
  if [[ -e "$file" ]]; then
    echo "Refusing to overwrite existing file: $file" >&2
    exit 1
  fi
done

cat >"$ARTIFACT_DIR/prompt.md" <<EOF
# Prompt

## Slot

$SLOT

## Task Type

$TYPE

## Title

$TITLE

## Date

$RUN_DATE

## Expected Deliverable Path

$PROMPT_TARGET

## Prompt Body

[待补充]
EOF

cat >"$ARTIFACT_DIR/observation-log.md" <<EOF
# Observation Log

## Trigger Shape

[待补充]

## Path Selection

[待补充]

## Context Efficiency

[待补充]

## Process Weight

[待补充]

## Runtime Use

[待补充]

## Notes

[待补充]
EOF

cat >"$ARTIFACT_DIR/outcome-summary.md" <<EOF
# Outcome Summary

## Deliverable Quality

[待补充]

## Did It Save Work

[待补充]

## Rework Impact

[待补充]

## Recommended Follow-up

[待补充]
EOF

cat >"$RUN_FILE" <<EOF
# $TITLE

## Task Type

$TYPE

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

## Context Efficiency

- Did the run reduce manual context supplementation?
- Did it make good assumptions when context was incomplete?

## Execution Outcome

- Did the final output solve the real task?
- Did it produce executable next steps?

## Process Weight

- Was the process too heavy for the task size?
- What friction was most noticeable?

## Rework Impact

- Did the run reduce likely rework?
- What would still need manual cleanup?

## Runtime Use

- Did this run read any runtime asset?
- If yes, did that reuse help?

## Product Signal

- Would this kind of task justify long-term use of the skill?

## Final Judgment

- Clearly helpful / Helpful but heavy / Marginal / Not worth the process

## Notes

[待补充]
EOF
