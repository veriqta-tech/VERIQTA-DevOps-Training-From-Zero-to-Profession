# Day 001 — Practice Exercises

These exercises reinforce the same concepts you learned in the class. Complete them in order and **verify each result**.

## Exercise 1 — Know your environment

Run:

```bash
cat /etc/os-release
whoami
pwd
hostname
```

**Your task:** Explain what each command tells you. Identify which result could change when you connect to a different server and which could change when you move to another directory.

**Verification:** You can distinguish OS, account, host, and location.

## Exercise 2 — Inspect Linux directories

Run:

```bash
ls /
ls -la /
```

**Your task:** Find `home`, `etc`, and `var` and describe their usual purpose.

**Verification:** Explain why the path `/` is not the same as `/root`.

## Exercise 3 — Return to your workspace

Run:

```bash
cd ~/devops-training/01-linux
pwd
ls
```

**Verification:** Your path ends in `/devops-training/01-linux`, and you can see `notes` and `practice`.

## Exercise 4 — Write an additional practice note

Run:

```bash
touch notes/my-observations.md
echo "Today I learned Linux basics" > notes/my-observations.md
cat notes/my-observations.md
```

**Verification:** The displayed sentence exactly matches what you wrote. Explain which command creates the file, which writes text, and which reads it.

## Exercise 5 — Observe safe redirection

Predict the result of the following command before running it **only on your practice file**:

```bash
echo "Changed" > notes/my-observations.md
cat notes/my-observations.md
```

**Verification:** The old sentence is replaced. Explain why `>` requires caution.

## Exercise 6 — Inspect the final structure

Run:

```bash
tree ~/devops-training/01-linux
```

If `tree` is unavailable:

```bash
find ~/devops-training/01-linux -maxdepth 3 -print
```

**Verification:** Find the lesson note, practice report, and observations file.

## Exercise 7 — Explain the workflow without looking

Explain, in your own words, how to:
1. Find your current directory.
2. Create a directory.
3. Create a file.
4. Write text to a file.
5. Read the file.
6. Rename a file.
7. Verify a directory structure.

If you cannot explain one of these, return to its teaching step and practice again. Then attempt the [independent assessment](../assessments/practical-assessment.md).
