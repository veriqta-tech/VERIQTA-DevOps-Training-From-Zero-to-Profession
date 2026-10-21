# Day 002 Troubleshooting and Safety

These examples explain errors and safe recovery. Do not claim an error occurred in the verified session unless it was actually observed. The session completed without a reported Day 002 command failure.

## `cd: No such file or directory`

**Likely cause:** Typo or incorrect current directory. Run `pwd` and `ls`. Return with `cd ~/devops-training` and verify `01-linux` exists. Absolute paths work from any current directory.

## `tree: command not found`

**Cause:** `tree` is optional and may not be installed. Use `find day-002 -type d` or, if you are authorized to install software on your own Ubuntu training instance, `sudo apt update && sudo apt install tree`. Day 001 included a real instance of installing `tree`; it was already available in Day 002.

## `cp: cannot stat ...`

**Likely cause:** The source does not exist at the specified path. Verify with `ls -l notes/lesson.txt` and inspect your working directory using `pwd`.

## `mv: cannot stat ...`

**Likely cause:** The file has already moved or was misspelled. Check both `labs` and `exercises` with `ls`; do not blindly rerun moves.

## `Permission denied`

Inspect the path and permissions with `ls -ld DIRECTORY` and `ls -l FILE`. Do not use `sudo` as a reflex. Verify ownership and whether you are in the intended training directory.

## File contents differ

Use `cat PATH` to check the actual contents. Remember `>` overwrites a file. For this exercise, only rewrite the specifically named training file after confirming its path. Do not overwrite production configuration to fix a lab.

## Interactive `rm -i` does not ask

Verify you ran `rm -i`, not `rm`, and that the file exists. If you typed `n`, it remains. A deletion prompt reduces accidental deletion but does not provide recovery.

## Wrong `project` versus `projects` folder

This verified session used `project` (singular). Some early planning examples referred to `projects`. For reproducibility, the completed Day 002 structure and all commands in this package consistently use `project`.

## Before deleting or overwriting any real file

Check `pwd`, inspect exact target paths, confirm the data is nonessential or backed up, and understand whether a service depends on the file. Never paste recursive deletion commands you do not understand.
