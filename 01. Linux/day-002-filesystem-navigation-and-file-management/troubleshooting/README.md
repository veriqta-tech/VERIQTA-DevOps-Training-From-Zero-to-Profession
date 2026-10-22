# Day 002 — Troubleshooting and Safe Recovery

DevOps engineers do not assume a command succeeded. They inspect the output, identify the exact failed operation, correct the smallest issue, and verify again.

## 1. `cd: ... No such file or directory`

**Likely cause:** Wrong path, missing directory, or working from a different starting location.

```bash
pwd
ls ~/devops-training
ls ~/devops-training/01-linux
```

**Recovery:** Navigate using the full intended path. Create only missing **training** directories if appropriate.

## 2. `mkdir: ... File exists`

**Likely cause:** The target directory already exists.

**Recovery:** Inspect with `ls -ld` and continue if it is the intended directory. `mkdir -p` is repeatable for directories. Do not delete existing work just to rerun the lab.

## 3. `tree: command not found`

`tree` may not be installed.

```bash
command -v tree
```

If authorized on Ubuntu, you can install it:

```bash
sudo apt update
sudo apt install tree
```

Or inspect without installation:

```bash
find day-002 -maxdepth 3 -print
```

## 4. `cp: cannot stat 'notes/lesson.txt'`

**Likely cause:** The source file is missing or you are in the wrong directory.

```bash
pwd
ls notes
cat notes/lesson.txt
```

**Recovery:** Return to `day-002`, create the source file if missing, and retry the copy.

## 5. `cp: ... Not a directory`

**Likely cause:** The destination folder does not exist or is actually a file.

```bash
ls -ld labs
```

**Recovery:** Confirm you created the correct `labs` directory in Step 3.

## 6. `mv -i` did not ask for confirmation

This is usually expected when the destination does **not** already exist. `-i` is designed to prompt before an overwrite, not necessarily before every move.

**Verify:** Check source and destination listings, then read the moved file.

## 7. The file disappeared from `labs`

After `mv -i labs/lesson.txt exercises/`, the source path is expected to disappear. This is the difference between moving and copying.

```bash
ls labs
ls exercises
cat notes/lesson.txt
```

**Verify:** The original `notes/lesson.txt` still exists.

## 8. `rm -i` asks for confirmation

Read the exact target path before typing `y`. If it is not the intended temporary practice file, answer `n` and inspect the directory.

**Never** use recursive removal just to “clean up” a lab.

## 9. The copied file has the wrong contents

```bash
cat notes/lesson.txt
cat exercises/file-management-practice.txt
```

If one is wrong, identify where the mistake was introduced. Do not overwrite the original without inspecting it first.

## 10. Project has `projects` instead of `project`

The expected workspace is `day-002/project` (**singular**). Check the structure:

```bash
cd ~/devops-training/01-linux/day-002
tree
```

If you created the wrong folder, do not delete it blindly. Inspect its contents, move only intended practice files to the correct folder, and verify.

## 11. Deployment copy is named `app.conf` instead of `production.conf`

The required deployment path is:

```text
application/deployment/production.conf
```

From `day-002/project`, you can create the correct copy from the original:

```bash
cp application/config/app.conf application/deployment/production.conf
cat application/deployment/production.conf
```

Check any unintended extra file before deciding what to do with it.

## 12. `Permission denied`

Check your identity, current directory, and target permissions:

```bash
whoami
pwd
ls -ld .
```

Stay within your own training workspace. Do not run every command with `sudo` or change system directory permissions.

## Final recovery checkpoint

From `~/devops-training/01-linux/day-002/project`:

```bash
pwd
tree application
cat application/config/app.conf
cat application/backup/app.conf
cat application/deployment/production.conf
```

**Expected:** The correct project path, the required three files, and `APP_NAME=DevOpsTraining` printed three times.

If all checks pass, return to the [Practical Assessment for Students](../assessments/practical-assessment.md) and [Knowledge Check](../assessments/knowledge-check.md).
