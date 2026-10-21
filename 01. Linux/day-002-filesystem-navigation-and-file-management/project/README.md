# Independent Mini-Project — Application Configuration Workspace

## Scenario

You are preparing a small application workspace for a deployment exercise. The operations team needs a primary configuration, a backup copy, and a deployment copy with a production-oriented filename. You will build the structure and verify each artifact. **This is a practice simulation, not a production deployment.**

## Requirements

Work inside `~/devops-training/01-linux/day-002/project`. Create:

```text
application/
├── backup/app.conf
├── config/app.conf
└── deployment/production.conf
```

All three files must contain this one line:

```text
APP_NAME=DevOpsTraining
```

**Your task:** Create the three directories, write the original configuration, copy it to backup, and create the deployment copy with its required name. Avoid changing or deleting the original.

## Verification (run before reading the solution)

```bash
cd ~/devops-training/01-linux/day-002/project
tree application
cat application/config/app.conf
cat application/backup/app.conf
cat application/deployment/production.conf
```

Expected: four directories including `application`, three files, and identical output from all three `cat` commands. Compare the contents exactly, including capitalization. If `tree` is unavailable, use `find application -print | sort`.

![Expected directory structure](../images/06-project-layout.svg)

<details>
<summary>Worked example — open after attempting the project</summary>

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

`mkdir -p` creates the directories. `echo ... >` creates the source file; running it again would overwrite its content. The first `cp` retains the source filename; the second writes to the destination filename `production.conf`. The final commands independently confirm structure and content.

</details>

## Engineering reflection

Why is a backup useful before modifying a configuration? What additional safeguards would you need on a real production system? Think about version control, approvals, access restrictions, secret management, deployment testing, and rollback.

## Supplied example files

The three `.conf` files included alongside this guide are **reference examples**. Recreate them yourself in the terminal rather than treating the supplied copies as proof you completed the exercise.
