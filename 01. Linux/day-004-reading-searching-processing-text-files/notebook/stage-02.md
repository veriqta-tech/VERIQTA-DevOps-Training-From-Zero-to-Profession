# VERIQTA DevOps Training — Day 004 Notebook
## Stage 2 of 7: Navigating with less, head and tail

**Level:** Absolute beginner. **System:** Ubuntu/Linux terminal. **Scope:** simulated training files, not production access.

### Learning outcome
Understand **less head tail** and demonstrate the behavior by running commands and checking actual output.

### Explanation from first principles
`less` pages through a file interactively. Use Space to advance, `b` to go backward, `/ERROR` to search, `n` to repeat and `q` to exit. `head` displays the start and `tail` the end; both default to ten lines, so use `-n` to select smaller windows. `tail -f` is for watching newly appended lines; stop it with Ctrl+C.

### Before you begin
```bash
cd ~/devops-training/01-linux/day-004
pwd
```
Ensure the sample files have been created using `setup/prepare-practice-files.sh` or the exact here-documents in `notes/complete-lesson.md`.

### Follow-along commands (run one at a time)
```bash
less application.log
```
```bash
head -n 3 application.log
```
```bash
tail -n 5 application.log
```
```bash
tail -f application.log
```

### Expected observation and verification
First three lines end at 09:02 WARN. Last five lines begin at 09:05 ERROR. Exit less with q and tail -f with Ctrl+C.

### Why this matters in a production investigation
When debugging a failure, use commands that let you inspect and summarize evidence reproducibly without editing original logs. Verify your working directory, file paths and line counts before drawing conclusions.

### Practical exercises
1. Explain the command in plain English without reading the solution.
2. Predict its output before running it, then compare the actual result.
3. Explain which file, if any, the command changes.
4. Record any unexpected output and the command you used to investigate it.

### Checkpoint before continuing
- [ ] Commands executed from the expected directory
- [ ] Output matches the expected observations
- [ ] Original source file remains intact
- [ ] Can explain the command without memorizing syntax alone

**Evidence instruction:** Capture your own screenshot if learning interactively. No fabricated screenshot is included in this public package.


## Instructor deep dive — less, head and tail inspect different slices

less is a pager: use Space to advance, b to go backward, /ERROR to search and q to quit. head -n 5 shows the first five lines; tail -n 5 shows the last five. tail -f follows appended entries until Ctrl+C; do not leave it running unnecessarily.

![VERIQTA DevOps Training instructional figure](../images/diagrams/file-reading.svg)

### Demonstrate the commands individually

Run these one by one, **not as a pasted block**, and inspect the result after each command:

```bash
less application.log
head -n 5 application.log
tail -n 5 application.log
```

**Interpretation:** head shows startup context, tail shows recent status. Neither alone establishes a full incident timeline.

### Self-explanation checkpoint

Before continuing, explain (1) the command's input, (2) what it writes to standard output, (3) whether it changes any file, and (4) how to recognize incorrect output. If your result differs, confirm `pwd`, `ls -l`, spelling and case, then repeat safely.

### Practice without copying

Reproduce the demonstration from memory, then check your output. Predict what would change if the source file gained another `ERROR` line; distinguish an observation from a hypothesis.
