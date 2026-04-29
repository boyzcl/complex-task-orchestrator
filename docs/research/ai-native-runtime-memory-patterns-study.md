# 小型 AI native agent 项目中的 runtime memory 与 evidence loop 模式研究

日期：2026-04-17

## 1. 研究目标

这份研究不是为了找“最强 memory 系统”，而是为了回答一个更贴近 `complex-task-orchestrator` 当前阶段的问题：

> 对一个轻量、协议型、小型 AI native 项目来说，什么样的 runtime memory 和 evidence loop 机制是足够的，什么样的又会过重？

## 2. 参考对象

本次只选 4 个具有明确参考价值的对象，每个只借它最值得借的一层。

### 2.1 [LLM](https://llm.datasette.io/)

借鉴维度：

- 默认运行留痕
- SQLite 作为可查询 runtime 宿主

参考原因：

- LLM 的一个强点是把 prompts / responses 的运行痕迹默认落到 SQLite 中，而不是让“运行记忆”只停留在聊天界面里。
- 这类设计对小项目很重要，因为它把“先有日志宿主”放在了“先做复杂记忆算法”之前。

### 2.2 [Aider](https://aider.chat/)

借鉴维度：

- evidence loop
- 测试 / lint / benchmark 驱动的行为验证

参考原因：

- Aider 的核心优势不在长期 memory，而在于它把验证闭环做成了产品的一部分。
- 它同时强调有限而克制的 agentic behavior，这对当前项目很重要：说明不是越自动、越复杂就越 AI native。

### 2.3 [LangMem](https://langchain-ai.github.io/langmem/concepts/conceptual_guide/)

借鉴维度：

- memory 类型分层
- 写入时机
- 过提取 / 欠提取的权衡

参考原因：

- LangMem 明确区分 semantic / episodic / procedural memory，并把 active 与 background formation 分开讨论。
- 它还明确指出：over-extract 会降低精度，under-extract 会降低召回。

### 2.4 [Mem0 / OpenClaw integration](https://docs.mem0.ai/integrations/openclaw)

借鉴维度：

- auto-recall / auto-capture
- session 与 long-term 双 scope
- 显式忘记 / 删除

参考原因：

- Mem0 的 OpenClaw 集成非常清楚地展示了一个 memory layer 应该具备哪些显式动作： recall、capture、store、search、forget。
- 它还把 session scope 和 long-term scope 分开，这对避免“所有记忆都挤在一层里”很有帮助。

## 3. 核心发现

## 3.1 小项目最先需要的不是“智能记忆”，而是“稳定宿主”

从 LLM 的做法看，小项目第一步最重要的是：

- 先有默认运行留痕
- 先有可查询宿主
- 先能知道过去发生了什么

而不是一开始就追求：

- 自动抽取
- 自动优化
- 自动记忆编排

对当前项目的启发：

- 现在已经有 runtime 宿主，是对的
- 但 manifest 还偏静态，capture 增长速度仍取决于手工维护
- 所以下一步应该优先降低 capture 维护摩擦，而不是继续设计更复杂的 memory 结构

## 3.2 AI native 项目的“证据环”常常比“记忆层”更关键

从 Aider 的做法看，真正让项目变强的不是 memory 本身，而是：

- lint / test / benchmark 这种外部验证环
- 明确的 pass / fail 判定
- 真实问题驱动的行为迭代

对当前项目的启发：

- `complex-task-orchestrator` 当前最重要的主线仍然应该是 Round 1 真实任务验证
- memory 必须服务于行为验证，而不能反过来抢主线
- 如果没有足够强的 evidence loop，memory 层很容易沦为装饰

## 3.3 memory 必须分层，否则很快就会漂移

LangMem 的启发非常直接：

- semantic、episodic、procedural 不应该混在一层
- 写入时机也不该只有一种
- over-extract 会导致低精度，under-extract 会导致低召回

对当前项目的启发：

