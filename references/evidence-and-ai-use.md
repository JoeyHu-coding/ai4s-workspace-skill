# Evidence and AI Use

AI can help organize, draft, compare, and critique research material. It must not become an unverified source of scientific truth.

## Evidence Rules

- Every important scientific claim needs a source, dataset, experiment, analysis note, or explicit assumption.
- Keep source facts separate from interpretation.
- Never accept AI-generated citations without checking the actual source.
- Do not infer numerical results unless they are present in data, code output, or trusted source material.
- Mark uncertain claims as uncertain in `explanation/claim-ledger.md`.

## Claim Ledger Fields

Keep the claim ledger at `explanation/claim-ledger.md`.

Use this compact format:

```markdown
| Claim | Type | Evidence | Source/Data/Output | Status | Notes |
| --- | --- | --- | --- | --- | --- |
| ... | background/result/method/limitation | ... | ... | unchecked/checked/needs work | ... |
```

Claim types:

- `background`
- `gap`
- `hypothesis`
- `method`
- `result`
- `limitation`
- `contribution`

## AI Use Log

Log material AI assistance when it affects research direction, claims, analysis interpretation, or manuscript text.

Suggested format:

```markdown
| Date | Task | Input Material | AI Output Used | Human Verification | Follow-up |
| --- | --- | --- | --- | --- | --- |
```

Do not log trivial grammar fixes unless the venue or team policy requires it.

## Source Summaries

When summarizing papers:

1. Record bibliographic metadata and local file/link.
2. Separate the paper's claims from your interpretation.
3. Extract methods, datasets, metrics, and limitations.
4. Mark uncertain summaries for later verification.
5. Add useful claims to `explanation/claim-ledger.md`.

## Writing With AI

When drafting:

- Provide AI with verified notes, claim IDs, and intended section purpose.
- Ask for structure, clarity, alternatives, and critique before polished prose.
- Check that generated text does not add unsupported claims.
- Keep final author judgment human-owned.
