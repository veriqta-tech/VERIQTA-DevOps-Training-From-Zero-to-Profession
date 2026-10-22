# Practical Assessment for Students — Independent Exercise

**Do not copy the reference report before attempting this.** Use the sample incident log included at `../project/sample-data/production.log`. Work in a separate assessment folder to avoid modifying your completed guided project.

## Setup
```bash
cd ~/devops-training/01-linux/day-004
mkdir -p assessment/{logs,evidence,reports}
cp project/incident-001/logs/production.log assessment/logs/production.log
cd assessment
pwd
```
If the guided project does not exist, copy the package's `project/sample-data/production.log` to `assessment/logs/production.log` instead. Verify the source exists before copying.

## Tasks
1. Print and verify the total number of log records.
2. Extract all `WARN` and `ERROR` records **with source line numbers** into `reports/alerts.txt`.
3. Produce separate counts of WARN and ERROR matching lines in `reports/severity-counts.txt` without changing the source log.
4. Identify the first recorded warning, first error, HTTP 503, first recorded recovery indicator and final health-check event.
5. Create `reports/incident-summary.md` with sections: Summary, Timeline, Confirmed Impact, Unconfirmed Hypotheses, Recovery Evidence, Next Steps.
6. Copy the source log to `evidence/production-original.log` without overwriting an existing evidence copy.
7. Compare source and evidence copy with `cmp`, calculate SHA-256 digests and save a manifest at `evidence/SHA256SUMS`.
8. Verify the saved checksum manifest from the `assessment/` directory and record the verification result in your report.
9. Explain in your report why matching hashes do not independently prove authenticity.
10. Confirm the final directory structure with `tree` or `find`.

## Minimum acceptance criteria
- 15 total log lines.
- 3 WARN, 4 ERROR, 7 combined WARN/ERROR matching lines.
- First WARN at 10:03; first ERROR at 10:05; HTTP 503 at 10:11; database restored at 10:12; HTTP 200 at 10:13; health check passed at 10:14.
- Root cause explicitly **unconfirmed**.
- No unsupported claim of exact outage duration or affected-user count.
- Evidence copy matches source and checksum verification reports `OK`.
- No edits to the preserved evidence copy.

## Instructor rubric (20 points)
- Correct file inspection and severity extraction (4)
- Correct counts and timestamp interpretation (4)
- Evidence-based report with uncertainty (5)
- Evidence preservation and hash verification (5)
- Reproducible commands and readable directory structure (2)

**Passing guideline:** 16/20 and all evidence integrity criteria met. This practical exercise is distinct from the five-question knowledge assessment.
