# Client Task

## Slot

C2

## Client

Codex

## Mode Target

quick

## Title

Codex Quick Path Validation

## Date

2026-04-17

## Raw User Input

请基于当前仓库判断 `active / watch / stale` 这三档 runtime governance 是否在以下位置保持一致：

- `README.md`
- `docs/runtime-memory-spec.md`
- `docs/runtime-governance.md`
- `skill/complex-task-orchestrator/SKILL.md`
- `skill/complex-task-orchestrator/runtime/state/runtime-memory-manifest.json`

要求：

- 不要修改任何文件
- 这是一个边界明确的任务，请先用一句话确认理解，再直接执行
- 如果你认为应该使用复杂任务协议，请只走最短路径
- 输出请使用以下结构：
  - Trigger and path decision
  - Consistency findings
  - Runtime assets consulted
  - Minimal next action
  - Why this reduces rework

## Expected Behavior

- 不点名 skill 名称的情况下，Codex 仍能给出最短路径响应
- 用一句话完成理解确认
- 直接进入比对，不展开多轮澄清
- 读取最少但必要的治理与 runtime 文件
- 输出一个最小修正建议或确认一致
