---
description: Summarize unstaged changes, generate a commit message, and push
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git diff:*), Bash(git commit:*), Bash(git push:*)
---

## Context
- Current git status: !`git status`
- Unstaged and staged diff: !`git diff HEAD`
- Current branch: !`git branch --show-current`

## Task
1. Read the diff above and the current conversation context to understand what changes were made and *why*.
2. Generate a concise, conventional commit message (imperative mood, ≤50 chars subject, optional body for context).
3. Run `git add -A` to stage all changes.
4. Commit with the generated message.
5. Push to the current branch with `git push origin <branch>`.
6. Report the commit message used and whether push succeeded.

If $ARGUMENTS is non-empty, use it as a hint or override for the commit message.
