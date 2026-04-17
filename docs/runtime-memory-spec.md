# Runtime Memory 最小规格

本项目当前只实现最小 runtime memory 闭环，不实现复杂自动化系统。

## 目标

让 skill 从“会留档”向“下一轮能读到一点真正有用的经验”迈进一步。

## 目录结构

```text
skill/complex-task-orchestrator/runtime/
  README.md
  captures/
  promoted/
    patterns/
    failure-modes/
  state/
    runtime-memory-manifest.json
```

## 资产类型

### 1. capture

capture 是一次任务结束后留下的最小运行痕迹。

推荐包含：

- task type
- summary
- what worked
- what failed
- source artifacts
- reuse hint

capture 的作用是：

- 留痕
- 供后续 triage

它不应被默认全量注入上下文。

在当前项目里，`captures/` 更接近 `episodic memory`。

### 2. promoted pattern

pattern 是被提升后的、跨任务仍有价值的方法。

pattern 进入 promoted 的前提：

- 不依赖某个单一任务的正文细节
- 能清楚描述适用条件
- 能解释为什么有效

在当前项目里，`promoted/patterns/` 更接近 `procedural memory`。

### 3. promoted failure mode

failure mode 是已经反复出现，值得下次主动规避的问题。

failure mode 进入 promoted 的前提：

- 失败点明确
- 影响结果明显
- 下次可以提前识别或规避

在当前项目里，`promoted/failure-modes/` 也更接近 `procedural memory`。

## 当前明确没有的层

当前项目还没有单独的 semantic profile 层。

这意味着：

- 不要急着为用户偏好、长期画像等信息新增一整层结构
- 先把 episodic -> promote -> reuse 这条链跑顺

## 读取规则

- 默认不要读取全部 runtime 资产。
- 只有当前任务与某类模式明显相关时，才读取 1 到 2 条 promoted 资产。
- 优先读取 `active` 的 `patterns/`，其次读取 `active` 的 `failure-modes/`。
- 只有在明确相关时，才读取 `watch` 资产。
- `stale` 资产默认不进入读取集合。
- 如果没有明确相关资产，不要硬读。
- 如果某类 promoted 资产开始增长很快，但 reuse 帮助感下降，要警惕 over-extraction。

## 与 `.local-docs/` 的关系

`.local-docs/` 可以是本地运行样本来源，但不是默认的 repo 内 runtime 证据层。

runtime 目录中的资产，应该是：

- 明确可复用
- 明确值得保留
- 可以被公开仓库长期维护

## 失效与降级意识

当前项目还没有自动化的 retire / stale 机制，但从现在开始应有一个明确判断：

- 如果某条 pattern 或 failure mode 在后续任务中长期不再帮助决策，或者已被更稳定规则取代，应考虑降级、重写或标记为 stale。

## 轻量治理

当前项目采用最小治理规则：

- `active`：默认可读
- `watch`：相关时可读，但要警惕证据不足
- `stale`：默认不读，只保留为历史资产

具体规则见 [runtime-governance.md](runtime-governance.md)。
