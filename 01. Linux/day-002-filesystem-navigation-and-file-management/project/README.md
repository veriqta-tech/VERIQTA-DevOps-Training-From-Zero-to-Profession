# Day 002 — Independent Project: Prepare an Application for Deployment

## Scenario

You are the engineer responsible for preparing a small application configuration before a deployment. You must keep an editable original, a backup copy, and a deployment copy. A teammate must be able to inspect the directory and confirm all three files have the intended content.

**Do not copy the solution until you've attempted the project.** Use what you learned in Steps 1–6.

## Requirements

Work inside:

```text
~/devops-training/01-linux/day-002/project
```

Create:

```text
application/
├── backup/
│   └── app.conf
├── config/
│   └── app.conf
└── deployment/
    └── production.conf
```

All three files must contain exactly:

```text
APP_NAME=DevOpsTraining
```

This is the configuration text for this Day 002 lab; it is not a company-name change. The course's public brand remains VERIQTA DevOps Training.

### Task 1 — Directories

Create `application/backup`, `application/config`, and `application/deployment`.

**Think:** Which command creates several nested directories in one operation? How will you confirm the result?

### Task 2 — Original configuration

Create `application/config/app.conf` containing the exact required line.

**Think:** Which command writes a short line? What does `>` do if the file already exists?

### Task 3 — Backup

Copy the original into `application/backup/`, keeping the name `app.conf`.

**Think:** Why is `cp` appropriate here and `mv` inappropriate?

### Task 4 — Deployment copy

Copy the original to `application/deployment/production.conf`.

**Think:** How can `cp` give the destination a different name?

### Task 5 — Verify

Run:

```bash
tree application
cat application/config/app.conf
cat application/backup/app.conf
cat application/deployment/production.conf
```

**Acceptance criteria:** The correct three subdirectories exist; all three expected files exist; all three contain exactly `APP_NAME=DevOpsTraining`; the original was not removed.

## Instructor walkthrough — review after your attempt

```bash
cd ~/devops-training/01-linux/day-002/project
mkdir -p application/{backup,config,deployment}
echo "APP_NAME=DevOpsTraining" > application/config/app.conf
cp application/config/app.conf application/backup/
cp application/config/app.conf application/deployment/production.conf
tree application
cat application/config/app.conf
cat application/backup/app.conf
cat application/deployment/production.conf
```

**Explanation:** The `mkdir -p` command creates the structure. `echo` writes the source configuration. The first `cp` retains the basename because the destination is a directory. The second `cp` names the copied file `production.conf`. The verification commands independently check structure and content.

## Production engineering perspective

This lab teaches the *mechanics* of making copies. A real production backup strategy also needs secure storage, retention, access controls, recovery testing, and possibly off-host copies. You will learn these topics in later modules.

Proceed to the [Practical Assessment for Students](../assessments/practical-assessment.md).
