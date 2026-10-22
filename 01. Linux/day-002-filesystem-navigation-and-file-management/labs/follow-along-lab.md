# Day 002 — Complete Follow-Along Lab
Read [Complete Instructor Notes](../notes/complete-lesson.md) alongside this lab. Every stage follows the same order as the class. **Run commands one at a time, stop at each checkpoint, and do not advance until the output makes sense.**

## Stage 1 — Navigate using paths

**Goal:** Distinguish relative paths, parent directories, and previous directories.

```bash
cd ~/devops-training
pwd
cd 01-linux
pwd
cd ..
pwd
cd -
pwd
```

**Expected location sequence:**
1. `/home/ubuntu/devops-training`
2. `/home/ubuntu/devops-training/01-linux`
3. `/home/ubuntu/devops-training`
4. `/home/ubuntu/devops-training/01-linux`

**Verify:** Explain `cd ..` versus `cd -`. Your home directory may not be `/home/ubuntu` if you use a different account.

## Stage 2 — Compare directory listings

```bash
ls
ls -l
ls -a
```

**Expected:** `ls -l` adds metadata; `ls -a` includes `.` and `..`.

**Verify:** Identify a directory entry, its owner, its group, and the leading `d` in a long listing.

## Stage 3 — Create five Day 002 folders

```bash
cd ~/devops-training/01-linux
mkdir -p day-002/{notes,labs,exercises,project,troubleshooting}
tree day-002
```

**Expected on a fresh run:**

```text
day-002
├── exercises
├── labs
├── notes
├── project
└── troubleshooting

6 directories, 0 files
```

**Verify:** Five named subdirectories; `project` is singular. On a repeat run, additional files may appear.

## Stage 4 — Create and copy a file

```bash
cd ~/devops-training/01-linux/day-002
echo "Learning Linux file management" > notes/lesson.txt
cat notes/lesson.txt
cp notes/lesson.txt labs/
cat labs/lesson.txt
ls notes
ls labs
```

**Expected:** Both `cat` commands print `Learning Linux file management`. Both directories contain `lesson.txt`.

**Verify:** Copying does **not** remove the source.

## Stage 5 — Move and rename the copy

```bash
mv -i labs/lesson.txt exercises/
ls exercises
ls labs
mv -i exercises/lesson.txt exercises/file-management-practice.txt
cat exercises/file-management-practice.txt
cat notes/lesson.txt
```

**Expected:** `labs/lesson.txt` is gone; `exercises/file-management-practice.txt` exists; `notes/lesson.txt` still exists. Both `cat` commands print the original sentence.

**Verify:** `mv -i` may not prompt if the destination does not exist; it prompts when an overwrite would otherwise occur.

## Stage 6 — Delete only a temporary file

```bash
echo "This is a temporary practice file" > exercises/temporary.txt
cat exercises/temporary.txt
rm -i exercises/temporary.txt
```

At the prompt, confirm with `y` **after checking the path**.

```bash
ls exercises
cat notes/lesson.txt
```

**Expected:** `temporary.txt` is absent, `file-management-practice.txt` remains, and the original lesson text is unchanged.

**Verify:** You removed the intended temporary file, not the lesson file.

## Stage 7 — Independent project

**Stop here and attempt the [project brief](../project/README.md) before viewing the solution.**

Your target is:

```text
application/
├── backup/app.conf
├── config/app.conf
└── deployment/production.conf
```

Each file must contain:

```text
APP_NAME=DevOpsTraining
```

**Verification commands** (from `day-002/project`):

```bash
tree application
cat application/config/app.conf
cat application/backup/app.conf
cat application/deployment/production.conf
```

**Expected:** Four directories including the top-level `application`, three files, and the required line displayed three times.

## Final learning checkpoint

Explain, in your own words, the purpose of `pwd`, `cd ..`, `cd -`, `ls -l`, `ls -a`, `mkdir -p`, `cp`, `mv -i`, `rm -i`, `tree`, and `cat`.

Then complete the [Practical Assessment for Students](../assessments/practical-assessment.md) and [Knowledge Check](../assessments/knowledge-check.md).
