---
name: cross-review
description: Hướng dẫn review chéo spec giữa các dev trong team. Dùng khi dev review spec module của dev khác (aiteam-review-spec), tập trung vào contracts alignment, completeness, và conflicts.
---

# Cross Review

Review chéo spec module do dev khác viết. Tập trung vào contracts match, completeness, và conflicts.

## Nguyên tắc

- **Review spec, không phải code** — logic, contracts, completeness
- **Đặt câu hỏi, không phải chỉ trích** — "Nên thêm xử lý timeout?" thay vì "Thiếu"
- **Cross-check contracts là quan trọng nhất** — contracts phải match giữa spec của bạn và module đang review
- **Góc nhìn người dùng contract** — bạn sẽ gọi API này, spec có đủ rõ để implement?

## Quy trình

Xem chi tiết: [references/review-process.md](references/review-process.md)

## Mức độ findings

| Mức độ | Khi nào | Ví dụ |
|--------|---------|-------|
| **Critical** | Chặn implement, phải sửa | Contract mismatch, thiếu error handling |
| **Important** | Nên sửa trước implement | Thiếu edge case tests, ambiguity |
| **Minor** | Có thể sửa sau | Typo, formatting, suggestion |

## Anti-patterns

- **Rubber stamp**: approve mà không đọc kỹ
- **Scope creep**: đề xuất thêm feature — ghi vào câu hỏi mở, không block
- **Rewrite**: viết lại spec theo ý mình — review, không phải rewrite
- **Chỉ nhìn happy path**: bỏ qua error scenarios và edge cases
