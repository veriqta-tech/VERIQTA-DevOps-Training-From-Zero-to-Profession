# Day 001: Follow-along lab

**Objective:** Identify the Linux environment and create a safe training workspace. **Prerequisite:** a working Ubuntu terminal.

## Lab A: Inspect the environment

```bash
sudo apt update
cat /etc/os-release
whoami
pwd
hostname
```

**Verify:** the OS information appears, and each of the three identity commands prints one meaningful result. The OS version and hostname vary by machine.

## Lab B: Explore the filesystem

```bash
ls /
ls -la /
```

**Verify:** locate `/home`, `/etc`, and `/var`. Do not edit anything under these paths.

## Lab C: Create your workspace

```bash
mkdir -p ~/devops-training/01-linux/notes
mkdir -p ~/devops-training/01-linux/practice
cd ~/devops-training
pwd
ls
```

**Verify:** `pwd` ends in `/devops-training`, and `ls` includes `01-linux`.

## Lab D: Create and inspect your first note

```bash
touch 01-linux/notes/day-001.md
echo "My first DevOps Linux lesson" > 01-linux/notes/day-001.md
cat 01-linux/notes/day-001.md
```

**Verify:** the displayed sentence matches exactly.

## Lab E: Inspect directory structure

```bash
command -v tree
```

If no path prints, install the utility on Ubuntu:

```bash
sudo apt update
sudo apt install tree
```

Then:

```bash
tree 01-linux
```

**Verify:** `notes/day-001.md` and `practice/` are visible.

## Stop and explain

Before proceeding, explain what `pwd` does, why `/` differs from `~`, and why `>` can be risky. If you cannot answer, revisit the teaching notes.

---
