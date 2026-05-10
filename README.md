# AI4S Workspace Skill

AI4S Workspace is a Codex skill for managing AI-assisted scientific research and manuscript projects. It gives each paper a structured workspace where ideas, plans, datasets, methods, analysis logs, results, claims, figures, writing drafts, literature notes, and human communication stay traceable from the first research question to submission.

这个 skill 的定位不是普通的文件夹模板，而是一套面向 AI4Science 工作流的研究上下文管理方法。它适合长期论文项目、数据分析型研究、AI 辅助写作、可复现实验整理、投稿准备和 reviewer response。核心目标是让研究过程留下证据链，让下一次 Codex 会话能够继续工作，也让人类作者可以检查每个结论来自哪里。

## 一键安装

Windows PowerShell

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/JoeyHu-coding/ai4s-workspace-skill/main/install.ps1 | iex"
```

手动安装或更新

```powershell
git clone https://github.com/JoeyHu-coding/ai4s-workspace-skill.git "$env:USERPROFILE\.codex\skills\ai4s-workspace"
```

如果本地已经有同名目录，可以先备份旧目录，再重新克隆。安装后，Codex 会在需要管理 AI4Science 论文项目、研究脚手架、证据链、论文写作或审稿回复时加载这个 skill。

## 快速开始

安装后，在 Codex 中提出类似任务。

```text
为我的 AI4Science 论文创建一个 research workspace，主题是 graph neural networks for molecular property prediction。
```

也可以直接运行内置脚本创建论文工作区。

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "$env:USERPROFILE\.codex\skills\ai4s-workspace\scripts\new-ai4s-workspace.ps1" -Name "graph neural networks for molecular property prediction" -Root ".\papers" -Field "AI for chemistry" -Venue "NeurIPS" -Phase idea
```

脚本会生成一个按日期和标题命名的 paper workspace，并初始化研究项目需要的核心目录和台账文件。

## 解决的问题

AI4Science 项目通常同时包含科学假设、数据来源、实验脚本、模型输出、图表、论文草稿、引用文献和人类反馈。普通目录很快会失去上下文，尤其是在多轮 AI 协作中，常见问题包括：

- 论文 claim 和证据来源脱节
- AI 生成的段落混入未验证结论
- 分析输出和最终解释混在一起
- 图表缺少源数据和生成方法
- 文献综述只剩摘要，缺少 gap 和 positioning
- 下一次会话不知道当前阶段、下一步和风险

AI4S Workspace 用固定结构解决这些问题。它把科学研究拆成 idea、plan、data、skills、literature、analysis、output、explanation、visualization、writing、communication 和 other，让每种材料有明确位置。

## 核心结构

新建的论文 workspace 默认包含这些目录。

```text
paper-workspace
  workspace.md
  state.md
  handoff.md
  ai-use-log.md
  idea
    idea.md
  plan
    research-scaffold.md
    milestones.md
  data
    data-manifest.md
  skills
    skill-map.md
  analysis
    analysis-log.md
  output
    result-ledger.md
  explanation
    interpretation.md
    claim-ledger.md
  visualization
    figure-index.md
  writing
    manuscript-outline.md
  literature
    literature-map.md
  communication
    human-briefing.md
    interaction-log.md
    figures
  other
    review-and-submission.md
    logs
    archive
```

## 工作区各部分的职责

| 区域 | 作用 | 典型产物 |
| --- | --- | --- |
| `idea` | 研究想法、科学问题、假设、贡献点 | `idea.md` |
| `plan` | 数据到分析再到论文输出的研究脚手架 | `research-scaffold.md`、`milestones.md` |
| `data` | 原始数据、数据来源、权限、数据字典 | `data-manifest.md` |
| `skills` | 项目需要的方法、工具、领域能力和缺口 | `skill-map.md` |
| `literature` | 文献聚类、研究 gap、related work 定位 | `literature-map.md` |
| `analysis` | 数据处理、实验方法、统计流程、模型运行 | `analysis-log.md` |
| `output` | 分析得到的结果、指标、表格、运行输出 | `result-ledger.md` |
| `explanation` | 结果解释、主张、证据链接、局限性 | `claim-ledger.md`、`interpretation.md` |
| `visualization` | 图表索引、源数据、生成方法、caption 状态 | `figure-index.md` |
| `writing` | 论文大纲、章节草稿、标题和摘要版本 | `manuscript-outline.md` |
| `communication` | 给人看的简报、决策问题、交互记录 | `human-briefing.md`、`interaction-log.md` |
| `other` | 投稿、补充材料、内部审阅、审稿回复 | `review-and-submission.md` |

