# Day 002 — Complete Instructor Notes
## Filesystem Navigation and File Management

Today we are going to work the way a DevOps engineer works when organizing deployment files, application configuration, scripts, and backups. You will **not** memorize commands without context. Every stage has a purpose, commands to run, expected behavior, and a verification checkpoint. Complete one stage before the next.

### Before we begin: Why paths matter

When you run a command such as `cp config.conf backup/`, Linux needs to know *where* to find the source and *where* to place the copy. Those locations are called **paths**. A command can be syntactically correct and still change the **wrong** file if you are in the wrong directory. That is why we repeatedly use `pwd`, `ls`, and `cat` to verify our work.

The examples use `ubuntu` as the Linux username. Your actual hostname, timestamps, and directory listing details may differ. Do not copy the `$` prompt shown in illustrative terminal examples.

---

## Step 1 of 7 — Absolute paths, relative paths, and changing directories

### What is a path?

A **path** identifies a location in the filesystem. There are two common forms:

- An **absolute path** starts at `/`, the filesystem root. Example: `/home/ubuntu/devops-training/01-linux`.
- A **relative path** is interpreted from your current working directory. Example: `01-linux` when you are in `~/devops-training`.

These symbols are essential:

| Symbol or command | Meaning |
|---|---|
| `/` | The top of the filesystem; also separates path components |
| `~` | Your current user's home directory |
| `.` | The current directory |
| `..` | The parent directory, one level up |
| `cd` | Change directory |
| `pwd` | Print the absolute path of the current directory |
| `cd -` | Return to the previous working directory |

### Follow along

**Command 1 — Enter the training workspace using a home-relative path:**

```bash
cd ~/devops-training
```

**Command 2 — Confirm where you are:**

```bash
pwd
```

Expected example:

```text
/home/ubuntu/devops-training
```

**Command 3 — Enter the Linux module using a relative path:**

```bash
cd 01-linux
```

Why this works: you are currently in `devops-training`, and `01-linux` is a directory immediately beneath it.

**Command 4 — Verify:**

```bash
pwd
```

Expected example:

```text
/home/ubuntu/devops-training/01-linux
```

**Command 5 — Move up to the parent directory:**

```bash
cd ..
```

`..` does not mean “the home directory.” It means **one directory above wherever you are now**.

**Command 6 — Verify:**

```bash
pwd
```

Expected example:

```text
/home/ubuntu/devops-training
```

**Command 7 — Return to the previous directory:**

```bash
cd -
```

Expected: the shell switches back to `/home/ubuntu/devops-training/01-linux` and commonly prints that path.

**Command 8 — Confirm the final location:**

```bash
pwd
```

Expected example:

```text
/home/ubuntu/devops-training/01-linux
```

### Why a DevOps engineer needs this

Imagine you are deploying a service. Running `rm -i config.txt` from the wrong directory could target the wrong file. `pwd` is a simple habit that prevents serious mistakes.

### Verification checkpoint 1

You should have visited the training root, the Linux module, returned to the training root, and returned to the Linux module. **Can you explain the difference between `cd ..` and `cd -`?** The former goes to a parent; the latter switches to the prior working directory.

![Path navigation](../images/01-path-navigation.svg)

---

## Step 2 of 7 — Listing files and interpreting `ls` output

A directory can contain files, other directories, and hidden entries. We need to inspect those entries before changing them.

Stay in:

```text
/home/ubuntu/devops-training/01-linux
```

**Command 1:**

```bash
ls
```

This lists visible entries. You should see your Day 001 folders and other existing training items, if present.

**Command 2:**

```bash
ls -l
```

The `-l` option requests a **long listing**. An illustrative line for `01-linux` when listed from its parent is:

```text
drwxrwxr-x 4 ubuntu ubuntu 4096 Oct 21 08:17 01-linux
```

Do not expect that exact date or size. Let's interpret the fields:

| Field | Meaning |
|---|---|
| `d` | Directory (a regular file would begin with `-`) |
| `rwxrwxr-x` | Permissions for owner, group, and others |
| `4` | Hard-link count for the directory; **not** the number of files |
| `ubuntu` | Owning user |
| `ubuntu` | Owning group |
| `4096` | Size field for the directory entry; **not** total contents |
| `Oct 21 08:17` | Displayed modification timestamp |
| `01-linux` | Directory name |

The permission string will be covered more deeply in Day 003. For today, notice the leading `d`, owner, group, and filename.

**Command 3:**

```bash
ls -a
```

`-a` means **all**: include names that begin with a dot. Two special entries commonly appear:

- `.` means the current directory.
- `..` means its parent.

Hidden files are not necessarily secret or secure. A name beginning with `.` simply makes it omitted from a normal `ls` listing.

### A useful contrast

- `ls` shows the visible names.
- `ls -l` shows more metadata.
- `ls -a` includes hidden entries.

You can combine options, such as `ls -la`, but first understand each option independently.

