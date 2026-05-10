param(
    [Parameter(Mandatory = $true)]
    [string]$Name,

    [string]$Root,

    [string]$Venue = "",

    [string]$Field = "",

    [ValidateSet("idea", "plan", "data", "skills", "analysis", "output", "explanation", "visualization", "writing", "literature", "communication", "other")]
    [string]$Phase = "idea",

    [switch]$NoDatePrefix,

    [switch]$Force
)

$ErrorActionPreference = "Stop"

function New-Slug {
    param([string]$Value)

    $slug = $Value.ToLowerInvariant()
    $slug = [regex]::Replace($slug, "[^a-z0-9]+", "-")
    $slug = [regex]::Replace($slug, "-+", "-")
    $slug = $slug.Trim("-")

    if ([string]::IsNullOrWhiteSpace($slug)) {
        return "paper"
    }

    return $slug
}

function Write-TextFile {
    param(
        [string]$Path,
        [string]$Content
    )

    if ((Test-Path -LiteralPath $Path) -and -not $Force) {
        return
    }

    Set-Content -LiteralPath $Path -Value $Content -Encoding UTF8
}

if ([string]::IsNullOrWhiteSpace($Root)) {
    $current = (Get-Location).Path
    if (Test-Path -LiteralPath (Join-Path $current "papers")) {
        $Root = Join-Path $current "papers"
    } else {
        $Root = Join-Path $current "papers"
    }
}

$slug = New-Slug $Name
$prefix = if ($NoDatePrefix) { "" } else { "$(Get-Date -Format 'yyyy-MM-dd')--" }
$workspaceName = "$prefix$slug"
$workspacePath = Join-Path $Root $workspaceName

if ((Test-Path -LiteralPath $workspacePath) -and -not $Force) {
    throw "Workspace already exists: $workspacePath. Use -Force to fill missing files without overwriting existing files."
}

New-Item -ItemType Directory -Force -Path $workspacePath | Out-Null

$folders = @(
    "idea",
    "plan",
    "data",
    "skills",
    "analysis",
    "output",
    "explanation",
    "visualization",
    "writing",
    "literature",
    "communication",
    "communication\figures",
    "other",
    "other\logs",
    "other\archive"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path (Join-Path $workspacePath $folder) | Out-Null
}

$today = Get-Date -Format "yyyy-MM-dd"

Write-TextFile -Path (Join-Path $workspacePath "workspace.md") -Content @"
# Paper Workspace

Title: $Name
Slug: $workspaceName
Field: $Field
Target venue: $Venue
Created: $today

## Purpose

Describe the paper goal and intended contribution.

## Materials

Existing files, datasets, code, notes, or sources:

## Constraints

Deadlines, venue requirements, authorship constraints, data limits, or policy constraints:
"@

Write-TextFile -Path (Join-Path $workspacePath "state.md") -Content @"
# State

Last updated: $today
Current phase: $Phase

## Active Focus

- Define the next concrete paper task.

## Next Actions

- [ ] Fill idea/idea.md.
- [ ] Fill plan/research-scaffold.md.
- [ ] Add raw data metadata to data/data-manifest.md.
- [ ] Start explanation/claim-ledger.md before drafting claims.

## Blockers

- None recorded.
"@

Write-TextFile -Path (Join-Path $workspacePath "handoff.md") -Content @"
# Handoff

Current status:

Important decisions:

Files created or changed:

AI assistance already used:

Remaining work:

Risks or blockers:
"@

Write-TextFile -Path (Join-Path $workspacePath "idea\idea.md") -Content @"
# Idea

Research idea:

Scientific problem:

Research question:

Hypothesis:

Expected contribution:

Highlights:

- 

Scope:
"@

Write-TextFile -Path (Join-Path $workspacePath "plan\research-scaffold.md") -Content @"
# Research Scaffold

## End-to-End Flow

Data:

Analysis:

Output:

Explanation:

Visualization:

Writing:

## Dependencies

## Risks and Fallbacks
"@

Write-TextFile -Path (Join-Path $workspacePath "plan\milestones.md") -Content @"
# Milestones

