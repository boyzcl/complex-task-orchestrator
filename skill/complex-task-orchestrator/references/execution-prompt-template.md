# Execution Prompt Template

Use this reference when creating the one-off Markdown execution prompt for the current task.

## Template

```md
# [Task Title]

## Role
[Assign the best-fit expert role and mindset for this task.]

## Core Task
[State the exact task in one or two sentences.]

## Context
[Record only the context needed to execute well.]

## Deliverables
[List the outputs that must exist when the task is done.]

## Execution Principles
[List the decision rules that should govern execution.]

## Implementation Steps
[Give the concrete step sequence.]

## Output Requirements
[Specify format, structure, and quality expectations.]

## Quality Bar
[State what "good enough" means for this task.]

## Final Self-Check
[Require a score, deduction reasons, revisions if needed, and final summary.]
```

## Usage Rules

- Make the prompt task-specific; do not leave generic placeholders in the final artifact.
- Start complete, then trim sections only when the task is obviously simpler.
- Preserve freedom where multiple valid approaches exist.
- Add constraints only when they materially improve quality or safety.
- Write the run-specific execution prompt in the user's working language by default.

## Strongest-Brain Rule

Before writing the execution prompt, identify how a top expert in the relevant domain would:

- define the real problem
- decompose the task
- set quality standards
- detect common failure modes

Reflect that mindset in the role, principles, and implementation steps.
