# VERIQTA DevOps Training — Day 004 Notebook
## Stage 5 of 7: Grouping with sort and uniq

**Level:** Absolute beginner. **System:** Ubuntu/Linux terminal. **Scope:** simulated training files, not production access.

### Learning outcome
Understand **sort uniq** and demonstrate the behavior by running commands and checking actual output.

### Explanation from first principles
`sort` sorts full lines. `uniq` only collapses adjacent equal lines, so it cannot aggregate unsorted categories reliably. `uniq -c` prints run counts. `sort severity.txt | uniq -c` produces true totals across the file. `sort` displays output; it does not change the input unless redirected back to a file (avoid doing that to evidence).

### Before you begin
```bash
cd ~/devops-training/01-linux/day-004
pwd
```
Ensure the sample files have been created using `setup/prepare-practice-files.sh` or the exact here-documents in `notes/complete-lesson.md`.

### Follow-along commands (run one at a time)
```bash
cat severity.txt
```
```bash
sort severity.txt
```
```bash
uniq -c severity.txt
```
```bash
sort severity.txt | uniq
```
```bash
sort severity.txt | uniq -c
```

### Expected observation and verification
3 ERROR, 5 INFO, 2 WARN. Compare unsorted uniq -c against the sorted pipeline and explain why they differ.

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


## Instructor deep dive — pipes and redirection are different

A pipe (|) sends stdout from one process into stdin of another. > creates or truncates an output file; >> appends. Before using >, check whether the destination already exists. Redirected command output does not modify the source input file. stderr is separate from stdout.

![VERIQTA DevOps Training instructional figure](../images/diagrams/pipeline.svg)

### Demonstrate the commands individually

Run these one by one, **not as a pasted block**, and inspect the result after each command:

```bash
grep "ERROR" application.log | wc -l
grep -i "ERROR" application.log > errors-report.txt
cat errors-report.txt
echo "Investigation note: three ERROR records identified." >> errors-report.txt
```

**Interpretation:** Verify the report has three matching ERROR lines plus one note. Re-running > overwrites the report, while >> adds another note.

### Self-explanation checkpoint

Before continuing, explain (1) the command's input, (2) what it writes to standard output, (3) whether it changes any file, and (4) how to recognize incorrect output. If your result differs, confirm `pwd`, `ls -l`, spelling and case, then repeat safely.

### Practice without copying

Reproduce the demonstration from memory, then check your output. Predict what would change if the source file gained another `ERROR` line; distinguish an observation from a hypothesis.
