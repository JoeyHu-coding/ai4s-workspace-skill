# Quality Gates

Run these checks before considering a manuscript draft mature.

## Source Integrity

- All cited works exist and have been checked.
- Source summaries do not overstate the original paper.
- Related work distinguishes source claims from your interpretation.

## Claim Integrity

- Core claims appear in `explanation/claim-ledger.md`.
- Result claims link to data, experiments, or analysis notes.
- Limitation claims are explicit and not hidden.
- Novelty claims are supported by the literature map.

## Reproducibility

- Methods are described at the right level for the target venue.
- Raw data provenance is recorded in `data/data-manifest.md`.
- Analysis settings, scripts, and run identifiers are recorded in `analysis/analysis-log.md`.
- Results are recorded in `output/result-ledger.md`.
- Figure source data and generation method are traceable through `visualization/figure-index.md`.

## Manuscript Quality

- Title, abstract, introduction, methods, results, discussion, and conclusion align.
- Contribution is clear and not overstated.
- Terms and notation are consistent.
- Figures and tables are cited in order and support the argument.
- The paper states limitations and future work honestly.

## AI-Assisted Work

- Material AI-generated text has been reviewed.
- AI-assisted analysis interpretation is checked against evidence.
- AI did not introduce unverifiable citations or results.
- `ai-use-log.md` is updated when AI materially shaped claims, interpretation, or manuscript text.
