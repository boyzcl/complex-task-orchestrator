# Round 2 Scaffold Usage

## 目的

用统一脚手架创建客户端验证记录，减少遗漏和命名漂移。

## 命令

```bash
bash scripts/scaffold-round2-client-run.sh \
  --slot C1 \
  --client Codex \
  --mode full \
  --slug codex-full-path \
  --title "Codex Full Path Validation"
```

## 会生成什么

- `docs/evals/round-02-artifacts/<slug>/01-client-task.md`
- `docs/evals/round-02-artifacts/<slug>/02-observation-log.md`
- `docs/evals/round-02-artifacts/<slug>/03-outcome-summary.md`
- `docs/evals/round-02-runs/<slot>-<slug>.md`

## 使用原则

- 只为真实客户端运行创建记录
- 不要把仓库内推断写成客户端观察
- 每个任务位只保留一个主评分卡
