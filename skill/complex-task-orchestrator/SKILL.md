---
name: complex-task-orchestrator
description: >
  Use this skill for complex, open-ended, multi-step, or underspecified tasks that should not be executed immediately. Trigger when the user asks the agent to clarify requirements first, asks for one-question-at-a-time alignment, needs explicit requirement consensus before execution, wants validation/test thinking before the execution plan, wants task-specific Markdown planning artifacts, or wants a full clarification, validation-first execution, verification, iteration, and self-review workflow. 默认用于复杂、开放式、需求不完整、多阶段、误解成本高的任务：先逐轮单问澄清需求，达到高置信理解后复述并确认，再先设计测试/验收逻辑，然后生成执行计划，随后执行、按预设验证回验、失败迭代、自检和总结。 Do not use for simple, well-scoped requests that can be executed directly.
---

# Complex Task Orchestrator

## Mission

- 先建立清晰共识，再执行复杂任务。
- 先设计测试/验收逻辑，再生成执行计划。
- 为当前任务生成一次性验证方案和执行计划，而不是复用空泛的通用 prompt。
- 把任务推进到可交付结果、预设验证回验、失败迭代、自检和总结，而不是停在想法或方案层。

## Trigger Boundaries

### Use this skill when

- 任务复杂、开放、多阶段，或需求仍有关键歧义。
- 用户明确要求先澄清、一次只问一个问题、先确认再执行。
- 任务失败代价高，返工成本明显高于多花一轮澄清。
- 任务需要沉淀可交接的执行文档，而不是只要一个即时回答。

### Do not use this skill when

- 请求非常简单、范围明确、低风险。
- 用户只要一个快速事实查询或一段小修小改。
- 额外流程明显比直接执行更贵。

## Stage Broadcast

- 在每个关键阶段切换时，明确告诉用户当前处于哪一阶段。
- 默认阶段名称：
  - 需求澄清
  - 共识确认
  - 测试与验收设计
  - 执行计划生成
  - 正式执行
  - 预设验证回验
  - 失败迭代
  - 自检总结
  - 扩展验证（仅在需要 forward test 时进入）
- 如果任务在主流程内已经完成，要明确说“主任务已完成”；不要把后续可选验证说成主流程尚未完成。
- 按 [references/stage-broadcast.md](references/stage-broadcast.md) 输出阶段提示。

## Quick Path

当以下条件基本都成立时，优先走快速路径，而不是完整协议：

- 目标已经清楚
- 交付物已经清楚
- 关键约束已经清楚
- 现在直接执行大概率不会走偏

快速路径规则：

- 可以压缩追问为 0 到 1 轮
- 仍要做一次简短共识确认
- 仍要列出最小验收检查
- 仍建议生成执行计划，但可以把验证方案和执行计划压缩成短版
- 完成后仍要按最小验收检查回验
- 仍要保留自检与最终总结

如果快速路径中途出现会改变方案方向或验收标准的新歧义，立即回到完整路径。

## Default Workflow

### 1. Adopt the strongest-brain stance

- 先判断该领域的顶级专家会如何定义问题、拆解路径、设置质量门槛。
- 把这种思维方式融入提问、执行文档和执行动作，但不要为了“像专家”而堆砌术语。

### 2. Clarify through one-question turns

- 一次只问一个真正推进理解的问题。
- 优先澄清目标、成功标准、约束、交付物、验证方式。
- 如果用户回答引入新的关键模糊点，先追问该点，再回到主线。
- 不要在此阶段直接输出完整方案或开始正式执行。

### 3. Decide whether to compress the flow

- 默认偏严格流程。
- 如果用户明确要求直接做，且任务已经足够清晰、没有关键歧义，可以压缩澄清轮次。
- 如果当前场景不适合多轮追问，但任务仍存在会改变方案方向、范围或验收标准的歧义，不要因为“可以带假设继续”就直接滑到压缩路径；应保留 Full Path 的框架，并显式列出假设后继续执行。
- 如果仍存在可能改变方案方向、范围或验收标准的歧义，继续澄清，不要为了节省轮次而跳过。
- 如果任务复杂度高、开放性强、误解成本高，或者用户明确要求严格协议，读取 [references/full-protocol.md](references/full-protocol.md) 并按其高强度模式执行。
- 当你不确定该用轻量模式还是完整模式时，按 [references/mode-selection.md](references/mode-selection.md) 做判断，而不是凭感觉切换。

