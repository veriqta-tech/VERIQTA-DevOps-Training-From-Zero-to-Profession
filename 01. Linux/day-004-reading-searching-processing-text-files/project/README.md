# Production Incident Investigation — INC-001

**Project:** VERIQTA Lesson API (synthetic training case).  
**Incident date:** 2026-10-22.  
**Objective:** investigate an application degradation, build a defensible timeline, preserve evidence, and produce a clear report.  
**Critical boundary:** this is simulated evidence, not a claim about a real VERIQTA outage.

## Project structure
```text
incident-001/
├── evidence/
│   ├── SHA256SUMS
│   └── production-original.log
├── logs/
│   └── production.log
└── reports/
    └── incident-report.md
```

## 7C.1 — Prepare directories and confirm location
```bash
cd ~/devops-training/01-linux/day-004
mkdir -p project/incident-001/{logs,evidence,reports}
cd project/incident-001
pwd
```
**Check:** you are inside `incident-001`. Braces create three subdirectories; do not run incident-relative commands from the wrong directory.

## 7C.2 — Create the original fifteen-line incident log
From `incident-001`, run:
```bash
cat > logs/production.log <<'EOF'
2026-10-22 10:00:00 INFO Application started
2026-10-22 10:01:00 INFO Database connection established
2026-10-22 10:02:00 INFO User authentication successful
2026-10-22 10:03:00 WARN Database response time increasing
2026-10-22 10:04:00 INFO Lesson content loaded successfully
2026-10-22 10:05:00 ERROR Database query timeout
2026-10-22 10:06:00 WARN Database connection pool nearing capacity
2026-10-22 10:07:00 ERROR Failed to retrieve lesson content
2026-10-22 10:08:00 INFO Retrying database query
2026-10-22 10:09:00 ERROR Database connection unavailable
2026-10-22 10:10:00 WARN Application response time degraded
2026-10-22 10:11:00 ERROR Lesson API returned HTTP 503
2026-10-22 10:12:00 INFO Database connection restored
2026-10-22 10:13:00 INFO Lesson API returned HTTP 200
2026-10-22 10:14:00 INFO Application health check passed
EOF
wc -l logs/production.log
cat -n logs/production.log
```
**Expect:** 15 lines. Check that timestamps and severities match the supplied training dataset. The exact dataset is also at `sample-data/production.log` in this package.

## 7C.3 — Inspect source metadata and size
```bash
ls -lh logs/production.log
wc -l logs/production.log
```
**Expect:** 15 lines; byte count depends on exact text/newline conventions. In the original Ubuntu exercise the file was approximately 840 bytes. **Reason:** record count and file existence are baseline checks before analysis.

## 7C.4 — Inspect chronological context
```bash
head -n 5 logs/production.log
tail -n 5 logs/production.log
cat -n logs/production.log
```
**Look for:** healthy startup, degradation, failures, then apparent recovery. The log is time-ordered; do not assume all real logs are.

## 7C.5 — Isolate warnings and errors
```bash
grep -n -E 'WARN|ERROR' logs/production.log
```
**Expect:** seven matching records (three WARN and four ERROR) at original line numbers 4, 6, 7, 8, 10, 11 and 12. Verify the totals with:
```bash
grep -E 'WARN|ERROR' logs/production.log | wc -l
grep 'WARN' logs/production.log | wc -l
grep 'ERROR' logs/production.log | wc -l
```
**Ground truth:** warnings at 10:03, 10:06, 10:10 (3); errors at 10:05, 10:07, 10:09, 10:11 (4). Always trust verified command output over assumptions.

## 7C.6 — Inspect the onset window
```bash
sed -n '4,8p' logs/production.log
```
**Expect:** 10:03 warning, 10:04 success, 10:05 timeout, 10:06 pool warning, 10:07 retrieval failure. **Reason:** a filtered error line alone may omit crucial preceding context.

