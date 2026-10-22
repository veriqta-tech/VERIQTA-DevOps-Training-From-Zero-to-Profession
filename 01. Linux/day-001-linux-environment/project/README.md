# Day 001 — Guided Project: Prepare a Linux Training Workspace

## Scenario

You have just received access to an Ubuntu server. Before working on larger projects, you need to establish a clean module directory and prepare two files: a lesson note and a practical report. A teammate should be able to find and read both without asking you where you saved them.

**This is a guided project.** For the independent assessment, see [Practical Assessment for Students](../assessments/practical-assessment.md).

### Project Step 1 — Create and enter the workspace

```bash
mkdir -p ~/devops-training/01-linux/notes
mkdir -p ~/devops-training/01-linux/practice
cd ~/devops-training/01-linux
pwd
```

**Why:** `mkdir -p` prepares nested directories without requiring you to create each parent separately. `cd` changes your current working directory. `pwd` proves your location.

**Checkpoint:** Your path ends in `/devops-training/01-linux`.

### Project Step 2 — Prepare the note

```bash
touch notes/day-001.md
echo "My first DevOps Linux lesson" > notes/day-001.md
cat notes/day-001.md
```

**Expected output:** `My first DevOps Linux lesson`

**Why:** Creating the file and verifying its contents are separate actions. `touch` is not the same as writing text.

### Project Step 3 — Prepare and rename the report

```bash
touch practice/day-001.md
mv practice/day-001.md practice/day-001-report.txt
echo "Linux Day 1 practical assessment completed." > practice/day-001-report.txt
cat practice/day-001-report.txt
```

**Expected output:** `Linux Day 1 practical assessment completed.`

**Why:** `mv` changes the filename here. `>` writes the report content and overwrites any previous content at that path. Check the path carefully.

### Project Step 4 — Verify the full deliverable

```bash
tree ~/devops-training/01-linux
cat ~/devops-training/01-linux/notes/day-001.md
cat ~/devops-training/01-linux/practice/day-001-report.txt
```

**Expected relevant structure:**

```text
01-linux/
├── notes/
│   └── day-001.md
└── practice/
    └── day-001-report.txt
```

Extra exercise files are fine.

**Acceptance criteria:** Both paths exist; the note and report contain the exact required sentences; you can explain each command; you did not modify unrelated system directories.

### Engineering reflection

What would happen if you wrote the report in the wrong directory? What would happen if you accidentally used `>` on an existing configuration file? Which commands would prove the result rather than merely assuming success?
