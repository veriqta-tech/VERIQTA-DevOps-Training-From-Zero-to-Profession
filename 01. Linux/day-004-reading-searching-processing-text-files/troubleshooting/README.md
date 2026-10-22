# Troubleshooting — Day 004

| Symptom | Likely cause | Safe response |
|---|---|---|
| `No such file or directory` | Wrong current directory or misspelled path | Run `pwd`, `ls`, then use a verified path |
| `Permission denied` | File or directory access restricted | Inspect `ls -l`; do not bypass controls on managed systems |
| `grep` prints nothing | No match or case mismatch | Check the file with `head`, try `grep -i` if appropriate |
| `uniq -c` repeats a severity in separate rows | Input not sorted | Use `sort severity.txt | uniq -c` |
| `wc -l` lower than expected | Missing newline or incomplete dataset | Inspect `cat -n` and final newline |
| Report content disappears | `>` overwrote an existing report | Use a new destination, version control and backups; use `>>` only when append is intended |
| `sha256sum -c` says FAILED | File bytes changed, manifest wrong, or wrong path | Stop and inspect; do not rewrite the evidence to force a match |
| `sha256sum -c` says file not found | Relative path resolved from wrong working directory | `cd` to incident root and rerun |
| `cmp` prints differences / returns 1 | Source and copy differ | Preserve both; investigate before taking any corrective action |
| `tree: command not found` | Utility not installed | Use `find . -maxdepth 3 -print` |
| `less` does not exit | Pager is waiting for keyboard input | Press `q` |
| `vi` does not accept typing | Normal mode active | Press `i` to insert; `Esc` then `:wq` to save |
| `grep -E` behaves unexpectedly | Quotes, pattern or file wrong | Use `grep -n -E 'WARN|ERROR' logs/production.log` from incident root |
| Hashes match but provenance uncertain | Hash checks do not prove who collected evidence | Record collection method, custody and independent provenance separately |

## Safety notes
Never run `>` against preserved evidence, and never silently regenerate a checksum after evidence changes. Use only authorized logs and avoid publishing secrets, tokens, personal data or private production log entries to GitHub.
