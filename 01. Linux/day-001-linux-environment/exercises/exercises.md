# Day 001 — Practice Exercises

Complete these after the guided lab. Work on your own training machine. Each exercise has a verification action; compare what you see with the explanation rather than copying example output blindly.

## Exercise 1 — Identify your environment

Run `cat /etc/os-release`, `whoami`, `pwd`, and `hostname` one at a time. Write down what each tells you. **Verify:** You can distinguish the operating system, account name, current directory, and computer name. These values are not interchangeable.

## Exercise 2 — Explore without modifying

Run `ls /` and `ls -la /`. Find `/home`, `/etc`, and `/var`. Explain their general purposes. **Verify:** Both commands display filesystem entries; `-la` includes extra details and hidden entries. Do not edit system files.

## Exercise 3 — Navigate to the workspace

Run:

```bash
cd ~/devops-training/01-linux
pwd
ls
```

**Verify:** The path ends with `/devops-training/01-linux`, and the `notes` and `practice` directories appear. If they do not exist, revisit the guided lab.

## Exercise 4 — Create and inspect your own note

```bash
touch notes/my-observations.md
echo "Today I learned Linux basics" > notes/my-observations.md
cat notes/my-observations.md
```

**Verify:** The printed line exactly matches what you wrote. Explain what `touch`, `echo`, `>`, and `cat` do.

## Exercise 5 — Understand redirection safely

Predict what running `echo "Changed" > notes/my-observations.md` will do. Then run it **only on this practice file** and verify with `cat`. Explain why using `>` on an important configuration file can be dangerous.

## Exercise 6 — Inspect your structure

Run `tree ~/devops-training/01-linux` (or `find ~/devops-training/01-linux -maxdepth 3 -print` if `tree` is unavailable). **Verify:** You can locate both note files and the practice directory.

## Reflection

Without looking at the notes, explain the difference between `pwd` and `cd`, between a directory and a file, and between writing a file and reading it. If any explanation is unclear, repeat that part of the lab before taking the assessment.
