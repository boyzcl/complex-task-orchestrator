# Round 2 Client Validation Plan

日期：2026-04-17

## 状态说明

这份文档保留的是 Round 2 启动时的原始计划。

截至 2026-04-17 的当前决策已经改为：

- 当前版本以 `Codex` 验证通过作为成立标准
- `Claude Code` 补跑属于增强项，不再是当前阻塞条件

## 1. 目标

Round 2 不再验证 repo 内结构是否存在，而是验证这套 skill 在真实客户端热路径中是否表现稳定。

重点只看两件事：

- 是否能在 Codex / Claude Code 中正确进入 skill
- 是否能在 `Quick Path` 与 `Full Path` 间做出合理选择

## 2. 验证范围

本轮只覆盖四个最小任务位：

- `C1` Codex Full Path
- `C2` Codex Quick Path
- `A1` Claude Code Full Path
- `A2` Claude Code Quick Path

## 3. 每个任务必须记录什么

- 客户端
- 用户原始输入
- skill 是否触发
- 触发是否合理
- 阶段播报是否清楚
- 路径选择是否正确
- 是否读取了相关 runtime 资产
- 最终结果是否解决真实问题
- 是否需要人工点名 skill 才能触发

## 4. 执行顺序

1. 先跑 Codex `Full Path`
2. 再跑 Codex `Quick Path`
3. 再跑 Claude Code `Full Path`
4. 最后跑 Claude Code `Quick Path`

这个顺序的目的，是先在当前最可控的环境里稳定记录，再去看 Claude Code 的差异。

## 5. 退出条件

Round 2 原始计划中的“最小完成”条件是：

- 四个任务位都完成评分卡
- 至少两个任务不需要手把手强提醒也能进入正确流程
- 至少一个 `Quick Path` 与一个 `Full Path` 被明确评为正确选择
- 至少出现一条新的客户端行为观察，能反推 skill 或文档修正

但当前仓库的最终解释应以：

- [round-02-assessment.md](/Users/boyzcl/Documents/Complex_Task/docs/evals/round-02-assessment.md)
- [ai-native-decision-2026-04-17.md](/Users/boyzcl/Documents/Complex_Task/docs/evals/ai-native-decision-2026-04-17.md)

为准。

## 6. 当前边界

当前仓库可以先把任务板、日志、脚手架和校验面准备完整。

但真正的客户端热路径表现，必须在真实客户端交互里记录，不能在仓库里伪造。

## 7. 本轮输出

- `round-02-task-board.md`
- `client-trigger-log.md`
- `round-02-runs/`
- `scripts/scaffold-round2-client-run.sh`

## 8. 当前执行决策

当前决策是：

- `Round 2` 立即启动
- 先把记录面与脚手架补齐
- 再在真实客户端里逐个跑四个任务位
