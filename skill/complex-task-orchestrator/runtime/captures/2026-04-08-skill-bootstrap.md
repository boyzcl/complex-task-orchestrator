# Skill Bootstrap Capture

## Task Type

skill-bootstrap

## Summary

把原本分散在协作习惯和元指令中的复杂任务协议，封装成一个可安装、可调用、可验证的 skill。

## What Worked

- 先做需求共识，再执行，明显降低了“做错题”的风险
- 把一次性执行指令文档显性化后，执行路径更稳
- 自检与评分让修订动作真正发生

## What Failed

- 早期版本对运行时文档语言考虑不够，默认生成了不利于当前用户阅读的英文文档
- 项目最初没有强阶段感，用户不容易知道当前处于哪个阶段

## Reuse Hint

当任务本身就是在创建 workflow、skill 或执行协议时，先把需求共识和执行指令显性化，收益通常很高。

## Source Artifacts

- `.local-docs/docs/01-requirement-consensus.md`
- `.local-docs/docs/02-task-execution-prompt.md`
- `.local-docs/docs/03-self-review-and-summary.md`
