# Day 003 — Practice Exercises

Use only your own `~/devops-training/01-linux/day-003` workspace. These are additional opportunities to practice the concepts from the class; they do not replace the independent assessment.

## Exercise 1 — Read your identity

```bash
whoami
id
groups
```

**Explain:** Which value is your UID? Which is your primary GID? How does group membership affect access?

## Exercise 2 — Compare file and directory listings

```bash
cd ~/devops-training/01-linux
ls -ld day-002
ls -l day-002
```

**Explain:** Why do these commands display different information? What does the first `d` mean?

## Exercise 3 — Interpret a permission string

Suppose you see `-rw-r-----`.

**Answer:** What can the owner, group, and others do? What numeric mode is this?

**Verify on your training file:**

```bash
cd ~/devops-training/01-linux/day-003/permissions-lab
chmod 640 app.conf
ls -l app.conf
stat -c '%a' app.conf
```

## Exercise 4 — Compare symbolic and numeric mode changes

On your existing practice script:

```bash
ls -l hello.sh
chmod u+x hello.sh
ls -l hello.sh
```

**Explain:** What does `u+x` change? Why might setting `777` be inappropriate?

## Exercise 5 — Read ownership metadata

```bash
stat -c 'Owner: %U | Group: %G | Permissions: %a' app.conf
```

**Explain:** Why does `whoami` not tell you who owns an arbitrary file?

## Exercise 6 — Inspect and run a known script

```bash
cat hello.sh
ls -l hello.sh
./hello.sh
```

**Expected:** `Welcome to VERIQTA DevOps Training`.

**Explain:** What does the shebang do? Why does `./` matter?

## Exercise 7 — Predict the project permissions

Before setting them, write out the triplets for `640` and `744`. Which categories can execute `deploy.sh` after `chmod 744`? Verify the answer using `stat`.

## Final reflection

Why do you need **all three** of `cat`, `stat`, and `tree` to prove the independent project is correct? Then complete the [student assessment](../assessments/practical-assessment.md).
