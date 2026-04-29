# Runtime 资产边界说明

本项目有三类容易混淆的资产：repo 资产、安装副本、runtime 资产。

如果不把它们分开，最常见的误判就是：

- 把 README 当成运行证据
- 把 curated case 当成默认运行样本
- 把安装副本当成仓库当前状态

## 1. repo 资产

repo 资产是公开仓库里受版本管理的内容，例如：

- `README.md`
- `docs/cases/*.md`
- `skill/complex-task-orchestrator/SKILL.md`
- `skill/complex-task-orchestrator/runtime/` 下的结构、模板、被明确提升后的模式

repo 资产负责：

- 对外表达
- 安装与使用说明
- 公开案例
- 可复用规则
- 被确认值得保留的长期资产

repo 资产不等于最近真实运行记录。

## 2. 安装副本

安装副本通常是指通过脚本创建的符号链接：

- `~/.codex/skills/complex-task-orchestrator`
- `~/.claude/skills/complex-task-orchestrator`

安装副本负责：

- 让客户端能发现并使用该 skill

安装副本不负责：

- 证明仓库当前状态
- 记录 runtime 历史

## 3. runtime 资产

runtime 资产是任务运行过程中自然产生或被整理出来的记忆层资产，例如：

- `runtime/captures/`
- `runtime/promoted/patterns/`
- `runtime/promoted/failure-modes/`
- 本地 `.local-docs/` 中的私有运行样本

runtime 资产负责：

- 留存任务级痕迹
- 支持后续筛选
- 支持小规模复用

runtime 资产不等于公开案例。

## 4. `.local-docs/` 的定位

`.local-docs/` 是本地运行样本宿主。

当前规则：

- 默认不提交到 git
- 可以作为作者本地复盘与抽取公共案例的原始来源
- 不应直接被当成对外公开证据层

如果某个运行样本值得公开，应先转写为 `curated case`，再放入 `docs/cases/`。

## 5. curated case 是什么

`docs/cases/` 中的案例是整理后的公开资产。

它们可以来源于 runtime 样本，但必须经过：

- 脱敏
- 结构化重写
- 资产类型说明

因此：

- `docs/cases/*.md` 不是原始运行日志
- `.local-docs/` 也不是公开案例页

## 6. 判断规则

如果一个文件主要用于：

- 公开讲清项目和案例：它是 repo 资产
- 让客户端发现 skill：它是安装副本
- 记录某次任务的真实过程或可复用模式：它是 runtime 资产
