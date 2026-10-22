# VERIQTA DevOps Training — From Zero to Professional
## Day 004 — Reading, Searching, and Processing Text Files in Linux

**Module:** 01 — Linux Fundamentals  
**Level:** Absolute beginner  
**Method:** Explain → demonstrate → execute → inspect output → verify → reflect  
**Suggested study:** 60 minutes for the core lesson; the extended production incident investigation may take additional sessions.  
**Lab environment:** Ubuntu Linux terminal (local or SSH-connected EC2).  
**Sample incident date:** 2026-10-22 (synthetic training data, not a real incident).

### Learning outcomes
By the end, a learner should be able to read files (`cat`, `less`, `head`, `tail`), search with `grep`, count with `wc`, sort and deduplicate with `sort`/`uniq`, combine commands with pipes, write and append using redirection, preserve an incident log, calculate and verify SHA-256 hashes, and write an evidence-based incident report.

### Read in this order
1. [`notes/complete-lesson.md`](notes/complete-lesson.md) — full concepts, examples and guided walkthrough.
2. [`labs/follow-along-labs.md`](labs/follow-along-labs.md) — executable exercises with expected outputs and checkpoints.
3. [`exercises/practice-exercises.md`](exercises/practice-exercises.md) — extra independent exercises.
4. [`project/README.md`](project/README.md) — the full incident investigation project, 7C.1–7C.14.
5. [`project/reference-solution.md`](project/reference-solution.md) — report and evidence interpretation.
6. [`assessments/knowledge-check.md`](assessments/knowledge-check.md) — formative questions.
7. [`assessments/practical-assessment.md`](assessments/practical-assessment.md) — independent hands-on assessment.
8. [`assessments/final-assessment.md`](assessments/final-assessment.md) — the five final assessment questions.
9. [`assessments/answer-key.md`](assessments/answer-key.md) — answer explanations (consult after trying).
10. [`troubleshooting/README.md`](troubleshooting/README.md) — common errors and fixes.

### Directory convention
Use `~/devops-training/01-linux/day-004/` for core exercises, and `~/devops-training/01-linux/day-004/project/incident-001/` for the investigation. All commands are meant to be executed in an authorized training environment. Paths and results depend on the current directory: check `pwd` before running relative-path commands.

### Evidence discipline
The sample log is synthetic. A matching checksum shows the checked bytes match the saved reference; it does **not** by itself prove source authenticity or establish a complete chain of custody. The root cause of the simulated incident remains unconfirmed.

### Publication notes
This classroom package is written for independent public learners. It contains no personal learner scores, private account details, or unverifiable claims of real-world incidents. The original VERIQTA logo asset is not bundled because an authenticated source file was not supplied for this package; it has not been recreated or modified.
