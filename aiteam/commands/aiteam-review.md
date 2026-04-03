---
description: Review spec — cross-review, self-review, hoặc AI review
---

# aiteam-review

Review spec module. Hỗ trợ nhiều hình thức: cross-review (người khác review), self-review, hoặc AI review.

## Đọc trước

- Đọc skill `aiteam/skills/cross-review/SKILL.md`

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Review spec module nào?
   - Hình thức review: cross-review / self-review / AI review?

2. **Tự động xác định reviewer**:
   - Lấy từ git config: `git config user.name`
   - Nếu không có → hỏi tên reviewer
   - Ghi nhận `review_type`: `cross` | `self` | `ai`

3. **Đọc context**:
   - `docs/ai/specs/overview.md`
   - `docs/ai/specs/modules/{module-name}.md` (spec cần review)
   - Contracts liên quan trong `docs/ai/specs/contracts/`
   - Component specs nếu có: `docs/ai/specs/modules/{module-name}/components/`

4. **Review** theo skill `cross-review`:
   - Kiểm tra completeness (5 sections)
   - Kiểm tra contracts alignment
   - Kiểm tra EST hợp lý (có quá lạc quan hoặc quá bi quan?)
   - Kiểm tra conflicts với overview và modules khác
   - Phân loại findings: Critical / Important / Minor

5. Viết review theo template `review.md`

6. Lưu review vào `docs/ai/reviews/{module-name}__{reviewer}__{date}.md`
   - Cho phép nhiều reviews trên cùng module

7. Cập nhật `docs/ai/status.md`: module → review status

## Backward

- needs-revision → chạy `aiteam-spec` sửa rồi submit review lại
- blocked (contract conflict) → chạy `aiteam-plan` cập nhật contracts

## Next

- **approved** → chạy `aiteam-implement`
- **needs-revision** → chạy `aiteam-spec` sửa, rồi review lại
- **blocked** → escalate, có thể cần `aiteam-plan`
