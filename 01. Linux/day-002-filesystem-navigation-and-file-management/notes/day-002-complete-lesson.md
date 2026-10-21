> **VERIQTA DevOps Training — From Zero to Professional**  
> © 2026 VERIQTA LIMITED. All rights reserved.

# Day 002 Complete Teaching Notes

This document preserves the **full instructional sequence** of the day: explanations, commands, expected results, reasoning, checks, and common mistakes. Run each command yourself; do not just read it.

## Preparation and safety

You need a Bash-compatible Linux shell. This session used Ubuntu 26.04 LTS on an AWS EC2 training server. Commands should be run as a regular user. **Do not use `sudo` for these file-management exercises.** Your workspace is `~/devops-training/01-linux`. In a fresh environment, create it with `mkdir -p ~/devops-training/01-linux` before starting. Never delete Day 001 work.

## Step 1. Absolute and relative paths

A **path** identifies a filesystem location. An **absolute path** begins at `/`, the filesystem root, so `/home/ubuntu/devops-training/01-linux` is independent of your current working directory. A **relative path** is interpreted from where you currently are. For example, when in `~/devops-training`, `01-linux` refers to the same directory. Your home directory is represented by `~` in Bash.

Useful symbols: `/` = root; `.` = current directory; `..` = parent; `~` = home; `cd -` switches to the previous working directory. `pwd` prints your current working directory. `cd` changes it.

![Path navigation](../images/01-path-navigation.svg)

**Follow along:**

```bash
cd ~/devops-training
pwd
cd 01-linux
pwd
cd ..
pwd
```

Expected paths on the training EC2 instance, in order:

```text
/home/ubuntu/devops-training
/home/ubuntu/devops-training/01-linux
/home/ubuntu/devops-training
```

Your username may differ. **Checkpoint 1:** verify the second `pwd` ends in `/01-linux` and the final `pwd` ends in `/devops-training`. If `cd 01-linux` fails, run `ls` and check the directory exists. Never assume a command worked without checking its result.

## Step 2. List files and hidden entries

`ls` lists visible entries. `ls -l` shows the long listing, including permissions, hard-link count, owner, group, size, timestamp, and name. `ls -a` also shows names beginning with `.`; it includes `.` and `..`. Files beginning with a dot are hidden **by naming convention**, not encrypted or protected automatically.

![Listing comparison](../images/02-ls-comparison.svg)

```bash
cd ~/devops-training
pwd
ls
ls -l
ls -a
```

Illustrative output:

```text
$ ls
01-linux
$ ls -a
.  ..  01-linux
```

A real long listing observed in the lesson had the directory permission string `drwxrwxr-x`. Its leading `d` means directory; owner `rwx`, group `rwx`, and others `r-x`. On directories, `x` permits traversal. Permissions will be studied in detail later. The link count is not a count of files inside the directory; the size shown is not the total size of its contents.

**Checkpoint 2:** `ls` shows `01-linux`; `ls -l` adds metadata; `ls -a` also shows `.` and `..`. Outputs and dates may differ across machines.

## Step 3. Create nested directories

`mkdir` creates a directory. `mkdir -p` also creates missing parent directories and does not fail if the named directory already exists. In Bash, `{notes,labs,exercises,project,troubleshooting}` expands into five separate names. **This lesson uses the singular `project`**, matching the verified training workspace.

![Nested folders](../images/03-directory-layout.svg)

```bash
cd ~/devops-training/01-linux
mkdir -p day-002/{notes,labs,exercises,project,troubleshooting}
tree day-002
```

Expected for a fresh Day 002 directory:

```text
day-002
├── exercises
├── labs
├── notes
├── project
└── troubleshooting

6 directories, 0 files
```

`tree` may not be installed. Use `find day-002 -type d` as a built-in alternative, or install `tree` only if your system policy permits. **Checkpoint 3:** five child directories, no errors. Avoid creating `projects` in addition to `project` unless your own repository structure intentionally uses both.

## Step 4. Copy a file

`cp SOURCE DESTINATION` copies a file. When the destination is an existing directory, the copied file normally keeps its filename. The source stays in place. `echo 'text' > file` writes a line and **overwrites** the target file if it already exists. `cat` prints file contents.

![Copy versus move](../images/04-copy-versus-move.svg)

