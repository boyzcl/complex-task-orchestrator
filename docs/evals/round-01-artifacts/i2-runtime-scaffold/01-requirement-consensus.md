# 需求共识

## 当前任务

运行记录脚手架与 capture 维护辅助实现

## 目标

实现一个最小但可直接使用的脚手架脚本，降低 Round 1 新任务创建评分卡、运行工件和 capture 的成本，并确保这套脚手架已经被真实使用一次。

## 范围

- 新增一个脚手架脚本
- 新增使用说明
- 用脚手架真实生成一组 Round 1 任务骨架
- 将脚手架纳入现有自动校验
- 记录本任务的评分卡与 capture

## 关键约束

- 不做复杂自动化系统
- 不自动改写任务板和 manifest，避免过度工程化
- 结果必须可读、可执行、可验证
- 本任务优先走 Quick Path，而不是完整重流程

## 交付物

- 01-requirement-consensus.md
- 02-task-execution-prompt.md
- 03-self-review-and-summary.md
- 任务评分卡
- runtime capture
- `scripts/scaffold-round1-run.sh`
- `docs/evals/scaffold-usage.md`

## 验收标准

- 能一键创建新的 Round 1 任务骨架
- 不覆盖已有文件
- 自动创建 `01/02/03`、评分卡和 capture 草稿
- 已通过一次真实运行验证
- 已纳入项目自动校验
