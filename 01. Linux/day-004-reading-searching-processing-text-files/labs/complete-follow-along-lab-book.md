# Day 004 — Full Follow-Along Lab Book

These are the **six foundational labs plus the independent incident project**, in the original order. Each command should be executed and verified before proceeding. Work in `~/devops-training/01-linux/day-004` except for the incident project. Create sample files using the `setup` script or the lesson's here-documents.

## Lab 1 — Inspect a log
```bash
pwd
ls -l application.log
cat application.log
cat -n application.log
```
Check: 10 lines; note which source line contains first ERROR. Explain why `cat -n` does not edit the source.

## Lab 2 — Navigate log boundaries
```bash
less application.log
head -n 3 application.log
tail -n 5 application.log
```
Inside less, practice `/ERROR`, `n`, `q`. Check: last five entries begin at 09:05.

## Lab 3 — Search case-sensitive and insensitive
```bash
grep 'ERROR' application.log
grep -i 'error' application.log
grep -n 'ERROR' application.log
grep -n -E 'WARN|ERROR' application.log
```
Check: ERROR at source lines 4, 6, 9; explain why grep -i is useful for mixed-case logs.

## Lab 4 — Count records and matches
```bash
wc -l application.log
wc -w application.log
wc -c application.log
grep 'ERROR' application.log | wc -l
```
Check: 10 records; 3 ERROR lines. Distinguish bytes from characters and lines from occurrences.

## Lab 5 — Aggregate severity labels
```bash
cat severity.txt
sort severity.txt
uniq -c severity.txt
sort severity.txt | uniq
sort severity.txt | uniq -c
```
Check: 3 ERROR, 5 INFO, 2 WARN. Explain the adjacent-only behavior of uniq.

## Lab 6 — Produce a persistent error report
```bash
grep -i 'ERROR' application.log | wc -l
grep -i 'ERROR' application.log > errors-report.txt
cat errors-report.txt
ls -l errors-report.txt
echo 'Investigation note: three ERROR records identified.' >> errors-report.txt
cat errors-report.txt
```
Check: three log entries and one appended analyst note. Explain the difference between `>` and `>>`; verify the original application.log still has ten lines.

## Lab 7 — Full independent incident project
Go to `../project/incident-investigation-workbook.md`. Follow every step 7C.1–7C.14; do not skip directly to hashes or the report. Complete the seven-section incident report and verify four files and four directories.

## Classroom verification rule
At each checkpoint: run one command, compare actual versus expected output, investigate discrepancies, and only then proceed. The public package cannot contain historical learner screenshots not available as files.
