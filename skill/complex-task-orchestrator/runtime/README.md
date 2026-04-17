# Runtime Memory

这是 `complex-task-orchestrator` 的最小 runtime memory 宿主。

## 目标

为复杂任务保留最小但有用的运行痕迹，并允许把少量高价值经验提升为跨任务可复用资产。

## 目录说明

- `captures/`：原始 capture
- `promoted/patterns/`：被提升的方法
- `promoted/failure-modes/`：被提升的失败模式
- `state/runtime-memory-manifest.json`：最小索引

## 使用规则

- 不要把所有 capture 都当成下次运行的上下文
- 只有明确相关时，读取 1 到 2 条 promoted 资产
- 优先读取 `active` 资产
- `watch` 资产只在明确相关时读取
- `stale` 资产默认不读
- 如果一条 capture 只是单次任务留痕，不要强行 promote

## 当前状态

当前 runtime 层只实现最小闭环：

- 有宿主目录
- 有 capture 样本
- 有 promoted pattern
- 有 promoted failure mode
- 有 manifest

它还不是自动化记忆系统。

当前也还没有自动化的 stale / retire 流程，因此 promoted 资产必须克制增长。

当前治理规则见：

- [docs/runtime-governance.md](/Users/boyzcl/Documents/Complex_Task/docs/runtime-governance.md)
