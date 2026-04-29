# Claude Code 边界说明

## 结论

截至 2026 年 4 月 17 日，Claude Code **不在当前成立范围内**。

当前能确认的是：

- 仓库结构与 Claude Code 的自定义 skill 发现机制兼容
- 项目级入口和安装脚本都已存在

当前不能确认的是：

- Claude Code 里已经具备可复现的真实任务正样本
- Claude Code 已进入当前 `Codex`-only 受限试用范围

## 事实分层

截至 2026 年 4 月 17 日，请把兼容性理解成以下三层：

### 1. 结构兼容：已具备

当前仓库满足 Claude Code 识别 skill 的基础结构：

- skill 目录名与 `name` 一致：`complex-task-orchestrator`
- skill 主入口为 `SKILL.md`
- frontmatter 使用 `name + description`
- 其他参考文件都在子目录中，不影响主入口识别

### 2. 项目级入口：已具备

仓库内包含：

- `.claude/skills/complex-task-orchestrator`

这意味着当 Claude Code 打开本项目时，项目级发现机制有机会直接看到该 skill，但这仍然不构成行为验证通过。

### 3. 用户级安装：需要用户执行脚本

仓库提供：

- [install-claude-code-skill.sh](/Users/boyzcl/Documents/Complex_Task/scripts/install-claude-code-skill.sh)

运行后会创建：

```text
~/.claude/skills/complex-task-orchestrator
```

重要边界：

- 这不是仓库天然自带的状态
- 只有在用户实际运行安装脚本后，这个用户级符号链接才会存在
- 仅有目录结构和符号链接还不等于“本机已经具备可运行的 Claude Code 客户端”

## 当前尚未宣称的内容

当前文档不宣称以下内容已经完成验证：

- 所有 Claude Code 版本上的触发体验一致
- Claude Code 中的自动触发率已经充分验证
- 阶段播报、quick path、runtime reuse 在 Claude Code 中都已完成充分的真实任务验证

## 安装方式

```bash
bash /Users/boyzcl/Documents/Complex_Task/scripts/install-claude-code-skill.sh
```

## 建议验证方式

如果你要在 Claude Code 里验证，建议最少做两类测试：

1. 轻量模式任务
2. 完整模式任务

重点观察：

- 是否进入 skill
- 是否能做出明确的阶段切换
- 是否会在需要时走 quick path
- 是否能按预期生成共识确认和执行指令

对应记录面已经准备在：

- [docs/evals/round-02-client-validation-plan.md](/Users/boyzcl/Documents/Complex_Task/docs/evals/round-02-client-validation-plan.md)
- [docs/evals/client-trigger-log.md](/Users/boyzcl/Documents/Complex_Task/docs/evals/client-trigger-log.md)

## 兼容性判断

当前最准确的判断是：

- `结构兼容：是`
- `项目级入口：是`
- `安装脚本：是`
- `当前成立范围：否`
- `完整行为验证：仍未完成`
