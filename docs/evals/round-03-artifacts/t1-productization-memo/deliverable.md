# T1 Productization Memo

本 memo 只基于以下文件：

- `README.md`
- `CHANGELOG.md`
- `docs/runtime-governance.md`
- `docs/runtime-memory-spec.md`
- `docs/validation-matrix.md`
- `docs/evals/round-02-assessment.md`
- `docs/evals/ai-native-decision-2026-04-17.md`
- `docs/evals/round-03-real-task-validation-plan.md`

## 判断

当前**还不值得直接进入“试用产品”阶段**。

更准确的定位是：这个项目已经不是“repo 里自洽的 skill 样品”，而是一个**在 `Codex` 客户端内完成最小行为验证、具备进入产品化验证资格的候选版本**；但还**没有**拿到足以支持“试用产品”判断的真实任务价值证据。

## 最关键的证据链

### 1. 它已经超过“样品”阶段

`README.md`、`CHANGELOG.md` 和 `docs/validation-matrix.md` 一致说明，这个项目已经具备：

- 可安装的 skill 本体和安装脚本
- `v0.2.0` 版本收口
- Quick Path / Full Path
- 最小 runtime memory 闭环
- governance 和 validation 文档
- `Codex` 客户端 runner 与最小真实验证

这说明它不再只是一个“文档上成立的 skill 样品”。

### 2. 它已经拿到“当前口径下成立”的客户端证据

`docs/evals/round-02-assessment.md` 和 `docs/evals/ai-native-decision-2026-04-17.md` 给出的核心结论是：

- `Codex` 侧 Quick Path / Full Path 都已有真实热路径证据
- 当前版本可以按“`Codex` 验证通过”收口
- `protocol-native`、最小 `memory-native`、`runner-native` 基本成立
- `cross-client-native` 尚未成立，但已被降级为非当前发布阻塞项

这说明“能不能在真实客户端里跑起来”这个问题，当前答案已经是“能，在 `Codex` 里能”。

### 3. 但“是否值得做试用产品”这件事，证据还没闭环

真正决定能否进入“试用产品”阶段的，不是触发成功，也不是客户端可运行，而是**真实工作价值**。

`docs/evals/round-03-real-task-validation-plan.md` 已经把这个门槛写得很清楚：只有当 3 到 5 个真实任务里，大多数被判定为 `Clearly helpful` 或 `Helpful but heavy`，并且至少 2 个任务明确减少上下文补充、至少 2 个任务明确减少返工风险时，Round 3 才能判定为“有产品化价值”。

在这次允许使用的材料里，**只有 Round 3 计划，没有 Round 3 结果**。因此当前最多只能说：

- 产品化验证问题被定义清楚了
- 但产品化价值本身还没有被证明

所以现在还不能把它升级表述为“值得进入试用产品阶段”。

## 最大风险

最大风险不是跨客户端缺失，而是**把“协议验证通过 / `Codex` 客户端验证通过”误判成“真实工作里已经有稳定产品价值”**。

如果现在就进入试用产品阶段，最可能出现的问题不是“完全不能用”，而是：

- 在复杂任务上看起来流程正确，但省事程度并未被证明
- 在短任务上可能显得过重
- 对外部试用者的价值承诺会跑在证据前面

这会把一个“已验证的 skill 候选版本”过早包装成“可试用产品”。

## 未来两周最值得做的 3 件事

1. 按 `docs/evals/round-03-real-task-validation-plan.md` 完成 `T1` 到 `T4`，并只用同一套标准产出 `round-03-assessment.md` 与产品化结论。
2. 在每个真实任务里强制收口四个指标：是否减少手动补充上下文、是否减少返工、是否产出可执行下一步、是否在短任务上过重；不要再用“触发成功”替代“产品价值成立”。
3. 如果 Round 3 通过，就把定位收紧为“`Codex`-only 试用版”，明确支持任务类型、适用边界和非目标；如果 Round 3 不通过，就先缩窄场景而不是提前放大产品叙事。

## 结论一句话

**当前结论应是：可以进入“真实任务产品化验证”阶段，但还不应直接进入“试用产品”阶段。**
