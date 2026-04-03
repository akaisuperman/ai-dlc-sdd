---
description: Implement module theo spec đã approved, dùng TDD cycle
---

# aiteam-implement

Implement module theo spec, sử dụng TDD workflow.

## Đọc trước

- Đọc skill `aiteam/skills/tdd-workflow/SKILL.md`
- Đọc `docs/ai/specs/modules/{module-name}.md` (spec đã approved)
- Đọc contracts liên quan trong `docs/ai/specs/contracts/`

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Implement module nào?
   - Spec đã được approved chưa? (nếu chưa → thông báo cần `aiteam-review` trước)
   - Tech stack / language / framework nào?
   - Test runner nào? (jest, vitest, phpunit, pytest...)

2. **Tạo feature branch**: `feature/{module-name}`

3. **Khởi tạo module**:
   - Tạo cấu trúc thư mục theo Section 4 của spec
   - Setup test runner + config
   - Tạo file test đầu tiên (rỗng, verify setup chạy được)

4. **TDD cycle** — lặp cho mỗi task trong Implementation Plan (Section 4):
   - Mở Section 5, chọn scenario(s) liên quan đến task hiện tại
   - **RED**: Chuyển scenario → test function, chạy, xác nhận FAIL
   - **GREEN**: Viết production code để test pass
   - **REFACTOR**: Cải thiện code, giữ tests pass
   - **COMMIT**: `[module-name] implement: {mô tả ngắn}`
   - Lặp lại cho scenario tiếp theo

5. **Kiểm tra coverage** >= 80%
   - Nếu chưa đạt: thêm tests cho branches/paths chưa cover

6. **Integration tests** (nếu module có contracts):
   - Test tương tác qua contract interfaces
   - Mock modules phụ thuộc
   - Test error scenarios

7. **Cập nhật**:
   - Đánh dấu tasks hoàn thành trong spec (Section 4)
   - Đánh dấu scenarios đã pass trong spec (Section 5)
   - Cập nhật `docs/ai/status.md`: module → implement: `done`

8. **Push branch**, tạo PR.

## Backward

- Phát hiện spec sai/thiếu → **DỪNG code**, quay `aiteam-spec` cập nhật, rồi `aiteam-review` lại
- Phát hiện contract cần thay đổi → liên hệ owner module liên quan trước khi sửa
- Không "work around" bằng code khi spec sai

## Next

- Module hoàn thành → tạo PR, chạy `aiteam-review-code`
- Cần thêm tests → `aiteam-test`
- Phát hiện spec cần sửa → quay `aiteam-spec`
- Gặp bug → `aiteam-fix` hoặc `aiteam-debug`
