# Complete Lesson — Day 004

## 0. Terminal readiness
A terminal is a text interface for issuing commands to the shell. On Ubuntu, `pwd` prints the current directory, `ls` lists directory entries, `cd` changes directories, and `mkdir -p` creates a directory hierarchy without failing if it already exists.

```bash
mkdir -p ~/devops-training/01-linux/day-004
cd ~/devops-training/01-linux/day-004
pwd
```
Expected path ends in `/devops-training/01-linux/day-004`. **Checkpoint:** verify `pwd` before continuing.

## 1. Why text files matter in production
Linux applications write logs, configuration files, scripts and reports as text. A log line is an observation, not necessarily a verified explanation. Logs can be incomplete, have clock skew, or omit context. Never infer a confirmed root cause from one suggestive line.

## 2. Create a safe sample log
The following *ten-line* file is used for command practice, not the fifteen-line incident project.

```bash
cat > application.log <<'EOF'
2026-10-22 09:00:00 INFO Application started
2026-10-22 09:01:00 INFO Database connected
2026-10-22 09:02:00 WARN Response time increasing
2026-10-22 09:03:00 ERROR Database query timeout
2026-10-22 09:04:00 INFO Retrying query
2026-10-22 09:05:00 ERROR Lesson request failed
2026-10-22 09:06:00 WARN Retry limit approaching
2026-10-22 09:07:00 INFO Database connection restored
2026-10-22 09:08:00 ERROR Cache refresh failed
2026-10-22 09:09:00 INFO Health check passed
EOF
wc -l application.log
```
Expected: `10 application.log`. The `cat > ... <<'EOF'` form is a here-document: the shell writes all following lines up to the exact `EOF` delimiter. `>` overwrites an existing file; use it carefully.

## 3. Read an entire file: cat
```bash
cat application.log
cat -n application.log
```
`cat` prints the entire file to standard output. `-n` adds displayed line numbers; it does not edit the file. Good for short files, poor for huge logs. **Checkpoint:** ten records appear in time order.

## 4. Navigate a long file: less
```bash
less application.log
```
`less` lets you page through content without modifying it. Press `Space` for next page, `b` for previous page, `/ERROR` to search forward, `n` for next match and `q` to quit. On some minimal environments `less` may need installation; do not install software without permission on managed systems.

## 5. Read the beginning or end: head and tail
```bash
head application.log
head -n 3 application.log
tail -n 5 application.log
```
`head` defaults to ten lines; `tail` defaults to ten lines. `-n N` selects a count. For active logs, `tail -f application.log` follows appended lines; press `Ctrl+C` to stop. Avoid streaming confidential logs into unapproved terminals.

## 6. Search by keyword: grep
```bash
grep 'ERROR' application.log
grep -i 'error' application.log
grep -n 'ERROR' application.log
grep -n -E 'WARN|ERROR' application.log
```
`grep` prints matching lines. `-i` ignores case, `-n` prints source line numbers, and `-E` enables extended regular expressions; `|` inside the quoted regex means OR. Exact uppercase `ERROR` appears three times in the sample.

## 7. Count text: wc
```bash
wc -l application.log
wc -w application.log
wc -c application.log
grep 'ERROR' application.log | wc -l
```
`-l` counts newline characters, usually corresponding to records in newline-terminated logs. `-w` counts whitespace-delimited words and `-c` counts bytes. `grep ... | wc -l` counts matching lines (not the number of occurrences within a line). Expected ERROR-line count: `3`.

## 8. Sort values and count categories
Create the exact ten-line practice dataset:
```bash
cat > severity.txt <<'EOF'
INFO
ERROR
WARN
INFO
ERROR
INFO
WARN
ERROR
INFO
INFO
EOF
sort severity.txt
sort severity.txt | uniq
uniq -c severity.txt
sort severity.txt | uniq -c
```
`sort` orders lines lexicographically. `uniq` collapses only **adjacent** duplicate lines; it does not globally deduplicate an unsorted file. `uniq -c` counts adjacent runs. The correct aggregate totals are **3 ERROR, 5 INFO, 2 WARN**. Notice that `uniq -c severity.txt` may list repeated categories in separate groups, which is why sorting first matters.

## 9. Pipes: connect commands
```bash
grep -i 'ERROR' application.log | wc -l
sort severity.txt | uniq -c
```
The shell pipe `|` connects one command's standard output to the next command's standard input. Commands can be composed into useful pipelines; check each stage separately when debugging.

## 10. Redirection: write reports safely
```bash
grep -i 'ERROR' application.log > errors-report.txt
cat errors-report.txt
ls -l errors-report.txt
echo 'Investigation note: three ERROR records identified.' >> errors-report.txt
cat errors-report.txt
```
`>` creates or **replaces** the destination; `>>` appends. Neither changes `application.log`. Confirm the report now contains three ERROR records and one note. Never redirect output onto an original evidence file.

## 11. Inspect a specific line range
```bash
sed -n '4,8p' application.log
```
`sed -n` suppresses automatic printing; `4,8p` prints lines 4 through 8. This is an additional tool useful for evidence context; it does not modify the file without explicit in-place options.

## 12. Readable incident investigation workflow
1. Confirm the source file and its context.
2. Count records and inspect beginning/end.
3. Extract warnings and errors with original line numbers.
4. Reconstruct a timeline and note evidence gaps.
5. Describe confirmed impact separately from possible impact.
6. Identify recovery signals without equating them to a permanent fix.
7. Preserve an unchanged evidence copy and validate checksums.
8. Write an incident report with uncertainty clearly labeled.

Proceed to [`../labs/follow-along-labs.md`](../labs/follow-along-labs.md), then the full [`../project/README.md`](../project/README.md).
