# Day 003 — Knowledge Check: Answer Key and Explanations

**Do not read this page until you've attempted all three questions.**

## Question 1 — C. `chmod 640 production.conf`

The first digit `6` is owner `4 + 2`, or read/write. The second digit `4` grants group read only. The last digit `0` gives others no permissions. The resulting ordinary-file permission string is `-rw-r-----`.

- `777` grants everyone read, write, and execute.
- `644` allows others to read.
- `755` adds execute permissions and lets others read.

**Engineering takeaway:** A configuration file should be readable only by identities that need it; verify the owning group as well as the mode.

## Question 2 — B. `chmod u+x deploy.sh`

`u` means owner/user, `+` means add, and `x` means execute. This modifies the owner's execute bit without replacing the other permission bits.

- `777` grants excessive access.
- `g+x` adds execute to the group instead of the owner.
- `chown` changes ownership, not execute permissions.

**Engineering takeaway:** A targeted symbolic change can be safer than resetting every permission bit when only one permission needs to change.

## Question 3 — D. `stat -c 'Owner: %U | Group: %G | Permissions: %a' production.conf`

`stat` reads metadata about the specified file. `%U` formats the owner name, `%G` the group name, and `%a` the numeric permissions.

- `whoami` reports the effective user running the command, not the file's owner.
- `chmod 640` changes permissions instead of reporting all requested metadata.
- `cat` prints file contents, not owner/group/mode metadata.

**Engineering takeaway:** Choose verification commands that prove the exact requirement. A file can have correct contents but incorrect ownership or permissions.

**Score:** 3/3 = all three concepts demonstrated; if you missed any, revisit the matching lesson step.
