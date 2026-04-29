# 测试先行协议升级：迭代执行计划

日期：2026-04-29

状态：执行中

## 1. 计划依据

本计划基于：

- `docs/upgrade-plans/test-first-validation-upgrade-plan.md`
- `docs/upgrade-plans/test-first-validation-implementation/01-validation-and-test-plan.md`

本轮目标是实施测试先行协议升级，并按预设验证逻辑回验结果。

## 2. 执行原则

- 先更新可复用协议，再更新公开入口。
- 主入口保持可读，细节下沉到 reference。
- 复杂或长链路任务强制测试先行，简单任务保留 Quick Path。
- 不把本次结构升级说成长期产品价值验证已经完成。
- 不修改无关未跟踪文件。

## 3. 变更范围

### Skill 本体

- `skill/complex-task-orchestrator/SKILL.md`

### Reference 文档

- 新增 `skill/complex-task-orchestrator/references/validation-first-workflow.md`
- 新增 `skill/complex-task-orchestrator/references/validation-plan-template.md`
- 更新 `full-protocol.md`
- 更新 `mode-selection.md`
- 更新 `artifact-conventions.md`
- 更新 `execution-prompt-template.md`
- 更新 `self-review-checklist.md`
- 更新 `definition-of-done.md`
- 更新 `stage-broadcast.md`

### 公开与维护文档

- `README.md`
- `README_EN.md`
- `docs/first-run-example.md`
- `docs/why-this-helps.md`
- `docs/smoke-checklist.md`
- `docs/validation-matrix.md`
- `CHANGELOG.md`

### 自动化验证

- `scripts/validate-skill-project.sh`

### 本轮运行留痕

- `docs/upgrade-plans/test-first-validation-implementation/01-validation-and-test-plan.md`
- `docs/upgrade-plans/test-first-validation-implementation/02-iteration-plan.md`
- `docs/upgrade-plans/test-first-validation-implementation/03-validation-results.md`

## 4. 步骤与对应验证

| Step | 动作 | 主要文件 | 对应验证 |
| --- | --- | --- | --- |
| 1 | 新增验证先行 reference | `validation-first-workflow.md`, `validation-plan-template.md` | V3 |
| 2 | 更新主入口流程 | `SKILL.md` | V1, V6 |
| 3 | 更新完整协议与模式选择 | `full-protocol.md`, `mode-selection.md` | V1, V6 |
| 4 | 更新产物约定和执行计划模板 | `artifact-conventions.md`, `execution-prompt-template.md` | V2 |
| 5 | 更新完成定义、自检和阶段播报 | `definition-of-done.md`, `self-review-checklist.md`, `stage-broadcast.md` | V4, V5 |
| 6 | 更新 README 和 first-run 说明 | README, first-run, why-this-helps | V7 |
| 7 | 更新维护信号和校验脚本 | changelog, validation matrix, smoke checklist, validate script | V8, A1, A2 |
| 8 | 运行验证并记录结果 | validation results | V1-V8, A3 |

## 5. 回验命令

计划使用以下命令回验：

```bash
rg -n "测试与验收设计|执行计划生成|预设验证回验|失败迭代" skill/complex-task-orchestrator/SKILL.md
rg -n "02-validation-and-test-plan.md|03-execution-plan.md|04-self-review-and-summary.md" README.md README_EN.md skill/complex-task-orchestrator/references/artifact-conventions.md
rg -n "自检不能替代|预设验证" skill/complex-task-orchestrator/references/self-review-checklist.md skill/complex-task-orchestrator/references/definition-of-done.md
bash scripts/validate-skill-project.sh
```

## 6. 完成标准

本轮完成必须同时满足：

- 所有必过验证项通过
- 自动化校验脚本通过
- 验证结果已落盘
- 最终反馈明确说明已做改动、验证结果、剩余风险

