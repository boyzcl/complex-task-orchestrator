#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_SKILL_DIR="$ROOT_DIR/skill/complex-task-orchestrator"
TARGET_DIR="${HOME}/.claude/skills"
TARGET_SKILL_DIR="$TARGET_DIR/complex-task-orchestrator"

mkdir -p "$TARGET_DIR"
ln -sfn "$SOURCE_SKILL_DIR" "$TARGET_SKILL_DIR"

echo "Installed Claude Code skill:"
echo "  $TARGET_SKILL_DIR -> $SOURCE_SKILL_DIR"
