# Day 004 — Exercises and Solutions Guidance

Work independently. For each exercise write: command, prediction, actual output, explanation, and whether any file changed. Do not edit preserved evidence.

1. Navigate to the Day 004 directory and show its absolute path.
2. Display the entire application log without modifying it.
3. Display the application log with source line numbers.
4. Open the log in a pager, find ERROR, and exit.
5. Print only the first three lines.
6. Print only the last five lines.
7. Find all ERROR lines with their original line numbers.
8. Find both WARN and ERROR lines with line numbers.
9. Count total log lines, then count ERROR-containing lines.
10. Count distinct severity values correctly even though the input is unsorted.
11. Compare `uniq -c severity.txt` with `sort severity.txt | uniq -c`; explain the difference.
12. Save ERROR entries to a separate report without overwriting the source.
13. Append an investigation note and verify the report has four lines.
14. Explain why redirecting output back to the source log is unsafe.
15. Use a pipeline to count all WARN/ERROR events in the 15-line incident log.
16. Print incident log lines 4 through 8 and explain the value of context.
17. Identify the first warning, first error, HTTP 503 and recovery events from evidence.
18. Write a timeline that distinguishes observation from hypothesis.
19. Preserve a log copy, compare its bytes and compute both SHA-256 hashes.
20. Verify a saved checksum manifest and inspect the four-file incident tree.

## Suggested answer commands (attempt before reading)
```bash
pwd
cat application.log
cat -n application.log
less application.log
head -n 3 application.log
tail -n 5 application.log
grep -n 'ERROR' application.log
grep -n -E 'WARN|ERROR' application.log
wc -l application.log
grep 'ERROR' application.log | wc -l
sort severity.txt | uniq -c
grep -i 'ERROR' application.log > errors-report.txt
echo 'Investigation note: three ERROR records identified.' >> errors-report.txt
sed -n '4,8p' project/incident-001/logs/production.log
```

For exercises 17–20 follow `project/incident-investigation-workbook.md` and explain results in your own words. Avoid declaring an unconfirmed root cause.
