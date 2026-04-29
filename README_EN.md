# complex-task-orchestrator

A reusable skill that pushes complex tasks through clarify, align, validate first, plan, execute, verify, iterate, and self-review instead of letting the model charge ahead too early.

[中文说明](./README.md)

## Current Stage

As of April 17, 2026, the most accurate project position is:

- validated in `Codex`
- currently entering a `Codex`-only limited-trial stage
- strongest validated task types are short briefs, quick reviews / audits, and fixed-source judgment memos

It should not currently be described as:

- stable across clients
- a general complex-task agent
- the default better path for all complex tasks

## When To Use

- complex, ambiguous, multi-stage tasks
- work where misunderstanding is expensive
- tasks that benefit from explicit consensus before execution
- tasks that need validation or acceptance checks before the execution plan
- research reviews, system design, project planning, open-ended implementation, skill and workflow design

## Strongest Validated Uses Right Now

- short status syncs / briefs
- quick reviews / audits
- fixed-source complex judgment memos

These are not the full theoretical scope of the skill. They are the task types that have repeated positive evidence in `Codex` as of April 17, 2026.

## When Not To Use

- tiny bug fixes
- short rewrites
- trivial formatting
- single-step factual lookups
- low-risk requests where the process would cost more than the task

## 30-Second Example

```text
This is a complex task. Use complex-task-orchestrator to clarify the requirement, confirm consensus, define validation checks first, create an execution plan, and then do the work.
```

```text
Use complex-task-orchestrator to clarify this ambiguous task before execution.
```

## What Happens On First Run

On a typical first run, the skill will try to move the task through a more reliable path:

1. clarify the most important ambiguity
2. restate the requirement and ask for confirmation
3. define task-specific validation or acceptance checks
4. generate a task-specific execution plan
5. execute
6. verify against the preset validation plan
7. iterate if required checks fail, then self-review and summarize

If the task is already clear enough, it can switch to the `Quick Path`:

- 0 to 1 clarification turns
- one short consensus confirmation
- a minimal acceptance checklist
- a short execution plan
- verification against the minimal checklist
- self-review still required

## What A Run Usually Produces

If writing artifacts is allowed, the default minimal outputs are:

- `01-requirement-consensus.md`
- `02-validation-and-test-plan.md`
- `03-execution-plan.md`
- `04-self-review-and-summary.md`

See [docs/first-run-example.md](docs/first-run-example.md) and [artifact conventions](skill/complex-task-orchestrator/references/artifact-conventions.md).

## Why It Is More Reliable Than Direct Prompting

Direct prompting often fails in three ways:

- execution starts before the requirement is actually clear
- the answer looks polished but solves the wrong problem
- the task ends without preset verification and a real revision loop

This skill is useful because it makes the validation contract and execution plan explicit before the model commits to a path.

More detail: [docs/why-this-helps.md](docs/why-this-helps.md)

## Install

### Codex

```bash
bash /path/to/complex-task-orchestrator/scripts/install-codex-skill.sh
```

This creates:

```text
~/.codex/skills/complex-task-orchestrator
```

This is the primary path that has completed real-task validation and now supports the limited-trial position.

### Claude Code

```bash
bash /path/to/complex-task-orchestrator/scripts/install-claude-code-skill.sh
```

This creates:

```text
~/.claude/skills/complex-task-orchestrator
```

This only establishes installation and structure visibility. It does not mean Claude Code is part of the current validated scope. See [docs/claude-code-compatibility.md](docs/claude-code-compatibility.md).

## Public Examples

- [Examples index](docs/cases/README.md)
- [Case 1: research review](docs/cases/case-01-research-review.md)
- [Case 2: skill bootstrap](docs/cases/case-02-skill-bootstrap.md)
- [Case 3: project remediation](docs/cases/case-03-project-remediation.md)
- [before / after comparison](docs/cases/before-after-comparison.md)

These are curated public assets, not raw runtime exports. See [docs/runtime-asset-boundary.md](docs/runtime-asset-boundary.md).

## Runtime Memory

This repository now includes a minimal runtime memory layer:

- `runtime/captures/`
- `runtime/promoted/patterns/`
- `runtime/promoted/failure-modes/`
- `runtime/state/runtime-memory-manifest.json`

Specification: [docs/runtime-memory-spec.md](docs/runtime-memory-spec.md)
Governance: [docs/runtime-governance.md](docs/runtime-governance.md)

## Current Status

As of April 17, 2026, this project includes:

- an installable skill
- Codex and Claude Code install scripts
- quick path and full path behavior
- an unreleased validation-first protocol upgrade
- a minimal runtime memory host
- a packaged `v0.2.0` release set
- 3 public cases and 1 comparison page
- changelog, smoke checklist, and validation matrix
- a Round 2 client-validation framework
- a Round 3 real-task evidence chain
- lightweight memory governance rules

Current validated scope:

- phase-level validation in `Codex`
- a `Codex`-only limited-trial position
- briefs, quick audits, and fixed-source judgment tasks

The current working tree also contains an `Unreleased` validation-first protocol upgrade. It is covered by structural checks, but it does not expand the April 17, 2026 product-value boundary by itself.

It does not claim:

- a mature automated memory system
- complete behavior validation across all clients
- broad stability as a general complex-task agent
- that `.local-docs/` is the public evidence layer

## Repository Structure

```text
skill/complex-task-orchestrator/
  SKILL.md
  references/
  runtime/
scripts/
  install-codex-skill.sh
  install-claude-code-skill.sh
  validate-skill-project.sh
docs/
  cases/
  templates/
  *.md
.claude/skills/complex-task-orchestrator
```

## Maintenance Signals

- [CHANGELOG.md](CHANGELOG.md)
- [docs/releases/v0.2.0-release-notes.md](docs/releases/v0.2.0-release-notes.md)
- [docs/smoke-checklist.md](docs/smoke-checklist.md)
- [docs/validation-matrix.md](docs/validation-matrix.md)

## License

MIT
