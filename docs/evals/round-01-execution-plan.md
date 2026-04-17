# Round 1 真实任务验证执行计划

日期：2026-04-16

## 1. 目标

Round 1 的目标不是再写更多文档，而是验证以下四件事：

1. skill 是否能在真实任务中稳定触发
2. skill 是否能正确选择 quick path 或完整路径
3. skill 是否真的带来结果层增益，而不是只带来更多流程
4. runtime memory 是否能开始形成可证明的 reuse 链

## 2. 成功标准

Round 1 结束时，至少满足以下条件：

- 完成 6 个真实任务验证
- 覆盖 3 类任务：
  - 研究 / 综述类 2 个
  - 规划 / 设计类 2 个
  - 实现 / 整改类 2 个
- 6 个任务里至少 4 个被评为“显著有帮助”
- 至少 1 个任务证明 quick path 是正确选择
- 至少 1 个任务暴露出新的 failure mode
- 至少完成 2 次 runtime reuse 验证

## 3. 执行范围

### 本轮要做

- 建立统一评分卡
- 建立任务板
- 建立 runtime reuse 日志
- 用真实任务逐项记录行为表现
- 基于真实任务结果修正 skill

### 本轮不做

- 不做复杂 benchmark 平台
- 不做自动化 runtime 写入工具
- 不以扩 references 为主线
- 不做大规模客户端适配工程

## 4. 执行顺序

### 阶段 A：准备

- 建立执行框架
- 选定 6 个任务
- 明确每个任务的分类与目标

### 阶段 B：真实任务运行

每个任务都必须记录：

- 任务类型
- 触发情况
- path 选择
- 共识确认质量
- 执行效果
- 是否留下 capture
- 是否值得 promote
- 是否读取了已有 runtime 资产
- 读取是否带来收益

### 阶段 C：runtime 复用验证

重点不是“有没有写 capture”，而是：

- 下一轮有没有读取
- 读取有没有帮助

### 阶段 D：协议修正

Round 1 结束后，只允许基于真实任务结果修改三类内容：

- trigger boundary
- quick path / full path 切换条件
- failure handling

## 5. 任务构成

Round 1 固定 6 个任务槽位：

1. 研究 / 综述任务 A
2. 研究 / 综述任务 B
3. 规划 / 设计任务 A
4. 规划 / 设计任务 B
5. 实现 / 整改任务 A
6. 实现 / 整改任务 B

当前已存在的历史案例可以作为 baseline 参考，但不直接算作 Round 1 完整通过项，除非按统一评分卡补齐评估。

## 6. 每个任务的统一输出

每个任务都必须至少产出：

- 一份评分卡
- 一条 capture 或明确说明为什么没有 capture
- 一条是否进入 reuse log 的记录

## 7. 记录位置

- 任务板：`docs/evals/round-01-task-board.md`
- 评分卡模板：`docs/evals/task-run-scorecard-template.md`
- runtime reuse 日志：`docs/evals/runtime-reuse-log.md`
- 单任务评分卡：`docs/evals/round-01-runs/`

## 8. 节奏建议

### 第 1 段

- 先补齐任务板和模板
- 先把现有 3 个已知案例转成 baseline scorecard

### 第 2 段

- 开始新一轮真实任务
- 每完成 1 个任务就立即写评分卡

### 第 3 段

- 累计至少 2 次 reuse 尝试
- 判断哪些 pattern 真有效、哪些只是写得好看

### 第 4 段

- 基于结果修正 `SKILL.md`
- 更新 `validation-matrix.md`
- 决定是否进入 `v0.2.0`

## 9. 退出条件

Round 1 只有在下面条件同时满足时才算结束：

- 6 个任务全部完成评分
- 2 次 reuse 验证已完成
- 至少 1 条新 failure mode 已确认
- 至少一轮 skill 规则修正已完成

## 10. 本轮立即执行项

当前回合立即执行以下动作：

1. 建立 `docs/evals/` 结构
2. 建立任务板
3. 建立评分卡模板
4. 建立 reuse 日志
5. 将已有 3 个案例补成 baseline 评分卡

这意味着 Round 1 从现在开始，而不是停留在待办状态。
