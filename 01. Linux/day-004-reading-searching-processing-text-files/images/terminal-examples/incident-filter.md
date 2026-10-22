# Terminal example: incident-filter

**Illustrative expected output, not a learner screenshot.**

```bash
grep -n -E "WARN|ERROR" logs/production.log
```

```text
4:... WARN Database response time increasing
6:... ERROR Database query timeout
7:... WARN Database connection pool nearing capacity
8:... ERROR Failed to retrieve lesson content
10:... ERROR Database connection unavailable
11:... WARN Application response time degraded
12:... ERROR Lesson API returned HTTP 503
```
