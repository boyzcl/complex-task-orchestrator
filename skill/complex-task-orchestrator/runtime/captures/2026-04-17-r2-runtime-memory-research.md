# Runtime Memory Research Capture

## Task Type

research-review

## Summary

研究 LLM、Aider、LangMem、Mem0/OpenClaw 在 runtime memory 和 evidence loop 上的机制差异，并把结论映射为对当前项目的轻量修正建议。

## What Worked

- 将研究问题压缩成“什么适合当前阶段的小项目”，避免了资料堆叠
- 读取现有 pattern / failure mode 后，研究更聚焦于真实执行问题，而不是空泛对标
- 结论直接支持对当前 runtime 规则做轻量修正

## What Failed

- 研究任务本身不能替代更多真实任务验证
- 某些参考对象比当前项目成熟得多，结论必须经过阶段折算

## Reuse Hint

当项目开始讨论 memory 扩张时，先做机制研究，明确当前阶段该借什么、不该抢先做什么。

## Source Artifacts

- `docs/evals/round-01-artifacts/r2-runtime-memory-research/01-requirement-consensus.md`
- `docs/evals/round-01-artifacts/r2-runtime-memory-research/02-task-execution-prompt.md`
- `docs/evals/round-01-artifacts/r2-runtime-memory-research/03-self-review-and-summary.md`
- `docs/research/ai-native-runtime-memory-patterns-study.md`
