# complex-task-orchestrator

一个把复杂任务从“直接开工”拉回到“先澄清、先验证、再计划、再执行”的可复用 skill。

[English README](./README_EN.md)

## 当前阶段

截至 2026 年 4 月 17 日，当前最准确的项目口径是：

- 已在 `Codex` 内完成阶段性验证
- 当前进入的是 `Codex`-only 受限试用阶段
- 当前最强场景是短状态同步 / brief、快速 review / audit、固定来源复杂判断

当前不应把它表述成：

- 跨客户端都已稳定成立
- 通用复杂任务代理
- 所有复杂任务都更省事的默认方案

## 适合什么任务

- 复杂、开放、多阶段、误解成本高的任务
- 需要先问清楚再执行的任务
- 需要先定义测试/验收逻辑，再沉淀执行计划和自检总结的任务
- 调研综述、系统设计、项目规划、开放式实现、skill / workflow 设计

## 当前已验证最强场景

- 短状态同步 / brief
- 快速 review / audit
- 有固定来源清单的复杂判断 memo

这些场景不是这个 skill 的全部理论适用范围，而是截至 2026 年 4 月 17 日已经在 `Codex` 内出现重复正样本支持的范围。

## 不适合什么任务

- 小 bug 修复
- 短文本润色
- 简单格式调整
- 单步事实查询
- 为了“看起来专业”而强行加流程的低风险任务

## 30 秒触发示例

```text
这是一个复杂任务。请用 complex-task-orchestrator 先澄清需求，做一次共识确认，再先给测试/验收思路，生成执行计划后开始做。
```

```text
Use complex-task-orchestrator to clarify this ambiguous task before execution.
```

## 第一次运行会发生什么

默认情况下，这个 skill 会尽量把复杂任务拉到一条更稳的路径上：

1. 如果任务仍有关键歧义，先问清楚最关键的问题
2. 在执行前复述理解并做一次共识确认
3. 先为当前任务设计测试/验收逻辑
4. 再生成一次性执行计划
5. 再进入正式执行
6. 完成后按预设验证方案回验
7. 如未通过则迭代修订，最后自检、总结

如果任务已经足够清楚，它会压缩到 `Quick Path`：

- 0 到 1 轮澄清
- 一次简短共识确认
- 一份最小验收检查
- 一份短版执行计划
- 按最小验收检查回验
- 保留自检和最终总结

## 一次运行通常会产出什么

如果允许落盘，默认最小产物是：

- `01-requirement-consensus.md`
- `02-validation-and-test-plan.md`
- `03-execution-plan.md`
- `04-self-review-and-summary.md`

具体约定见 [docs/first-run-example.md](docs/first-run-example.md) 和 [skill/complex-task-orchestrator/references/artifact-conventions.md](skill/complex-task-orchestrator/references/artifact-conventions.md)。

## 为什么它比直接提问更稳

直接提问的常见失真点是：

- 需求还没讲清楚，模型就开始执行
- 输出看起来很完整，但实际答错题
- 任务做完就停，没有自检和修订

这个 skill 的价值不在于“让模型更会写”，而在于：

- 先逼出真实目标
- 先对齐边界和验收标准
- 在执行前定义测试/验收逻辑
- 把执行计划显性化
- 在收工前按预设验证回验并自检

更多解释见 [docs/why-this-helps.md](docs/why-this-helps.md)。

## 安装

### Codex

```bash
bash /path/to/complex-task-orchestrator/scripts/install-codex-skill.sh
```

安装后会创建：

```text
~/.codex/skills/complex-task-orchestrator
```

这是当前已完成真实任务验证、并进入受限试用的主路径。

### Claude Code

```bash
bash /path/to/complex-task-orchestrator/scripts/install-claude-code-skill.sh
```

安装后会创建：

```text
~/.claude/skills/complex-task-orchestrator
```

当前这只代表安装入口和结构兼容信息存在，不代表 Claude Code 已进入当前成立范围。边界说明见 [docs/claude-code-compatibility.md](docs/claude-code-compatibility.md)。

## 公开案例

- [案例总览](docs/cases/README.md)
- [案例 1：研究 / 综述任务](docs/cases/case-01-research-review.md)
- [案例 2：skill 自举创建任务](docs/cases/case-02-skill-bootstrap.md)
- [案例 3：项目审计与整改任务](docs/cases/case-03-project-remediation.md)
- [before / after 对照](docs/cases/before-after-comparison.md)

这些案例是 `curated assets`，不是原始 runtime 样本的直接导出。repo、安装副本、runtime 的边界见 [docs/runtime-asset-boundary.md](docs/runtime-asset-boundary.md)。

## Runtime Memory

本项目现在包含一个最小 runtime memory 闭环：

- `runtime/captures/`：原始任务 capture
- `runtime/promoted/patterns/`：可跨任务复用的方法
- `runtime/promoted/failure-modes/`：容易复发的失败模式
- `runtime/state/runtime-memory-manifest.json`：最小索引

设计说明见 [docs/runtime-memory-spec.md](docs/runtime-memory-spec.md)。
治理规则见 [docs/runtime-governance.md](docs/runtime-governance.md)。

## 当前状态

截至 2026 年 4 月 17 日，这个项目已经具备：

- 可安装的 skill 本体
- Codex 与 Claude Code 的安装脚本
- 快速路径与完整路径
- 测试/验收先行的待发布协议升级
- 最小 runtime memory 宿主
- `v0.2.0` release package
- 3 个公开案例与 1 个对照案例
- changelog、smoke checklist、validation matrix
- Round 2 客户端验证框架
- Round 3 真实任务价值证据链
- 轻量 memory governance 规则

当前已成立的范围：

- `Codex` 内的阶段性验证
- `Codex`-only 受限试用
- brief / quick audit / 固定来源复杂判断这三类任务

当前 `Unreleased` 变更还加入了测试/验收先行流程。该升级已经纳入结构校验，但不改变 2026 年 4 月 17 日形成的产品价值边界。

仍未宣称的内容：

- 不宣称已经完成成熟的自动化 memory 系统
- 不宣称已经在所有客户端完成充分行为验证
- 不宣称已经是广谱稳定的复杂任务代理
- 不把 `.local-docs/` 直接当作公开案例库

## 仓库结构

```text
skill/complex-task-orchestrator/
  SKILL.md
  references/
  runtime/
scripts/
  install-codex-skill.sh
  install-claude-code-skill.sh
  validate-skill-project.sh
docs/
  cases/
  templates/
  *.md
.claude/skills/complex-task-orchestrator
```

## 维护信号

- 变更记录见 [CHANGELOG.md](CHANGELOG.md)
- 版本说明见 [docs/releases/v0.2.0-release-notes.md](docs/releases/v0.2.0-release-notes.md)
- 手工验收清单见 [docs/smoke-checklist.md](docs/smoke-checklist.md)
- 验证矩阵见 [docs/validation-matrix.md](docs/validation-matrix.md)
- AI native 判断与后续验证计划见 [docs/evals/README.md](docs/evals/README.md)

## License

MIT
