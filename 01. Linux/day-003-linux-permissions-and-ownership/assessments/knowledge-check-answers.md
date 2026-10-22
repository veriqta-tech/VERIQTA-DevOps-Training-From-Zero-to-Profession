# Knowledge Check — Answers and Explanations
1. **C — `chmod 640`**. Owner `6=rw-`, group `4=r--`, others `0=---`.
2. **B — `chmod u+x`**. Adds owner execute without changing group/others bits.
3. **D — `stat -c ...`**. `%U` prints owner username, `%G` group name, `%a` numeric mode.
4. **B — Traverse/search**. Directory `x` permits accessing known paths when other permissions allow.
5. **B — Directory**. The first character of a long listing is the file type.
6. **A — Group ownership**. `chgrp` does not alter file contents.
7. **B — Bash interpreter versus direct execution**. `bash hello.sh` requires readable script content; `./hello.sh` normally requires the execute bit and a valid interpreter.
8. **C — Inspect contents and source**. Permissions do not establish trustworthiness.

**Review guidance:** If you missed a question, revisit the matching section of the [complete notes](../notes/complete-lesson.md) and repeat its lab before moving on.
