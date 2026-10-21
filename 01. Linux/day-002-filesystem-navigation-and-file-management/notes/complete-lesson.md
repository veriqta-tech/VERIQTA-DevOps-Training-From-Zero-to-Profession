# Day 002 — Complete Teaching Lesson

This is a **follow-along class**. Read one section, type its commands, compare the output, and complete the checkpoint before proceeding. Output examples illustrate what you should look for; dates, usernames, and directory listings may differ. Do not paste a terminal prompt such as `ubuntu@server:~$` as part of a command.

## Before you begin: know your working location

A Linux filesystem is a hierarchy of directories. A **directory** holds entries such as files and other directories. A **path** tells Linux where to find an entry. Your **working directory** is where relative commands start.

```bash
whoami
pwd
ls
```

`whoami` prints your current username. `pwd` means *print working directory*. `ls` lists entries. If you completed Day 001, your workspace should be under your home directory. Create it safely if it is missing:

```bash
mkdir -p ~/devops-training/01-linux
cd ~/devops-training
pwd
```

Expected pattern: `/home/ubuntu/devops-training` for the example Ubuntu account. `~` expands to your own home directory, so the commands are portable across usernames.

## Step 1 — Navigate with absolute and relative paths

An **absolute path** starts with `/`, the filesystem root, and does not depend on your current location: `/home/ubuntu/devops-training`. A **relative path** starts from your current working directory: `01-linux`. `/` and `~` are not interchangeable: `/` is the top of the filesystem; `~` is your home directory. `.` refers to the current directory and `..` to its parent.

![Path navigation](../images/01-path-navigation.svg)

From the training workspace:

```bash
cd ~/devops-training
pwd
cd 01-linux
pwd
cd ..
pwd
```

Expected pattern:

```text
/home/ubuntu/devops-training
/home/ubuntu/devops-training/01-linux
/home/ubuntu/devops-training
```

Try the absolute path with your own home expanded automatically:

```bash
cd "$HOME/devops-training/01-linux"
pwd
cd -
pwd
```

`$HOME` contains your home directory. `cd -` returns to the *previous working directory* and prints its path. Its destination depends on where you were before. `cd` alone or `cd ~` takes you home. `cd /` takes you to the filesystem root. Use `pwd` whenever you are uncertain where you are.

**Checkpoint 1:** From `~/devops-training`, enter `01-linux`, then return to `~/devops-training` using `cd ..`. Confirm both locations with `pwd`. Explain in your own words why `cd /` would not achieve the same result.

## Step 2 — Inspect entries with `ls`, `ls -l`, and `ls -a`

```bash
cd ~/devops-training
ls
ls -l
ls -a
```

![Compare listing commands](../images/02-ls-comparison.svg)

`ls` shows non-hidden names, such as `01-linux`. `ls -l` uses the **long format**: entry type and permissions, hard-link count, owner, group, size, modification time, and name. `ls -a` also displays names starting with a dot, including `.` and `..`.

Example long listing (your timestamps and sizes will differ):

```text
drwxrwxr-x 4 ubuntu ubuntu 4096 Oct 21 08:17 01-linux
```

Read the fields carefully:

- The first `d` indicates a directory; a regular file typically starts with `-`.
- `rwxrwxr-x` describes owner, group, and other permission sets. `r` means read, `w` write, and `x` execute/traverse as applicable.
- `4` is the hard-link count, **not** the number of files inside the directory.
- The two `ubuntu` fields are owner and group.
- `4096` is the directory entry's reported size in bytes on this filesystem, **not** the total size of everything beneath it.
- The date is its modification timestamp; the last field is its name.

Hidden dotfiles are not automatically secure or private; `ls -a` merely makes them visible.

**Checkpoint 2:** Run all three commands and identify the difference. Point to the directory indicator, owner, and permissions in one `ls -l` row. If your workspace is empty, create the `01-linux` folder using the setup command above.

## Step 3 — Create a structured directory workspace

`mkdir` means *make directory*. With `-p`, it creates missing parent directories and does not fail simply because a requested directory already exists. In Bash, `{a,b,c}` expands into multiple words before `mkdir` runs.

```bash
cd ~/devops-training/01-linux
mkdir -p day-002/{notes,labs,exercises,project,troubleshooting}
tree day-002
```

![Nested directory layout](../images/03-directory-layout.svg)

Expected:

```text
day-002
├── exercises
├── labs
├── notes
├── project
└── troubleshooting

6 directories, 0 files
```

The count includes the `day-002` parent. **Use `project` singular**. If `tree` is not installed, run `find day-002 -type d | sort` instead; the output formatting differs. You can install `tree` on Ubuntu using `sudo apt update && sudo apt install tree`, if permitted and appropriate for your sandbox.

**Checkpoint 3:** Confirm all five subdirectories exist and that you have not accidentally created `projects` instead of `project`.

