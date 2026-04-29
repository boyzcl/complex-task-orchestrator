# Round 1 任务板

## 目标

把真实任务验证从“想到要做”推进到“按板执行”。

## 状态定义

- `planned`
- `running`
- `scored`
- `reuse-tested`
- `closed`

## 任务槽位

| Slot | Task Type | Candidate | Status | Notes |
| --- | --- | --- | --- | --- |
| R1 | Research / Review | 性行为相关能力与欲望影响因素综述 | scored-baseline | 已有历史案例，需作为 baseline 参考，不直接代表新一轮客户端验证 |
| R2 | Research / Review | 小型 AI native agent 项目中的 runtime memory 与 evidence loop 模式研究 | scored / reuse-tested | 已完成研究结论、评分卡、capture，并形成第 3 条 reuse 记录 |
| P1 | Planning / Design | complex-task-orchestrator 自举创建 | scored-baseline | 已有历史案例，可作为 baseline |
| P2 | Planning / Design | v0.2.0 发布门槛与行为验证协议设计 | scored / reuse-tested | 已完成首次真实 reuse 记录，并产出 release gate |
| I1 | Implementation / Remediation | complex-task-orchestrator 项目审计与整改 | scored-baseline | 已有本轮整改案例，可作为 baseline |
| I2 | Implementation / Remediation | 运行记录脚手架与 capture 维护辅助实现 | scored / reuse-tested | 已按 Quick Path 完成，并形成第 2 条真实 reuse 记录 |

## 当前决策

Round 1 已启动，但当前只有 3 个 baseline case 被纳入统一评估。

当前已经完成：

- baseline 任务 3 个
- 新任务 3 个
- 真实 reuse 记录 3 条
- Quick Path 真实通过案例 1 个

Round 1 主体验证任务已完成，下一步进入：

- 汇总结果
- skill 本体修正
- `v0.2.0` readiness 判断
