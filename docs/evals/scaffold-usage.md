# Round 1 脚手架使用说明

用于快速创建新的 Round 1 任务运行骨架：

```bash
bash /Users/boyzcl/Documents/Complex_Task/scripts/scaffold-round1-run.sh \
  --slot I2 \
  --slug i2-runtime-scaffold \
  --task-type "Implementation / Remediation" \
  --title "运行记录脚手架与 capture 维护辅助实现"
```

默认会生成：

- `docs/evals/round-01-artifacts/<slug>/01-requirement-consensus.md`
- `docs/evals/round-01-artifacts/<slug>/02-task-execution-prompt.md`
- `docs/evals/round-01-artifacts/<slug>/03-self-review-and-summary.md`
- `docs/evals/round-01-runs/<slot>-<slug>.md`
- `skill/complex-task-orchestrator/runtime/captures/<date>-<slug>.md`

## 适用场景

- Round 1 的新真实任务
- 后续类似的评估批次
- 需要快速生成最小任务留痕时

## 为什么需要它

如果每次都手写评分卡和最小运行工件，runtime 机制很容易因为记录成本过高而退化成“设计上存在，实际很少发生”。
