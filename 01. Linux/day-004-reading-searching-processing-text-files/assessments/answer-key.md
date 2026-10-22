# Answer Key and Reasoning

## Final assessment
1. **B** — The log supports degradation, failure and recovery, not a proven root cause or full outage interval.
2. **C** — Preserve original evidence; work on a copy and document changes.
3. **D** — `-n` adds source line numbers; `-E` enables `WARN|ERROR` alternation.
4. **D** — A healthy response and check show recovery indicators, not a verified permanent fix.
5. **B** — `sort` groups labels, `uniq -c` counts them, and `>` writes a separate report. Expected counts: 3 ERROR, 3 INFO, 2 WARN.

## Classroom knowledge check
1. **B** — `uniq` combines adjacent equal lines.
2. **A** — Filter matching lines and count them.
3. **C** — `-i` ignores case.
4. **B** — `>` truncates an existing destination.
5. **A** — `>>` appends.
6. **B** — `cmp` exit status zero means no differences found.
7. **B** — Equal hashes support content integrity comparison; do not infer independent authenticity.
8. **C** — `-c` checks saved checksum entries.
9. **B** — An HTTP 200 is evidence of a successful response, not universal service health.
10. **A** — Separate source logs, preserved evidence and analysis for traceability.
