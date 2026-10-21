# Mini-project: My first Linux operations workspace

## Scenario
You are preparing a simple personal workspace on a Linux server for DevOps practice. Your manager wants a note and a verifiable report file, organized under a dedicated module folder.

## Requirements
1. Create `~/devops-training/01-linux/notes` and `~/devops-training/01-linux/practice`.
2. Create `notes/day-001.md` containing `My first DevOps Linux lesson`.
3. In `practice`, create a file named `day-001.md`, then rename it to `day-001-report.txt` using `mv`.
4. Write exactly `Linux Day 1 practical assessment completed.` to the report file.
5. Read the report back with `cat`.
6. Show the directory structure with `tree`.

## Verification

```bash
cat ~/devops-training/01-linux/notes/day-001.md
cat ~/devops-training/01-linux/practice/day-001-report.txt
tree ~/devops-training/01-linux
```

The report should print:

```text
Linux Day 1 practical assessment completed.
```

The file tree should contain `notes/day-001.md` and `practice/day-001-report.txt`. Other files may also exist.

## Production thinking
This is a learning simulation, not a production deployment. In real environments, always check the current machine, target paths, access permissions, and the impact of overwriting files.

![Mini-project workflow](../images/08-mini-project.svg)

---
© 2026 VERIQTA LIMITED · VERIQTA DevOps Training — From Zero to Professional · All rights reserved.