### Verification checkpoint 2

Run all three commands and compare the output. Identify at least one directory and explain what `.` and `..` represent. If a directory's long-listing line begins with `d`, that tells you its type, not that it is executable.

![Listing modes](../images/02-ls-comparison.svg)

---

## Step 3 of 7 — Creating a structured Day 002 workspace

In real DevOps projects, we do not throw every file into one directory. We separate teaching notes, lab files, exercises, project files, and troubleshooting material.

**Make sure you are in the Linux module:**

```bash
cd ~/devops-training/01-linux
pwd
```

**Create all five subdirectories in one command:**

```bash
mkdir -p day-002/{notes,labs,exercises,project,troubleshooting}
```

Let's explain this carefully.

- `mkdir` creates directories.
- `-p` creates missing parent directories and tolerates already-existing directories.
- `day-002/` is the parent path.
- `{notes,labs,exercises,project,troubleshooting}` is **Bash brace expansion**. Before `mkdir` runs, Bash expands this into five paths.
- `project` is **singular** in this course's workspace. Do not substitute `projects`.

**Verify the result:**

```bash
tree day-002
```

Expected structure:

```text
day-002
├── exercises
├── labs
├── notes
├── project
└── troubleshooting

6 directories, 0 files
```

The count includes the top-level `day-002` directory. If you have already done some exercises, your tree will also show files; that is fine.

**If `tree` is missing**, use `find day-002 -maxdepth 2 -print` or review the installation guidance from Day 001.

### Why this matters in DevOps

Clear directory conventions help teammates, automation pipelines, and reviewers find what they need. Inconsistent paths can break scripts even if the file contents are correct.

### Verification checkpoint 3

Confirm that all five subdirectories exist, that `project` is singular, and that you did not accidentally create the workspace outside `01-linux`.

![Workspace structure](../images/03-directory-layout.svg)

---

## Step 4 of 7 — Creating and copying files with `echo`, `cat`, and `cp`

Now we will create a small text file and copy it. Copying is a foundational backup skill: it produces a second file **without removing the original**.

**Enter the workspace:**

```bash
cd ~/devops-training/01-linux/day-002
```

**Create the source file:**

```bash
echo "Learning Linux file management" > notes/lesson.txt
```

Break it down:
- `echo` prints text.
- Quotation marks keep the phrase together.
- `>` redirects output into the target file and **overwrites existing contents**. Only use it here on your known training file.

**Read the source:**

```bash
cat notes/lesson.txt
```

Expected:

```text
Learning Linux file management
```

**Copy the file into the labs directory:**

```bash
cp notes/lesson.txt labs/
```

The source is `notes/lesson.txt`. The destination is the existing directory `labs/`. Because we gave a destination directory, the copied file retains the basename `lesson.txt`.

**Read the copy:**

```bash
cat labs/lesson.txt
```

Expected:

```text
Learning Linux file management
```

**Verify both directory listings:**

```bash
ls notes
ls labs
```

Both should include `lesson.txt`.

### What actually happened?

Before copying, only `notes/lesson.txt` existed. After copying, both `notes/lesson.txt` and `labs/lesson.txt` exist. The two files can later be edited independently.

In production, engineers may copy configuration files before changing them. However, a local copy is not a complete backup strategy: it does not protect against disk failure or loss of the entire machine.

### Verification checkpoint 4

Can you display **both files** and prove they contain the same sentence? If yes, the copy worked. Do not assume success just because `cp` printed no error.

![Copy versus move](../images/04-copy-versus-move.svg)

---

## Step 5 of 7 — Moving and renaming files safely with `mv -i`

We now have a copy in `labs`. Let's move that copy to `exercises`, then rename it. **The original file in `notes` must remain untouched.**

**Make sure you are inside `day-002`:**

```bash
pwd
```

Expected path ends in `/01-linux/day-002`.

**Move the copied file into `exercises`:**

```bash
mv -i labs/lesson.txt exercises/
```

`mv` means move. `-i` requests confirmation **when an overwrite would occur**; it does not necessarily prompt when the destination is new. That is normal.

**Verify that the destination contains the file:**

```bash
ls exercises
```

Expected: `lesson.txt` is present.

**Verify that the old directory no longer contains it:**

```bash
ls labs
```

Expected: no `lesson.txt` entry (the directory may otherwise be empty).

**Rename the moved file:**

```bash
mv -i exercises/lesson.txt exercises/file-management-practice.txt
```

Because the source and destination are in the same directory, this is a rename.

**Read the renamed file:**

```bash
cat exercises/file-management-practice.txt
```

Expected:

```text
Learning Linux file management
```

**Check that the original still exists:**

```bash
cat notes/lesson.txt
```

Expected:

```text
Learning Linux file management
```

### `cp` versus `mv`: the key distinction

| Command | Result |
|---|---|
| `cp source destination` | Creates a copy; source remains |
| `mv source destination` | Moves or renames the source; original path no longer refers to it |

