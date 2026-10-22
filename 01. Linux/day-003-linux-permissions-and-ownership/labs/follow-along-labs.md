# Guided Follow-Along Labs — Day 003
Follow each lab in sequence. Do not skip the verification checkpoints. Commands are for a disposable learning workspace, not production.

## Lab 1 — Identify your identity
```bash
whoami
id
groups
```
**Expected:** A username, numeric user/group IDs, and group names. **Verify:** Find your primary group and check whether your account belongs to `sudo`. **Reflect:** Why might an application run as a different user?

## Lab 2 — Read directory metadata
```bash
cd ~/devops-training/01-linux
pwd
ls -l
ls -ld day-002
```
**Expected:** Absolute directory path; long listing; `day-002` line beginning with `d` if it exists. **Verify:** Identify owner, group, and all three permission triplets. **If `day-002` is absent:** Create a harmless practice directory named `directory-demo` and inspect it using `ls -ld directory-demo`.

## Lab 3 — Create and inspect a config file
```bash
mkdir -p day-003/permissions-lab
cd day-003/permissions-lab
echo 'APP_NAME=VERIQTA' > app.conf
cat app.conf
ls -l app.conf
```
**Expected:** `APP_NAME=VERIQTA`; a regular file entry. **Verify:** The leading character is `-`. **Note:** Your initial permissions depend on umask.

## Lab 4 — Symbolic and numeric `chmod`
```bash
chmod o-r app.conf
ls -l app.conf
chmod 640 app.conf
ls -l app.conf
cat app.conf
```
**Expected:** Final mode `-rw-r-----`; original content preserved. **Verify:** Use `stat -c '%a' app.conf` and expect `640`.

## Lab 5 — Inspect ownership
```bash
ls -l app.conf
stat -c 'Owner: %U | Group: %G | Permissions: %a' app.conf
chgrp ubuntu app.conf
ls -l app.conf
sudo chown ubuntu:ubuntu app.conf
stat -c 'Owner: %U | Group: %G | Permissions: %a' app.conf
```
**Expected on standard Ubuntu EC2:** `Owner: ubuntu | Group: ubuntu | Permissions: 640`. **Verify:** Compare before and after. **Note:** If your user is not `ubuntu`, substitute the correct account and group rather than copying a potentially invalid command.

## Lab 6 — Build and run a Bash script
```bash
printf '#!/bin/bash
' > hello.sh
echo 'echo "Welcome to VERIQTA DevOps Training"' >> hello.sh
cat hello.sh
ls -l hello.sh
chmod u+x hello.sh
ls -l hello.sh
./hello.sh
```
**Expected:** `Welcome to VERIQTA DevOps Training`. **Verify:** Owner triplet includes `x`; the script content is the two expected lines. **Reflect:** Why can `bash hello.sh` differ from `./hello.sh`?

## Lab 7 — Independent project
Read [project instructions](../project/README.md). Create the project without using the answer key. Inspect its tree, file contents, permissions, ownership, and script output. Complete the [practical assessment](../assessments/practical-assessment.md).
