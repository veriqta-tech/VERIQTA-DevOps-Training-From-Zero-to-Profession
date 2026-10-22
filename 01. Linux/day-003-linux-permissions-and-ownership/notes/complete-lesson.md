# Complete Teaching Notes — Linux Day 003

## Why permissions matter
Linux is a multiuser operating system. Applications, automation agents, and people may share a host, but they should not all have the same access. A readable application configuration might be harmless, while a file containing credentials must be restricted. File mode bits are one control among several: ACLs, filesystem mount options, service isolation, and privileged accounts can also affect access. **Permissions are not encryption.**

## 1. Who am I? Users and groups
Run:
```bash
whoami
id
groups
```
A typical Ubuntu EC2 account may show `ubuntu`, `uid=1000(ubuntu)`, `gid=1000(ubuntu)`, and groups such as `sudo`. Your numeric IDs and groups may differ. `whoami` prints the effective username; `id` prints user and group IDs and memberships; `groups` prints group names. Membership in `sudo` generally allows authorized elevation, but your normal shell does not automatically run as root.

**Verify:** `whoami` matches the username displayed in `id`; identify your primary group and any supplementary groups. **Production connection:** CI/CD services and applications often run under dedicated service identities.

![Ownership model](../images/ownership.svg)

## 2. Read `ls -l` and identify file types
From your Linux module directory:
```bash
cd ~/devops-training/01-linux
pwd
ls -l
ls -ld day-002
```
`pwd` shows the current absolute path. `ls -l` lists entries with detailed metadata; `ls -ld day-002` shows metadata for the directory itself, not its contents. Example:
```text
drwxrwxr-x 7 ubuntu ubuntu 4096 Oct 21 09:20 day-002
```
The first character is file type: `-` regular file, `d` directory, `l` symbolic link. Other types include `c` character device, `b` block device, `p` named pipe, and `s` socket. The next nine characters are three triplets: owner, group, others. Other columns include link count, owner, group, size, modification timestamp, and name. Directory size is **not** the total size of everything inside it. Exact timestamps, link counts, and permissions vary.

![Permission string](../images/permission-anatomy.svg)

## 3. What read, write, and execute mean

| Bit | Regular file | Directory |
|---|---|---|
| `r` | Read contents | List entry names |
| `w` | Modify contents | Create, remove, or rename entries, normally together with `x` |
| `x` | Execute as a program (if valid executable/script) | Traverse directory and access known entries |

Directory deletion is controlled primarily by permissions on the **parent directory**, not the file's write bit; sticky-bit directories and other controls can restrict this further. `r` on a directory without `x` does not generally allow opening files inside it.

Create a safe workspace:
```bash
mkdir -p ~/devops-training/01-linux/day-003/permissions-lab
cd ~/devops-training/01-linux/day-003/permissions-lab
echo 'APP_NAME=VERIQTA' > app.conf
cat app.conf
ls -l app.conf
```
Expected `cat` output: `APP_NAME=VERIQTA`. Example initial mode: `-rw-rw-r--` or `-rw-r--r--`, depending on your umask. The `>` operator **overwrites** an existing file; use only the lab file.

**Verify:** `ls -l` starts with `-` and shows your current account as owner.

## 4. Change permissions with `chmod`
Symbolic mode: `u` owner, `g` group, `o` others, `a` all; `+` add, `-` remove, `=` set exactly.
```bash
chmod o-r app.conf
ls -l app.conf
chmod 640 app.conf
ls -l app.conf
cat app.conf
```
Numeric mode uses `r=4`, `w=2`, `x=1`. Add values for each triplet: owner `6=4+2` (`rw-`), group `4` (`r--`), others `0` (`---`). `chmod 640` gives `-rw-r-----` on a regular file. `chmod o-r` removes only others' read bit, leaving other bits unchanged. The contents remain `APP_NAME=VERIQTA`.

![Numeric permissions](../images/numeric-permissions.svg)

