# Session Handoff

日期：2026-04-17

## 当前总判断

项目已经从“只在 repo 内成立”推进到：

- `Codex` 客户端内稳定成立
- 已出现有限但真实的产品化价值
- `Claude Code` 侧仍然环境阻塞，但已不是当前主线

按当前验收口径，应先接受这一层结论：

- 当前版本已经可按 `Codex` 验证通过收口
- 当前已经可以进入 `Codex`-only 的受限试用阶段
- `Claude Code` 补跑属于下一阶段增强，而不是当前阻塞项

因此当前最重要的主线，不是继续优先修改 `SKILL.md`，而是：

1. 围绕已成立场景继续扩真实任务样本
2. 把“受限试用范围”写实并保持收口
3. 只在出现重复问题时再回写 `SKILL.md`

## 已完成的关键结果

### 1. 协议与 runtime 基础已成立

- `v0.2.0` 收口已完成
- runtime memory、governance、manifest、公开案例、Round 1 eval 都已建立

### 2. Codex 客户端验证已跑通

- `C1` 初次运行会压缩路径
- 经过规则修正与聚焦 runner 复跑后，`C1` 已能命中 `Full Path`
- `C2` 已稳定命中 `Quick Path`

### 3. Runner 基础设施已建立

已存在并通过校验：

- [run-codex-client-validation.sh](/Users/boyzcl/Documents/Complex_Task/scripts/run-codex-client-validation.sh)

这个 runner 会：

- 隔离 `HOME/.codex`
- 带超时
- 保留 `events.jsonl`、`last.txt`、`status.json`
- 将客户端摩擦和协议问题拆开

### 4. 一条真实不一致已修复

`C2` 重跑时发现：

- `runtime-memory-manifest.json` 把 `watch` 错列进了 `default_read_statuses`

已修复为：

- `default_read_statuses = ["active"]`
- `conditional_read_statuses = ["watch"]`

### 5. Round 3 已完成第一轮真实任务价值验证

当前已有 4 个真实任务位结果：

- `T1` 高歧义复杂决策：首轮超时，聚焦复跑完成，结论为 `Helpful but heavy`
- `T2` 中等复杂执行推进：首轮和聚焦复跑都超时，当前为 `Marginal`
- `T3` 短平快状态同步：完成，`Clearly helpful`
- `T4` 快速评审 / 一致性检查：完成，`Clearly helpful`

这轮最重要的新认知是：

- 当前最稳的产品价值场景是短状态同步和快速 review
- 有固定来源清单的复杂判断任务也有价值，但要控制输入边界
- 执行推进类任务当前仍不够稳，不应作为主打场景

## 当前阻塞

当前机器没有可调用的 Claude Code 客户端入口：

- `claude`
- `claude-code`
- `anthropic`
- `~/.claude`

因此：

- `A1` 未运行
- `A2` 未运行

这属于环境阻塞，不是行为失败。

但这不影响当前项目已经进入 `Codex`-only 受限试用阶段。

## 最重要的现状文件

- [Round 2 评估结论](/Users/boyzcl/Documents/Complex_Task/docs/evals/round-02-assessment.md)
- [AI native 当前决策](/Users/boyzcl/Documents/Complex_Task/docs/evals/ai-native-decision-2026-04-17.md)
- [Round 3 评估结论](/Users/boyzcl/Documents/Complex_Task/docs/evals/round-03-assessment.md)
- [产品价值决策](/Users/boyzcl/Documents/Complex_Task/docs/evals/product-value-decision-2026-04-17.md)
- [Round 3 真实任务验证计划](/Users/boyzcl/Documents/Complex_Task/docs/evals/round-03-real-task-validation-plan.md)
- [Round 3 任务板](/Users/boyzcl/Documents/Complex_Task/docs/evals/round-03-task-board.md)
- [Codex 客户端运行器说明](/Users/boyzcl/Documents/Complex_Task/docs/evals/codex-client-runner.md)
- [客户端触发日志](/Users/boyzcl/Documents/Complex_Task/docs/evals/client-trigger-log.md)

## 新对话里应直接做什么

如果新对话继续执行，优先顺序应为：

1. 先读取：
   - `docs/evals/session-handoff-2026-04-17.md`
   - `docs/evals/round-03-assessment.md`
   - `docs/evals/product-value-decision-2026-04-17.md`
   - `docs/evals/round-03-task-board.md`
2. 不要再从 `Claude Code` 环境阻塞开始，而是直接按受限试用口径继续
3. 优先补跑：
   - 2 到 3 个状态同步 / brief
   - 2 到 3 个快速 review / audit
   - 1 到 2 个固定来源清单的复杂判断任务
4. 暂时不要再跑“大而全执行推进包生成”，除非先把它拆成更小粒度任务
5. 跑完后立刻回写：
   - `docs/evals/round-03-runs/`
   - `docs/evals/round-03-artifacts/`
   - `docs/evals/round-03-assessment.md`
   - `docs/evals/product-value-decision-2026-04-17.md`
6. 只有当同一问题重复出现时，才继续回写 `SKILL.md`

## 不要优先做什么

- 不要继续优先修改 `SKILL.md`
- 不要继续扩案例页
- 不要继续优化 README 表达
- 不要把结构兼容误当成 Claude Code 行为验证通过
- 不要把一次复杂任务复跑成功误判成“广谱稳定”
- 不要把执行推进类任务继续当作当前主打场景

## 校验命令

继续任务前后，都可以运行：

```bash
bash /Users/boyzcl/Documents/Complex_Task/scripts/validate-skill-project.sh
```

当前该命令应通过。
