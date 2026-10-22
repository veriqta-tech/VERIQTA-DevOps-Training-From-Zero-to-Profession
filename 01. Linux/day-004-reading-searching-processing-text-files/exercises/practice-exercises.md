# Additional Practice Exercises

Perform these after the guided labs. Use only training files.

1. Print the first four lines of `application.log` and explain the option used.
2. Print the last three lines of `application.log`.
3. Find every `WARN` or `ERROR` line with original line numbers.
4. Count the number of `ERROR` lines with a pipeline; explain what is being counted.
5. Produce `severity-summary.txt` with a single pipeline without modifying `severity.txt`.
6. Save warning records to `warnings-report.txt` with `>`; append a clearly labeled analyst note with `>>`.
7. Use `sed -n '4,8p' application.log` and describe what it shows.
8. Demonstrate why `uniq -c severity.txt` alone is not reliable for global category counts.
9. Explain the difference between `grep 'ERROR'` and `grep -i 'error'`.
10. Explain why an HTTP 200 after an HTTP 503 is evidence of recovery but not proof of a permanent fix.

**Self-check:** `wc -l` and `cat` verify report output. Compare category counts to 3 ERROR, 5 INFO, 2 WARN. Consult the lesson for reasoning rather than copying output without understanding.
