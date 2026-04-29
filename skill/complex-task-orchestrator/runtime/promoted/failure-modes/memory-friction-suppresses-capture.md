# Memory Friction Suppresses Capture

## Symptom

项目已经定义了 capture、scorecard、reuse log 等运行资产，但真实任务里这些资产生成频率很低，或者每次都被拖到最后才补。

## Why It Happens

当记录成本过高时，agent 或操作者会优先完成主任务，把留痕和记忆层维护视为“可选项”。

## Resulting Risk

- runtime 机制名义存在、实际稀疏
- 经验无法稳定进入下一轮
- promoted 资产增长变慢

## How To Detect Early

- 每次新任务都要手工创建多个文件
- scorecard 和 capture 常常缺失或极其简略
- reuse log 长时间没有新条目

## How To Avoid It Next Time

- 为重复结构的任务提供脚手架
- 默认生成最小工件，而不是强迫每次从零写起
- 让脚手架进入自动校验链

## Source Evidence

- `captures/2026-04-17-i2-runtime-scaffold.md`
