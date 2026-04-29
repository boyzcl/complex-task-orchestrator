# Smoke Checklist

这份清单用于做最小但可信的项目级冒烟验证。

## 自动化部分

运行：

```bash
bash /Users/boyzcl/Documents/Complex_Task/scripts/validate-skill-project.sh
```

应至少验证：

- 关键文件存在
- README 与 `SKILL.md` 包含核心区块
- validation-first reference 文件存在
- runtime manifest JSON 有效
- Codex 与 Claude Code 安装脚本能在临时 `HOME` 下创建正确符号链接

## 手工部分

### 1. README first-run 检查

确认只看 README 首页就能回答：

- 这是什么
- 什么时候用
- 第一次会发生什么
- 为什么比直接提问更稳

### 2. skill 行为检查

确认 `SKILL.md` 中已存在：

- Quick Path
- Validation-first workflow
- Runtime Reuse Rules
- Failure Handling
- Success Signals

### 2.1 测试先行检查

确认：

- `SKILL.md` 包含 `测试与验收设计`
- `SKILL.md` 包含 `预设验证回验`
- `artifact-conventions.md` 包含 4 件套：
  - `01-requirement-consensus.md`
  - `02-validation-and-test-plan.md`
  - `03-execution-plan.md`
  - `04-self-review-and-summary.md`
- `self-review-checklist.md` 明确自检不能替代预设验证

### 3. 案例页检查

确认：

- 至少 3 个公开案例
- 至少 1 个 before / after 对照
- 案例明确标注为 curated asset

### 4. 维护信号检查

确认：

- `CHANGELOG.md` 已建立
- `docs/validation-matrix.md` 已建立
- `docs/runtime-asset-boundary.md` 已建立
