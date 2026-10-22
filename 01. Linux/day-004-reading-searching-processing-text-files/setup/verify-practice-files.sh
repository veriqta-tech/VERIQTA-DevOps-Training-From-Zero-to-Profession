#!/usr/bin/env bash
set -euo pipefail
cd "$HOME/devops-training/01-linux/day-004"
test "$(wc -l < application.log)" -eq 10
test "$(wc -l < severity.txt)" -eq 10
test "$(grep -c ERROR application.log)" -eq 3
test "$(grep -c ERROR severity.txt)" -eq 3
test "$(grep -c INFO severity.txt)" -eq 5
test "$(grep -c WARN severity.txt)" -eq 2
printf 'Practice data verified: 10 application lines; 3 errors; severity 3 ERROR / 5 INFO / 2 WARN.\n'
