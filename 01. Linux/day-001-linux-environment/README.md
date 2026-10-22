# VERIQTA DevOps Training — From Zero to Professional
## Module 01: Linux | Day 001 — Your Linux Environment and First Commands

Welcome to your first Linux class. This is a **follow-along lesson**, not a summary of someone else's class. You will read the explanation, run the command, inspect the result, and complete the verification checkpoint before moving on.

**Who this is for:** Absolute beginners. No prior Linux or cloud knowledge is assumed.

**Lab environment:** An Ubuntu Linux machine with a terminal. The walkthrough uses an Ubuntu EC2 instance accessed over SSH, but a local Ubuntu VM works too. Commands are run as an ordinary user unless a specific package-installation step uses `sudo`.

**What you will build:** A reusable training workspace containing a Linux module, a lesson note, and a practical report.

**Learning rhythm:** Understand → Demonstrate → Run → Observe → Verify → Explain → Continue.

### Follow the class in order

1. [Complete instructor notes — the full lesson, in teaching order](notes/complete-lesson.md)
2. [Follow-along terminal lab — each command and checkpoint](labs/follow-along-lab.md)
3. [Practice exercises](exercises/exercises.md)
4. [Guided mini-project](project/README.md)
5. [Practical Assessment for Students](assessments/practical-assessment.md)
6. [Knowledge Check](assessments/knowledge-check.md)
7. [Troubleshooting and recovery](troubleshooting/README.md)

The **notes are the class**: they contain the explanations and demonstrations. The **lab is your hands-on companion**: it repeats the commands in sequence, with expected outputs and checkpoints. You can keep both open side by side.

### Outcomes

After the lesson you should be able to:
- Explain Linux, Ubuntu, the terminal, the shell, and SSH in plain language.
- Recognize your prompt and know what *not* to type.
- Identify your OS, current user, hostname, and current working directory.
- Explain the root directory `/` and key Linux folders.
- Create a predictable training directory structure.
- Create, write, read, rename, and verify your own practice files.
- Diagnose and recover when `tree` is not installed.
- Complete an independent assessment without copying the guided solution.

### Safety and repeatability

Do not paste private SSH keys, passwords, cloud credentials, or identifying server details into a public repository. Commands that write files should be run **only inside your own practice workspace**. If a folder already exists, inspect it rather than deleting it. The `>` operator overwrites its target; always check the destination first.

**Next:** Day 002 — Filesystem Navigation and File Management.

**Branding:** VERIQTA DevOps Training. Copyright and licensing are maintained once at the repository root, not inside this daily folder.
