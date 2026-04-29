# Validation Matrix

最后更新：2026-04-29

## 当前阶段结论

| 项目 | 状态 | 备注 |
| --- | --- | --- |
| 当前成立范围 | `Codex`-only 受限试用 | 已有 Round 2 + Round 3 证据支持 |
| 当前最强场景 | 已明确 | brief、quick review / audit、固定来源复杂判断 |
| 当前不主打范围 | 已明确 | 大而全执行推进、开放复杂任务、跨客户端稳定叙事 |

## 自动化验证

| 项目 | 方法 | 状态 |
| --- | --- | --- |
| 关键文件存在 | `validate-skill-project.sh` | 已验证 |
| README 关键区块 | `validate-skill-project.sh` | 已验证 |
| `SKILL.md` 关键区块 | `validate-skill-project.sh` | 已验证 |
| validation-first reference 文件 | `validate-skill-project.sh` | 已验证 |
| 测试先行关键流程 | `validate-skill-project.sh` | 已验证 |
| runtime manifest JSON | `validate-skill-project.sh` | 已验证 |
| Codex 安装脚本 | 临时 `HOME` 下运行 | 已验证 |
| Claude Code 安装脚本 | 临时 `HOME` 下运行 | 已验证 |

## 结构验证

| 项目 | 状态 | 备注 |
| --- | --- | --- |
| skill 目录结构 | 已验证 | `SKILL.md`、`references/`、`runtime/` 已存在 |
| repo 级 Claude 入口 | 已验证 | `.claude/skills/complex-task-orchestrator` 已存在 |
| 公共案例页 | 已验证 | 3 个案例 + 1 个对照 |
| 维护文档 | 已验证 | changelog、smoke checklist、validation matrix 已存在 |
| `v0.2.0` release notes | 已验证 | release 收口文档已存在 |
| Round 2 记录脚手架 | 已验证 | `scaffold-round2-client-run.sh` 已纳入校验 |
| memory governance 文档 | 已验证 | `docs/runtime-governance.md` 已存在 |
| Codex 客户端运行器 | 已验证 | `run-codex-client-validation.sh` 已纳入校验 |
| 测试先行升级方案 | 已验证 | `docs/upgrade-plans/test-first-validation-upgrade-plan.md` 已存在 |
| 测试先行实施留痕 | 已验证 | 验证逻辑、迭代计划和验证结果文档已建立 |

## 版本收口

| 项目 | 状态 | 备注 |
| --- | --- | --- |
| `v0.2.0` release gate | 已满足 | Round 1 gate 已全部满足 |
| `v0.2.0` readiness assessment | 已完成 | 已给出可进入版本结论 |
| `v0.2.0` release notes | 已完成 | 版本范围与边界已写清 |

## 尚未完成的真实行为验证

| 项目 | 状态 | 备注 |
| --- | --- | --- |
| Codex 客户端中的真实触发表现 | 已完成阶段性验证 | `C1 / C2` 已产出真实观察，并足以支撑当前 `Codex`-only 结论 |
| Claude Code 客户端中的真实触发表现 | 环境阻塞 | 当前机器无可调用 Claude Code 客户端 |
| 多任务 runtime reuse 效果 | 已完成最小验证 | 当前已完成 3 条真实 reuse 记录 |
| Round 3 真实任务产品信号 | 已完成当前轮次 | 当前 9 个任务位里，8 个为 `Clearly helpful` 或 `Helpful but heavy` |

## 已启动的下一阶段

| 项目 | 状态 | 备注 |
| --- | --- | --- |
| AI native 判断文档 | 已建立 | `docs/evals/ai-native-judgment-2026-04-16.md` |
| Round 1 执行计划 | 已建立 | `docs/evals/round-01-execution-plan.md` |
| Round 1 任务板 | 已建立 | `docs/evals/round-01-task-board.md` |
| baseline 评分卡 | 已建立 | 当前已完成 3 份 baseline scorecard |
| 新任务评分卡 | 已建立 | 当前已完成 P2、I2、R2 三份新任务评分卡 |
| runtime reuse 日志 | 已建立 | 当前已完成 3 条真实 reuse 记录 |
| Round 2 客户端验证计划 | 已建立 | 4 个任务位已定义 |
| Round 2 触发日志 | 已建立 | 已写入 Codex 与 Claude 阻塞观察 |
| Round 2 评分卡目录 | 已建立 | 已包含 C1/C2/A1/A2 |
| memory governance | 已建立 | 已定义 `active / watch / stale` |
| Codex 客户端运行器 | 已建立 | 用于隔离 HOME、超时和部分结果保留 |
| Claude Code 解除阻塞清单 | 已建立 | 已明确最小环境前提与验收命令 |
| Round 3 任务板 | 已建立并补样完成 | 当前已完成 `T1` 到 `T9` |
| Round 3 产品价值判断 | 已建立 | 已收口为 `Codex`-only 受限试用 |
| 测试先行协议升级 | 结构验证已通过 | 当前是 `Unreleased` 协议升级，不扩大既有产品价值边界 |

## Round 1 Gate 状态

| Gate | 状态 | 备注 |
| --- | --- | --- |
| 6 个真实任务评分 | 已满足 | baseline 3 个 + 新任务 3 个 |
| 至少 4 个 Clearly helpful | 已满足 | 当前 6 个都为 Clearly helpful |
| 至少 1 个 Quick Path 真实通过案例 | 已满足 | I2 |
| 至少 2 条真实 reuse 记录 | 已满足 | 当前为 3 |
| 至少 1 条新 failure mode | 已满足 | `memory-friction-suppresses-capture` 与 `over-extraction-causes-memory-drift` |
| 至少一轮 skill 本体修正 | 已满足 | 已根据 I2 / R2 修正 runtime reuse 与 artifact 规则 |
