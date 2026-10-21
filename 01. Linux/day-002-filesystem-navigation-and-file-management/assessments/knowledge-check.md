# Day 002 — Knowledge Check

Answer these questions **before** opening the answer key below. Explain your reasoning, not just the letter. Each question is worth one point.

### Question 1 — Back up a configuration

You must create a backup of `app.conf` without removing the original. Which command is most appropriate?

A. `mv app.conf app.conf.backup`  
B. `cp app.conf app.conf.backup`  
C. `rm app.conf`  
D. `mkdir app.conf.backup`

### Question 2 — Navigate to the parent directory

You are in `/home/ubuntu/devops-training/01-linux/day-002`. Which command takes you to `/home/ubuntu/devops-training/01-linux`?

A. `cd /`  
B. `cd ..`  
C. `cd ~`  
D. `pwd`

### Question 3 — Confirm before deleting

You need to remove the temporary file `test.log`, but want Linux to ask for confirmation. Which command should you use?

A. `rm test.log`  
B. `mv test.log`  
C. `rm -i test.log`  
D. `cp test.log`

### Question 4 — Show hidden entries

Which command displays entries whose names begin with a dot?

A. `ls -a`  
B. `pwd`  
C. `cd -`  
D. `mkdir`

### Question 5 — Create missing parent directories

Which command creates `review/input` even if `review` does not exist?

A. `ls review/input`  
B. `mkdir -p review/input`  
C. `rm review/input`  
D. `cat review/input`

### Question 6 — Relative paths

What does `..` mean in a relative filesystem path?

A. Filesystem root  
B. Home directory  
C. Parent directory  
D. Hidden file

### Question 7 — Moving a file

After `mv -i labs/lesson.txt exercises/` succeeds, where is the moved file?

A. Only in `labs`  
B. In both directories  
C. In `exercises`, not `labs`  
D. Deleted everywhere

### Question 8 — Safe verification

After copying a configuration file, what is the strongest verification among these choices?

A. Assume the command worked because no error appeared  
B. Run `cat` on the source and destination and compare their content  
C. Delete the source  
D. Rename the parent directory

---

<details>
<summary>Answer key and explanations — open after answering</summary>

1. **B.** `cp` duplicates the file while preserving the original. `mv` would relocate or rename it.
2. **B.** `cd ..` enters the parent directory. `/` is root and `~` is home.
3. **C.** `rm -i` prompts before removal. Confirm the exact filename before answering.
4. **A.** `ls -a` includes dot-prefixed names such as `.` and `..`.
5. **B.** `mkdir -p` creates missing parent directories.
6. **C.** `..` refers to the parent directory; `.` refers to the current directory.
7. **C.** A successful `mv` relocates the source to the target directory; `-i` prompts if overwriting would occur.
8. **B.** Checking the actual contents verifies the intended outcome rather than relying only on a command's exit behavior.

**Score guide:** 8/8: ready for the next lesson; 6–7: review any missed topics; 0–5: repeat the guided lab and retake the check. These are study recommendations, not automatic certifications.

</details>
