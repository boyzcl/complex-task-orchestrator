# Execution Plan Template

Use this reference when creating the one-off Markdown execution plan for the current task.

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

## Validation Plan
[List validation points, methods, expected results, evidence, and required/pass criteria.]

## Execution Principles
[List the decision rules that should govern execution.]

## Implementation Steps
[Give the concrete step sequence.]

## Output Requirements
[Specify format, structure, and quality expectations.]

## Quality Bar
[State what "good enough" means for this task.]

## Verification Pass
[Require checking the result against the validation plan before self-review.]

## Final Self-Check
[Require a score, deduction reasons, revisions if needed, and final summary.]
```

## Usage Rules

- Make the plan task-specific; do not leave generic placeholders in the final artifact.
- Start complete, then trim sections only when the task is obviously simpler.
- Preserve freedom where multiple valid approaches exist.
- Add constraints only when they materially improve quality or safety.
- Write the run-specific execution plan in the user's working language by default.
- Do not generate the execution plan before the validation/test plan exists for complex or long-chain tasks.
- Each critical implementation step should map to at least one validation point when feasible.

## Strongest-Brain Rule

Before writing the execution plan, identify how a top expert in the relevant domain would:

- define the real problem
- decompose the task
- set quality standards
- detect common failure modes

Reflect that mindset in the role, principles, and implementation steps.
