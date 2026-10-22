# Day 003 — Practical Assessment for Students
## Secure a VERIQTA application · 100 points

**Work independently** on your own Ubuntu practice server. The instructor reference solution is available only for review after you attempt the tasks.

### Scenario

You are preparing a small application for deployment. Its configuration must be protected, and its deployment script must be executable by its owner. Build and verify the deliverables under `~/devops-training/01-linux/day-003/project/veriqta-app`.

### Required deliverables

```text
project/veriqta-app/
├── config/
│   └── production.conf
└── scripts/
    └── deploy.sh
```

`production.conf` must contain `APP_NAME=VERIQTA`, have mode `640`, and be owned by the correct authorized user/group (`ubuntu:ubuntu` on the standard lab host).

`deploy.sh` must contain:

```bash
#!/bin/bash
echo "VERIQTA deployment ready"
```

Its numeric mode must be **744**, and direct execution must print `VERIQTA deployment ready`.

### Five practical tasks

1. **Directory layout — 20 points:** Create `config/` and `scripts/` under the correct project directory.
2. **Configuration content — 20 points:** Create `production.conf` containing exactly `APP_NAME=VERIQTA`.
3. **Configuration security — 20 points:** Set mode `640` and verify the owner and group.
4. **Deployment script — 20 points:** Create the exact two-line Bash script and set mode `744`.
5. **Complete verification — 20 points:** Show structure, contents, permissions, ownership, and successful script execution.

### Required verification

From `~/devops-training/01-linux/day-003`:

```bash
pwd
tree project
cat project/veriqta-app/config/production.conf
stat -c 'Owner: %U | Group: %G | Permissions: %a' project/veriqta-app/config/production.conf
cat project/veriqta-app/scripts/deploy.sh
stat -c 'Owner: %U | Group: %G | Permissions: %a' project/veriqta-app/scripts/deploy.sh
./project/veriqta-app/scripts/deploy.sh
```

### Marking rubric

| Requirement | Points |
|---|---:|
| Correct directory structure | 20 |
| Correct configuration contents | 20 |
| Configuration mode and ownership | 20 |
| Correct script contents and mode | 20 |
| Evidence of successful verification and execution | 20 |
| **Total** | **100** |

**Suggested pass threshold:** 80/100, with both files present and no unsafe permissions such as `777`. Give partial credit for correctly completed requirements, not merely for commands typed without evidence.

### Reflection

- Why is `640` only appropriate when the owning group is trusted?
- What is the difference between `x` on a file and `x` on a directory?
- Why might `chmod u+x` be preferable to setting a broad mode?
- What does `stat` verify that `cat` cannot?
- Why should you inspect a script before executing it?

### When something goes wrong

A typo like `ls-l` is a command-name error, not a permissions error. Correct it to `ls -l`. Fix only the failed item, then rerun the verification commands. See [troubleshooting](../troubleshooting/README.md).
