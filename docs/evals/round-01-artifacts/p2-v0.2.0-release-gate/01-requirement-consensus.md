# 需求共识

## 当前任务

为 `complex-task-orchestrator` 定义 `v0.2.0` 的发布门槛与行为验证协议。

## 目标

输出一份能直接指导后续 Round 1 执行的 release gate 文档，明确：

- 哪些条件是 `must-pass`
- 哪些条件是 `should-have`
- 哪些内容当前不是发布阻塞项
- Round 1 结束后如何判断是否允许进入 `v0.2.0`

## 范围

- 基于当前项目已有的 runtime、案例、validation matrix 和 AI native 判断
- 不新增复杂自动化平台
- 重点约束真实任务验证、runtime reuse 和 skill 修正规则

## 关键约束

- 发布门槛必须围绕行为证据，而不是围绕文档数量
- 要避免把“写得更完整”误当成“更接近 release”
- 要允许项目保持轻量，不引入过度工程化负担

## 交付物

- `v0.2.0-release-gate.md`
- 本次任务的执行指令文档
- 本次任务的自检总结
- 一份任务评分卡
- 一条 runtime reuse 记录

## 运行时复用输入

本次任务显式读取以下 runtime 资产：

- `runtime/promoted/patterns/clarify-before-execute.md`
- `runtime/promoted/failure-modes/polished-answer-wrong-problem.md`

## 验收标准

- 文档能直接指导 Round 1 后续任务的通过/不通过判断
- 发布门槛明确、可执行、可检查
- 明确指出当前哪些内容还不是 release 充分条件
