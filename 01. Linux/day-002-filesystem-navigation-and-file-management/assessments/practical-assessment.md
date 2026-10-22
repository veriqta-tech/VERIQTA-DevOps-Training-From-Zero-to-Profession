# Day 002 — Practical Assessment for Students

**Total: 100 points.** Work independently. You may refer to the notes to understand commands, but do not use the instructor solution as a substitute for doing the work.

## Scenario

Prepare a small application workspace for deployment. Your configuration must be available in three places: its original location, a backup directory, and a deployment directory.

## Target structure

```text
day-002/
└── project/
    └── application/
        ├── backup/
        │   └── app.conf
        ├── config/
        │   └── app.conf
        └── deployment/
            └── production.conf
```

All three files must contain **exactly**:

```text
APP_NAME=DevOpsTraining
```

## Five assessment tasks

1. **Create the directory structure — 20 points.** Create `application`, `backup`, `config`, and `deployment` under the correct project path.
2. **Create the original configuration — 20 points.** Write the required line into `application/config/app.conf`.
3. **Create a backup — 20 points.** Preserve the original and copy it into `application/backup/app.conf`.
4. **Prepare the deployment copy — 20 points.** Create `application/deployment/production.conf` with the same contents.
5. **Verify the complete result — 20 points.** Display the tree and read all three files. Explain what each verification command proves.

## Required verification

From `~/devops-training/01-linux/day-002/project`:

```bash
pwd
tree application
cat application/config/app.conf
cat application/backup/app.conf
cat application/deployment/production.conf
```

**Expected:** The tree shows four directories including `application` and three files. Each `cat` displays `APP_NAME=DevOpsTraining`.

## Marking guide

| Criterion | Points |
|---|---:|
| Directory structure | 20 |
| Original configuration | 20 |
| Backup copy | 20 |
| Deployment copy | 20 |
| Complete verification | 20 |
| **Total** | **100** |

**Suggested passing standard:** At least 80 points, with the original configuration preserved and all required files readable.

## When verification fails

Do not delete the entire project. Inspect the exact path that failed using `pwd`, `ls`, `tree`, and `cat`. Fix the smallest mistake, then run the verification commands again.

## Reflection

Why did you use `cp` rather than `mv` for the backup? What would happen if you accidentally wrote the deployment configuration to the original path? Why is it important to verify file contents as well as filenames?
