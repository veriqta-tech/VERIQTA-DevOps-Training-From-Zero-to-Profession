# Day 003 — Follow-Along Labs
## Seven stages, in the same order as the classroom lesson

Open the [Complete Instructor Notes](../notes/complete-lesson.md) alongside this file. **Run one command at a time.** Read its explanation in the notes, compare the output, and complete the checkpoint before continuing.

### Lab 1 — Who am I on this Linux server?

**Purpose:** Understand which account and groups may affect access decisions.

```bash
whoami
id
groups
```

**Expected:** Username, UID, primary GID, and group memberships. On the standard Ubuntu EC2 account, the username is `ubuntu` and the primary group is often `ubuntu`.

**Checkpoint:** Identify the username, primary group, and whether `sudo` appears in the group list. Explain why the group list matters for file access.

### Lab 2 — Inspect the directory you already created

```bash
cd ~/devops-training/01-linux
pwd
ls -l
ls -ld day-002
```

**Expected:** The full path to `01-linux`; a long listing; a line for `day-002` beginning with `d`.

**Checkpoint:** Identify the directory owner, group, and three permission triplets. Explain why `ls -ld day-002` inspects the directory itself.

**If `day-002` does not exist:** Do not invent it as completed training. Use a harmless directory you own to practice `ls -ld`.

### Lab 3 — Create a configuration file

```bash
mkdir -p day-003/permissions-lab
cd day-003/permissions-lab
echo "APP_NAME=VERIQTA" > app.conf
cat app.conf
ls -l app.conf
```

**Expected `cat`:**

```text
APP_NAME=VERIQTA
```

**Checkpoint:** Verify the file exists, its content is exact, and its listing begins with `-` rather than `d`. Initial permission bits can vary by umask.

### Lab 4 — Practice symbolic and numeric permissions

```bash
chmod o-r app.conf
ls -l app.conf
chmod 640 app.conf
ls -l app.conf
cat app.conf
stat -c '%a' app.conf
```

**Expected final permission string:** `-rw-r-----`

**Expected numeric output:** `640`

**Expected contents:** `APP_NAME=VERIQTA`

**Checkpoint:** Explain `o-r` and how 6, 4, and 0 correspond to owner, group, and others. Confirm the contents were not changed.

### Lab 5 — Inspect ownership and group

```bash
ls -l app.conf
stat -c 'Owner: %U | Group: %G | Permissions: %a' app.conf
chgrp ubuntu app.conf
ls -l app.conf
sudo chown ubuntu:ubuntu app.conf
stat -c 'Owner: %U | Group: %G | Permissions: %a' app.conf
```

**Expected on a standard Ubuntu EC2 machine:**

```text
Owner: ubuntu | Group: ubuntu | Permissions: 640
```

**Checkpoint:** Explain the difference among `chmod`, `chgrp`, and `chown`. **If your user is not `ubuntu`, adapt the two ownership commands to your actual authorized user/group; do not blindly change ownership to an unrelated account.** Reassigning the existing owner/group is a syntax demonstration, not a real transfer to a different identity.

### Lab 6 — Build and execute a script

```bash
printf '#!/bin/bash\n' > hello.sh
echo 'echo "Welcome to VERIQTA DevOps Training"' >> hello.sh
cat hello.sh
ls -l hello.sh
chmod u+x hello.sh
ls -l hello.sh
./hello.sh
```

**Expected script contents:**

```bash
#!/bin/bash
echo "Welcome to VERIQTA DevOps Training"
```

**Expected output when run:**

```text
Welcome to VERIQTA DevOps Training
```

**Checkpoint:** Confirm the owner has `x`, the script has a shebang, and the output matches. Explain why `>>` was used for the second line and why `./` is needed for direct execution.

### Lab 7 — Independent application project

**Stop here.** Open [the project brief](../project/README.md) and create the project **without opening the reference solution first**.

Required:

```text
day-003/project/veriqta-app/
├── config/production.conf
└── scripts/deploy.sh
```

- `production.conf`: `APP_NAME=VERIQTA`, mode `640`, owner/group `ubuntu:ubuntu` on the standard Ubuntu environment.
- `deploy.sh`: shebang plus `echo "VERIQTA deployment ready"`, mode `744`, executable by owner.
- Keep your earlier `permissions-lab` intact.

**Verify from `day-003`:**

```bash
tree project
cat project/veriqta-app/config/production.conf
stat -c 'Owner: %U | Group: %G | Permissions: %a' project/veriqta-app/config/production.conf
cat project/veriqta-app/scripts/deploy.sh
stat -c 'Owner: %U | Group: %G | Permissions: %a' project/veriqta-app/scripts/deploy.sh
./project/veriqta-app/scripts/deploy.sh
```

**Expected script output:** `VERIQTA deployment ready`.

**Checkpoint:** Structure, contents, modes, ownership, and execution must all be independently verified.

### Final student assessment

Complete [Practical Assessment for Students](../assessments/practical-assessment.md) for the 100-point project rubric, then answer the [three classroom questions](../assessments/knowledge-check.md). The answer key is separate.

**Troubleshooting:** If you accidentally type `ls-l`, correct it to `ls -l`. Do not change permissions broadly to bypass an error.
