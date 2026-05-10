# AI4Science Paper Workspace Structure

Use this structure for one paper, preprint, thesis chapter, or focused research manuscript project.

## Default Directory Map

```text
paper-workspace/
  workspace.md
  state.md
  handoff.md
  ai-use-log.md
  idea/
    idea.md
  plan/
    research-scaffold.md
    milestones.md
  data/
    data-manifest.md
  skills/
    skill-map.md
  analysis/
    analysis-log.md
  output/
    result-ledger.md
  explanation/
    interpretation.md
    claim-ledger.md
  visualization/
    figure-index.md
  writing/
    manuscript-outline.md
  literature/
    literature-map.md
  communication/
    human-briefing.md
    interaction-log.md
    figures/
  other/
    review-and-submission.md
    logs/
    archive/
```

## Folder Roles

- `idea/`: research idea, scientific problem, hypothesis, contribution target, and highlights.
- `plan/`: research scaffold from data to analysis to output, with milestones and decision gates.
- `data/`: raw data, data provenance, data dictionaries, permissions, and source manifests.
- `skills/`: project-specific methods, tools, domain skills, AI skills, and missing capabilities needed for the research. This is not the top-level Codex skill source directory.
- `analysis/`: data processing, analysis methods, scripts, workflows, statistics, and model runs. Do not put final interpretation here.
- `output/`: all analysis-produced results, result tables, metrics, intermediate findings, and run outputs.
- `explanation/`: integrated interpretation of outputs, scientific claims, evidence links, limitations, and narrative logic.
- `visualization/`: figures, tables, plotting scripts, figure source data, captions, and visual QA notes.
- `writing/`: manuscript outline, section drafts, abstract/title variants, and final draft candidates.
- `literature/`: PDFs, BibTeX, source exports, reading notes, literature map, source clusters, and related work positioning.
- `communication/`: human-facing plain-language briefings, readable summaries, discussion notes, decision requests, and diagrams or figures used for interaction with people. This folder is for communication, not source-of-truth scientific records.
- `other/`: review, submission, supplementary material, cover letters, reviewer responses, logs, archive, and miscellaneous project administration.

## Minimal Maintenance Files

Update frequently:

- `state.md`
- `handoff.md`
- `explanation/claim-ledger.md`
- `output/result-ledger.md`
- `ai-use-log.md`

Update as needed:

- `idea/idea.md`
- `plan/research-scaffold.md`
- `literature/literature-map.md`
- `analysis/analysis-log.md`
- `visualization/figure-index.md`
- `communication/human-briefing.md`

Do not update every file on every task turn. Follow the active paper phase.
