---
name: ai4s-workspace
description: Create and manage AI4Science research and academic paper workspaces using an idea-plan-data-skills-analysis-output-explanation-visualization-writing-literature-communication-other structure. Use when Codex helps with scientific writing, research idea development, research scaffolding, data and analysis tracking, human-facing research briefings, skill planning, result interpretation, visualization, literature review, manuscript drafting, reviewer response, submission readiness, or maintaining reproducible AI-assisted research writing context.
---

# AI4S Workspace

Use this skill to organize AI-assisted scientific research and manuscript work so that ideas, plans, data, skills, analyses, outputs, explanations, visualizations, writing, literature, human-facing communication, and other review/submission work stay separate and traceable.

## Scope

Use this skill for:

- Literature review and research question refinement.
- Building a paper-specific workspace.
- Tracking ideas, scientific questions, hypotheses, highlights, claims, evidence, methods, data, analysis workflows, outputs, explanations, and figures.
- Drafting or revising academic papers with AI assistance.
- Preparing reviewer responses or submission packages.
- Maintaining handoff context for long-running AI4Science writing work.

For generic task setup, use `workspace`. For a paper project itself, use this skill.

## Workspace Creation

Prefer the bundled script:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File <skill-dir>\scripts\new-ai4s-workspace.ps1 -Name "<paper or project title>" -Root "<paper-root>"
```

Default root selection:

1. Use a user-specified root when provided.
2. Use an existing `papers/` directory in the current project when present.
3. Otherwise create under `papers/` in the current project.

After creation, fill in `workspace.md`, `state.md`, `idea/idea.md`, and `plan/research-scaffold.md` before doing substantial analysis or drafting.

## Core Files

Maintain these files throughout the project:

- `state.md`: current phase, active focus, next actions, blockers.
- `handoff.md`: enough context for a new LLM to continue safely.
- `ai-use-log.md`: important AI-assisted steps, prompts/outputs worth preserving, and human verification status.
- `idea/idea.md`: research idea, scientific question, hypothesis, and highlights.
- `plan/research-scaffold.md`: end-to-end research scaffold from data to analysis to output.
- `data/data-manifest.md`: raw data inventory and provenance.
- `skills/skill-map.md`: research skills, tools, methods, and missing capabilities needed for the project.
- `analysis/analysis-log.md`: data processing and analysis methods without final interpretation.
- `output/result-ledger.md`: results produced by analysis.
- `explanation/claim-ledger.md`: interpretation, claims, evidence links, and limitations.
- `visualization/figure-index.md`: figures, tables, source data, scripts, captions, and status.
- `writing/manuscript-outline.md`: paper outline and section status.
- `literature/literature-map.md`: source clusters, gaps, and related work positioning.
- `communication/human-briefing.md`: human-facing plain-language status, summaries, diagrams, questions, and decision needs.
- `communication/interaction-log.md`: human-facing interaction history, decisions, feedback, and follow-up requests.

Read `references/workspace-structure.md` for the full directory map.

## Working Rules

- Separate sources, claims, interpretations, drafts, and final manuscript files.
- Do not invent citations, datasets, results, equations, or evaluation metrics.
- Treat AI output as draft material until checked against sources, data, or code.
- Put every important manuscript claim into `explanation/claim-ledger.md` with a source or evidence trail.
- Keep `analysis/` limited to methods, processing, and analysis execution. Put final interpretation in `explanation/`.
- Put raw data and provenance in `data/`. Put derived analytical results in `output/`.
- Put human-facing summaries, discussion material, and readable diagrams in `communication/`. Do not use `communication/` as the source of truth for claims, data, or results; link back to ledgers and source files.
- Use `skills/` for project-specific research skills, methods, tools, or capabilities required by the paper. Do not treat it as the top-level Codex skill source directory.
- Keep reproducibility material with methods, data, experiment logs, scripts, and environment notes.
- Keep routine updates focused on `state.md`, `handoff.md`, `explanation/claim-ledger.md`, `output/result-ledger.md`, and `ai-use-log.md`.

Read `references/evidence-and-ai-use.md` before using AI to summarize sources, generate claims, interpret results, or draft paper text.

## Lifecycle

Follow this order, while allowing iteration:

1. Idea: refine research idea, scientific question, hypothesis, and highlights.
2. Plan: build the research scaffold, milestones, and end-to-end workflow.
3. Data: collect raw data, provenance, permissions, and data dictionaries.
4. Skills: identify required methods, tools, domain skills, and missing capabilities.
5. Literature: build source map, related-work clusters, and research gap notes.
6. Analysis: process data and run analysis methods without final interpretation.
7. Output: store all analysis-produced results, metrics, tables, and intermediate findings.
8. Explanation: interpret outputs, connect evidence to claims, and record limitations.
9. Visualization: create figures and tables for major findings.
10. Writing: draft sections with traceable claims and versioned manuscripts.
11. Communication: maintain human-facing briefings, readable diagrams, decision summaries, and interaction notes.
12. Other: handle review, submission, supplementary material, cover letters, and reviewer responses.
13. Handoff: update `state.md` and `handoff.md`.

Read `references/paper-lifecycle.md` for phase-specific checklist items.

## Quality Gates

Before treating a draft as ready:

- Every core claim is present in `explanation/claim-ledger.md`.
- References in the manuscript correspond to real sources.
- Results are traceable to data, scripts, experiments, or explicit analysis notes.
- Figures have source data, generation method, caption status, and permissions/provenance when relevant.
- Limitations are stated honestly.
- AI-assisted content has been reviewed by a human and logged when material.

Read `references/quality-gates.md` for detailed checks.
