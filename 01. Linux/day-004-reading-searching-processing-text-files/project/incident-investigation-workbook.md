# Incident Investigation Workbook — Full Stage 7C.1–7C.14
**VERIQTA DevOps Training | Day 004 | synthetic incident INC-001**

This workbook follows the complete guided project sequence. Use `project/README.md` for the full 15-line dataset and `project/reference-solution.md` for the model seven-section report. Commands below assume the location stated in each step.

## 7C.1 — Create case workspace
Create `project/incident-001/{logs,evidence,reports}` and use `pwd` to confirm location. Explain why original logs, preserved evidence, and findings should be stored separately.

**Command(s):**
```bash
mkdir -p project/incident-001/{logs,evidence,reports}
cd project/incident-001
pwd
```
**Verification:** The current directory ends with incident-001.
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.2 — Write and inspect the fifteen-line incident log
Use the full 15-line heredoc from `project/README.md`. Never substitute the 10-line practice log. Count and number source records.

**Command(s):**
```bash
wc -l logs/production.log
cat -n logs/production.log
```
**Verification:** 15 lines; first at 10:00 and last at 10:14.
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.3 — Establish source metadata
Confirm file existence, byte size and record count before interpreting it.

**Command(s):**
```bash
ls -l logs/production.log
wc -l logs/production.log
```
**Verification:** 840 bytes in the supplied exact training file; 15 lines.
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.4 — Review full chronological context
Inspect the beginning and end, and do not treat isolated failures as the complete timeline.

**Command(s):**
```bash
head -n 5 logs/production.log
tail -n 5 logs/production.log
cat -n logs/production.log
```
**Verification:** Early successful startup, subsequent degradation, then recovery messages.
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.5 — Filter warnings and errors
Use extended grep and line numbers. Explain the difference between source line number and clock time.

**Command(s):**
```bash
grep -n -E "WARN|ERROR" logs/production.log
grep -E "WARN|ERROR" logs/production.log | wc -l
```
**Verification:** Seven matching records: 3 WARN (source lines 4, 7, 11) and 4 ERROR (6, 8, 10, 12).
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.6 — Examine onset context
Use `sed` to inspect the time window surrounding first symptoms, including INFO context.

**Command(s):**
```bash
sed -n "4,8p" logs/production.log
```
**Verification:** 10:03 WARN, 10:04 INFO, 10:05 ERROR, 10:06 WARN, 10:07 ERROR.
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.7 — Identify first observed symptoms
Extract first warning and first error; avoid claiming these are the true incident start.

**Command(s):**
```bash
grep "WARN" logs/production.log | head -n 1
grep "ERROR" logs/production.log | head -n 1
```
**Verification:** First observed warning 10:03; first observed error 10:05.
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.8 — Distinguish failure and recovery
Review HTTP 503, restoration, HTTP 200, and health-check evidence.

**Command(s):**
```bash
grep -n -E "HTTP 503|HTTP 200|connection restored|health check passed" logs/production.log
```
**Verification:** 10:11 503; 10:12 connection restored; 10:13 200; 10:14 health check passed.
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.9 — Create incident report
Create `reports/incident-report.md` with vi. Include incident metadata, summary, observed recovery and root-cause uncertainty.

**Command(s):**
```bash
vi reports/incident-report.md
cat reports/incident-report.md
```
**Verification:** A readable Markdown report exists; root cause remains unconfirmed.
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.10 — Finish seven report sections
Add incident timeline, impact assessment, proposed actions, closure and follow-up. Mark unknown counts and outage duration as unknown.

**Command(s):**
```bash
grep -n "^## " reports/incident-report.md
wc -l reports/incident-report.md
```
**Verification:** Seven numbered report sections. Proposals are not misrepresented as fixes.
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.11 — Preserve an unchanged evidence copy
Copy without overwriting a pre-existing preserved file; compare exact bytes. In the original classroom the copy command used `cp -n`, which emitted a portability warning but succeeded.

**Command(s):**
```bash
cp -n logs/production.log evidence/production-original.log
ls -lh evidence/production-original.log
cmp logs/production.log evidence/production-original.log
echo $?
```
**Verification:** cmp prints nothing and exit code is 0 if identical.
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.12 — Calculate hashes of both copies
Compute SHA-256 for source and evidence and compare the complete 64-character digest.