| Milestone | Node | Done When | Status | Notes |
| --- | --- | --- | --- | --- |
| M1 | idea | Research question, hypothesis, and highlights are clear. | todo | |
| M2 | plan | Data-to-output scaffold and milestones are defined. | todo | |
| M3 | data | Raw data inventory and provenance are recorded. | todo | |
| M4 | analysis | Analysis methods are executable and logged. | todo | |
| M5 | output | Main results are recorded. | todo | |
| M6 | explanation | Results are interpreted and claims are linked to evidence. | todo | |
| M7 | visualization | Main figures and tables are traceable. | todo | |
| M8 | writing | Draft sections use checked claims. | todo | |
"@

Write-TextFile -Path (Join-Path $workspacePath "data\data-manifest.md") -Content @"
# Data Manifest

| Dataset | Location | Raw/Derived | Provenance | Access/Permissions | Status | Notes |
| --- | --- | --- | --- | --- | --- | --- |
"@

Write-TextFile -Path (Join-Path $workspacePath "skills\skill-map.md") -Content @"
# Skill Map

| Skill/Method/Tool | Needed For | Available? | Source or Owner | Status | Notes |
| --- | --- | --- | --- | --- | --- |
"@

Write-TextFile -Path (Join-Path $workspacePath "analysis\analysis-log.md") -Content @"
# Analysis Log

Record data processing and analysis methods here. Do not put final scientific interpretation in this file.

| Date | Analysis | Input Data | Method/Script | Parameters | Output Location | Status | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
"@

Write-TextFile -Path (Join-Path $workspacePath "output\result-ledger.md") -Content @"
# Result Ledger

| Result | Source Analysis | Output Location | Metric/Table/File | Status | Notes |
| --- | --- | --- | --- | --- | --- |
"@

Write-TextFile -Path (Join-Path $workspacePath "explanation\interpretation.md") -Content @"
# Explanation

## Integrated Interpretation

## Main Claims

## Alternative Explanations

## Limitations

## Open Questions
"@

Write-TextFile -Path (Join-Path $workspacePath "explanation\claim-ledger.md") -Content @"
# Claim Ledger

| Claim | Type | Evidence | Source/Data/Output | Status | Notes |
| --- | --- | --- | --- | --- | --- |
"@

Write-TextFile -Path (Join-Path $workspacePath "visualization\figure-index.md") -Content @"
# Figure and Table Index

| Item | Type | Purpose | Source Data/Output | Generation Method | Caption Status | Manuscript Status |
| --- | --- | --- | --- | --- | --- | --- |
"@

Write-TextFile -Path (Join-Path $workspacePath "writing\manuscript-outline.md") -Content @"
# Manuscript Outline

## Title Candidates

## Abstract

## Introduction

## Related Work

## Methods

## Results

## Discussion

## Limitations

## Conclusion
"@

Write-TextFile -Path (Join-Path $workspacePath "literature\literature-map.md") -Content @"
# Literature Map

## Source Clusters

| Cluster | Key Sources | What They Establish | Gap or Tension |
| --- | --- | --- | --- |

## Related Work Positioning

## Open Questions
"@

Write-TextFile -Path (Join-Path $workspacePath "communication\human-briefing.md") -Content @"
# Human Briefing

## Plain-Language Status

Current project status for people:

## What Changed Recently

## Key Materials to Review

| Item | Why It Matters | Source File |
| --- | --- | --- |

## Human Decisions Needed

| Decision | Options | Needed By | Notes |
| --- | --- | --- | --- |

## Discussion Notes

## Human-Facing Diagrams or Figures

Store readable diagrams or discussion figures in communication/figures and link them here.
"@

Write-TextFile -Path (Join-Path $workspacePath "communication\interaction-log.md") -Content @"
# Interaction Log

| Date | Human Input or Question | Response/Decision | Follow-up | Linked Files |
| --- | --- | --- | --- | --- |
"@

Write-TextFile -Path (Join-Path $workspacePath "other\review-and-submission.md") -Content @"
# Review and Submission

## Review Notes

## Submission Requirements

## Supplementary Material

## Cover Letter

## Reviewer Response
"@

Write-TextFile -Path (Join-Path $workspacePath "ai-use-log.md") -Content @"
# AI Use Log

| Date | Task | Input Material | AI Output Used | Human Verification | Follow-up |
| --- | --- | --- | --- | --- | --- |
"@

Write-Host $workspacePath