```bash
cd ~/devops-training/01-linux/day-002
echo "Learning Linux file management" > notes/lesson.txt
cat notes/lesson.txt
cp notes/lesson.txt labs/
cat labs/lesson.txt
ls notes
ls labs
```

Both `cat` calls should print `Learning Linux file management`. Both `ls` calls should list `lesson.txt`. **Checkpoint 4:** the original and copied file exist independently. On important files, check destinations first: `cp` can overwrite an existing file. Use `cp -i` for an overwrite prompt, though prompts are not backups.

## Step 5. Move and rename

`mv SOURCE DESTINATION` moves or renames a path. Unlike `cp`, it does not normally leave the file at its previous pathname. `mv -i` prompts before overwriting a destination. Moving between filesystems may entail a copy followed by removal of the source, so do not assume every move is instantaneous or atomic.

```bash
cd ~/devops-training/01-linux/day-002
mv -i labs/lesson.txt exercises/
ls exercises
ls labs
mv -i exercises/lesson.txt exercises/file-management-practice.txt
cat exercises/file-management-practice.txt
cat notes/lesson.txt
```

Expected: `ls exercises` first shows `lesson.txt`; `ls labs` shows no entries (unless you added other files); both `cat` calls show `Learning Linux file management`. **Checkpoint 5:** the file has moved and been renamed; the original notes file remains unchanged.

## Step 6. Delete safely

`rm` removes files without a normal Trash/undo mechanism. `rm -i` asks for confirmation. `rmdir` removes an **empty** directory. `rm -r` recursively deletes directories and contents and is intentionally **not used** in this lab. Before deleting files, inspect `pwd`, target names, and backups.

![Safe deletion](../images/05-safe-deletion.svg)

```bash
cd ~/devops-training/01-linux/day-002
echo "This is a temporary practice file" > exercises/temporary.txt
cat exercises/temporary.txt
rm -i exercises/temporary.txt
# At the prompt, type y and press Enter.
ls exercises
cat notes/lesson.txt
```

Expected: the temporary text is printed; an interactive question appears; after `y`, `temporary.txt` is gone; `file-management-practice.txt` remains; the original notes file still prints `Learning Linux file management`. **Checkpoint 6:** confirm deletion did not affect other files. If you answer `n`, the file should remain.

## Step 7. Independent application configuration project

**Scenario:** You are preparing an application configuration workspace with an original file, a backup, and a renamed deployment copy. This is a **training exercise**, not a full production deployment.

**Requirements:** Inside `day-002/project`, create `application/config`, `application/backup`, and `application/deployment`; write exactly `APP_NAME=DevOpsTraining` to `config/app.conf`; copy it to `backup/app.conf`; copy it to `deployment/production.conf`; verify all three contents; show `tree application`.

![Project layout](../images/06-project-layout.svg)

Try independently before revealing this reference solution:

```bash
cd ~/devops-training/01-linux/day-002/project
mkdir -p application/{backup,config,deployment}
echo "APP_NAME=DevOpsTraining" > application/config/app.conf
cp application/config/app.conf application/backup/
cp application/config/app.conf application/deployment/production.conf
tree application
cat application/config/app.conf
cat application/backup/app.conf
cat application/deployment/production.conf
```

Expected `tree`:

```text
application
├── backup
│   └── app.conf
├── config
│   └── app.conf
└── deployment
    └── production.conf

4 directories, 3 files
```

Each `cat` must show `APP_NAME=DevOpsTraining`. **Checkpoint 7:** confirm both filenames **and** contents. An existing file with incorrect content is not a successful deployment artifact.

## Knowledge check and learning reflection

1. Which command preserves the original while making a backup? `cp app.conf app.conf.backup`.
2. Which command moves up one directory? `cd ..`.
3. Which command asks before deleting a file? `rm -i test.log`.

In the verified session, the learner answered all three correctly, scoring 3/3, and earned 100/100 on the practical project. The most important engineering habit today was **verifying effects rather than assuming success**.

## Extra notes for real-world engineering

`cp` makes a point-in-time copy, but it is not a comprehensive backup strategy. A deployment configuration containing only an application name does not demonstrate secure production deployment. Avoid storing real credentials in a repository. Use version control for configuration changes and validate application behavior after deployment. File permissions, symbolic links, atomic replacement, checksums, and backup retention will be covered in future lessons.
