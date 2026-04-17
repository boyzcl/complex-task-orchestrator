# Claude Code Unblock Checklist

日期：2026-04-17

## 目标

把当前项目从“在 Codex 客户端内稳定成立”推进到“开始具备跨客户端验证条件”。

## 当前阻塞

在当前机器上，以下入口都不存在：

- `claude`
- `claude-code`
- `anthropic`
- `~/.claude`

因此 `A1 / A2` 目前属于环境阻塞，不是行为失败。

## 最小解除阻塞步骤

1. 确认本机已安装可调用的 Claude Code 客户端
2. 确认至少存在一个可执行入口：
   - `claude`
   - `claude-code`
3. 确认用户目录存在：
   - `~/.claude`
4. 运行安装脚本：
   - `bash /Users/boyzcl/Documents/Complex_Task/scripts/install-claude-code-skill.sh`
5. 确认符号链接存在：
   - `~/.claude/skills/complex-task-orchestrator`

## 最小验收命令

```bash
command -v claude || command -v claude-code
ls -la ~/.claude
ls -la ~/.claude/skills/complex-task-orchestrator
```

## 环境解除后先跑什么

按既定顺序：

1. `A1` Claude Code Full Path
2. `A2` Claude Code Quick Path

## 跑完后立刻回写什么

- `docs/evals/round-02-runs/a1-claude-full-path.md`
- `docs/evals/round-02-runs/a2-claude-quick-path.md`
- `docs/evals/client-trigger-log.md`
- `docs/evals/round-02-assessment.md`

## 不要做什么

- 不要因为当前机器缺客户端，就把结构兼容当成行为验证通过
- 不要在没跑 `A1 / A2` 之前继续优先修改协议
