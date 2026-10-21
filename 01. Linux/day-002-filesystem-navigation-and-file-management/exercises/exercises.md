# Day 002 — Practice Exercises

Complete these in your training sandbox after the guided lab. Try each task **before** reading the hint. Verify every result using `pwd`, `ls`, `tree`, or `cat`.

## Exercise 1: Navigate without guessing

From `~/devops-training`, enter `01-linux/day-002` using a relative path. Move up one directory, then return to the previous directory. **Check:** Use `pwd` after each move. **Hint:** `cd 01-linux/day-002`, `cd ..`, `cd -`.

## Exercise 2: Compare listings

From `~/devops-training`, run `ls`, `ls -l`, and `ls -a`. Identify which command displays hidden names, which shows ownership, and which shows only non-hidden names. **Check:** Describe what `.` and `..` represent.

## Exercise 3: Build a practice workspace

Inside `day-002/exercises`, create `review/{input,output,archive}` using one `mkdir -p` command. **Check:** `tree review` should show four directories including `review`, zero files. **Hint:** Brace expansion.

## Exercise 4: Copy and compare

Create `review/input/message.txt` containing `Practice builds confidence`. Copy it to `review/archive/`. **Check:** `cat` both files and verify that both still exist. **Hint:** `echo`, `>`, `cp`, `cat`.

## Exercise 5: Move and rename

Move the archived copy into `review/output/`, then rename it `final-message.txt` using `mv -i`. **Check:** The input copy remains; the output copy has the new name; archive no longer contains the file.

## Exercise 6: Delete only what you created

Create `review/output/remove-me.txt` with a short message. Display it, remove it using `rm -i`, and verify `final-message.txt` remains. **Check:** Confirm the prompt names the correct file before entering `y`.

## Reflection

Answer in your own words: (1) When would you choose `cp` instead of `mv`? (2) What does `mkdir -p` change? (3) Why should you run `pwd` before a destructive command? (4) What does `ls -a` reveal that `ls` normally hides?

**Optional cleanup:** Keep your work as a learning record. If you choose to remove practice files later, inspect the exact paths first; do not copy arbitrary recursive deletion commands from the internet.
