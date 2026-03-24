---
name: code-review
description: Review code quality, security, và alignment với spec/design. Dùng khi dev review code trên PR hoặc trước khi push (aiteam-review mode code).
---

# Code Review

Review code trước khi merge. Tập trung vào quality, security, và spec alignment.

## Nguyên tắc

- **Review code, không rewrite** — gợi ý cải thiện, không viết lại
- **Spec alignment trước** — code có đúng với spec không?
- **Security không nhượng bộ** — hardcoded secrets, SQL injection, XSS = blocking
- **Tests đi kèm** — code mới phải có tests

## Checklist nhanh

- [ ] Code align với spec (Section 1-3 của module spec)?
- [ ] Không có hardcoded secrets/credentials?
- [ ] Input validation cho user input?
- [ ] Error handling đầy đủ (không swallow errors)?
- [ ] Không có `console.log` / debug code còn sót?
- [ ] Functions nhỏ (< 50 dòng)?
- [ ] Tests cover behavior chính + edge cases?
- [ ] Coverage >= 80%?
- [ ] Commit messages đúng format `[module-name] mô tả`?

## Quy trình chi tiết

Xem: [references/review-checklist.md](references/review-checklist.md)

## Mức độ findings

| Mức độ | Khi nào | Ví dụ |
|--------|---------|-------|
| **Blocking** | Phải sửa trước merge | Security issue, logic sai, thiếu error handling |
| **Important** | Nên sửa | Naming không rõ, thiếu tests cho edge case |
| **Nice-to-have** | Có thể sửa sau | Style preference, suggestion |

## Anti-patterns

- **Nitpicking**: chỉ comment style mà bỏ qua logic
- **Rubber stamp**: approve không đọc kỹ
- **Scope creep**: yêu cầu thêm feature trong review
- **Chỉ happy path**: bỏ qua error handling và edge cases
