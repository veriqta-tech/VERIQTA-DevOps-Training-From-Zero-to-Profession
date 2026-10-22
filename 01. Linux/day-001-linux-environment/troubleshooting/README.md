# Day 001 — Troubleshooting and Recovery

Errors are useful evidence. **Read the error, identify the cause, make the smallest safe correction, and verify again.** Never delete your workspace or run commands with `sudo` simply to hide a mistake.

## Problem 1 — `tree: command not found`

**Meaning:** The shell could not find a `tree` executable in its command search path.

**Investigate:**

```bash
command -v tree
```

**Ubuntu fix (if you have permission and network access):**

```bash
sudo apt update
sudo apt install tree
```

**Verify:**

```bash
tree ~/devops-training/01-linux
```

**Without installing:**

```bash
find ~/devops-training/01-linux -maxdepth 3 -print
```

## Problem 2 — `mkdir: ... File exists`

**Meaning:** A directory or file with that name already exists.

**Investigate:**

```bash
pwd
ls -ld ~/devops-training/01-linux
```

**Safe recovery:** If the existing path is the intended directory, continue; use `mkdir -p` for repeatable directory creation. Do not delete it.

## Problem 3 — `cd: ... No such file or directory`

**Meaning:** The target path does not exist or is misspelled.

**Investigate:**

```bash
pwd
ls ~
```

**Recovery:** Confirm the intended path and create missing training directories with `mkdir -p ~/devops-training/01-linux` if appropriate.

## Problem 4 — `touch: cannot touch ... No such file or directory`

**Meaning:** The parent directory is missing.

**Recovery:**

```bash
mkdir -p ~/devops-training/01-linux/notes
touch ~/devops-training/01-linux/notes/day-001.md
```

## Problem 5 — `Permission denied`

**Meaning:** Your current account may lack permission to create or read the target file.

**Investigate:**

```bash
whoami
pwd
ls -ld .
```

**Recovery:** Return to your home training directory. Avoid modifying protected system folders and do not add `sudo` to every command.

## Problem 6 — Wrong report text

If you wrote `practice assessment` instead of `practical assessment`, the words do not match.

**Inspect first:**

```bash
cat ~/devops-training/01-linux/practice/day-001-report.txt
```

**Correct only the known training report:**

```bash
echo "Linux Day 1 practical assessment completed." > ~/devops-training/01-linux/practice/day-001-report.txt
cat ~/devops-training/01-linux/practice/day-001-report.txt
```

Remember that `>` overwrites the file.

## Problem 7 — `ll: command not found`

`ll` is an alias in some shells, not a universal command.

**Use instead:**

```bash
ls -la /
```

## Problem 8 — `apt` cannot download packages

The server may lack network access, repository access, or required privileges. Do not change firewall rules or cloud networking blindly. You can complete the lesson using `find` instead of `tree`.

## Problem 9 — The command runs but the file is not where you expected

Relative paths are interpreted from your **current working directory**.

**Investigate:**

```bash
pwd
ls
```

Then use an absolute path to inspect the intended file. Before creating another copy, locate the file you already wrote.

## Final recovery checkpoint

```bash
whoami
pwd
ls -la ~/devops-training/01-linux
cat ~/devops-training/01-linux/notes/day-001.md
cat ~/devops-training/01-linux/practice/day-001-report.txt
```

If all outputs match the lesson requirements, you are ready for the practical assessment and knowledge check.
