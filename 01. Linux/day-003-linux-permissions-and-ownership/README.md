# VERIQTA DevOps Training — From Zero to Professional
## Module 01 · Linux · Day 003: Understanding Linux Files, Permissions, and Ownership

Welcome back. You have already learned how to navigate directories and manage files. Today you will learn **who is allowed to read, change, or execute those files**. This is a fundamental production-security skill.

**How to take this class:** Read one teaching stage → run its commands on your own Ubuntu machine → examine the output → complete the verification checkpoint → continue. You do not need to know the answers in advance. The documentation is a complete classroom experience, not a retrospective summary.

### Seven teaching stages
1. Identify your Linux account, numeric IDs, and groups.
2. Inspect permissions and ownership of directories.
3. Create an application configuration file.
4. Change permissions using symbolic and numeric `chmod`.
5. Inspect and assign file ownership and group.
6. Create, make executable, and run a Bash script.
7. Complete an independent VERIQTA application project.

### Open these files in order
- [Complete instructor notes — the full seven-stage class](notes/complete-lesson.md)
- [Follow-along lab — commands, outputs, checkpoints](labs/follow-along-labs.md)
- [Practice exercises](exercises/practice-exercises.md)
- [Independent application project](project/README.md)
- [Practical Assessment for Students](assessments/practical-assessment.md)
- [Knowledge Check — three classroom questions](assessments/knowledge-check.md)
- [Separate knowledge-check answer key](assessments/knowledge-check-answers.md)
- [Troubleshooting and recovery](troubleshooting/README.md)

**Environment:** Ubuntu Linux, with an existing `~/devops-training/01-linux` workspace from Days 001–002. Examples assume the standard Ubuntu EC2 account `ubuntu`. If your username differs, adapt owner/group commands accordingly.

**Important safety rule:** Only change permissions or ownership of files inside your practice workspace. Do not run `chmod 777` or change system files to make an error disappear. You will encounter `sudo` once for a deliberate ownership demonstration; understand the command before running it.

**Publishing standard:** VERIQTA DevOps Training, written for students around the world. No learner-specific scores, no personal screenshots, and no duplicate copyright file.
