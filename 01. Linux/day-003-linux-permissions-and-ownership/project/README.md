# Day 003 — Independent Project: Secure the VERIQTA Application

## Scenario

You are preparing a small application for a deployment. The configuration must not be readable by everyone on the server, and the deployment script must be executable by its owner. Your responsibility is to create the correct files **and prove** their content, ownership, and permissions.

This is the same project from the Day 003 class. **Attempt it before opening [the reference solution](reference-solution.md).**

### Starting point

```bash
cd ~/devops-training/01-linux/day-003
pwd
```

### Required complete structure

```text
day-003/
├── permissions-lab/
│   ├── app.conf
│   └── hello.sh
└── project/
    └── veriqta-app/
        ├── config/
        │   └── production.conf
        └── scripts/
            └── deploy.sh
```

Keep the guided `permissions-lab` files intact. Your new work belongs under `project/veriqta-app`.

## Task 1 — Create directories

Create `project/veriqta-app/config` and `project/veriqta-app/scripts`.

**Think:** Which command creates nested directories without failing if the parents already exist?

**Checkpoint:** Use `tree project` to show both subdirectories.

## Task 2 — Create the configuration

Create `project/veriqta-app/config/production.conf` containing exactly:

```text
APP_NAME=VERIQTA
```

**Think:** Which command writes a single line? What does `>` do to an existing file?

**Checkpoint:** Use `cat` to verify the exact contents.

## Task 3 — Set and verify the configuration mode

Set `production.conf` to numeric mode `640`. On the standard Ubuntu EC2 account, its owner and group should be `ubuntu:ubuntu`. If your account is different, adapt to the correct authorized account/group.

**Checkpoint:**

```bash
stat -c 'Owner: %U | Group: %G | Permissions: %a' project/veriqta-app/config/production.conf
```

Expected on the standard lab:

```text
Owner: ubuntu | Group: ubuntu | Permissions: 640
```

## Task 4 — Write the deployment script

Create `project/veriqta-app/scripts/deploy.sh` with exactly these lines:

```bash
#!/bin/bash
echo "VERIQTA deployment ready"
```

Set the script's numeric mode to `744`: owner read/write/execute; group read; others read.

**Checkpoint:** `cat` proves the contents; `stat` proves the numeric mode.

## Task 5 — Execute and verify

From `day-003`, run:

```bash
tree project
cat project/veriqta-app/config/production.conf
stat -c 'Owner: %U | Group: %G | Permissions: %a' project/veriqta-app/config/production.conf
cat project/veriqta-app/scripts/deploy.sh
stat -c 'Owner: %U | Group: %G | Permissions: %a' project/veriqta-app/scripts/deploy.sh
./project/veriqta-app/scripts/deploy.sh
```

Expected script output:

```text
VERIQTA deployment ready
```

**Acceptance criteria:** Correct structure; exact configuration and script contents; configuration mode `640`; script mode `744`; correct owner/group; successful script execution; guided lab files remain intact.

### If your verification fails

Read the actual error. For example, `ls-l` is not `ls -l`: the space matters. Avoid broad permission changes such as `chmod 777`. Correct the specific file or command and verify again.

### Assessment

Complete the [Practical Assessment for Students](../assessments/practical-assessment.md) independently. It uses five equally weighted criteria (100 points total). Review the [reference solution](reference-solution.md) **only after your attempt**.
