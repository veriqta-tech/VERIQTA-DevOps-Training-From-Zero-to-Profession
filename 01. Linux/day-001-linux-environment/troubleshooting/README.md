# Day 001 troubleshooting log and guide

## Observed: `tree` command not found

**Symptom:** `tree` failed because the utility was not installed.

**Diagnosis:** The shell suggested installing the missing package. On Ubuntu, you can also check `command -v tree`.

**Resolution:** The original learner ran `sudo apt install tree` and then successfully used `tree` to display the workspace structure.

**Reusable fix:**

```bash
sudo apt update
sudo apt install tree
tree ~/devops-training/01-linux
```

**Verification:** You see the directory tree rather than a missing-command error.

## Common: `mkdir: File exists`

This means the directory already exists. Do not delete it. Use `mkdir -p path` when you want an idempotent directory-creation step.

## Common: `No such file or directory`

Run `pwd` and `ls` to confirm where you are and whether the path exists. A relative path depends on the current directory.

## Common: `Permission denied`

Check the file path and your identity with `whoami`. Do not reflexively add `sudo` to every command. For this lesson, work in your own home directory.

## Common: wrong report text

The original learner initially used the wording `practice assessment`, while the assessment required `practical assessment`. Exact output matters for automation and reproducible labs. The learner corrected the sentence and verified it with `cat`.

## Safety reminders

- Never paste an unknown command into a production shell without understanding it.
- `>` overwrites file contents.
- Do not publish AWS private keys, credentials, or sensitive infrastructure details.
- Do not run deletion commands to fix simple directory mistakes.

---
© 2026 VERIQTA LIMITED · VERIQTA DevOps Training — From Zero to Professional · All rights reserved.
