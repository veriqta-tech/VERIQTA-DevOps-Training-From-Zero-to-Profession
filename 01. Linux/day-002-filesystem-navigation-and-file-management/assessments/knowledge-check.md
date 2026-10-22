# Day 002 — Knowledge Check

These are the **three questions from the Day 002 class**, in the same order. Answer one at a time, then check the explanations after you finish.

## Question 1 of 3 — Creating a backup

You are working on a production Linux server. You need to create a backup of `app.conf` before modifying the original file. Which command is most appropriate?

A. `mv app.conf app.conf.backup`  
B. `cp app.conf app.conf.backup`  
C. `rm app.conf`  
D. `mkdir app.conf.backup`

**Choose one answer before continuing.**

## Question 2 of 3 — Moving to the parent directory

You are working inside this directory:

```text
/home/ubuntu/devops-training/01-linux/day-002
```

You want to move up one directory to:

```text
/home/ubuntu/devops-training/01-linux
```

Which command should you use?

A. `cd /`  
B. `cd ..`  
C. `cd ~`  
D. `pwd`

**Choose one answer before continuing.**

## Question 3 of 3 — Confirming before deletion

Imagine you are a DevOps engineer working on a Linux server. You have a temporary file named `test.log` that you no longer need. You want to delete it, but you want Linux to ask for confirmation before removing it.

Which command should you use?

A. `rm test.log`  
B. `mv test.log`  
C. `rm -i test.log`  
D. `cp test.log`

**Choose one answer before reading the explanations.**

---

## Answer key and instructor explanations

### Question 1 — B. `cp app.conf app.conf.backup`

`cp` creates a second file while leaving `app.conf` in place. After the command, both `app.conf` and `app.conf.backup` exist. `mv` would rename or move the original rather than preserve a second copy. `rm` deletes; `mkdir` creates a directory.

**Engineering lesson:** Before changing a configuration file, preserve the original and verify the backup. A same-disk copy is useful but does not replace a complete backup strategy.

### Question 2 — B. `cd ..`

`..` means the parent directory. `cd ..` moves one level up from `day-002` to `01-linux`. `cd /` goes to the filesystem root, `cd ~` goes to your home directory, and `pwd` displays your current directory without changing it.

**Engineering lesson:** Always know your current working directory before running commands that modify files.

### Question 3 — C. `rm -i test.log`

`rm -i` asks for confirmation before removing the named file. Plain `rm` normally removes it without that interactive confirmation. `mv` moves or renames; `cp` copies.

**Engineering lesson:** Interactive confirmation is helpful but not infallible. Check the full target path, and do not experiment with recursive deletion on important directories.

### Knowledge-check completion

**Score:** 1 point per correct answer, 3 points total. If you missed a question, repeat its associated lab stage and explain the command in your own words before moving to Day 003.