### 4. Confirm consensus explicitly

- 当对用户真实目标有约 95% 把握时，完整复述需求定义。
- 至少覆盖问题、目标、约束、交付物、质量标准、执行边界。
- 明确请求用户确认；未确认前不要进入正式执行。

### 5. Design validation before planning

- 在正式执行计划前，先为当前任务设计测试/验收逻辑。
- 至少明确验证点、验证方法、预期结果、必过项、证据留存方式和失败迭代规则。
- 每个核心交付物至少要有一个对应验证点。
- 如果任务不是代码任务，也要使用人工验收表、证据矩阵、口径一致性检查或读者路径检查等方式验证。
- 需要完整规则时，读取 [references/validation-first-workflow.md](references/validation-first-workflow.md)。
- 需要模板时，读取 [references/validation-plan-template.md](references/validation-plan-template.md)。

### 6. Create task-specific planning artifacts

- 在正式执行前，先为当前任务生成 Markdown 文档。
- 用户侧项目文档默认跟随当前对话语言；如果当前协作是中文，就优先用中文写需求共识、验证方案、执行计划和自检总结。
- 除非用户明确反对，否则默认创建最小文档骨架：
  - 需求共识文档
  - 测试与验收方案文档
  - 一次性执行计划文档
  - 自检与总结文档
- 按 [references/artifact-conventions.md](references/artifact-conventions.md) 组织文档。
- 按 [references/execution-prompt-template.md](references/execution-prompt-template.md) 生成任务执行计划，默认完整，再按复杂度裁剪。
- 如果任务本质上是研究、调查、证据整合、文献综述或框架比较，读取 [references/research-review-workflow.md](references/research-review-workflow.md)。

### 7. Execute against the agreed plan

- 把执行计划文档当作当前任务的操作协议。
- 如果执行中出现新的歧义：
  - 影响主路径、方案方向或验收标准时，暂停并回到澄清阶段。
  - 不影响主路径时，做最小合理假设继续推进，并在结果中说明假设。
- 把关键决策和重要偏差更新回项目文档。

### 8. Verify, iterate, then self-review

- 执行完成后，先按测试与验收方案逐项回验。
- 记录通过、失败、跳过和阻塞原因，并保留关键证据。
- 任何必过验证项失败时，不要直接进入最终总结；先定位原因、修复或补充，再重新运行相关验证。
- 如果无法通过，明确说明外部阻塞、影响范围和剩余风险。
- 自检不能替代预设验证；自评分必须基于验证结果。

- 完成后按 [references/self-review-checklist.md](references/self-review-checklist.md) 自检。
- 先给工作打 1 到 10 分，并说明扣分原因。
- 如果低于 9.5，继续修订，直到达到 9.5 以上，或被外部缺失信息阻塞；如果被阻塞，明确说明阻塞点。
- 最后输出问题、本质原因、解决方案和完成度信心。
- 用 [references/definition-of-done.md](references/definition-of-done.md) 区分“主任务闭环完成”和“额外验证仍待进行”。

## Runtime Reuse Rules

- 默认不要全量读取 runtime 资产。
- 只有当当前任务与已知模式明显相关时，才读取 1 到 2 条 promoted 资产。
- 优先读取 `status = active` 的 `runtime/promoted/patterns/`，其次读取 `status = active` 的 `runtime/promoted/failure-modes/`。
- `status = watch` 的资产只在明确相关时读取。
- `status = stale` 的资产默认不读取。
- `runtime/captures/` 主要用于留痕和后续筛选，不应直接全部注入上下文。
- 如果 runtime 里没有明确相关的资产，不要为了“看起来有记忆”而强行引用。
- 当一次任务结束后，如果本轮确实产生了跨任务仍有价值的方法或失败模式，可按 [runtime/README.md](runtime/README.md) 写入 capture，并视价值提升为 pattern 或 failure mode。
- 不要因为某次任务里出现了一个看起来聪明的结论，就立刻 promote；优先提升跨任务仍有价值、边界清楚、能减少返工的模式。
- promote 后默认需要进入最小治理视角：确认它是 `active`、`watch` 还是 `stale`，而不是把所有 promoted 资产都当成默认可读知识。
- 对重复结构的验证、审计或维护任务，优先用脚手架生成最小工件，避免记录摩擦压低 capture 频率。

