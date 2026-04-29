# Polished Answer, Wrong Problem

## Symptom

模型很快产出了一份结构完整、语气笃定的结果，但真正要解决的问题并没有被对齐。

## Why It Happens

复杂任务中，模型会用补全能力把模糊需求自动“补成”一个看起来合理的任务定义。

## Resulting Risk

- 做错题
- 返工
- 用户误以为过程推进了，实际只是沿错方向跑得更快

## How To Detect Early

- 目标、边界、交付物、验收标准还说不清
- 用户和模型对任务描述存在多种可行解释
- 结果还没开始做，就已经显得过于笃定

## How To Avoid It Next Time

- 先做需求共识确认
- 在执行前生成测试/验收方案和一次性执行计划
- 不要在关键歧义未解决前直接开工

## Source Evidence

- `captures/2026-04-08-skill-bootstrap.md`
