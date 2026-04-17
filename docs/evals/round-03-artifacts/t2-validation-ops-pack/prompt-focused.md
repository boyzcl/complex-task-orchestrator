# Focused Prompt

请继续推进 `/Users/boyzcl/Documents/Complex_Task` 项目，但不要改 `SKILL.md` 主体。

这是 `T2` 的聚焦复跑。目标不变：

为这个项目写一份接下来 1 周可反复使用的“真实任务验证执行包”。

这次请只使用以下来源：

- `scripts/run-codex-client-validation.sh`
- `scripts/scaffold-round3-real-task-run.sh`
- `docs/evals/codex-client-runner.md`
- `docs/evals/round-03-real-task-validation-plan.md`
- `docs/evals/round-03-task-board.md`
- `docs/evals/round-03-runs/README.md`
- `docs/evals/round-02-assessment.md`
- `docs/evals/client-trigger-log.md`

请不要扫描或读取以下路径：

- `docs/evals/round-03-artifacts/`
- 任何 `run-output/` 目录
- 其他未列出的评估历史文件

请把最终结果写入：

`docs/evals/round-03-artifacts/t2-validation-ops-pack/deliverable.md`

这份执行包至少包含：

1. 任务选择规则
2. 推荐执行顺序
3. 运行命令清单
4. 产物命名约定
5. 回写步骤
6. 区分协议问题与客户端摩擦的方法

要求：

- 这是执行推进文档，不要只写高层原则
- 让另一个协作者可以直接照着跑
- 不要修改其他仓库文件
- 尽量减少过程噪音，直接交付
