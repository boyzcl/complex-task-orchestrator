# Changelog

## Unreleased

- 暂无未发布条目

## v0.2.0 - 2026-04-17

### Added

- 重写中英文 README，补齐 first-run 路径、公开案例入口和维护信号
- 新增 `docs/runtime-asset-boundary.md`
- 新增 `docs/first-run-example.md`
- 新增 `docs/why-this-helps.md`
- 新增 `docs/runtime-memory-spec.md`
- 新增 3 个公开案例与 1 个 before / after 对照页
- 新增 `docs/smoke-checklist.md`
- 新增 `docs/validation-matrix.md`
- 新增 `docs/releases/v0.2.0-release-notes.md`
- 新增 `docs/evals/round-02-client-validation-plan.md`
- 新增 `docs/evals/round-02-task-board.md`
- 新增 `docs/evals/client-trigger-log.md`
- 新增 `docs/evals/round-02-runs/README.md`
- 新增 `docs/runtime-governance.md`
- 新增 `scripts/install-claude-code-skill.sh`
- 新增 `scripts/validate-skill-project.sh`
- 新增 `scripts/scaffold-round1-run.sh`
- 新增 `scripts/scaffold-round2-client-run.sh`
- 新增最小 runtime memory 结构、captures、promoted patterns、failure modes 和 manifest
- 新增 `failure-handling` 与 `success-criteria` 参考文档

### Changed

- 重写 `SKILL.md`，加入 Quick Path、Runtime Reuse Rules、Failure Handling、Success Signals 与治理约束
- 重写 Claude Code 兼容说明，改为事实分层表述
- 将 `v0.2.0` gate、readiness 与 release notes 收口为一致的版本叙事
- 将 runtime memory 规格扩展为含 `active / watch / stale` 的轻量治理规则

### Fixed

- 修复公开文档与本地实际状态错位的问题
- 明确区分 repo 资产、安装副本和 runtime 资产
- 修复 `v0.2.0` gate 文档与 readiness 结论之间的时序错位
