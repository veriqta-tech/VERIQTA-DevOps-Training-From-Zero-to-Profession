# Follow-Along Labs — Execute, Verify, Explain

**Start:** `cd ~/devops-training/01-linux/day-004` and verify with `pwd`. Complete each checkpoint before proceeding. Commands below assume the practice files were created using `notes/complete-lesson.md`.

## Lab 1 — Inspect a text file
```bash
ls -lh application.log
cat application.log
cat -n application.log
wc -l application.log
```
**Expect:** file exists, ten records, numbered lines 1–10. **Explain:** `ls` displays metadata, `cat` displays contents, `wc -l` counts lines.

## Lab 2 — Read strategically
```bash
head -n 3 application.log
tail -n 5 application.log
less application.log
```
**Expect:** first three lines, last five lines, then an interactive pager. Exit `less` with `q`. **Verify:** no file content changed.

## Lab 3 — Search log severity
```bash
grep 'ERROR' application.log
grep -i 'error' application.log
grep -n -E 'WARN|ERROR' application.log
```
**Expect:** three ERROR lines for the first two commands; both warning and error lines, numbered, for the third. **Explain:** case-sensitive versus insensitive, and regex OR.

## Lab 4 — Count matches
```bash
grep 'ERROR' application.log | wc -l
wc -l application.log
```
**Expect:** 3 and 10. **Explain:** a pipe passes output; counting matching lines is different from counting all lines.

## Lab 5 — Sort and deduplicate
```bash
cat severity.txt
sort severity.txt
uniq -c severity.txt
sort severity.txt | uniq -c
```
**Expect:** sorted counts 3 ERROR, 5 INFO, 2 WARN. **Explain:** `uniq` only combines adjacent identical lines. **Knowledge check:** why does sorting change the result? Because it makes equal values adjacent.

## Lab 6 — Produce a report
```bash
grep -i 'ERROR' application.log > errors-report.txt
cat errors-report.txt
ls -l errors-report.txt
echo 'Investigation note: three ERROR records identified.' >> errors-report.txt
cat errors-report.txt
```
**Expect:** three error records followed by the appended note. **Knowledge check:** why use `>>` for the note? It appends rather than overwrites the extracted evidence.

## Lab 7 — Project handoff
```bash
mkdir -p project/incident-001/{logs,evidence,reports}
cd project/incident-001
pwd
```
**Expect:** working directory ends in `/project/incident-001`. Continue in [`../project/README.md`](../project/README.md) to create the fifteen-line production log and complete all fourteen 7C checkpoints.

### Learning verification
At each checkpoint, learners should record the command, expected result, observed result, and one sentence explaining the result. Screenshots are optional for public learners; instructors may require them before progression.
