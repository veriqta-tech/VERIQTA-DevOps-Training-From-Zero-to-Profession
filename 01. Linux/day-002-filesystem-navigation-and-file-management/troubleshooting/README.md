# Day 002 — Troubleshooting Guide

When a command fails, first check **where you are** with `pwd`, **what exists** with `ls`, and **how the target is spelled**. Read the full error before trying another command.

## `cd: ... No such file or directory`

**Cause:** Wrong current directory, typo, or missing target. **Check:** `pwd`, `ls`, and `ls ~/devops-training`. **Fix:** Use an absolute home-based path such as `cd ~/devops-training/01-linux`. Create the training workspace with `mkdir -p ~/devops-training/01-linux` if necessary.

## `cp: cannot stat 'notes/lesson.txt'`

**Cause:** The source path is wrong or the file was never created. **Check:** `pwd; ls notes; cat notes/lesson.txt`. **Fix:** Return to `~/devops-training/01-linux/day-002`, then recreate the intended practice file if needed.

## `mkdir: ... File exists`

**Cause:** A directory already exists or a regular file blocks the requested directory name. **Check:** `ls -ld NAME`. **Fix:** Use `mkdir -p` for directories that may already exist. Do not delete a blocking file until you understand what it contains.

## `tree: command not found`

**Cause:** The optional `tree` package is missing. **Fix:** Use `find day-002 -print | sort` immediately, or install `tree` on Ubuntu using `sudo apt update` followed by `sudo apt install tree` if your training environment permits it.

## `mv` or `cp` overwrote something unexpectedly

**Cause:** The destination already existed. **Prevention:** Inspect `ls -l DESTINATION` before the operation and use `cp -i` or `mv -i` where appropriate. Note that `-i` prompts **only when an overwrite is at issue**, not every time. In real operations, prefer version control and verified backups.

## `rm -i` does not ask a question

**Cause:** The file may not exist, or the shell may be executing a different command than expected. **Check:** `pwd`, `ls -l exercises/temporary.txt`, and the exact command typed. If the file is absent, no deletion is needed. Never use `rm -f` to silence a confusing error.

## `Permission denied`

**Cause:** The user lacks permission on a directory or file. **Check:** `whoami`, `pwd`, `ls -ld .`, and `ls -l FILE`. **Fix:** Work inside your own home directory. Do not use `sudo` reflexively or weaken system permissions just to make a lab pass.

## `>` erased earlier file content

**Cause:** Shell redirection with `>` truncates an existing file before writing. **Prevention:** Use new disposable filenames in the lab and inspect files before writing. `>>` appends instead of replacing, but should also be used intentionally.

## Wrong project filename or directory

**Cause:** `projects` versus `project`, or `production.conf` versus `app.conf`. **Check:** `tree day-002` and `tree project/application`. **Fix:** Revisit the required names and use `mv -i` to rename your own files carefully.

## Verification checklist

```bash
pwd
ls -la
find ~/devops-training/01-linux/day-002 -maxdepth 3 -print | sort
```

Inspect output; do not delete or recursively modify paths to hide an error. If a file's content differs, use `cat` on the source and destination and retrace the last copy or move operation.
