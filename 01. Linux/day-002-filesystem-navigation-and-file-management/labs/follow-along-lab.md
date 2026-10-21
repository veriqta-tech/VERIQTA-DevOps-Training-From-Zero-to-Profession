# Guided Follow-Along Lab — Day 002

**Goal:** Perform the same seven stages taught in the [complete lesson](../notes/complete-lesson.md). Type commands yourself; do not skip verification. Use your own sandbox.

## Lab setup

```bash
mkdir -p ~/devops-training/01-linux
cd ~/devops-training
pwd
```

Expected: a path ending `/devops-training`.

## Stage 1: Navigate

```bash
cd 01-linux
pwd
cd ..
pwd
```

**Verify:** The first path ends `/01-linux`; the second ends `/devops-training`. Explain the role of `..`.

## Stage 2: List and inspect

```bash
ls
ls -l
ls -a
```

**Verify:** You can find `01-linux` and see `.` and `..` in `ls -a`. Identify owner and permissions in the long listing.

## Stage 3: Build the directory layout

```bash
cd ~/devops-training/01-linux
mkdir -p day-002/{notes,labs,exercises,project,troubleshooting}
tree day-002
```

**Verify:** The output contains `notes`, `labs`, `exercises`, `project`, `troubleshooting`; six directories including the parent, zero files. If `tree` is unavailable, use `find day-002 -type d | sort`.

## Stage 4: Copy a file

```bash
cd day-002
echo "Learning Linux file management" > notes/lesson.txt
cat notes/lesson.txt
cp notes/lesson.txt labs/
cat labs/lesson.txt
ls notes
ls labs
```

**Verify:** Both directories contain `lesson.txt`; both files show the same line.

## Stage 5: Move and rename

```bash
mv -i labs/lesson.txt exercises/
ls exercises
ls labs
mv -i exercises/lesson.txt exercises/file-management-practice.txt
cat exercises/file-management-practice.txt
cat notes/lesson.txt
```

**Verify:** `labs/lesson.txt` is gone, `exercises/file-management-practice.txt` exists, and `notes/lesson.txt` remains unchanged.

## Stage 6: Interactive deletion

```bash
echo "This is a temporary practice file" > exercises/temporary.txt
cat exercises/temporary.txt
rm -i exercises/temporary.txt
```

Confirm with `y` **only** when the prompt identifies the correct temporary file.

```bash
ls exercises
cat notes/lesson.txt
```

**Verify:** The temporary file is gone, the renamed practice file remains, and the notes file is intact.

## Stage 7: Independent mini-project

Follow [the project instructions](../project/README.md). Before consulting the worked example, build `application/config`, `application/backup`, and `application/deployment`, and ensure each required `.conf` file contains `APP_NAME=DevOpsTraining`.

**Verify:** Run `tree application` and the three `cat` commands from the project guide. Record what you observed in your own notes, then complete the [practical assessment](../assessments/practical-assessment.md).
