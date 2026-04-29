# Prompt

## Slot

T9

## Task Type

fixed-source complex judgment

## Title

Limited Trial Scope Memo

## Date

2026-04-17

## Expected Deliverable Path

docs/evals/round-03-artifacts/t9-limited-trial-scope-memo/deliverable.md

## Prompt Body

请基于固定来源，写一份短 memo，判断这个项目在接下来一小段时间里应该如何定义 `Codex`-only 受限试用范围，输出到：

`docs/evals/round-03-artifacts/t9-limited-trial-scope-memo/deliverable.md`

只允许使用这些来源：

- `docs/evals/round-02-assessment.md`
- `docs/evals/round-03-assessment.md`
- `docs/evals/product-value-decision-2026-04-17.md`
- `docs/evals/session-handoff-2026-04-17.md`
- `docs/validation-matrix.md`
- `docs/claude-code-compatibility.md`

要求：

1. 不要引用其他文件
2. 先给一句判断：当前试用范围该如何定义
3. 再给三部分：
   - 可以主动试用的任务类型
   - 暂不应主打的任务类型
   - 下一批样本怎么补最能提高判断质量
4. 最后补一个小节：当前最容易说大的风险是什么
5. 控制在 500 到 800 字中文

这是一个固定来源复杂判断任务。

不要把 memo 写成大而全战略文档，也不要把 Claude Code 阻塞重新抬成当前主线。
