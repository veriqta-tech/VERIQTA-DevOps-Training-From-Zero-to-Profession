#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$HOME/devops-training/01-linux/day-004"
cd "$HOME/devops-training/01-linux/day-004"
for file in application.log severity.txt; do
  if [ -e "$file" ]; then
    printf 'Refusing to overwrite existing %s; inspect it manually.\n' "$file" >&2
    exit 1
  fi
done
cat > application.log <<'EOF'
2026-10-22 09:00:00 INFO Application started
2026-10-22 09:01:00 INFO Database connected
2026-10-22 09:02:00 WARN Response time increasing
2026-10-22 09:03:00 ERROR Database query timeout
2026-10-22 09:04:00 INFO Retrying query
2026-10-22 09:05:00 ERROR Lesson request failed
2026-10-22 09:06:00 WARN Retry limit approaching
2026-10-22 09:07:00 INFO Database connection restored
2026-10-22 09:08:00 ERROR Cache refresh failed
2026-10-22 09:09:00 INFO Health check passed
EOF
cat > severity.txt <<'EOF'
INFO
ERROR
WARN
INFO
ERROR
INFO
WARN
ERROR
INFO
INFO
EOF
printf 'Ready: %s\n' "$PWD"
wc -l application.log severity.txt
