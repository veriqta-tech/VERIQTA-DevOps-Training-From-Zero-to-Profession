# Independent Project — Secure a Small Deployment Workspace

## Scenario
You are preparing a small application workspace for VERIQTA DevOps Training. Create a configuration file with controlled access and a deployment script that the owner can execute. This is a simulation: do not deploy a real application or store real secrets.

## Required structure
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

## Requirements
1. From `day-003`, create `project/veriqta-app/config` and `project/veriqta-app/scripts`.
2. Put exactly `APP_NAME=VERIQTA` in `config/production.conf`.
3. Set configuration mode `640`. Confirm the user owner and group owner; on the standard Ubuntu EC2 lab they are both `ubuntu`.
4. Create a two-line Bash script with `#!/bin/bash` and an `echo` command that prints exactly `VERIQTA deployment ready`.
5. Grant owner execute permission to `deploy.sh`, run it from the project path, and verify output.
6. Show the directory tree and both files' permission and ownership details.

**Think before you type:** Which commands from Days 001–003 will you reuse? Can you accomplish this without `sudo`? How will you prove that permissions are correct?

## Student verification checklist
- [ ] `tree project` shows two required files in the right directories.
- [ ] `cat project/veriqta-app/config/production.conf` prints the exact setting.
- [ ] `stat -c '%a %U %G' project/veriqta-app/config/production.conf` prints `640` and the intended owner/group.
- [ ] `cat project/veriqta-app/scripts/deploy.sh` shows a valid Bash shebang and expected echo command.
- [ ] `ls -l project/veriqta-app/scripts/deploy.sh` shows owner execute permission.
- [ ] `./project/veriqta-app/scripts/deploy.sh` prints the required message.

When finished, submit your terminal output or screenshots to your instructor for marking. For an optional self-study walkthrough, see [reference solution](reference-solution.md) **only after attempting the project**.
