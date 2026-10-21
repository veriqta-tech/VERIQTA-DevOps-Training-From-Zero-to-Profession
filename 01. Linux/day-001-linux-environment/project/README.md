# Day 001 — Mini-Project: Build Your First Linux Operations Workspace

## Scenario

You are preparing a dedicated folder on an Ubuntu server for the first week of VERIQTA DevOps Training. Your goal is to organize notes and a practice report, then prove that the files contain the correct information.

## Follow along

**1. Create the workspace:**

```bash
mkdir -p ~/devops-training/01-linux/notes
mkdir -p ~/devops-training/01-linux/practice
cd ~/devops-training/01-linux
pwd
```

**Verify:** Your path ends in `/devops-training/01-linux`.

**2. Write a lesson note:**

```bash
touch notes/day-001.md
echo "My first DevOps Linux lesson" > notes/day-001.md
cat notes/day-001.md
```

**Verify:** The sentence prints exactly.

**3. Prepare a practice report:**

```bash
touch practice/day-001.md
mv practice/day-001.md practice/day-001-report.txt
echo "Linux Day 1 practical assessment completed." > practice/day-001-report.txt
cat practice/day-001-report.txt
```

**Verify:** The final sentence includes the word **practical** (not *practice*). `mv` renamed the file; it did not create a second copy.

**4. Inspect the result:**

```bash
tree ~/devops-training/01-linux
```

Expected relevant structure (additional exercise files are fine):

```text
devops-training/
└── 01-linux/
    ├── notes/
    │   └── day-001.md
    └── practice/
        └── day-001-report.txt
```

## Engineering lesson

A successful command is not enough: verify **where** a file was created, **what** it contains, and **whether** it has the required name. Automated deployment tools rely on exact paths and text. After completing this guided project, try the [independent practical assessment](../assessments/practical-assessment.md) without following these commands.
