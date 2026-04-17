# Over-Extraction Causes Memory Drift

## Symptom

系统为很多小信号都生成 memory 或 promoted 资产，短期看起来很“有记忆”，但后续检索命中质量下降，真正有价值的模式反而被噪音稀释。

## Why It Happens

当 capture、promote 和 recall 没有明确边界时，系统会倾向于把更多痕迹都当成“也许以后有用”的资产。

## Resulting Risk

- recall 精度下降
- promoted 资产膨胀
- 旧规则与新规则冲突
- memory 层越来越像堆积而不是学习

## How To Detect Early

- 单次任务的小结论也频繁进入 promoted 层
- recall 命中的资产越来越多，但帮助感下降
- runtime 目录增长很快，但 reuse 证据不增长

## How To Avoid It Next Time

- 将 capture 和 promoted 明确分层
- 只提升跨任务仍有价值、且边界清楚的模式
- 优先先做少量高质量 promote，而不是增加数量

## Source Evidence

- `captures/2026-04-17-r2-runtime-memory-research.md`
