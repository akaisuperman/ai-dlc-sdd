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
   - Spec đã được approved chưa?
   - Tech stack / language / framework nào?
   - Test runner nào? (jest, vitest, phpunit, pytest...)

2. **Kiểm tra prerequisites**:
   - Spec phải có status `approved` (đã qua review)
   - Nếu chưa approved → thông báo cần chạy `aiteam-review` trước

3. **Tạo feature branch**: `feature/{module-name}`

4. **Khởi tạo module**:
   - Tạo cấu trúc thư mục theo Section 4 của spec
   - Setup test runner + config
   - Tạo file test đầu tiên (rỗng, chỉ để verify setup chạy được)

5. **TDD cycle** — lặp cho mỗi task trong Implementation Plan (Section 4):
   - Mở Section 5, chọn scenario(s) liên quan đến task hiện tại
   - **RED**: Chuyển scenario → test function, chạy, xác nhận FAIL
   - **GREEN**: Viết production code (models, services, controllers...) để test pass
   - **REFACTOR**: Cải thiện code, giữ tests pass
   - **COMMIT**: `[module-name] implement: {mô tả ngắn}`
   - Lặp lại cho scenario tiếp theo
   Mỗi cycle tạo ra cả test lẫn production code — không chỉ tests.

6. **Kiểm tra coverage** >= 80%
   - Nếu chưa đạt: thêm tests cho branches/paths chưa cover

7. **Integration tests** (nếu module có contracts):
   - Test tương tác qua contract interfaces
   - Mock modules phụ thuộc
   - Test error scenarios

8. **Cập nhật**:
   - Đánh dấu tasks hoàn thành trong spec (Section 4)
   - Đánh dấu scenarios đã pass trong spec (Section 5)
   - Cập nhật `docs/ai/status.md`: module → implement: `done`

9. **Push branch**, tạo PR.

## Backward

- Phát hiện spec sai/thiếu → **DỪNG code**, quay `aiteam-spec` cập nhật, rồi `aiteam-review` lại
- Phát hiện contract cần thay đổi → liên hệ owner module liên quan trước khi sửa
- Không "work around" bằng code khi spec sai

## Next

- Module hoàn thành → tạo PR, chạy `aiteam-review` để code review
- Cần thêm tests → `aiteam-test`
- Phát hiện spec cần sửa → quay `aiteam-spec`
- Gặp bug → `aiteam-fix` hoặc `aiteam-debug`
- Xem trạng thái tổng thể → `aiteam-status`