Moving a file across different filesystems can require a copy-and-delete operation internally, rather than a simple rename. In either case, verify the final result.

### Verification checkpoint 5

You should now have:
- `notes/lesson.txt` — original preserved.
- `exercises/file-management-practice.txt` — moved and renamed copy.
- No `labs/lesson.txt`.

If you cannot explain why `labs/lesson.txt` disappeared while `notes/lesson.txt` remained, repeat the comparison before proceeding.

---

## Step 6 of 7 — Safe deletion and why `rm -i` matters

Deleting files is one of the most dangerous routine operations in Linux because removal is not normally sent to a desktop recycle bin. We will delete **only a temporary practice file that we create ourselves**.

**Create a temporary file:**

```bash
echo "This is a temporary practice file" > exercises/temporary.txt
```

**Verify its contents:**

```bash
cat exercises/temporary.txt
```

Expected:

```text
This is a temporary practice file
```

**Remove it interactively:**

```bash
rm -i exercises/temporary.txt
```

When prompted, confirm with `y` **only after checking the path**. The exact prompt wording can vary.

**Verify the directory:**

```bash
ls exercises
```

Expected: `file-management-practice.txt` remains, while `temporary.txt` is gone.

**Verify the original lesson file is still safe:**

```bash
cat notes/lesson.txt
```

Expected:

```text
Learning Linux file management
```

### Understanding the deletion commands

- `rm file` removes a file without the interactive confirmation you requested here.
- `rm -i file` asks for confirmation before removal.
- `rmdir folder` removes an **empty** directory.
- `rm -r folder` recursively removes a directory and its contents; this is **dangerous** if the path is wrong.
- `rm -ri folder` requests interactive confirmation during recursive removal, but it is not a guarantee against mistakes.

Never experiment with recursive deletion on production paths. For this course, you do **not** need to run `rm -r` or `rm -ri`.

### Verification checkpoint 6

Prove that `temporary.txt` is absent and that the original and renamed exercise file remain. A safe deletion is not just “the file disappeared”; it is “the **intended** file disappeared and everything else stayed.”

![Safe deletion](../images/05-safe-deletion.svg)

---

## Step 7 of 7 — Independent project: application configuration, backup, and deployment copy

Now it's time to work independently. Imagine you are preparing a small application for deployment. You need to organize its configuration, preserve a backup, and prepare a deployment-specific copy.

**Your starting point:**

```text
~/devops-training/01-linux/day-002
```

**Your project destination:**

```text
day-002/project/application/
```

**Target structure:**

```text
application/
├── backup/
│   └── app.conf
├── config/
│   └── app.conf
└── deployment/
    └── production.conf
```

**All three files must contain exactly:**

```text
APP_NAME=DevOpsTraining
```

This is the exact configuration string for this Day 002 classroom exercise. The course and images are branded **VERIQTA DevOps Training**, but the lab's expected file contents are intentionally preserved.

### Your independent requirements

1. Create the `backup`, `config`, and `deployment` directories inside `project/application`.
2. Create `config/app.conf` with the required configuration line.
3. Copy it to `backup/app.conf` without removing the original.
4. Create the deployment copy at `deployment/production.conf`.
5. Verify the directory tree and read all three files.

**Do the project before opening the solution section below.** Your goal is to choose the right commands yourself, not copy a recipe without understanding it.

### Project verification commands

From inside `day-002/project`, run:

```bash
tree application
cat application/config/app.conf
cat application/backup/app.conf
cat application/deployment/production.conf
```

**Expected:** `tree` shows four directories including `application` and three files. Each `cat` prints exactly `APP_NAME=DevOpsTraining`.

### Guided solution — open only after attempting the project

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

**Why these commands work:**
- `mkdir -p` plus brace expansion creates the three required folders.
- `echo ... >` writes the configuration to the original.
- `cp ... application/backup/` preserves the basename `app.conf`.
- `cp ... application/deployment/production.conf` writes a copy under a different filename.
- `tree` checks structure; the three `cat` commands check content.

A copy of the sample configuration files is included under [`../project/application/`](../project/application/) for reference. The actual assessment requires you to create them on your own Linux server.

### Project assessment

See [Practical Assessment for Students](../assessments/practical-assessment.md) for the 100-point rubric. After completing the practical assessment, answer the three [Knowledge Check](../assessments/knowledge-check.md) questions.

![Application project structure](../images/06-project-layout.svg)

---

## What you should understand before moving to Day 003

You should be able to answer all of these **without guessing**:

- Am I using an absolute or relative path?
- Which directory am I in, and how can I prove it?
- Does my command create a copy, move a file, or rename it?
- Could this command overwrite an existing file?
- What will remain after I remove this temporary file?
- How do I prove a project has the correct structure **and** contents?

These are the habits of reliable DevOps engineering: **inspect, act deliberately, verify, and preserve what matters.**

**Next lesson:** Linux file permissions, ownership, and executable scripts.
