# Knowledge Check — Linux Day 003
Choose one answer per question before opening the answer key. These questions test the same concepts used in the labs.

**1.** You want owner read/write, group read-only, and others no permissions on `production.conf`. Which command sets the exact mode?
- A. `chmod 777 production.conf`
- B. `chmod 644 production.conf`
- C. `chmod 640 production.conf`
- D. `chmod 755 production.conf`

**2.** You want to add execute permission **only for the owner** of `deploy.sh` without changing other existing permissions. Which command is correct?
- A. `chmod 777 deploy.sh`
- B. `chmod u+x deploy.sh`
- C. `chmod g+x deploy.sh`
- D. `chown ubuntu deploy.sh`

**3.** Which command displays username owner, group name, and numeric permissions in a formatted line?
- A. `whoami production.conf`
- B. `chmod 640 production.conf`
- C. `cat production.conf`
- D. `stat -c 'Owner: %U | Group: %G | Permissions: %a' production.conf`

**4.** What does `x` mean on a directory?
- A. Execute directory as a script
- B. Traverse/search the directory
- C. Automatically delete its contents
- D. Encrypt its contents

**5.** What does the first `d` in `drwxr-xr-x` indicate?
- A. Deleted file
- B. Directory
- C. Device owner
- D. Default mode

**6.** What does `chgrp` change?
- A. Group ownership
- B. File contents
- C. File name
- D. Current shell

**7.** Which statement is correct about `bash hello.sh` and `./hello.sh`?
- A. Both always require file execute permission
- B. `bash hello.sh` asks Bash to read the script, while `./hello.sh` directly executes it and normally requires the execute bit
- C. `./hello.sh` deletes the file
- D. Neither uses an interpreter

**8.** What is the safest first action before running an unfamiliar deployment script?
- A. Set `chmod 777`
- B. Run it with `sudo`
- C. Inspect its contents and source
- D. Disable permission checks

**Answer key:** [Open after answering](knowledge-check-answers.md).