## 7C.7 — Identify the first observed warning and error
```bash
grep 'WARN' logs/production.log | head -n 1
grep 'ERROR' logs/production.log | head -n 1
```
**Expect:** first warning at 10:03; first error at 10:05. These are *first observed in this file*, not necessarily the true beginning of an incident.

## 7C.8 — Inspect the service failure and recovery
```bash
grep -n -E 'HTTP 503|HTTP 200|connection restored|health check passed' logs/production.log
```
**Expect:** HTTP 503 at 10:11, database connection restored at 10:12, HTTP 200 at 10:13, health check passed at 10:14. **Interpretation:** recovery observed; not a proven permanent fix.

## 7C.9 — Draft the incident report
Create `reports/incident-report.md` with `vi` (or a preferred terminal editor). Start with the incident ID, date, system, status, summary and observed recovery. A full reference example is provided in [`reference-solution.md`](reference-solution.md).
```bash
vi reports/incident-report.md
cat reports/incident-report.md
```
**In `vi`:** press `i` to insert; press `Esc`, type `:wq`, then Enter to save and quit. If you need to quit without saving, `Esc`, `:q!`, Enter. **Check:** the file contains your actual observations, not guesses.

## 7C.10 — Complete all report sections and verify
Include: 1. Incident Summary; 2. Observed Recovery; 3. Root Cause (not yet confirmed); 4. Incident Timeline; 5. Impact Assessment; 6. Corrective and Preventive Actions; 7. Incident Closure and Follow-Up. Distinguish confirmed impact from possible user impact. Do not claim the number of affected users, exact outage duration, financial loss, or definitive cause without supporting evidence.
```bash
cat reports/incident-report.md
wc -l reports/incident-report.md
grep -n '^## ' reports/incident-report.md
```
**Check:** seven numbered sections and readable Markdown. All proposed engineering actions must be described as recommendations, not completed fixes.

## 7C.11 — Preserve the source as an evidence copy
```bash
cp logs/production.log evidence/production-original.log
ls -lh evidence/production-original.log
cmp logs/production.log evidence/production-original.log
echo $?
```
**Expect:** `cmp` prints nothing for identical files, and exit code `0`. If the destination exists, do **not** blindly overwrite evidence; inspect and choose a new case/version path. The original classroom used `cp -n` (no-clobber), but `-n` portability/behavior varies by implementation, so a guarded copy is preferable in reusable documentation. This training exercise does not claim full forensic acquisition.

## 7C.12 — Calculate SHA-256 hashes
```bash
sha256sum logs/production.log evidence/production-original.log
```
**Expect:** two identical 64-character hex digests if the files contain identical bytes. **Interpretation:** equality of checked contents at this moment; not independent proof of authenticity.

## 7C.13 — Save and verify a checksum manifest
```bash
sha256sum evidence/production-original.log > evidence/SHA256SUMS
cat evidence/SHA256SUMS
sha256sum -c evidence/SHA256SUMS
```
**Expect:** `evidence/production-original.log: OK` when running from `incident-001`. The manifest stores a relative path; running the check from another directory may fail. For serious evidence handling, store trustworthy manifests and chain-of-custody records separately with access controls.

## 7C.14 — Final structural and integrity verification
```bash
tree
sha256sum -c evidence/SHA256SUMS
```
**Expect:** four directories and four files in `incident-001` (the current directory plus `evidence`, `logs`, `reports`; two evidence files, one log, one report) and checksum `OK`. If `tree` is unavailable, use `find . -maxdepth 3 -print` to inspect the layout.

## Completion checklist
- [ ] Fifteen original synthetic log entries verified
- [ ] Warnings and errors extracted with line numbers
- [ ] First observed warning/error identified
- [ ] Recovery evidence and uncertainty distinguished
- [ ] Seven-section report created and inspected
- [ ] Original copy preserved and compared
- [ ] Matching SHA-256 hashes observed
- [ ] Saved manifest verified with `OK`
- [ ] Four-file incident directory confirmed

**Next:** independent assessment, knowledge checks and answer key. Do not modify `evidence/production-original.log` to add analyst commentary; write notes in the report or a separate working copy.
