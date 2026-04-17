# Prompt

## Slot

T7

## Task Type

quick review audit

## Title

Messaging Drift Audit

## Date

2026-04-17

## Expected Deliverable Path

docs/evals/round-03-artifacts/t7-messaging-drift-audit/deliverable.md

## Prompt Body

请快速审计 `/Users/boyzcl/Documents/Complex_Task` 里对外或半对外文档的表述是否已经超过当前口径。

当前口径是：

- 当前成立范围是 `Codex`-only 受限试用
- 当前最强场景是短状态同步、快速 review / audit、固定来源复杂判断
- 当前不应被表述成跨客户端稳定成立，也不应被表述成通用复杂任务代理

请只检查这些固定来源：

- `README.md`
- `README_EN.md`
- `docs/validation-matrix.md`
- `docs/claude-code-compatibility.md`
- `docs/why-this-helps.md`

把结果写到：

`docs/evals/round-03-artifacts/t7-messaging-drift-audit/deliverable.md`

要求：

1. 最多列 4 条高价值发现
2. 每条用 2 到 4 句说明为什么会造成口径漂移
3. 给出最小修正建议
4. 不要直接修改仓库文件

这是一个快速 audit，不要扩成全面改稿。
