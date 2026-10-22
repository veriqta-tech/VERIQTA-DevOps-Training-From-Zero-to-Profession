# Day 003 — Instructor Reference Solution
**Open only after attempting the independent project.**

This solution assumes the standard Ubuntu EC2 user `ubuntu`. Adapt ownership commands if your authorized account or group differs.

### 1. Create the project directories

```bash
cd ~/devops-training/01-linux/day-003
mkdir -p project/veriqta-app/{config,scripts}
tree project
```

### 2. Create the configuration and secure it

```bash
echo "APP_NAME=VERIQTA" > project/veriqta-app/config/production.conf
chmod 640 project/veriqta-app/config/production.conf
cat project/veriqta-app/config/production.conf
stat -c 'Owner: %U | Group: %G | Permissions: %a' project/veriqta-app/config/production.conf
```

Expected `cat`:

```text
APP_NAME=VERIQTA
```

Expected `stat` on the standard environment:

```text
Owner: ubuntu | Group: ubuntu | Permissions: 640
```

If owner/group differ and you are authorized to correct them **for this training file only**, use the appropriate `chown` command and verify again. Do not use `sudo` reflexively.

### 3. Create the script and set mode 744

```bash
printf '#!/bin/bash\n' > project/veriqta-app/scripts/deploy.sh
echo 'echo "VERIQTA deployment ready"' >> project/veriqta-app/scripts/deploy.sh
chmod 744 project/veriqta-app/scripts/deploy.sh
cat project/veriqta-app/scripts/deploy.sh
stat -c 'Owner: %U | Group: %G | Permissions: %a' project/veriqta-app/scripts/deploy.sh
```

Expected script:

```bash
#!/bin/bash
echo "VERIQTA deployment ready"
```

Expected numeric permissions:

```text
744
```

### 4. Run the script

```bash
./project/veriqta-app/scripts/deploy.sh
```

Expected:

```text
VERIQTA deployment ready
```

### 5. Final verification

```bash
tree day-003
```

If you are still inside `day-003`, use `tree .` instead. The target includes the existing `permissions-lab` and the new `project/veriqta-app` structure.

**Why these steps work:** `mkdir -p` creates the correct folders; `echo` and `printf` write known practice-file contents; `chmod 640` protects the configuration; `chmod 744` allows owner execution of the script; `cat`, `stat`, `tree`, and `./deploy.sh` each prove a different requirement.

**Do not use this solution as evidence that you completed the assessment.** Your own terminal verification is the evidence.
