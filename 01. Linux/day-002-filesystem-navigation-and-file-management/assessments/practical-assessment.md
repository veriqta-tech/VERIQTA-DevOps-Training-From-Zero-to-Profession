# Day 002 — Practical Assessment (100 points)

Complete this independently in your own training environment. Do not rely on prepackaged example files. You may use the lesson notes for command syntax, but make the decisions and run the commands yourself.

## Assessment scenario

Prepare an application configuration workspace under `~/devops-training/01-linux/day-002/project`. Your task is to create a clean folder hierarchy, write the application's configuration, preserve a backup, and prepare a deployment copy.

| Requirement | Points | What to demonstrate |
|---|---:|---|
| Directory structure | 20 | `application/config`, `application/backup`, and `application/deployment` exist |
| Original configuration | 20 | `config/app.conf` contains exactly `APP_NAME=DevOpsTraining` |
| Backup copy | 20 | `backup/app.conf` exists and matches the source |
| Deployment copy | 20 | `deployment/production.conf` exists and matches the source |
| Verification and explanation | 20 | Show `tree` (or `find`) and all three `cat` results; explain why a copy was appropriate |
| **Total** | **100** | |

## Verification commands

```bash
cd ~/devops-training/01-linux/day-002/project
pwd
tree application
cat application/config/app.conf
cat application/backup/app.conf
cat application/deployment/production.conf
```

**Expected structure:** Four directories including `application`, three files. **Expected content:** Each `cat` prints `APP_NAME=DevOpsTraining`. If `tree` is unavailable, substitute `find application -print | sort`.

## Self-assessment

- [ ] I built the directories myself.
- [ ] I created the source file before copying it.
- [ ] I preserved the original while creating both copies.
- [ ] I verified each file's content rather than assuming a command succeeded.
- [ ] I can explain the purpose of each folder and file.

Award points only for requirements you actually verified. Correct any failed requirement and repeat the check. There is **no preassigned student score**; your result depends on your work.

**Suggested passing threshold:** 80/100, with all required configuration files present and verified. If a safety-critical operation was misunderstood, review the relevant lesson before proceeding.
