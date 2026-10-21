# VERIQTA DevOps Training — From Zero to Professional

## Linux Day 002: Filesystem Navigation and File Management

**Module:** 01 — Linux Fundamentals  
**Level:** Beginner  
**Learning format:** Explain → demonstrate → execute → verify → practice → assess  
**Recommended time:** 60–90 minutes; take longer when needed.

Welcome back. Today you will navigate Linux directories, inspect files, create organized workspaces, copy and move files, and remove temporary files safely. You will finish by preparing a small application configuration directory as an independent practical project.

**Prerequisites:** Day 001; a Linux terminal; the `~/devops-training/01-linux` workspace. Commands use an Ubuntu account named `ubuntu`, but work on most Linux environments. Your home directory may be different. Use a **personal practice machine or sandbox**, not a production server.

### Learning path

1. [Complete teaching lesson](notes/complete-lesson.md) — every concept, command, expected output, and checkpoint.
2. [Guided follow-along lab](labs/follow-along-lab.md) — reproduce the seven practical stages.
3. [Exercises](exercises/exercises.md) — reinforce your skills with additional challenges.
4. [Independent mini-project](project/README.md) — create and verify application configuration, backup, and deployment copies.
5. [Practical assessment](assessments/practical-assessment.md) — demonstrate the skills yourself using a 100-point rubric.
6. [Knowledge check](assessments/knowledge-check.md) — test understanding, then review the answer explanations.
7. [Troubleshooting](troubleshooting/README.md) — investigate and correct common mistakes.

### What you will be able to do

- Distinguish absolute and relative paths and navigate with `cd`, `pwd`, `~`, `.`, `..`, and `cd -`.
- Inspect directories with `ls`, `ls -l`, and `ls -a`, and interpret basic listing metadata.
- Create nested directories with `mkdir -p` and Bash brace expansion.
- Write and inspect a file using `echo`, `>`, and `cat`.
- Copy with `cp`, move and rename with `mv -i`, and delete a specific temporary file with `rm -i`.
- Verify the expected file structure and contents before declaring work complete.

### Visual guide

![Path navigation](images/01-path-navigation.svg)
![Directory listing](images/02-ls-comparison.svg)
![Nested folders](images/03-directory-layout.svg)
![Copy and move](images/04-copy-versus-move.svg)
![Safe deletion](images/05-safe-deletion.svg)
![Mini-project layout](images/06-project-layout.svg)

### Completion checklist

- [ ] Completed each of the seven practical stages and checked its expected output.
- [ ] Explained why `cp` preserves a source file but `mv` relocates or renames it.
- [ ] Practiced interactive deletion without deleting unrelated files.
- [ ] Built and verified the three application configuration files.
- [ ] Completed the practical assessment and knowledge check.

**Next:** Linux Day 003, after you can reproduce these operations confidently.

**Brand:** VERIQTA DevOps Training. Copyright and licensing are maintained at repository root; this lesson does not duplicate those files.
