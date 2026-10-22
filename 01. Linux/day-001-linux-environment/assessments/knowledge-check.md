# Day 001 — Knowledge Check

Answer each question **before** reading the answer key. These questions reinforce the commands you used in the class.

### Question 1

What is the difference between `mkdir` and `touch`?

A. `mkdir` creates directories; `touch` can create empty files.  
B. Both commands delete files.  
C. `mkdir` displays files; `touch` changes directories.  
D. They are identical.

### Question 2

Which command shows your current working directory?

A. `hostname`  
B. `pwd`  
C. `whoami`  
D. `cat`

### Question 3

What does `whoami` display?

A. The Linux version  
B. The hostname  
C. The current effective username  
D. The current directory

### Question 4

What does `cat notes/day-001.md` do?

A. Deletes the file  
B. Displays the file contents  
C. Renames the file  
D. Creates a directory

### Question 5

What does `>` do in `echo "hello" > file.txt`?

A. Appends without changing existing text  
B. Renames the file  
C. Redirects output to the file, replacing its existing contents  
D. Prints the current directory

### Question 6

You run `tree` and see `command not found`. What is the best next action?

A. Delete the training workspace  
B. Investigate whether `tree` is installed, and install it if appropriate  
C. Run every future command as root  
D. Reinstall Linux

### Question 7

What does `/` represent in a Linux path?

A. Your home directory  
B. The filesystem root  
C. A text file  
D. Your hostname

### Question 8

Why run `cat` after writing your practice report?

A. To confirm the exact file contents  
B. To install a package  
C. To connect through SSH  
D. To change file ownership

---

## Answer key — read after attempting the questions

1. **A.** `mkdir` creates directories. `touch` creates a missing empty file or updates timestamps on an existing file.
2. **B.** `pwd` means *print working directory*. `cd` changes the directory; it does not print it by itself.
3. **C.** `whoami` identifies the effective user running the command.
4. **B.** `cat` prints the contents of the specified file. It does not rename or delete it.
5. **C.** `>` overwrites the destination file's contents. This is useful in a controlled lab but risky on important files.
6. **B.** Diagnose the error. On Ubuntu, `sudo apt update` followed by `sudo apt install tree` may be appropriate; `find` is another option.
7. **B.** `/` is the top of the filesystem. It is not the same as `/root`.
8. **A.** Verification catches misspellings, wrong destinations, and incorrect contents.

**Self-assessment:** Review any question you missed, return to the corresponding teaching stage, and repeat the command until you can explain both what it does and why you use it.
