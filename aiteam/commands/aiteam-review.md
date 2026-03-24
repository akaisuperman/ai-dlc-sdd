---
description: Review chéo spec — dev A review spec của dev B trước khi implement
---

# aiteam-review

Review chéo spec module do dev khác viết. Tập trung vào contracts match, completeness, và conflicts.

## Đọc trước

- Đọc skill `aiteam/skills/cross-review/SKILL.md`

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Review spec module nào?
   - Bạn own module nào? (để cross-check contracts)

2. **Đọc context**:
   - `docs/ai/specs/overview.md`
   - `docs/ai/specs/modules/{module-name}.md` (spec cần review)
   - Contracts liên quan trong `docs/ai/specs/contracts/`
   - Spec module mà reviewer own

3. **Review** theo skill `cross-review`:
   - Kiểm tra completeness (5 sections)
   - Kiểm tra contracts alignment (quan trọng nhất)
   - Kiểm tra conflicts với overview và modules khác
   - Phân loại findings: Critical / Important / Minor

4. Viết review theo template `review.md`

5. Lưu review vào `docs/ai/reviews/{module-name}.md`

6. Cập nhật `docs/ai/status.md`: module → review status

## Backward

- needs-revision → owner chạy `aiteam-spec` sửa rồi submit review lại
- blocked (contract conflict) → chạy `aiteam-plan` cập nhật contracts

## Next

- **approved** → owner chạy `aiteam-implement`
- **needs-revision** → owner chạy `aiteam-spec` sửa, rồi review lại
- **blocked** → escalate cho cả team, có thể cần `aiteam-plan`
