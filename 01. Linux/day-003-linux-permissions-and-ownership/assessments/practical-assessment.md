# Practical Assessment — Linux Day 003 (100 Points)
Complete independently on an Ubuntu lab host. Use only your Day 003 workspace. Refer to the [project brief](../project/README.md) for the required directory structure and file contents.

| Criterion | Points | Evidence |
|---|---:|---|
| Create `config/` and `scripts/` in `project/veriqta-app/` | 20 | `tree project` |
| Create `production.conf` with exactly `APP_NAME=VERIQTA` | 20 | `cat` output |
| Secure config to mode `640` and confirm owner/group | 20 | `stat` output |
| Create a valid Bash `deploy.sh` and add owner execute permission | 20 | `cat`, `ls -l` |
| Verify structure, contents, modes, and successful script execution | 20 | Command output, exit status |
| **Total** | **100** | |

## Submission
Provide commands and terminal outputs or readable screenshots showing each criterion. If you make a mistake, correct it and explain the fix. A typo corrected before final submission is part of the learning process.

## Marking guidance
Award full points when requirements are met and evidence is clear. Award partial credit for a correct approach with an incomplete or unverified result. Do not award points solely for typed commands without evidence of their effect. Treat equivalent safe commands as valid. Never require broad privileges or insecure modes such as `777`.

## Reflection questions
Why does `chmod 640` require a trusted group? What is the difference between file and directory execute permission? Why is `chmod u+x` often preferable to setting a broad numeric mode? What does `stat` verify that `cat` does not?
