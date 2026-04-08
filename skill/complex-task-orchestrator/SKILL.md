---
name: complex-task-orchestrator
description: >
  Use this skill for complex, open-ended, multi-step, or underspecified tasks that should not be executed immediately. Trigger when the user asks the agent to clarify requirements first, asks for one-question-at-a-time alignment, needs explicit requirement consensus before execution, wants a task-specific Markdown execution prompt or document, or wants a full clarification, execution, and self-review workflow. 默认用于复杂、开放式、需求不完整、多阶段、误解成本高的任务：先逐轮单问澄清需求，达到高置信理解后复述并确认，再为当前任务生成一次性 Markdown 执行指令文档，随后执行、自检和总结。 Do not use for simple, well-scoped requests that can be executed directly.
---

# Complex Task Orchestrator

## Mission

- 先建立清晰共识，再执行复杂任务。
- 为当前任务生成一次性执行指令文档，而不是复用空泛的通用 prompt。
- 把任务推进到可交付结果、自检和总结，而不是停在想法或方案层。

## Stage Broadcast

- 在每个关键阶段切换时，明确告诉用户当前处于哪一阶段。
- 默认阶段名称：
  - 需求澄清
  - 共识确认
  - 执行指令生成
  - 正式执行
  - 自检修订
  - 任务总结
  - 扩展验证（仅在需要 forward test 时进入）
- 如果任务在主流程内已经完成，要明确说“主任务已完成”；不要把后续可选验证说成主流程尚未完成。
- 按 [references/stage-broadcast.md](references/stage-broadcast.md) 输出阶段提示。

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
- 如果仍存在可能改变方案方向、范围或验收标准的歧义，继续澄清，不要为了节省轮次而跳过。
- 如果任务复杂度高、开放性强、误解成本高，或者用户明确要求严格协议，读取 [references/full-protocol.md](references/full-protocol.md) 并按其高强度模式执行。
- 当你不确定该用轻量模式还是完整模式时，按 [references/mode-selection.md](references/mode-selection.md) 做判断，而不是凭感觉切换。

### 4. Confirm consensus explicitly

- 当对用户真实目标有约 95% 把握时，完整复述需求定义。
- 至少覆盖问题、目标、约束、交付物、质量标准、执行边界。
- 明确请求用户确认；未确认前不要进入正式执行。

### 5. Create task-specific execution artifacts

- 在正式执行前，先为当前任务生成 Markdown 文档。
- 用户侧项目文档默认跟随当前对话语言；如果当前协作是中文，就优先用中文写需求共识、执行指令和自检总结。
- 除非用户明确反对，否则默认创建最小文档骨架：
  - 需求共识文档
  - 一次性任务执行指令文档
  - 自检与总结文档
- 按 [references/artifact-conventions.md](references/artifact-conventions.md) 组织文档。
- 按 [references/execution-prompt-template.md](references/execution-prompt-template.md) 生成任务执行指令，默认完整，再按复杂度裁剪。
- 如果任务本质上是研究、调查、证据整合、文献综述或框架比较，读取 [references/research-review-workflow.md](references/research-review-workflow.md)。

### 6. Execute against the agreed prompt

- 把执行指令文档当作当前任务的操作协议。
- 如果执行中出现新的歧义：
  - 影响主路径、方案方向或验收标准时，暂停并回到澄清阶段。
  - 不影响主路径时，做最小合理假设继续推进，并在结果中说明假设。
- 把关键决策和重要偏差更新回项目文档。

### 7. Self-review and revise

- 完成后按 [references/self-review-checklist.md](references/self-review-checklist.md) 自检。
- 先给工作打 1 到 10 分，并说明扣分原因。
- 如果低于 9.5，继续修订，直到达到 9.5 以上，或被外部缺失信息阻塞；如果被阻塞，明确说明阻塞点。
- 最后输出问题、本质原因、解决方案和完成度信心。
- 用 [references/definition-of-done.md](references/definition-of-done.md) 区分“主任务闭环完成”和“额外验证仍待进行”。

## Conversation Rules

- 对中文用户优先使用中文；用户改用其他语言时跟随用户。
- 让问题简洁、具体、面向决策，不问礼貌性废话。
- 不要把整个中间试探过程都落盘；只沉淀关键节点文档。
- 不要把简单、明确、低风险的请求强行升级成重流程任务。

## Artifact Rules

- 让执行文档服务当前任务，而不是写成抽象宣言。
- 让用户要读的项目文档优先对当前用户可读，而不是优先迁就开源展示。
- 让文档足够自包含，使另一个高能力模型也能直接接手执行。
- 让最终总结始终回答四件事：
  - 目前的问题是什么
  - 本质原因是什么
  - 具体解决方案是什么
  - 当前方案有多少信心真正解决问题

## References

- 需要文档产物规则时，读取 [references/artifact-conventions.md](references/artifact-conventions.md)。
- 需要阶段播报时，读取 [references/stage-broadcast.md](references/stage-broadcast.md)。
- 需要判断轻量模式或完整模式时，读取 [references/mode-selection.md](references/mode-selection.md)。
- 需要生成一次性任务执行指令时，读取 [references/execution-prompt-template.md](references/execution-prompt-template.md)。
- 需要处理研究、调研、综述、证据整合任务时，读取 [references/research-review-workflow.md](references/research-review-workflow.md)。
- 需要执行后自检时，读取 [references/self-review-checklist.md](references/self-review-checklist.md)。
- 需要判断任务是否真正完成、以及 forward test 是否属于主流程时，读取 [references/definition-of-done.md](references/definition-of-done.md)。
- 需要高强度完整协议时，读取 [references/full-protocol.md](references/full-protocol.md)。
