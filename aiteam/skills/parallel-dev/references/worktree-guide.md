# Git Worktree Guide

## Multi-Agent Setup (Cursor)

Moi module = 1 worktree = 1 Cursor window = 1 AI agent doc lap.

```bash
# Tao worktree cho moi module
git worktree add ../project-module-a feature/module-a
git worktree add ../project-module-b feature/module-b
git worktree add ../project-module-c feature/module-c

# Mo tung worktree trong Cursor rieng
cursor ../project-module-a
cursor ../project-module-b
```

## Cau truc thu muc

```
parent-dir/
  project/              # main worktree
  project-module-a/     # worktree cho module A
  project-module-b/     # worktree cho module B
  project-module-c/     # worktree cho module C
```

## Quy trinh lam viec

1. Tao worktrees tu main branch
2. Moi worktree = 1 feature branch
3. Implement doc lap trong moi worktree
4. Merge tung module ve main khi xong
5. Integration test tren main

## Merge Strategy

```bash
# Khi module A xong
cd ../project
git merge feature/module-a

# Khi module B xong (sau A)
git merge feature/module-b
# Resolve conflicts neu co

# Integration test
npm test  # hoac test runner cua du an
```

## Cleanup

```bash
# Xoa worktree khi xong
git worktree remove ../project-module-a
git worktree remove ../project-module-b
```

## Luu y

- Docs (`docs/ai/`) nen duoc edit tren main branch, khong phai tren worktree
- Neu dung docs repo rieng: khong can lo ve conflict docs vs code
- Status.md: cap nhat tren main branch sau khi merge
