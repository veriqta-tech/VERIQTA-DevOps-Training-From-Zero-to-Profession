# Follow-Along Lab: Day 002

Use the [complete teaching notes](../notes/day-002-complete-lesson.md) for the explanation behind each command. Complete checkpoints before proceeding. This is a **practice checklist**, not a substitute for reading the lesson.

## Checkpoint 1: navigation
```bash
cd ~/devops-training
pwd
cd 01-linux
pwd
cd ..
pwd
```
Pass if the path moves into `01-linux` and returns to `devops-training`.

## Checkpoint 2: listings
```bash
cd ~/devops-training
pwd
ls
ls -l
ls -a
```
Pass if you can explain why `ls -a` includes `.` and `..`.

## Checkpoint 3: nested directories
```bash
cd ~/devops-training/01-linux
mkdir -p day-002/{notes,labs,exercises,project,troubleshooting}
tree day-002
```
Pass if you see five child directories.

## Checkpoint 4: copying
```bash
cd ~/devops-training/01-linux/day-002
echo "Learning Linux file management" > notes/lesson.txt
cat notes/lesson.txt
cp notes/lesson.txt labs/
cat labs/lesson.txt
ls notes
ls labs
```
Pass if the original and copy both exist.

## Checkpoint 5: moving
```bash
mv -i labs/lesson.txt exercises/
ls exercises
ls labs
mv -i exercises/lesson.txt exercises/file-management-practice.txt
cat exercises/file-management-practice.txt
cat notes/lesson.txt
```
Pass if the renamed file exists and original notes remain intact.

## Checkpoint 6: safe deletion
```bash
echo "This is a temporary practice file" > exercises/temporary.txt
cat exercises/temporary.txt
rm -i exercises/temporary.txt
# Type y when prompted.
ls exercises
cat notes/lesson.txt
```
Pass if only the temporary file was removed.

## Checkpoint 7: independent project
Follow [project instructions](../project/README.md). Verify three files with `cat` and layout with `tree`. Do not skip content verification.

## Record your work
Write down the commands you used, any error messages, why they happened, and how you verified the fix. Do not upload screenshots containing secrets, personal identifiers, or server IP addresses.
