# Claude Code 兼容说明

## 结论

`complex-task-orchestrator` 在结构层面与 Claude Code 的自定义 Skill 机制兼容。

兼容原因：

- Skill 目录名与 `name` 一致：`complex-task-orchestrator`
- 主入口文件为标准的 `SKILL.md`
- 使用的是 `name + description` 的 YAML frontmatter
- 其余说明文件放在子目录中，不影响 Claude Code 识别

`agents/openai.yaml` 是给 Codex/UI 用的附加元数据，Claude Code 即使不使用它，也不会影响 `SKILL.md` 这套 Skill 主体工作。

## 当前项目里已经做好的两层兼容

### 1. 项目级兼容

已在项目内创建：

- `.claude/skills/complex-task-orchestrator`

这意味着如果你用 Claude Code 打开这个项目，项目级 Skill 发现机制理论上就能直接看到它。

### 2. 个人级兼容

已在你的用户目录创建：

- `~/.claude/skills/complex-task-orchestrator`

这是一个指向本项目 Skill 目录的符号链接。也就是说，你在其他 Claude Code 工作区中，通常也能直接复用这一份 Skill。

## 安装脚本

项目里提供了一个安装脚本：

- [install-claude-code-skill.sh](/Users/boyzcl/Documents/Complex_Task/scripts/install-claude-code-skill.sh)

运行方式：

```bash
bash /Users/boyzcl/Documents/Complex_Task/scripts/install-claude-code-skill.sh
```

它会把当前项目里的 Skill 以符号链接方式安装到：

```text
~/.claude/skills/complex-task-orchestrator
```

## 使用建议

如果你想在 Claude Code 里验证它，建议：

1. 在 Claude Code 中打开本项目，或任意一个你想测试的项目
2. 直接明确提到 `complex-task-orchestrator`，或者给出一个明显复杂、开放、需要先澄清再执行的任务
3. 观察它是否按预期进入：
   - 需求澄清
   - 共识确认
   - 执行指令生成
   - 正式执行
   - 自检修订

## 还需要注意的点

- Claude Code 和 Codex 对 Skill 的触发体验、UI 展示、上下文注入细节不一定完全相同，所以“兼容”不等于“体验完全一致”
- 结构兼容已经具备，真正还需要验证的是 Claude Code 中的实际触发率和阶段表现
- 如果后续发现 Claude Code 对 description 长度、触发语气、目录发现规则有更明确偏好，再做一轮定向微调即可
