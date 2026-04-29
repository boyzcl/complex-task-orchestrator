# Artifact Conventions

当任务需要在执行前后保留关键项目文档时，使用本参考。

## 默认目录结构

如果用户没有要求其他结构，就在项目里创建 `docs/` 目录来存放关键流程产物。

如果是单个项目里的多个复杂任务，优先按任务分目录，而不是把所有任务文档堆在同一级目录。

推荐结构：

```text
docs/
  task-slug/
    01-requirement-consensus.md
    02-validation-and-test-plan.md
    03-execution-plan.md
    04-self-review-and-summary.md
    [primary-output-if-needed]
```

默认文件：

- `01-requirement-consensus.md`
- `02-validation-and-test-plan.md`
- `03-execution-plan.md`
- `04-self-review-and-summary.md`

## 任务目录命名

- 默认使用短英文 slug，便于长期维护
- 命名应描述任务本身，而不是阶段
- 避免使用过于泛的名字如 `task1`、`research`、`new-task`

示例：

- `sexual-behavior-evidence-review`
- `skill-release-plan`
- `plugin-comparison-study`

## 语言规则

- 用户侧项目文档默认跟随当前对话语言。
- 如果当前协作语言是中文，就优先用中文写这些文档。
- 只有在用户明确要求、或项目分发场景强依赖英文时，才把项目文档改为英文或双语。
- 可复用 Skill 本体可以兼顾开源传播，但运行时项目文档先服务当前用户可读性。

## 应该记录什么

### 需求共识

只记录最终确认版理解，不记录整段探索式对话。

建议包含：

- 当前任务
- 目标
- 范围
- 已确认流程
- 关键约束
- 验收标准

### 测试与验收方案

在执行计划前创建，记录当前任务如何判断完成。

建议包含：

- 验证目标
- 验证点
- 验证方法
- 预期结果
- 必过项与可选项
- 证据留存方式
- 失败后的迭代规则

### 执行计划

为当前任务创建一份一次性的 Markdown 执行计划。

要求：

- 必须针对当前任务
- 必须足够自包含，不依赖额外解释
- 默认完整，只有在任务显然更简单时才裁剪
- 必须基于已确认的测试与验收方案
- 每个关键执行步骤尽量对应一个验证点

### 自检与总结

记录：

- 预设验证结果
- 未通过项的处理过程
- 1 到 10 分评分
- 扣分原因
- 自检后实际做过的修订
- 问题、本质原因、解决方案、最终信心

## 分离规则

把可复用 Skill 内容与本次运行产物分开：

- 可复用规则放在 Skill 目录
- 本次任务的决策和结果放在 `docs/`
- 如果同一项目中连续执行多个复杂任务，每个任务各自维护自己的子目录

## 压缩规则

如果任务足够简单，可以减少文档量。轻量任务可以合并为：

```text
01-requirement-consensus.md
02-execution-and-validation-summary.md
```

但复杂或长链路任务不应省略测试与验收设计。
