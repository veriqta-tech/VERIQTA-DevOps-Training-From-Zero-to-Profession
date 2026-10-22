# Day 003 — Knowledge Check
## The same three questions from the class

Answer **one question at a time**. Record your choice before moving to the next question. Only open the [answer key](knowledge-check-answers.md) after all three.

### Question 1 of 3 — Protect a configuration file

You need to give the **owner read and write**, the **group read only**, and **others no permissions** on `production.conf`.

Which command sets exactly those permissions?

A. `chmod 777 production.conf`

B. `chmod 644 production.conf`

C. `chmod 640 production.conf`

D. `chmod 755 production.conf`

**Your answer:** ______

### Question 2 of 3 — Make a script executable for the owner

You need to **add execute permission only for the owner** of `deploy.sh`, without changing the file's other existing permissions.

Which command should you use?

A. `chmod 777 deploy.sh`

B. `chmod u+x deploy.sh`

C. `chmod g+x deploy.sh`

D. `chown ubuntu deploy.sh`

**Your answer:** ______

### Question 3 of 3 — Verify owner, group, and permissions

Which command displays the owning username, owning group name, and numeric permissions in a formatted line for `production.conf`?

A. `whoami production.conf`

B. `chmod 640 production.conf`

C. `cat production.conf`

D. `stat -c 'Owner: %U | Group: %G | Permissions: %a' production.conf`

**Your answer:** ______

### How to finish

Score **one point per correct answer** (3 total). Explain *why* the correct answer works, and why the other commands do not meet the requirement. If you miss a question, repeat the related lab and verification checkpoint before advancing.
