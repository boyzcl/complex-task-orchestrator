# 案例 3：项目审计与整改任务

## 资产类型

`curated case`

## 任务类型

项目审计 / 仓库整改 / 实施落地

## 原始任务

对 `complex-task-orchestrator` 做一次项目级审计，然后按执行方案把关键缺口落实到仓库中，并通过测试验证结果。

## 初始问题

在整改前，项目存在几类明显断层：

- README、Claude 兼容文档和 Claude 安装脚本从工作树中缺失
- first-run 路径不够锐利
- 没有真正落地的 runtime memory 宿主
- 缺少公开案例页
- 缺少 changelog、validation matrix 和 smoke checklist

## skill 是怎么介入的

这次任务没有停留在“出一份建议”，而是按执行方案直接落地：

- 先确认改造范围
- 再补主入口和 runtime 骨架
- 再补公开文档和案例
- 最后跑自动化 smoke test 和安装脚本测试

## 最终产物

- 重写后的中英文 README
- 修正后的 Claude 兼容文档
- 最小 runtime memory 结构
- 3 个公开案例与 1 个对照页
- `CHANGELOG.md`
- `docs/smoke-checklist.md`
- `docs/validation-matrix.md`
- 自动化验证脚本

## 结果价值

- 项目从“有方法论”前进到“有默认路径、有公开证据、有最小验证”
- repo、安装副本、runtime 的边界变清楚了
- 这轮改动本身也成为一个新的 implementation case

## 学到的模式

- 项目改造要先补默认路径，再补包装细节
- runtime 机制至少要有宿主、capture、promoted、manifest
- 项目可信度来自事实对齐和验证，不来自更长的宣言
