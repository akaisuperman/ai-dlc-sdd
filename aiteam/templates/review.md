---
module: <module-name>
reviewer: <developer-name>
review_date: YYYY-MM-DD
verdict: approved | needs-revision | blocked
---

# Review: <Module Name>

**Reviewer**: <developer-name>
**Spec owner**: <owner-name>
**Ngày review**: YYYY-MM-DD

## Tóm tắt

<!-- 2-3 câu tóm tắt kết quả review -->

## Gaps (thiếu sót)

<!-- Những phần spec chưa đề cập hoặc chưa đủ chi tiết -->

| # | Mô tả | Mức độ | Section liên quan |
|---|--------|--------|-------------------|
| 1 | ... | Critical / Important / Minor | Section 2 |

## Conflicts (mâu thuẫn)

<!-- Mâu thuẫn với overview spec, với modules khác, hoặc nội bộ spec -->

| # | Mô tả | Mâu thuẫn với | Đề xuất giải quyết |
|---|--------|--------------|-------------------|
| 1 | ... | overview.md / module-x spec | ... |

## Contract Alignment

<!-- Kiểm tra contracts match giữa module này và các modules phụ thuộc -->

| Contract | Match? | Ghi chú |
|----------|--------|---------|
| module-a ↔ module-b | OK / Mismatch | ... |

## Chất lượng Spec

- [ ] Section 1 (Overview) đầy đủ và rõ ràng
- [ ] Section 2 (Architecture) có diagram, data models
- [ ] Section 3 (Contracts) khớp với contract files
- [ ] Section 4 (Implementation Plan) tasks đủ nhỏ, có thứ tự
- [ ] Section 5 (Test Cases) cover requirements và edge cases
- [ ] Success Criteria đo lường được

## Verdict

<!-- approved | needs-revision | blocked -->

**Kết luận**: ...

### Điều kiện để approve (nếu needs-revision)
<!-- Liệt kê cụ thể những gì cần sửa -->

1. ...
2. ...
