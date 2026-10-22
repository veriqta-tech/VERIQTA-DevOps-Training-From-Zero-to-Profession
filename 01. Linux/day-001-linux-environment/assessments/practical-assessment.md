# Day 001 — Practical Assessment for Students

**Work independently.** You may consult the notes for command meanings, but try to complete the tasks without copying the guided project's full command sequence.

## Scenario

You have been assigned an Ubuntu Linux environment and must prepare the first module of a technical training repository. The reviewer will inspect paths, filenames, contents, and verification evidence.

## Required tasks

**Task 1 — Prepare the workspace (20 points)**  
Ensure `~/devops-training/01-linux` exists in the correct location. Do not remove or overwrite unrelated files.

**Task 2 — Organize folders (15 points)**  
Inside `01-linux`, ensure `notes` and `practice` directories exist.

**Task 3 — Create the lesson note (20 points)**  
Create `notes/day-001.md` containing exactly:

```text
My first DevOps Linux lesson
```

**Task 4 — Practice renaming (15 points)**  
Create `practice/day-001.md` and rename it to `practice/day-001-report.txt`. The final report should be under the new name.

**Task 5 — Write the report (20 points)**  
Write exactly:

```text
Linux Day 1 practical assessment completed.
```

**Task 6 — Prove your work (10 points)**  
Use commands to show your location, directory structure, and the contents of both files. Explain which command proves each requirement.

## Verification checkpoint

Run these after completing the tasks:

```bash
pwd
ls -l ~/devops-training/01-linux
cat ~/devops-training/01-linux/notes/day-001.md
cat ~/devops-training/01-linux/practice/day-001-report.txt
tree ~/devops-training/01-linux
```

**Expected:** The two `cat` commands print the exact required sentences, and the tree contains the two required file paths. Your current `pwd` may differ if you verified from another directory.

## Marking rubric

| Criterion | Points |
|---|---:|
| Workspace exists in the correct location | 20 |
| `notes` and `practice` directories exist | 15 |
| Correct lesson note path and contents | 20 |
| Correct rename and final report filename | 15 |
| Correct report contents | 20 |
| Clear verification of structure and contents | 10 |
| **Total** | **100** |

**Suggested pass threshold:** 80/100, provided the two required files can be located and read correctly.

## If something is wrong

Do not erase the whole workspace. Identify the specific failed requirement, inspect the file or directory with `ls`, `pwd`, or `cat`, correct only that item, and repeat the verification. See [troubleshooting](../troubleshooting/README.md).

## Stretch reflection (ungraded)

Why do exact paths and filenames matter to deployment automation? What is the difference between `touch`, `echo`, `cat`, and `mv`?