## Failure Handling

- 用户不愿多轮澄清：
  - 明确说明风险
  - 用最小合理假设继续
  - 在结果中显式写出假设和影响
- 用户回答很模糊：
  - 继续追问当前最关键的模糊点
  - 不要一次问多个问题
- 不适合写文件：
  - 保留口头版共识确认、压缩版验收检查和压缩版执行计划
  - 不要因为无法落盘就放弃协议核心
- 中途需求变更：
  - 若变更影响主路径、交付物或验收标准，回到共识确认
  - 若只影响局部细节，说明变更并继续执行

需要更完整的异常路径规则时，读取 [references/failure-handling.md](references/failure-handling.md)。

## Success Signals

- 结果解决的是用户真正的问题，而不是一个浅层代理问题。
- 执行路径明显减少了返工或方向跑偏。
- 共识、验证方案、执行计划和最终交付之间保持一致。
- 最终交付已按预设验证方案回验，必过项已经通过或阻塞已说明。
- 留下了足够的产物，方便下次复用或交接。

需要更明确的成功标准时，读取 [references/success-criteria.md](references/success-criteria.md)。

## Conversation Rules

- 对中文用户优先使用中文；用户改用其他语言时跟随用户。
- 让问题简洁、具体、面向决策，不问礼貌性废话。
- 不要把整个中间试探过程都落盘；只沉淀关键节点文档。
- 不要把简单、明确、低风险的请求强行升级成重流程任务。

## Artifact Rules

- 让执行文档服务当前任务，而不是写成抽象宣言。
- 让用户要读的项目文档优先对当前用户可读，而不是优先迁就开源展示。
- 让文档足够自包含，使另一个高能力模型也能直接接手执行。
- 让验证方案先于执行计划出现，避免执行后才临时定义成功标准。
- 当类似任务会反复出现时，优先复用脚手架或模板，降低留痕成本。
- 让最终总结始终回答四件事：
  - 目前的问题是什么
  - 本质原因是什么
  - 具体解决方案是什么
  - 当前方案有多少信心真正解决问题

## References

- 需要文档产物规则时，读取 [references/artifact-conventions.md](references/artifact-conventions.md)。
- 需要阶段播报时，读取 [references/stage-broadcast.md](references/stage-broadcast.md)。
- 需要判断轻量模式或完整模式时，读取 [references/mode-selection.md](references/mode-selection.md)。
- 需要先设计测试/验收逻辑时，读取 [references/validation-first-workflow.md](references/validation-first-workflow.md)。
- 需要生成验证方案时，读取 [references/validation-plan-template.md](references/validation-plan-template.md)。
- 需要生成一次性任务执行计划时，读取 [references/execution-prompt-template.md](references/execution-prompt-template.md)。
- 需要处理研究、调研、综述、证据整合任务时，读取 [references/research-review-workflow.md](references/research-review-workflow.md)。
- 需要执行后自检时，读取 [references/self-review-checklist.md](references/self-review-checklist.md)。
- 需要判断任务是否真正完成、以及 forward test 是否属于主流程时，读取 [references/definition-of-done.md](references/definition-of-done.md)。
- 需要高强度完整协议时，读取 [references/full-protocol.md](references/full-protocol.md)。
- 需要处理异常路径时，读取 [references/failure-handling.md](references/failure-handling.md)。
- 需要判断任务是否真的比直接做更稳时，读取 [references/success-criteria.md](references/success-criteria.md)。
