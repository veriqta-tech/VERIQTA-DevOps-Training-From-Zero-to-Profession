# Day 001 — Knowledge Check

Answer these questions **before** opening the answer key. Write your answers in your own notes.

**1. What is the difference between `mkdir` and `touch`?**  
A. `mkdir` creates directories; `touch` can create empty files.  
B. Both commands delete files.  
C. `mkdir` displays files; `touch` changes directories.  
D. They are identical.

**2. Which command shows your current working directory?**  
A. `hostname`  B. `pwd`  C. `whoami`  D. `cat`

**3. What does `whoami` print?**  
A. The Linux version  B. The computer hostname  C. The current effective username  D. The current directory

**4. What is the purpose of `cat notes/day-001.md`?**  
A. Delete the file  B. Display the file contents  C. Rename the file  D. Create a directory

**5. What does `>` do in `echo "hello" > file.txt`?**  
A. Append without changing existing text  B. Rename the file  C. Replace the file contents with the command's output  D. Print the current directory

**6. What should you do if `tree` reports `command not found` on Ubuntu?**  
A. Delete the workspace  B. Investigate and install `tree` if needed  C. Run everything as root  D. Reinstall Linux

**7. What does `/` mean when used as a Linux path?**  
A. The current user's home directory  B. The filesystem root  C. A text file  D. The hostname

**8. Why do we verify the report with `cat` after writing it?**  
A. To confirm the exact contents  B. To install a package  C. To connect to SSH  D. To change its owner

---

## Answer key and explanations

1. **A** — `mkdir` creates directories; `touch` creates a missing file or updates timestamps.
2. **B** — `pwd` prints the current working directory.
3. **C** — `whoami` reports the effective username.
4. **B** — `cat` prints file contents to the terminal.
5. **C** — `>` overwrites the destination file; use it carefully.
6. **B** — Diagnose the error, then use `sudo apt update` and `sudo apt install tree` if appropriate. `find` can be used without `tree`.
7. **B** — `/` is the filesystem root, not the root user's home directory (`/root`).
8. **A** — Verification catches typos and unintended file contents.

**Self-check:** Aim for 8/8. For any missed question, return to the relevant teaching step and repeat the command on your own machine.
