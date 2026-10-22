# Day 003 — Troubleshooting and Recovery

A reliable engineer does not respond to every failure with `sudo` or `chmod 777`. Read the error, identify which requirement failed, correct the smallest thing, and verify.

## `ls-l: command not found`

**Cause:** Missing space. The shell searches for a program named `ls-l`.

**Fix:**

```bash
ls -l
```

This exact typo is worth understanding: shell commands are sensitive to spaces.

## `Permission denied` when running `./hello.sh`

**Possible causes:** Missing execute permission, inaccessible parent directory, or a filesystem mounted with execution restrictions.

**Inspect first:**

```bash
pwd
ls -l hello.sh
cat hello.sh
```

**For the practice script only:**

```bash
chmod u+x hello.sh
ls -l hello.sh
./hello.sh
```

If it still fails, check the interpreter path and the filesystem restrictions. Do not set `777`.

## `No such file or directory`

**Possible causes:** Wrong working directory, misspelled path, missing file, or a shebang referencing a missing interpreter.

```bash
pwd
ls
cat hello.sh
```

Return to the correct practice directory before retrying.

## `chmod: cannot access 'app.conf'`

The file may not exist in your current directory.

```bash
pwd
ls -l
```

Confirm you are in `day-003/permissions-lab`. Do not create a duplicate file elsewhere by guessing.

## `chgrp: invalid group` or `chown: invalid user`

The account or group name may not exist on your machine. Inspect:

```bash
whoami
id
groups
```

Use the actual authorized user and group for your practice file. Do not create system accounts just to complete this exercise.

## `Operation not permitted` during `chgrp` or `chown`

Ownership changes have authorization rules. An ordinary user cannot arbitrarily change a file's owner. The guided `sudo chown` step is limited to the known practice file and should only be run if you are authorized.

**Do not** recursively change ownership of your home directory or system folders.

## Permission string differs before `chmod`

This can be normal because new-file permissions depend on umask. The final explicit `chmod 640` is what matters for `app.conf`.

**Verify:**

```bash
stat -c '%a' app.conf
```

Expected after setting the mode: `640`.

## File contents changed unexpectedly

`>` overwrites; `>>` appends. Inspect your practice script:

```bash
cat hello.sh
```

If the shebang is missing, recreate the two-line practice script using the commands from Lab 6, then verify before executing it.

## `./hello.sh` differs from `bash hello.sh`

`bash hello.sh` explicitly asks Bash to interpret the file. `./hello.sh` requests direct execution and generally requires execute permission. This lesson intentionally uses direct execution to practice `chmod u+x`.

## `stat` shows mode `744` but the script still will not execute

Check its shebang and whether parent directories are traversable. The filesystem may have `noexec` restrictions. Do not weaken unrelated permissions; investigate the exact error.

## Project structure is wrong

From `day-003`, run:

```bash
pwd
tree project
```

Check for singular `project`, exact `veriqta-app`, and `config`/`scripts`. Do not delete the entire project to fix one misspelled directory.

## Final verification checklist

From `~/devops-training/01-linux/day-003`:

```bash
tree project
cat project/veriqta-app/config/production.conf
stat -c 'Owner: %U | Group: %G | Permissions: %a' project/veriqta-app/config/production.conf
cat project/veriqta-app/scripts/deploy.sh
stat -c 'Owner: %U | Group: %G | Permissions: %a' project/veriqta-app/scripts/deploy.sh
./project/veriqta-app/scripts/deploy.sh
```

**Required:** Correct paths; configuration `APP_NAME=VERIQTA` and mode `640`; script mode `744` and output `VERIQTA deployment ready`. Each command proves a different part of the result.
