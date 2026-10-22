# Day 001 — Follow-Along Lab
## Run the same commands in the same teaching order

**How to use this lab:** Read the matching section in [Complete Instructor Notes](../notes/complete-lesson.md), run **one command at a time**, compare your output with the checkpoint, and only then continue. Example output is illustrative.

### Stage 1 — Identify Ubuntu

**Goal:** Find out which operating system you are using.

```bash
cat /etc/os-release
```

**Expected:** Lines identifying Ubuntu (or your own Linux distribution) and its release.

**Verify:** Identify the `NAME` and `PRETTY_NAME` values. Explain why `cat` does not change the file.

**Stop and troubleshoot if:** `/etc/os-release` is missing, the command is not recognized, or the machine is not Linux.

### Stage 2 — Identify user, location, and machine

**Goal:** Establish the operating context before making changes.

```bash
whoami
pwd
hostname
```

**Expected:** A username (often `ubuntu`), an absolute working-directory path (often `/home/ubuntu`), and a hostname specific to your server.

**Verify:** You can tell which output answers “who am I?”, “where am I?”, and “which machine am I on?”

### Stage 3 — Inspect the filesystem safely

**Goal:** Explore root-level directories without modifying them.

```bash
ls /
ll /
```

If `ll` is not available:

```bash
ls -la /
```

**Expected:** A listing containing several standard Linux directories such as `etc`, `home`, and `var`.

**Verify:** Find `/home`, `/etc`, and `/var`. Explain the difference between `/` and `/root`.

**Safety:** Do not create or delete anything in system directories.

### Stage 4 — Build the training workspace

**Goal:** Create a dedicated directory for your training.

```bash
mkdir -p ~/devops-training
cd ~/devops-training
pwd
mkdir 01-linux
ls
```

**Expected:** `pwd` ends with `/devops-training`; `ls` includes `01-linux`.

**If `mkdir 01-linux` says `File exists`:** Do not delete it. Confirm with `ls`; use `mkdir -p 01-linux` on repeat runs.

**Verify:** The correct directory exists in the correct location.

### Stage 5 — Write and verify a lesson note

**Goal:** Practice creating, writing, and reading a file.

```bash
cd ~/devops-training/01-linux
mkdir -p notes
mkdir -p practice
touch notes/day-001.md
echo "My first DevOps Linux lesson" > notes/day-001.md
cat notes/day-001.md
ls notes
```

**Expected `cat` output:**

```text
My first DevOps Linux lesson
```

**Expected `ls notes` entry:** `day-001.md`

**Verify:** Both the filename and the contents match. Explain why `>` is safe for this new practice file but risky for an existing production file.

### Stage 6 — Display the directory tree and troubleshoot

**Goal:** Inspect the structure and handle a missing utility.

```bash
cd ~/devops-training
tree
```

**If `tree` is missing:**

```bash
command -v tree
sudo apt update
sudo apt install tree
tree
```

**Alternative without installation:**

```bash
find ~/devops-training/01-linux -maxdepth 3 -print
```

**Verify:** You can find the module directory, `notes/day-001.md`, and `practice`. Explain why the error did not mean your folders disappeared.

### Stage 7 — Build the report and verify it

**Goal:** Prepare the practical report using file creation, rename, writing, and verification.

```bash
cd ~/devops-training/01-linux
pwd
touch practice/day-001.md
mv practice/day-001.md practice/day-001-report.txt
echo "Linux Day 1 practical assessment completed." > practice/day-001-report.txt
cat practice/day-001-report.txt
cat notes/day-001.md
tree ~/devops-training/01-linux
```

**Expected report output:**

```text
Linux Day 1 practical assessment completed.
```

**Expected note output:**

```text
My first DevOps Linux lesson
```

**Expected paths:** `notes/day-001.md` and `practice/day-001-report.txt`.

**Verify:** The original `practice/day-001.md` filename is gone after the rename, and the renamed file contains the exact sentence.

### Final lab verification

Run:

```bash
whoami
pwd
ls -l ~/devops-training/01-linux
cat ~/devops-training/01-linux/notes/day-001.md
cat ~/devops-training/01-linux/practice/day-001-report.txt
tree ~/devops-training/01-linux
```

**Check:** You know what each output proves. Do not claim a task is complete based only on the absence of an error.

**Next:** Complete the [practice exercises](../exercises/exercises.md), then the [independent practical assessment](../assessments/practical-assessment.md) and [knowledge check](../assessments/knowledge-check.md).
