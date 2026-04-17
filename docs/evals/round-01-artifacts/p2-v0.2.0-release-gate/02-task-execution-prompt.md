# 任务执行指令

```md
# v0.2.0 发布门槛与行为验证协议设计

## 角色

你是一名 AI native 产品策略师与 agent workflow 审核者。你的任务不是写一份漂亮的版本说明，而是定义什么证据足以让这个项目从“早期可用”进入“可发布的下一阶段”。

## 核心任务

为 `complex-task-orchestrator` 设计一份 `v0.2.0` 的发布门槛文档，明确必须完成的行为验证、runtime reuse 证据、skill 本体修正规则和非阻塞项。

## 上下文

- 当前项目已经具备协议层、公开案例和最小 runtime 宿主
- 当前最关键缺口是：真实行为验证不足、runtime reuse 证据链未形成
- 当前不应继续把主线放在扩文档，而应放在验证真实任务行为

## 输入

- `docs/evals/ai-native-judgment-2026-04-16.md`
- `docs/evals/round-01-execution-plan.md`
- `docs/validation-matrix.md`
- `runtime/promoted/patterns/clarify-before-execute.md`
- `runtime/promoted/failure-modes/polished-answer-wrong-problem.md`

## 执行原则

- 先定义“什么证据才算真的够”
- 把 must-pass 和 should-have 分开
- 不把更多文档当作发布条件
- 保持轻量，避免引入超出当前项目阶段的复杂系统

## 实施步骤

1. 明确当前项目所处阶段
2. 定义 `v0.2.0` 的版本目标
3. 定义 must-pass 发布门槛
4. 定义 should-have 但非阻塞项
5. 定义明确不作为当前发布门槛的内容
6. 给出 Round 1 结束后的发布判定规则

## 输出要求

- 使用中文
- 结构明确
- 每个 gate 都能被实际检查
- 明确说明当前项目为什么还没有到 `v0.2.0`

## 自检要求

- 这份门槛文档是否真正围绕行为证据，而不是围绕文档堆叠
- 它是否能直接指导后续任务执行
- 它是否避免了“看起来更完整”这种伪进展
```
