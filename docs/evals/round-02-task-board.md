# Round 2 Task Board

最后更新：2026-04-17

## 目标

验证 `complex-task-orchestrator` 在真实客户端热路径中的触发、路径选择和最小 runtime reuse 是否稳定。

## 任务位

| Slot | Client | Path | Status | Goal |
| --- | --- | --- | --- | --- |
| C1 | Codex | Full Path | Completed | 聚焦 runner 复跑后已命中 Full Path，并确认 probe design 比协议本体更关键 |
| C2 | Codex | Quick Path | Completed | 已命中 Quick Path，runner 重跑后完整收口并暴露 manifest 不一致 |
| A1 | Claude Code | Full Path | Blocked but optional | 当前机器无可调用 Claude Code 客户端，不影响当前轮次通过 |
| A2 | Claude Code | Quick Path | Blocked but optional | 当前机器无可调用 Claude Code 客户端，不影响当前轮次通过 |

## 进入执行前的必备条件

- `v0.2.0` release package 已收口
- runtime governance 已写入规格
- `scaffold-round2-client-run.sh` 已通过校验
- `client-trigger-log.md` 已存在

## 完成判定

- `Codex` 侧 Full Path 与 Quick Path 都有对应评分卡
- 至少两个 `Codex` 任务位被判定为 `Clearly helpful`
- 至少一个真实客户端观察回写到 skill 或文档
- Claude Code 任务位若 blocked，当前轮次可不作为阻塞条件
