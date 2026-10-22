# Troubleshooting — Linux Day 003

## `ls-l: command not found`
Cause: Missing space. `ls-l` is interpreted as a single command name. **Fix:** `ls -l filename`.

## `Permission denied` when running `./hello.sh`
Inspect `ls -l hello.sh` and `cat hello.sh`. Confirm owner `x` with `chmod u+x hello.sh`; confirm a valid `#!/bin/bash` shebang. Also verify the parent directory can be traversed. A `noexec` filesystem mount can prevent direct execution even when mode bits allow it.

## `Permission denied` when reading a file
Check `ls -l file`, `id`, and parent directory traversal permissions. Do not reflexively use `sudo` or `chmod 777`. Determine which identity needs access.

## `No such file or directory`
Use `pwd`, `ls`, and `ls -l path` to verify current location, spelling, and case. Linux paths are case-sensitive. For scripts, also inspect the shebang and line endings if the file visibly exists.

## `stat` does not show `640`
Re-run `chmod 640 app.conf` on the intended lab file, then `stat -c '%a %n' app.conf`. Ensure you did not accidentally change a similarly named file in another directory.

## `Operation not permitted` from `chgrp` or `chown`
Changing user ownership generally requires privilege; changing group ownership is constrained by ownership and group membership. Confirm the correct user and group with `id` and `ls -l`. For the standard lab, do not invent additional accounts. Avoid escalating privilege unless necessary and justified.

## Script output includes quotation marks
If you accidentally wrote `echo '"VERIQTA deployment ready"'` with literal backslashes, inspect with `cat deploy.sh`. Replace the line with `echo "VERIQTA deployment ready"` (without extra escaped quotes in the actual script). Test again.

## `tree: command not found`
Use `find project -print` as an alternative. If your lab allows package installation, `sudo apt update && sudo apt install tree` can install it; do not install software on a restricted production host without authorization.

## File mode changes but contents disappear
`chmod` does not erase contents. Investigate prior redirection commands: `>` overwrites; `>>` appends. Recover from a known backup or recreate the lab file.

## Safety reminders
Do not run `chmod -R 777`, `sudo chown -R` on system paths, or arbitrary internet scripts. The sample configuration is deliberately non-sensitive.
