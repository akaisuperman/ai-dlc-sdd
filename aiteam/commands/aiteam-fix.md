---
description: Fix bug hoặc build error — phân tích và sửa với diff tối thiểu
---

# aiteam-fix

Fix bug hoặc build error. Tập trung sửa nhanh, diff tối thiểu, không refactor kiến trúc.

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Lỗi gì? (error message, log, screenshot)
   - File/module nào liên quan?
   - Có spec cho module này không?
   - Lỗi xảy ra khi nào? (build, runtime, test)

2. **Phân loại**:
   - **Build error** → đọc error log, fix compilation/type errors
   - **Test failure** → đọc test output, fix implementation (không fix test trừ khi test sai)
   - **Runtime bug** → reproduce, tìm root cause, fix

3. **Fix**:
   - Sửa với diff tối thiểu — không refactor, không thêm feature
   - Chạy tests sau khi fix
   - Nếu fix yêu cầu thay đổi lớn → thông báo, đề xuất chạy `aiteam-implement` thay vì fix

4. **Commit**: `[module-name] fix: mô tả ngắn`

## Backward

- Root cause nằm ở spec sai → dừng fix, chạy `aiteam-spec` cập nhật spec trước
- Root cause nằm ở contract mismatch → chạy `aiteam-plan` cập nhật contracts

## Next

- Fix xong → chạy `aiteam-test` nếu cần thêm test coverage
- Fix xong → push, tạo PR nếu đã đủ
