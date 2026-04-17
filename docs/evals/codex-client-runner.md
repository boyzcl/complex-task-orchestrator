# Codex Client Runner

## 目标

为 Round 2 和后续客户端验证提供一个更稳定的 Codex 运行入口。

它解决的问题是：

- 旧状态库污染真实观察
- 运行超时后缺少结构化留痕
- 分析已发生但结果未收尾时，工件不够完整

## 脚本

```bash
bash scripts/run-codex-client-validation.sh \
  --prompt-file /path/to/prompt.txt \
  --output-dir /path/to/output \
  --root /Users/boyzcl/Documents/Complex_Task \
  --timeout-seconds 120 \
  --sandbox workspace-write
```

## 行为

脚本会：

- 创建隔离的 `HOME/.codex`
- 复制必要的 `auth.json`、`config.toml` 和 `skills/`
- 默认用只读沙箱运行 `codex exec`
- 也可通过 `--sandbox workspace-write` 让任务把输出写入指定目录
- 生成：
  - `meta.json`
  - `events.jsonl`
  - `last.txt`
  - `stdout.log`
  - `stderr.log`
  - `status.json`

## 状态判定

- `completed`
- `failed`
- `timeout`

## 为什么有价值

它不会把“客户端卡住”误判成“协议无效”。

它先把执行环境和协议行为拆开，再让后续判断更干净。

在 Round 3 里，它还被用来验证：

- 复杂任务是否需要更干净的输入边界
- 允许写文件时，任务是否真的能把交付物落盘
