# 需求共识

## 当前任务

小型 AI native agent 项目中的 runtime memory 与 evidence loop 模式研究

## 目标

研究几个代表性项目如何处理运行时留痕、经验提升、下一轮读取和行为验证，并把结论转成适用于当前项目的最小可行调整建议。

## 范围

- 只看对当前项目阶段真正有参考价值的机制
- 不做机械化大而全对标
- 输出重点是“对当前项目接下来该怎么做”的判断

## 关键约束

- 优先使用官方文档或项目本身的资料
- 区分包装差距、机制差距、阶段差距
- 不把大型框架的做法生搬硬套到当前项目

## 交付物

- 研究结论文档
- 本次任务的执行指令文档
- 本次任务的自检总结
- 任务评分卡
- runtime capture

## 运行时复用输入

本次任务显式读取以下 runtime 资产：

- `runtime/promoted/patterns/clarify-before-execute.md`
- `runtime/promoted/failure-modes/polished-answer-wrong-problem.md`

## 验收标准

- 能清楚说明当前项目最该借鉴哪些机制
- 能明确指出当前项目不该提前做什么
- 能产出至少 1 条直接影响当前项目的修正建议
