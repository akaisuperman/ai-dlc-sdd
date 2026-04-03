---
name: cross-review
description: Review spec module. Ho tro cross-review, self-review, va AI review. Dung trong aiteam-review.
---

# Spec Review

Review spec module. Ho tro nhieu hinh thuc review.

## Hinh thuc review

| Type | Khi nao | Mo ta |
|------|---------|-------|
| **cross** | Team co nhieu nguoi | Nguoi khac review spec cua ban |
| **self** | Solo dev hoac team nho | Tu review spec cua minh |
| **ai** | Bat ky luc nao | AI agent review |

## Nguyen tac

- **Review spec, khong phai code** — logic, contracts, completeness, EST
- **Dat cau hoi, khong phai chi trich** — "Nen them xu ly timeout?" thay vi "Thieu"
- **Cross-check contracts la quan trong nhat** — contracts phai match
- **Kiem tra EST** — estimation co hop ly khong? qua lac quan hay bi quan?
- **Goc nhin nguoi dung contract** — ban se goi API nay, spec co du ro de implement?

## Quy trinh

Xem chi tiet: [references/review-process.md](references/review-process.md)

## Muc do findings

| Muc do | Khi nao | Vi du |
|--------|---------|-------|
| **Critical** | Chan implement, phai sua | Contract mismatch, thieu error handling |
| **Important** | Nen sua truoc implement | Thieu edge case tests, ambiguity, EST khong hop ly |
| **Minor** | Co the sua sau | Typo, formatting, suggestion |

## Anti-patterns

- **Rubber stamp**: approve ma khong doc ky
- **Scope creep**: de xuat them feature — ghi vao cau hoi mo, khong block
- **Rewrite**: viet lai spec theo y minh — review, khong phai rewrite
- **Chi nhin happy path**: bo qua error scenarios va edge cases
- **Bo qua EST**: khong kiem tra estimation co hop ly khong
