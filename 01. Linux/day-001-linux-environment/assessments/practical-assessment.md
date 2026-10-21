# Day 001 — Independent Practical Assessment

**Instructions:** Complete this on your Ubuntu training machine without copying the mini-project command sequence. You may consult `--help` or manual pages. Verify every requirement before marking yourself complete.

## Scenario

You have been asked to prepare the Linux module workspace and submit a simple completion report. The reviewer needs to find the correct directories, note, and report with exact contents.

## Requirements

1. Under `~/devops-training`, ensure the `01-linux` directory exists.
2. Inside `01-linux`, create `notes` and `practice` directories.
3. Create `notes/day-001.md` containing exactly `My first DevOps Linux lesson`.
4. Inside `practice`, create a file named `day-001.md`, then rename it to `day-001-report.txt`.
5. Write exactly `Linux Day 1 practical assessment completed.` into the renamed file.
6. Verify the content of both files and display the directory structure.

## Verification checklist

Run these **after** you finish:

```bash
pwd
ls -l ~/devops-training/01-linux
cat ~/devops-training/01-linux/notes/day-001.md
cat ~/devops-training/01-linux/practice/day-001-report.txt
tree ~/devops-training/01-linux
```

**Expected content:**

```text
My first DevOps Linux lesson
Linux Day 1 practical assessment completed.
```

The two lines above are outputs from separate `cat` commands. Your `tree` output should include `notes/day-001.md` and `practice/day-001-report.txt`. Other files you created during practice may also appear.

## Assessment rubric — 100 points

| Requirement | Points |
|---|---:|
| Workspace and module directory exist in the correct location | 20 |
| `notes` and `practice` directories are correctly organized | 15 |
| Note file contains the exact required text | 20 |
| Practice file is correctly renamed | 15 |
| Report contains the exact required text | 20 |
| Student verifies file contents and structure | 10 |
| **Total** | **100** |

**Pass standard:** 80/100 or above, with the required report and note both verified. Correct any mistakes and repeat the verification commands. This is a student-facing rubric, not a preassigned score.

## Think like an engineer

If the report content is wrong, do not guess. Use `cat` to inspect it, correct it in your own practice folder, and run `cat` again. Exact text and paths matter in automation.
