# Independent Project: Application Configuration Workspace

## Scenario
You are a junior engineer preparing an application configuration workspace. Keep an original config, an independent backup, and a deployment copy with a new name. **This does not deploy an application**; it practices filesystem operations used in deployment workflows.

## Requirements

1. Work in `~/devops-training/01-linux/day-002/project`.
2. Create `application/config`, `application/backup`, and `application/deployment`.
3. Create `application/config/app.conf` with the exact line `APP_NAME=DevOpsTraining`.
4. Copy the original to `application/backup/app.conf`.
5. Copy the original to `application/deployment/production.conf`.
6. Verify the directory layout with `tree application`.
7. Verify **each** file's contents with `cat`.
8. Preserve the original configuration.

![Expected project layout](../images/06-project-layout.svg)

## Verification commands

```bash
cd ~/devops-training/01-linux/day-002/project
tree application
cat application/config/app.conf
cat application/backup/app.conf
cat application/deployment/production.conf
```

Expected output for each `cat` command:

```text
APP_NAME=DevOpsTraining
```

## Assessment rubric

| Criterion | Points |
| --- | ---: |
| Correct directory structure | 20 |
| Original configuration created | 20 |
| Backup copy created | 20 |
| Renamed deployment copy created | 20 |
| All three file contents verified | 20 |
| **Total** | **100** |

## Reference project files

The included `application/` directory contains the **expected artifacts**, provided so future readers can compare their own work. Do not simply copy these files and claim the independent challenge is complete.

## Production context

Real application deployment also requires configuration validation, secrets management, permissions, change review, application health checks, and rollback planning. This is a filesystem foundation exercise, not a production-ready deployment.
