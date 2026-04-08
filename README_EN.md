# complex-task-orchestrator

A reusable skill for complex, open-ended, multi-step tasks.

It helps an agent avoid the classic failure mode of agentic work:

- rushing into execution before the requirement is actually clear
- producing a polished answer to the wrong problem
- finishing a task without a real self-review loop

Instead, this skill pushes the workflow through:

1. requirement clarification
2. explicit consensus confirmation
3. task-specific execution prompt generation
4. execution
5. self-review and revision
6. final summary

[中文说明](./README.md)

## What It Is Good For

Use it when the task is complex, ambiguous, multi-stage, or costly to misunderstand.

Examples:

- research and evidence reviews
- workflow and system design
- large prompt / skill / plugin creation
- project planning
- open-ended implementation tasks
- any task where you want the model to clarify first instead of charging ahead

## What It Is Not For

Do not use it for small, obvious, low-risk tasks like:

- quick bug fixes
- short rewrites
- trivial formatting requests
- simple factual lookups

## Core Ideas

- clarify one question at a time when needed
- confirm understanding before execution
- generate a task-specific Markdown execution document
- keep user-facing project docs readable in the user's working language
- distinguish the main task flow from optional forward testing
- self-score and revise before calling the work done

## Repository Structure

```text
skill/complex-task-orchestrator/
  SKILL.md
  references/
scripts/
  install-codex-skill.sh
  install-claude-code-skill.sh
docs/
  claude-code-compatibility.md
.claude/skills/complex-task-orchestrator
```

- `skill/complex-task-orchestrator/` is the actual installable skill
- `scripts/` contains helper install scripts
- `docs/` contains public-facing support docs
- `.claude/skills/complex-task-orchestrator` makes the repo Claude Code-friendly at the project level

## Install In Codex

```bash
bash /path/to/complex-task-orchestrator/scripts/install-codex-skill.sh
```

This installs a symlink to:

```text
~/.codex/skills/complex-task-orchestrator
```

## Install In Claude Code

```bash
bash /path/to/complex-task-orchestrator/scripts/install-claude-code-skill.sh
```

This installs a symlink to:

```text
~/.claude/skills/complex-task-orchestrator
```

More details:
[docs/claude-code-compatibility.md](docs/claude-code-compatibility.md)

## Example Usage

Examples of requests that should trigger this skill:

- `Use complex-task-orchestrator to help me plan and execute this ambiguous project.`
- `This is a complex task. Ask me one question at a time until you understand what I actually want.`
- `Help me create a task-specific execution prompt before doing the work.`
- `I want a clarify -> confirm -> execute -> self-review workflow for this task.`

## Current Status

This repository is publishable and usable now, but it is still evolving through real tasks.

Recent improvements include:

- explicit stage broadcasting
- lightweight vs full-protocol mode selection
- research / review workflow guidance
- task folder naming conventions
- definition of done vs optional forward testing

## Compatibility

- Codex: compatible
- Claude Code: structure-compatible, with install helper and project-level skill entry

## License

MIT
