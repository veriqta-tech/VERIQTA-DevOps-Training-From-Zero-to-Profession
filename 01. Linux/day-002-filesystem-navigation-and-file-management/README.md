# VERIQTA DevOps Training — From Zero to Professional
## Module 01 · Linux · Day 002: Filesystem Navigation and File Management

Welcome back. In Day 001 you connected to Linux, explored the operating system, and created a training workspace. Today you will **navigate that workspace confidently and manage files safely**. This is a full follow-along class, not a summary of someone else's experience.

**Teaching rhythm:** I explain → you run → you inspect → you verify → you understand → you continue. Read each section before running its commands. Stop at every checkpoint.

### What you will learn
1. Absolute and relative paths, `cd`, `pwd`, `/`, `~`, `.`, `..`, and `cd -`.
2. Directory listings with `ls`, `ls -l`, and `ls -a`.
3. Nested directories with `mkdir -p` and Bash brace expansion.
4. Creating and copying a file with `echo`, `cat`, and `cp`.
5. Moving and renaming files safely with `mv -i`.
6. Removing a temporary file with `rm -i` and understanding deletion risks.
7. Building an application configuration, backup, and deployment layout independently.

### Start here
- [Complete instructor notes — seven fully explained stages](notes/complete-lesson.md)
- [Follow-along lab — exact command sequence and checkpoints](labs/follow-along-lab.md)
- [Practice exercises](exercises/exercises.md)
- [Independent project guide](project/README.md)
- [Practical Assessment for Students](assessments/practical-assessment.md)
- [Knowledge Check — the three classroom questions](assessments/knowledge-check.md)
- [Troubleshooting and safe recovery](troubleshooting/README.md)

**Lab environment:** Ubuntu Linux, ordinary user `ubuntu` in examples, terminal or SSH. Other Linux accounts and hostnames are fine. If your Day 001 workspace is in a different location, adapt paths carefully.

**Starting location:** `~/devops-training/01-linux`. The workspace is named `day-002`, with a **singular** `project` directory.

**Important:** The notes and labs contain the same learning path, intentionally. The notes explain *why and how*; the lab gives you a focused, executable companion. Do not blindly paste a whole lesson into your terminal.

**Safety:** Use these commands only in your training workspace. Never test destructive commands against system directories or other people's files. `>` overwrites files, and `rm` normally has no undo.

**Brand:** VERIQTA DevOps Training. The repository's single root copyright file applies; there is no daily copyright file.
