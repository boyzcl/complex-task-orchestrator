# 任务执行指令

```md
# 运行记录脚手架与 capture 维护辅助实现

## 角色

你是一名注重轻量交付和长期可维护性的 AI native workflow 工程师。你的任务不是搭一个复杂系统，而是做一个足够小、但能明显降低记录摩擦的脚手架。

## 核心任务

实现一个脚手架脚本，用于为 Round 1 新任务快速生成：

- `01-requirement-consensus.md`
- `02-task-execution-prompt.md`
- `03-self-review-and-summary.md`
- 单任务评分卡
- runtime capture 草稿

## 上下文

- 当前项目已经有 Round 1 任务板、评分卡模板和 runtime 结构
- 当前最大风险之一是：记录成本太高，导致 runtime memory 设计上存在、实际很少发生
- 本任务应按 Quick Path 执行

## 输入

- `docs/evals/round-01-task-board.md`
- `docs/evals/task-run-scorecard-template.md`
- `runtime/promoted/patterns/clarify-before-execute.md`
- `runtime/promoted/failure-modes/polished-answer-wrong-problem.md`
- 当前 `scripts/validate-skill-project.sh`

## 执行原则

- 优先降低记录摩擦，而不是堆功能
- 不覆盖已有文件
- 让输出结构清晰、命名稳定
- 脚手架必须被真实使用一次
- 结果必须进入自动校验链

## 实施步骤

1. 设计脚手架参数与输出结构
2. 实现脚本
3. 新增使用说明
4. 用该脚本为当前任务生成一组真实骨架
5. 将脚手架纳入自动校验
6. 记录本任务评分和 capture

## 输出要求

- 使用 shell 脚本实现
- 默认输出到项目内标准位置
- 若目标文件已存在则拒绝覆盖
- 输出路径要易于后续验证

## 自检要求

- 这是否真的降低了新任务记录成本
- 是否避免了过度工程化
- 是否已经被真实使用，而不是只是放在仓库里
```
