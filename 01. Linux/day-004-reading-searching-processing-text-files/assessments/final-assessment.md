# Final Knowledge Assessment — Five Questions

These five questions reproduce the completed final assessment scenarios and options for public learners. Choose one answer per question before reading the answer key.

## Question 1 — Evidence-based conclusions
A VERIQTA Lesson API training log shows increasing database response time at 10:03, query timeout at 10:05, connection pool pressure at 10:06, lesson retrieval failure at 10:07, database connection unavailable at 10:09, HTTP 503 at 10:11, connection restored at 10:12, HTTP 200 at 10:13 and a successful health check at 10:14. Which conclusion is most defensible?
- **A.** The database connection pool definitely caused the entire incident.
- **B.** The logs show database-related degradation, application failures, and subsequent recovery, but the root cause remains unconfirmed.
- **C.** The application was completely unavailable from 10:03 until 10:14.
- **D.** The HTTP 503 error proves that the application server was permanently damaged.

## Question 2 — Evidence integrity
An engineer wants to add comments directly inside `evidence/production-original.log`. What is safest?
- **A.** Allow edits because the investigation is ongoing.
- **B.** Delete the original after copying error messages into the report.
- **C.** Preserve original evidence unchanged, analyze a separate working copy, and document modifications to that copy.
- **D.** Edit the original and generate a new checksum without recording the modification.

## Question 3 — Search with line numbers
Which command extracts all WARN and ERROR lines, including original line numbers?
- **A.** `grep "ERROR" production.log`
- **B.** `tail -n 5 production.log`
- **C.** `wc -l production.log`
- **D.** `grep -n -E "WARN|ERROR" production.log`

## Question 4 — Recovery versus permanent resolution
The log shows HTTP 503 at 10:11, database restored at 10:12, HTTP 200 at 10:13 and a passed health check at 10:14. What is the best professional response?
- **A.** A successful health check proves the database problem was permanently fixed.
- **B.** HTTP 200 proves monitoring is unnecessary.
- **C.** No recovery occurred because HTTP 503 remains in the historical log.
- **D.** Recovery is indicated, but root cause and permanent remediation are unverified; continue monitoring and investigating.

## Question 5 — Count severity labels without modifying input
`severity.txt` contains these unordered lines:
```text
ERROR
INFO
WARN
ERROR
INFO
ERROR
WARN
INFO
```
Which command saves a count of each category to `severity-summary.txt` while preserving the source?
- **A.** `uniq -c severity.txt > severity-summary.txt`
- **B.** `sort severity.txt | uniq -c > severity-summary.txt`
- **C.** `sort severity.txt > severity-summary.txt`
- **D.** `sort severity.txt | uniq -c >> severity.txt`

**Passing suggestion:** 4/5, plus successful completion of the independent practical assessment. This is a classroom guideline, not a professional certification.
