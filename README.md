# complex-task-orchestrator

一个面向复杂任务的可复用 Skill。

它解决的不是模型会不会做，而是复杂任务里最常见的那个问题：

- 需求还没讲清楚，模型就开始执行
- 模型产出看起来很完整，但其实做错了题
- 任务做完就停，没有真正的自检和修订闭环

`complex-task-orchestrator` 的目标，就是把复杂任务拉回一条更稳的路径：

1. 先澄清需求
2. 再达成共识
3. 再生成一次性执行指令
4. 再正式执行
5. 最后自检、修订、总结

[English README](./README_EN.md)

## 适合什么任务

适合复杂、开放、多阶段、误解成本高的任务，例如：

- 调研、综述、证据整合
- 工作流设计、系统设计
- Skill / Prompt / Plugin 创建
- 项目规划
- 大型或开放式实现任务
- 任何你希望模型先问清楚、再开始做的任务

## 不适合什么任务

不建议用于非常简单、范围明确、低风险的任务，例如：

- 小 bug 修复
- 短文本润色
- 简单格式调整
- 单步事实查询

## 核心能力

- 在需要时，一次只问一个真正推进理解的问题
- 在执行前明确复述需求并等待确认
- 为当前任务生成一次性的 Markdown 执行指令文档
- 让用户侧项目文档默认跟随当前工作语言
- 明确区分主任务闭环和可选的 forward test
- 在结束前进行自评和修订，而不是直接收工

## 仓库结构

```text
skill/complex-task-orchestrator/
  SKILL.md
  references/
scripts/
  install-codex-skill.sh
  install-claude-code-skill.sh
docs/
  claude-code-compatibility.md
.claude/skills/complex-task-orchestrator
```

- `skill/complex-task-orchestrator/` 是真正可安装的 Skill 本体
- `scripts/` 是安装辅助脚本
- `docs/` 只保留对公开使用有帮助的文档
- `.claude/skills/complex-task-orchestrator` 让这个仓库对 Claude Code 更友好

## 安装到 Codex

```bash
bash /path/to/complex-task-orchestrator/scripts/install-codex-skill.sh
```

会安装到：

```text
~/.codex/skills/complex-task-orchestrator
```

## 安装到 Claude Code

```bash
bash /path/to/complex-task-orchestrator/scripts/install-claude-code-skill.sh
```

会安装到：

```text
~/.claude/skills/complex-task-orchestrator
```

项目内也已经包含了一个项目级入口：

```text
.claude/skills/complex-task-orchestrator
```

兼容说明见：
[docs/claude-code-compatibility.md](docs/claude-code-compatibility.md)

## 使用示例

下面这些请求，通常就适合触发这个 Skill：

- `Use complex-task-orchestrator to help me plan and execute this ambiguous project.`
- `这是一个复杂任务，请先一次问我一个问题，直到你真正理解需求。`
- `先帮我生成当前任务的执行指令文档，再开始做。`
- `我想要一套 clarify -> confirm -> execute -> self-review 的完整流程。`

## 当前状态

这个仓库现在已经可用、可安装、可公开发布，但还会继续通过真实任务迭代。

最近补齐的能力包括：

- 阶段播报
- 轻量模式 vs 完整模式判断
- 研究 / 综述类任务 workflow
- 任务目录命名规范
- 主任务完成 vs 扩展验证的边界定义

## 兼容性

- Codex：兼容
- Claude Code：结构兼容，并已提供安装脚本和项目级入口

## License

MIT
