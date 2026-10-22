# Knowledge Check — Day 004

These are classroom-aligned review questions. Exact historical wording of earlier intermediate quizzes is not available, so these are newly written equivalent questions rather than a claim to reproduce unseen text.

1. Why should `sort` normally precede `uniq -c` when counting categories in an unordered file?
   - A. It deletes empty lines; B. It groups identical values next to each other; C. It converts values to numbers; D. It modifies the original file.
2. Which command counts lines containing uppercase `ERROR`?
   - A. `grep ERROR application.log | wc -l`; B. `cat application.log | sort`; C. `tail application.log`; D. `wc -w application.log`.
3. What does `grep -i` do?
   - A. In-place edit; B. Print only first line; C. Case-insensitive matching; D. Count bytes.
4. What does `>` do when the destination exists?
   - A. Append; B. Overwrite/truncate; C. Delete source; D. Compare hashes.
5. What does `>>` do?
   - A. Append output; B. Reverse lines; C. Print line numbers; D. Stop a pipeline.
6. What does `cmp` returning exit status `0` indicate for two readable regular files?
   - A. Different content; B. Matching content; C. Authentic origin proven; D. File encrypted.
7. What does matching `sha256sum` output establish?
   - A. Root cause fixed; B. Contents hash identically at time checked; C. Source authenticity independently proven; D. System cannot be compromised.
8. What does `sha256sum -c evidence/SHA256SUMS` do?
   - A. Encrypt evidence; B. Edit the log; C. Verify files against recorded checksums; D. Rebuild the report.
9. What does a later HTTP 200 prove about an earlier HTTP 503?
   - A. Root cause eliminated; B. Recovery observed for that request; C. No monitoring needed; D. All users unaffected.
10. Why keep logs, evidence and reports in separate directories?
    - A. Improve traceability and distinguish source observations from analyst conclusions; B. Guarantee security; C. Reduce all disk usage; D. Make logs uneditable automatically.