- 当前 runtime/captures 更接近 `episodic memory`
- `promoted/patterns` 和 `promoted/failure-modes` 更接近 `procedural memory`
- 当前项目还没有真正的 semantic profile 层，也不应该急着补

因此，当前最合理的方向不是扩更多 runtime 子目录，而是先明确：

- captures 是任务痕迹
- promoted 才是跨任务可复用规则
- 不要把所有 capture 都往上 promote

## 3.4 显式 recall / capture / forget 能显著减少记忆错觉

Mem0 / OpenClaw 给出的启发很强：

- recall 应该是显式动作
- capture 应该有 scope
- forget / delete 应该存在
- 最好能保留 edit history

对当前项目的启发：

- 当前项目已经有 recall 边界，但还没有 delete / retire 的明确规则
- 当前 promoted 资产一旦进入仓库，几乎没有“降级”或“失效”机制
- 这会导致未来 runtime 层越积越多时，旧 pattern 和 failure mode 可能逐渐漂移

## 4. 对当前项目的判断

## 4.1 当前 runtime 结构不过重，但仍偏原始

这是好事。

因为对当前项目来说，真正危险的不是“结构太少”，而是“在还没有真实 reuse 证据时，先上太多自动化机制”。

所以当前状态的正确判断是：

- `不是太轻到没法用`
- `也还没成熟到可以自动演进`

## 4.2 当前最合理的方向是“轻量强化”，而不是“体系扩建”

接下来最值得补的不是大系统，而是：

1. 降低 capture 维护成本
2. 明确 promoted 资产的失效 / 降级规则
3. 继续通过真实任务来证明 reuse 是否真的有帮助

## 5. 最小可行调整建议

## 建议 1：明确当前 memory 类型分层

建议在项目文档中明确：

- `captures/` = episodic
- `promoted/patterns` = procedural
- `promoted/failure-modes` = procedural
- 当前没有 semantic profile 层

这样能减少后续结构误判。

## 建议 2：为 promoted 资产补“失效判断”

建议新增一个最小规则：

- 如果某条 pattern / failure mode 连续多轮不再帮助任务，或者已被更稳定规则替代，应允许标记为 stale 或退役。

当前不一定要自动化实现，但规则应该先存在。

## 建议 3：不要默认走 auto-capture

Mem0/OpenClaw 展示了 auto-capture 的吸引力，但当前项目还不适合默认上这一层。

原因：

- 当前验证密度还不够
- 当前 task 类型差异还较大
- 如果太早自动 capture，容易把低质量、低价值痕迹灌进 runtime

所以当前最优策略仍然是：

- 手工 / 半手工 capture
- 明确 promote
- 小规模 reuse

## 建议 4：继续把验证环置于 memory 之前

当前项目最不应该犯的错误是：

- 还没把真实行为验证跑顺
- 就开始扩 memory 自动化

所以接下来优先级应保持为：

1. 真实任务验证
2. reuse 验证
3. skill 本体修正
4. 再考虑 memory 自动化

## 6. 对当前项目的直接决策影响

这份研究支持以下决策：

- 当前不做复杂 auto-capture
- 当前不扩 semantic profile 层
- 当前要补一个新的 failure mode：`over-extraction-causes-memory-drift`
- 当前要在 `SKILL.md` 和 runtime 说明中明确“不要过度提取”
- 当前继续保持“验证优先于记忆扩张”

## 7. 参考来源

- [LLM documentation](https://llm.datasette.io/_/downloads/en/stable/pdf/)
- [Aider benchmark article](https://aider.chat/2024/06/02/main-swe-bench.html)
- [Aider linting and testing docs](https://aider.chat/docs/usage/lint-test.html)
- [LangMem conceptual guide](https://langchain-ai.github.io/langmem/concepts/conceptual_guide/)
- [Mem0 OpenClaw integration](https://docs.mem0.ai/integrations/openclaw)
- [Mem0 delete memories API](https://docs.mem0.ai/api-reference/memory/delete-memories)
