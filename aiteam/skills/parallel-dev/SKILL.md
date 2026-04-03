---
name: parallel-dev
description: Multi-agent orchestration va parallel development. Worktree setup, conflict resolution, nhieu agents/devs lam song song.
---

# Parallel Development

Huong dan phat trien song song — nhieu devs hoac nhieu AI agents lam cung luc tren cac modules khac nhau.

## Khi nao dung

- Team co 2+ nguoi cung implement
- Muon chay nhieu AI agents song song (Cursor worktrees)
- Modules doc lap co the implement cung luc

## Setup Git Worktree

Xem chi tiet: [references/worktree-guide.md](references/worktree-guide.md)

## Nguyen tac

- **Module doc lap truoc** — implement modules khong co dependency truoc
- **Contract truoc implementation** — contracts phai agreed truoc khi bat dau song song
- **Khong sua contract don phuong** — thay doi contract can dong y cua ca 2 owners
- **Merge thuong xuyen** — tranh diverge qua lau giua cac branches
- **Status.md la nguon su that** — moi nguoi cap nhat status khi chuyen phase

## Conflict Resolution

1. Code conflict: rebase thuong xuyen, resolve som
2. Contract conflict: dung lai, thao luan, cap nhat contract truoc
3. Spec conflict: escalate len lead hoac chay aiteam-plan lai

## Anti-patterns

- **Silent contract change**: sua contract ma khong thong bao owner module khac
- **Merge bomb**: de accumulate changes qua lau roi merge 1 lan
- **Parallel cung 1 module**: 2 nguoi cung sua 1 module = conflict chac chan
