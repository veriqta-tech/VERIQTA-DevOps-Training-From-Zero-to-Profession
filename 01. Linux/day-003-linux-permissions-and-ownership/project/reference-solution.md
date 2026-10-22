# Reference Solution — Read After Attempting the Project
This is one valid implementation, not the only correct solution. Run from `~/devops-training/01-linux/day-003`.

```bash
mkdir -p project/veriqta-app/{config,scripts}
echo 'APP_NAME=VERIQTA' > project/veriqta-app/config/production.conf
chmod 640 project/veriqta-app/config/production.conf
printf '#!/bin/bash
echo "VERIQTA deployment ready"
' > project/veriqta-app/scripts/deploy.sh
chmod u+x project/veriqta-app/scripts/deploy.sh
tree project
cat project/veriqta-app/config/production.conf
stat -c '%a %U %G %n' project/veriqta-app/config/production.conf
cat project/veriqta-app/scripts/deploy.sh
ls -l project/veriqta-app/scripts/deploy.sh
./project/veriqta-app/scripts/deploy.sh
```

Expected tree: four directories including `project`, `veriqta-app`, `config`, `scripts`; two files. Expected config output: `APP_NAME=VERIQTA`. Expected config mode: `640`. Expected script output: `VERIQTA deployment ready`. A script mode such as `744` or `744`'s symbolic equivalent is acceptable **if owner execute is set and group/others do not have execute**; `chmod u+x` is preferable when preserving pre-existing permissions. Numeric mode depends on the initial umask.

**Security reflection:** A group-readable configuration is appropriate only if the group is authorized. The script's readable bits should also be reviewed for sensitive content. Never use real passwords in this demonstration.
