# Practice Exercises — Day 003
Complete these before the independent project. Work in `~/devops-training/01-linux/day-003/permissions-lab`.

### Exercise 1 — Decode a permission string
Write the file type and owner/group/others rights for `-rwxr-----` and `drwxr-x---`. Explain why directory `x` does not mean running a directory as a program.

### Exercise 2 — Create a read-only sample
Create `notice.txt` containing `Training notice`. Set its permissions to `644`, then use `stat -c '%a %n' notice.txt` to verify. Explain who can modify it.

### Exercise 3 — Restrict access
Set `notice.txt` to `600`. Confirm the mode and describe who may read the file through ordinary mode bits.

### Exercise 4 — Symbolic change
Use symbolic mode to add group read permission back to `notice.txt`, without changing owner or others. Verify the resulting mode and explain why it is `640`.

### Exercise 5 — Script inspection
Inspect `hello.sh` with `cat`, check its owner execute bit, then run it. Explain why you inspect an unfamiliar script before execution.

### Exercise 6 — Diagnose the typo
Compare `ls-l notice.txt` with `ls -l notice.txt`. Explain why the first is interpreted as a different command name and how to fix it.

**Self-check:** All file changes should be confined to this lab. No system files should be modified.