**Command(s):**
```bash
sha256sum logs/production.log evidence/production-original.log
```
**Verification:** Both digests match. This proves content equality at checking time, not chain of custody.
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.13 — Save and verify checksum manifest
Record hash of preserved copy and verify it from the incident root.

**Command(s):**
```bash
sha256sum evidence/production-original.log > evidence/SHA256SUMS
cat evidence/SHA256SUMS
sha256sum -c evidence/SHA256SUMS
```
**Verification:** evidence/production-original.log: OK
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.

## 7C.14 — Verify the finished incident directory
Inspect the tree and rerun checksum verification.

**Command(s):**
```bash
tree
sha256sum -c evidence/SHA256SUMS
```
**Verification:** 4 directories, 4 files, and evidence verification OK.
**Instructor checkpoint:** Explain what the command establishes, inspect its output, and do not continue if it differs.


## Appendix A — Complete 15-line source data (self-contained)

Run from `project/incident-001` only if `logs/production.log` does not already exist. **Do not overwrite existing case evidence.**

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

Expected: 15 lines; seven WARN/ERROR records (3 WARN and 4 ERROR).

## Appendix B — Complete reference report

# Reference Solution — Incident Report

This is an **example report for synthetic training logs**, not a real incident record. A learner may phrase observations differently if every claim is evidence-based.

# VERIQTA DevOps Training
## Production Incident Investigation Report

**Incident ID:** INC-001  
**Incident Date:** 2026-10-22  
**System:** VERIQTA Lesson API  
**Status:** Recovery observed; continued monitoring required

### 1. Incident Summary
The sample application showed database response degradation, database query timeouts, and failures to retrieve lesson content. The first recorded warning was at 10:03 and the first recorded error at 10:05. At 10:11, the Lesson API returned HTTP 503.

### 2. Observed Recovery
The log reports that the database connection was restored at 10:12, the Lesson API returned HTTP 200 at 10:13, and an application health check passed at 10:14. These are recovery indicators; they do not demonstrate permanent remediation.

### 3. Root Cause
**Not yet confirmed.** The recorded symptoms suggest investigating database performance and connection capacity, but the log alone cannot establish a definitive root cause. Correlate with database metrics, connection-pool telemetry, deployments, traces and infrastructure events.

### 4. Incident Timeline
| Time | Severity | Observed event |
|---|---|---|
| 10:03 | WARN | Database response time increasing |
| 10:05 | ERROR | Database query timeout |
| 10:06 | WARN | Database connection pool nearing capacity |
| 10:07 | ERROR | Failed to retrieve lesson content |
| 10:09 | ERROR | Database connection unavailable |
| 10:10 | WARN | Application response time degraded |
| 10:11 | ERROR | Lesson API returned HTTP 503 |
| 10:12 | INFO | Database connection restored |
| 10:13 | INFO | Lesson API returned HTTP 200 |
| 10:14 | INFO | Application health check passed |

### 5. Impact Assessment
**Confirmed:** at least one recorded Lesson API HTTP 503, a database query timeout, a database connectivity failure, a lesson retrieval failure, and degraded response indicators.  
**Possible but not confirmed:** some users may have experienced failed or delayed lesson requests. The number of affected users, exact outage duration, total request failure rate and financial impact cannot be determined from this file.

### 6. Corrective and Preventive Actions
**Proposed for engineering review, not verified as implemented:** inspect database latency and saturation metrics; analyze pool utilization and timeouts; correlate application/database telemetry; review retry and timeout configuration; alert on elevated response time, connection-pool pressure and repeated HTTP 503; exercise failure/recovery scenarios; verify any implemented remediation under monitoring.

### 7. Incident Closure and Follow-Up
Recovery is observed by 10:14 in the available log, but definitive root cause and permanent remediation remain open. Retain the original log and SHA-256 manifest, document evidence provenance and follow-up ownership, and verify sustained service health before final closure according to the organization's incident policy.

**Evidence:** `logs/production.log`, preserved copy `evidence/production-original.log`, manifest `evidence/SHA256SUMS`.