**Security:** `640` is suitable only if the owning group is allowed to read the data. Do not use `777` as a blanket fix for permission problems. A stricter `600` may be appropriate for sensitive files, depending on service requirements.

## 5. Ownership and groups
Every file has a user owner and group owner. Inspect without changing:
```bash
ls -l app.conf
stat -c 'Owner: %U | Group: %G | Permissions: %a' app.conf
```
Expected for this lab after the previous step: `Owner: ubuntu | Group: ubuntu | Permissions: 640`, if your login and file owner are `ubuntu`.

Practice safe syntax on your own lab file:
```bash
chgrp ubuntu app.conf
ls -l app.conf
sudo chown ubuntu:ubuntu app.conf
stat -c 'Owner: %U | Group: %G | Permissions: %a' app.conf
```
`chgrp` changes group ownership; `chown user:group` sets both. In this exercise the values already match, so the commands demonstrate syntax **without transferring ownership to another identity**. `sudo` is privileged; only use it for a specific justified operation. `stat` format tokens: `%U` username, `%G` group name, `%a` numeric permission mode.

**Avoid:** `sudo chown -R` or `chmod -R` on `/`, `/etc`, `/usr`, or another system path. Such commands can break operating system services.

## 6. Executable scripts
A script is a text file containing commands for an interpreter. Create a harmless Bash script:
```bash
printf '#!/bin/bash
' > hello.sh
echo 'echo "Welcome to VERIQTA DevOps Training"' >> hello.sh
cat hello.sh
ls -l hello.sh
chmod u+x hello.sh
ls -l hello.sh
./hello.sh
```
Expected contents:
```bash
#!/bin/bash
echo "Welcome to VERIQTA DevOps Training"
```
Expected output: `Welcome to VERIQTA DevOps Training`.

`#!/bin/bash` is the shebang; it identifies the interpreter for direct execution. `>>` appends instead of overwriting. `chmod u+x` grants owner execute permission without changing the other bits. `./` specifies the script in the current directory. `bash hello.sh` can work without an execute bit if Bash can read the script; direct `./hello.sh` generally requires the execute bit and access to the interpreter. Always inspect scripts before running them.

![Script execution](../images/script-execution.svg)

## 7. Independent deployment project
You will create `project/veriqta-app/config/production.conf` and `project/veriqta-app/scripts/deploy.sh`. The configuration contains exactly `APP_NAME=VERIQTA`, with mode `640`, owner and group matching your lab account. The script prints `VERIQTA deployment ready` and grants execute permission to the owner. See [project brief](../project/README.md) and [practical assessment](../assessments/practical-assessment.md). Work independently before consulting the optional reference solution.

![Project structure](../images/project-structure.svg)

## Verification habits that transfer to production
After changing permissions, **inspect the result** with `ls -l` or `stat`. After changing a script, **read its contents** before execution. After execution, compare stdout and exit status. Never assume that a silent command succeeded without verification.

![Verification workflow](../images/verification-workflow.svg)

## Key command reference
| Command | Purpose |
|---|---|
| `whoami` | Current effective username |
| `id` | User/group IDs and memberships |
| `groups` | Group memberships |
| `pwd` | Current directory |
| `ls -l` | Detailed listing |
| `ls -ld DIR` | Inspect directory itself |
| `cat FILE` | Display file contents |
| `stat -c '...' FILE` | Format ownership and mode details |
| `chmod u+x FILE` | Add owner execute permission |
| `chmod 640 FILE` | Set owner/group/others permissions exactly |
| `chgrp GROUP FILE` | Set group owner |
| `sudo chown USER:GROUP FILE` | Set user/group owner (privileged) |
| `./script.sh` | Run an executable script in current directory |

## Exit checkpoint
Explain why directory `x` differs from file `x`, decode `-rw-r-----`, identify when group-readable config is unsafe, and demonstrate verification after `chmod`. Then complete the exercises and assessments.
