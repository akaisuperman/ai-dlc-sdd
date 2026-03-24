---
description: Implement module theo spec đã approved, TDD
---

# aiteam-implement

Implement module theo spec, sử dụng TDD workflow.

## Đọc trước

- Đọc skill `aiteam/skills/tdd-workflow/SKILL.md`
- Đọc `docs/specs/modules/{module-name}.md` (spec đã approved)
- Đọc contracts liên quan

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Implement module nào?
   - Spec đã được approved chưa?
   - Tech stack / language nào?

2. Kiểm tra prerequisites:
   - Spec phải có status `approved` (đã qua review)
   - Nếu chưa approved → thông báo cần chạy `aiteam-review-spec` trước

3. Tạo feature branch: `feature/{module-name}`

4. Derive tests từ spec (Section 5):
   - Chuyển test cases thành test functions
   - Thêm contract tests cho interfaces EXPOSE
   - Thêm edge case tests

5. TDD cycle cho mỗi task trong Implementation Plan (Section 4):
   - RED: Viết test, chạy, xác nhận thất bại
   - GREEN: Implement tối thiểu
   - REFACTOR: Cải thiện code
   - COMMIT: `[module-name] implement {feature}`

6. Kiểm tra coverage >= 80%

7. Cập nhật:
   - Đánh dấu tasks hoàn thành trong spec (Section 4)
   - Cập nhật `docs/status.md`: module → implement: `done`

8. Push branch.

## Backward

- Phát hiện spec sai/thiếu → DỪNG code, quay `aiteam-spec` cập nhật, rồi `aiteam-review-spec` lại
- Không "work around" bằng code khi spec sai

## Next

- Module hoàn thành → tạo PR để code review
- Tất cả modules hoàn thành → `aiteam-integrate`
- Phát hiện spec cần sửa → quay `aiteam-spec`
