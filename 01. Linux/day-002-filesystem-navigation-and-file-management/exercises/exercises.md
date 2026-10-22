# Day 002 — Practice Exercises

Complete these **after the guided lab** and before the independent project if you need more practice. Work only inside `~/devops-training/01-linux/day-002`.

## Exercise 1 — Explain your path

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

**Your task:** Identify which path is absolute, which directory name is relative, and how `cd -` differs from `cd ..`.

**Verify:** You end in `01-linux` and can explain every transition.

## Exercise 2 — Inspect hidden entries

```bash
ls
ls -l
ls -a
```

**Your task:** Explain the difference among the three listings and identify `.` and `..`.

**Verify:** You can recognize a directory from the leading `d` in a long listing.

## Exercise 3 — Create nested practice folders

```bash
cd ~/devops-training/01-linux/day-002
mkdir -p exercises/review/{input,output}
tree exercises/review
```

**Your task:** Explain how Bash brace expansion and `mkdir -p` work together.

**Verify:** `input` and `output` both exist beneath `review`.

## Exercise 4 — Copy and verify

```bash
echo "Practice copying files" > exercises/review/input/example.txt
cp exercises/review/input/example.txt exercises/review/output/
cat exercises/review/input/example.txt
cat exercises/review/output/example.txt
```

**Verify:** Both files contain `Practice copying files`.

## Exercise 5 — Move and rename

```bash
mv -i exercises/review/output/example.txt exercises/review/output/renamed.txt
ls exercises/review/output
cat exercises/review/output/renamed.txt
```

**Verify:** The old name is absent from `output`, the new name exists, and the source under `input` remains.

## Exercise 6 — Safe temporary-file deletion

```bash
echo "Temporary" > exercises/review/output/delete-me.txt
cat exercises/review/output/delete-me.txt
rm -i exercises/review/output/delete-me.txt
ls exercises/review/output
```

Confirm only the intended temporary file. **Verify:** `delete-me.txt` is absent while `renamed.txt` remains.

## Exercise 7 — Explain your decisions

Without copying a solution, answer:
- When should you use `cp` rather than `mv`?
- Why do we inspect a file with `cat` after copying it?
- What can `>` overwrite?
- Why is `rm -i` safer than plain `rm`, and what risk remains?
- What would you check if `tree` showed the project in the wrong location?

When ready, attempt the [independent project](../project/README.md) and [student assessment](../assessments/practical-assessment.md).