## Step 4 — Create, read, and copy a file

`echo` prints text. The `>` redirection operator writes command output to a file, **overwriting that file if it already exists**. `cat` displays file contents. `cp SOURCE DESTINATION` copies a file while leaving the source in place.

```bash
cd ~/devops-training/01-linux/day-002
echo "Learning Linux file management" > notes/lesson.txt
cat notes/lesson.txt
cp notes/lesson.txt labs/
cat labs/lesson.txt
ls notes
ls labs
```

Expected from both `cat` commands:

```text
Learning Linux file management
```

Expected from each `ls`: `lesson.txt`. A destination ending in `/` identifies an existing directory. A missing source file usually means your working directory or spelling is wrong; check `pwd` and `ls notes` before retrying. `cp -i` can request confirmation before overwriting an existing destination; ordinary `cp` may overwrite it.

![Copy versus move](../images/04-copy-versus-move.svg)

**Checkpoint 4:** Verify `notes/lesson.txt` and `labs/lesson.txt` both exist and have identical content. Explain why copying did not remove the source.

## Step 5 — Move and rename without losing the original

`mv` changes the location or name of a file. `mv -i` requests confirmation **when a move would overwrite an existing destination**, not for every move. The original copy in `notes/` remains because the source of the move is the copied file in `labs/`.

```bash
mv -i labs/lesson.txt exercises/
ls exercises
ls labs
mv -i exercises/lesson.txt exercises/file-management-practice.txt
cat exercises/file-management-practice.txt
cat notes/lesson.txt
```

Expected: `exercises` contains `file-management-practice.txt`; `labs` no longer contains `lesson.txt`; both displayed files contain `Learning Linux file management`. A rename within one filesystem typically changes directory entries without duplicating the data; moving between filesystems may require copying and removing the source.

**Checkpoint 5:** Explain the difference between copying, moving, and renaming. Verify that the file under `notes/` was preserved.

## Step 6 — Remove a temporary file safely

Deleting files can be irreversible. Restrict this exercise to the disposable file you create here. `rm -i` prompts before removal; respond `y` only after checking the exact target.

```bash
echo "This is a temporary practice file" > exercises/temporary.txt
cat exercises/temporary.txt
rm -i exercises/temporary.txt
```

At the prompt, verify it names `exercises/temporary.txt`, then type `y` and press Enter. Now check:

```bash
ls exercises
cat notes/lesson.txt
```

Expected: `temporary.txt` is absent; `file-management-practice.txt` remains; the notes file still reads `Learning Linux file management`.

![Safe deletion](../images/05-safe-deletion.svg)

`rm` removes files without an interactive confirmation by default. `rmdir` removes **empty** directories. `rm -r` recursively removes a directory tree and can be destructive; `rm -ri` adds prompts but still requires care. Do not run recursive removal on shared, system, or production paths. Always inspect with `pwd`, `ls`, or `find` before deleting.

**Checkpoint 6:** Confirm only the intended temporary file disappeared. Explain why `rm -i` is safer for this exercise than plain `rm`.

## Step 7 — Independent application configuration mini-project

You are preparing a tiny application workspace. The application needs one source configuration file, a backup copy, and a deployment copy under a different filename. This models a basic operations habit: preserve a known-good configuration before deployment. It is **not** a full deployment system or a secure secrets-management workflow.

First, enter the project folder:

```bash
cd ~/devops-training/01-linux/day-002/project
pwd
```

Now complete the project yourself before looking at the example solution in [the project guide](../project/README.md). The required result is:

```text
application/
├── backup/
│   └── app.conf
├── config/
│   └── app.conf
└── deployment/
    └── production.conf
```

All three files must contain exactly:

```text
APP_NAME=DevOpsTraining
```

![Project structure](../images/06-project-layout.svg)

Verify the tree and all three files with:

```bash
tree application
cat application/config/app.conf
cat application/backup/app.conf
cat application/deployment/production.conf
```

**Checkpoint 7:** Confirm there are four directories (including `application`) and three files, and that all three `cat` commands print the same line. Do not place real passwords, API keys, or credentials in these example files.

## Engineer's reasoning: why these habits matter

A command succeeding is not the same as a task being correct. In operations work, verify **where** you are (`pwd`), **what** exists (`ls`, `tree`), **what** a file contains (`cat`), and **what changed** after an operation. Before modifying a configuration, preserve the source and check the destination. On a real system, teams also use version control, reviews, access controls, backups, and tested rollback procedures; these come later in your training.

## Continue

Complete [guided lab](../labs/follow-along-lab.md), [extra exercises](../exercises/exercises.md), [independent project](../project/README.md), [practical assessment](../assessments/practical-assessment.md), and [knowledge check](../assessments/knowledge-check.md). Work through errors with [troubleshooting](../troubleshooting/README.md).
