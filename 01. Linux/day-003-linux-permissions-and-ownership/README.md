# VERIQTA DevOps Training — Linux Day 003
## Linux File Permissions, Ownership, and Executable Scripts

**Course:** From Zero to Professional · **Module:** 01 Linux · **Level:** Beginner · **Platform:** Ubuntu on AWS EC2 or another Ubuntu lab VM

Welcome. Today you will identify your Linux account, interpret file and directory permission strings, secure configuration files, inspect ownership, make a Bash script executable, and build a small application deployment workspace. Follow the stages in order. Execute commands yourself, compare expected results, and complete the assessments without looking at the answers first.

**Learning path:** [Full teaching notes](notes/complete-lesson.md) → [Guided labs](labs/follow-along-labs.md) → [Practice exercises](exercises/practice-exercises.md) → [Project](project/README.md) → [Practical assessment](assessments/practical-assessment.md) → [Knowledge check](assessments/knowledge-check.md). See [troubleshooting](troubleshooting/README.md) if a command fails.

**Diagrams:** [Permission anatomy](images/permission-anatomy.svg) · [Numeric modes](images/numeric-permissions.svg) · [Ownership](images/ownership.svg) · [Script workflow](images/script-execution.svg) · [Project layout](images/project-structure.svg) · [Safe verification](images/verification-workflow.svg).

**Safety:** Use only your own lab directory. Do not recursively change permissions or ownership of system paths. Do not execute untrusted scripts. Do not put real secrets in the sample configuration.

**Workspace:** This course uses `~/devops-training/01-linux/day-003` for continuity with Days 001–002. The course is branded VERIQTA DevOps Training; the existing workspace path need not be renamed.

**Completion:** You should be able to explain `r`, `w`, `x` on files versus directories, interpret `640` and `744`, use `chmod`, inspect ownership with `stat`, and verify a script executes successfully.
