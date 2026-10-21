# Day 002 Exercises

Do these in your own training workspace. Do not run commands against production paths. Keep Day 001 work intact.

## Exercise 1: path reasoning
From `~/devops-training`, predict the outputs after `cd 01-linux`, `pwd`, `cd ..`, `pwd`. Verify in the terminal. Explain absolute versus relative paths in two sentences.

## Exercise 2: hidden entries
Run `ls`, `ls -l`, and `ls -a` from `~/devops-training`. Describe two differences. What do `.` and `..` mean? What does the leading `d` in `drwxrwxr-x` mean?

## Exercise 3: directory design
Use `mkdir -p` to create `day-002/{notes,labs,exercises,project,troubleshooting}`. Confirm with `tree day-002`. Why is `-p` useful?

## Exercise 4: copy and move
Write `Learning Linux file management` into `notes/lesson.txt`. Copy it to `labs`, move the copy to `exercises`, then rename it to `file-management-practice.txt`. Verify both final file contents. Explain why `cp` and `mv` have different results.

## Exercise 5: deletion safety
Create `exercises/temporary.txt`, view it, delete it with `rm -i`, and verify it is absent. Confirm that `notes/lesson.txt` is still present. Why is an interactive prompt not equivalent to a backup?

## Exercise 6: independent project
Complete the [application configuration project](../project/README.md) without looking at the reference solution in the complete lesson. Take a note of each verification command.

## Reflection
Write a short paragraph: Which command would you check twice before running on a production server, and why? What would you verify after copying an application configuration?
