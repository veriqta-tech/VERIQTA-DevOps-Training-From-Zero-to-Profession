# Day 001 — Troubleshooting and Recovery

Errors are part of learning Linux. Read the message, identify the command that failed, fix the specific cause, and verify again. Work only in your own training workspace.

## `tree: command not found`

**Why:** `tree` may not be installed. **Check:** `command -v tree`. **Fix on Ubuntu:**

```bash
sudo apt update
sudo apt install tree
```

Then retry `tree ~/devops-training/01-linux`. If installation is not permitted, use `find ~/devops-training/01-linux -maxdepth 3 -print`.

## `mkdir: cannot create directory ... File exists`

**Why:** The directory already exists. **Fix:** Check `ls` and use `mkdir -p` for repeatable setup. Do not delete an existing workspace to make the error disappear.

## `cd: ... No such file or directory`

**Why:** The path is misspelled or not created yet. **Check:** `pwd` and `ls ~`. **Fix:** Create the intended training directory with `mkdir -p ~/devops-training/01-linux` and retry.

## `touch: cannot touch ... No such file or directory`

**Why:** The parent directory is missing. **Fix:** `mkdir -p ~/devops-training/01-linux/notes`, then retry from the correct directory.

## `Permission denied`

**Why:** You might be working in a protected directory or using the wrong account. **Check:** `whoami`, `pwd`, and `ls -ld .`. **Fix:** Return to your home training directory. Do not use `sudo` to bypass permissions for ordinary note creation.

## Your report says `practice assessment` instead of `practical assessment`

**Why:** The words are different, and exact strings matter. **Fix:** Reopen the correct practice report using `cat`, rewrite it with the exact required sentence, and verify again:

```bash
echo "Linux Day 1 practical assessment completed." > ~/devops-training/01-linux/practice/day-001-report.txt
cat ~/devops-training/01-linux/practice/day-001-report.txt
```

This is safe only for the assessment report, whose intended contents are known. Remember that `>` overwrites existing contents.

## `ll: command not found`

`ll` is commonly an interactive-shell alias, not a universal Linux command. Use `ls -la` instead.

## `sudo apt update` cannot reach package servers

Check that the machine has network access and that package repositories are configured. On a cloud instance, review its outbound network access and security policy. Do not blindly change firewall or repository settings on a shared system.

## Final recovery check

```bash
whoami
pwd
ls -la ~/devops-training/01-linux
cat ~/devops-training/01-linux/notes/day-001.md
cat ~/devops-training/01-linux/practice/day-001-report.txt
```

Confirm each output before continuing to Day 002.
