---
module: <module-name>
reviewer: <auto-detect từ git config hoặc nhập thủ công>
review_type: cross | self | ai
review_date: YYYY-MM-DD
verdict: approved | needs-revision | blocked
---

# Review: <Module Name>

**Reviewer**: <auto-detect>
**Review type**: <cross | self | ai>
**Spec owner**: <owner-name>
**Ngày review**: YYYY-MM-DD

## Tóm tắt

<!-- 2-3 câu tóm tắt kết quả review -->

## Gaps (thiếu sót)

| # | Mô tả | Mức độ | Section liên quan |
|---|--------|--------|-------------------|
| 1 | ... | Critical / Important / Minor | Section X |

## Conflicts (mâu thuẫn)

| # | Mô tả | Mâu thuẫn với | Đề xuất giải quyết |
|---|--------|--------------|-------------------|
| 1 | ... | overview.md / module-x spec | ... |

## Contract Alignment

| Contract | Match? | Ghi chú |
|----------|--------|---------|
| module-a ↔ module-b | OK / Mismatch | ... |

## EST Review

<!-- Kiểm tra estimation có hợp lý không -->
- [ ] Tổng EST phù hợp với scope?
- [ ] Tasks có EST quá lạc quan?
- [ ] Tasks có EST quá bi quan?
- Nhận xét: ...

## Chất lượng Spec

- [ ] Section 1 (Overview) đầy đủ và rõ ràng
- [ ] Section 2 (Architecture) có diagram, data models
- [ ] Section 3 (Contracts) khớp với contract files
- [ ] Section 4 (Implementation Plan) tasks có EST, đủ nhỏ, có thứ tự
- [ ] Section 5 (Test Cases) cover requirements và edge cases
- [ ] Success Criteria đo lường được

## Verdict

<!-- approved | needs-revision | blocked -->

**Kết luận**: ...

### Điều kiện để approve (nếu needs-revision)
1. ...
2. ...