## 证据链设计

这个 skill 的关键文件是 `explanation/claim-ledger.md`。论文中的核心 claim 需要在这里登记，并连接到来源、数据、输出或分析记录。

推荐字段如下。

```markdown
| Claim | Type | Evidence | Source/Data/Output | Status | Notes |
| --- | --- | --- | --- | --- | --- |
```

claim 类型可以包括 background、gap、hypothesis、method、result、limitation 和 contribution。这样做的好处是，论文写作阶段不再只依赖记忆或 AI 生成文本，而是从已检查的 evidence trail 取材。

## AI 使用记录

`ai-use-log.md` 用来记录对研究方向、claim、解释或正文产生实质影响的 AI 辅助步骤。它帮助作者区分 AI 草稿和已验证材料，也方便后续按团队或期刊要求披露 AI 使用情况。

建议格式如下。

```markdown
| Date | Task | Input Material | AI Output Used | Human Verification | Follow-up |
| --- | --- | --- | --- | --- | --- |
```

## 适用场景

这个 skill 适合这些工作：

- AI4Science 论文从 idea 到 manuscript 的全流程管理
- 数据分析型研究项目的材料整理
- 多轮 AI 协作下的论文写作和修改
- 文献综述、gap mapping 和 related work positioning
- 结果解释、claim 检查和图表管理
- 投稿前质量检查
- reviewer response 和 revision map

它也适合给新会话做 handoff。只要维护 `state.md` 和 `handoff.md`，后续 Codex 可以快速知道当前阶段、已完成工作、剩余任务和风险。

## 内置质量门

`references/quality-gates.md` 提供投稿前检查清单，覆盖四类风险。

- Source integrity：引用是否真实，文献总结是否准确
- Claim integrity：核心 claim 是否有证据，novelty 是否被文献支持
- Reproducibility：数据、分析设置、结果和图表是否可追踪
- Manuscript quality：标题、摘要、方法、结果和讨论是否一致

这些检查不能替代人类作者判断，但能显著降低 AI 辅助写作中的断链、幻觉和过度声称。

## 发布级目录

本仓库根目录就是可安装的 skill 包。

```text
SKILL.md
README.md
install.ps1
agents
assets
references
scripts
development-workspace
```

其中 `SKILL.md` 是 Codex 识别 skill 的入口，`references` 保存重型参考文档，`scripts` 保存可复用脚本，`development-workspace` 保存这个 skill 的开发过程记录。

## 发布标准评估

当前仓库已经具备一个可发布 Codex skill 的基本标准：

- 根目录包含 `SKILL.md`
- frontmatter 包含 `name` 和 `description`
- description 描述触发条件，覆盖 AI4Science、论文写作、研究脚手架、数据和 claim 管理等关键词
- 支持文件放在 `references` 和 `scripts`
- 提供一键安装命令
- 提供快速开始示例
- 提供专业 README 说明用途、结构、工作流和质量门
- 保留开发过程记录，但不影响 Codex 加载 skill

仍建议在正式公开推广前继续补充三类材料：

- 真实论文项目的 before and after 示例
- 一次完整的 smoke test 记录
- 版本号、许可证和 changelog

## 文件说明

| 文件 | 作用 |
| --- | --- |
| `SKILL.md` | skill 主入口，定义触发条件、工作规则和生命周期 |
| `scripts/new-ai4s-workspace.ps1` | 创建 AI4Science paper workspace 的脚本 |
| `references/workspace-structure.md` | 完整目录结构和各文件职责 |
| `references/evidence-and-ai-use.md` | claim 证据链和 AI 使用记录规则 |
| `references/paper-lifecycle.md` | idea 到 submission 的阶段清单 |
| `references/quality-gates.md` | 投稿前质量检查门 |
| `agents/openai.yaml` | Codex UI 中的显示名和默认提示 |

## 维护建议

维护这个 skill 时，优先更新 `SKILL.md` 中的触发条件和关键规则。大型说明放入 `references`，可执行逻辑放入 `scripts`。每次修改后，至少做一次本地脚本 smoke test，并记录在开发 workspace 或 changelog 中。

## 许可证

当前仓库暂未添加许可证。公开分享前建议添加 MIT、Apache 2.0 或你希望采用的其他许可证。
