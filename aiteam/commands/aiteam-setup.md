---
description: Khởi tạo cấu trúc thư mục và files ban đầu cho dự án
---

# aiteam-setup

Khởi tạo cấu trúc dự án cho workflow team.

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Tên dự án
   - Danh sách thành viên team
   - Mô tả ngắn gọn dự án

2. Tạo cấu trúc thư mục:
   ```
   docs/
   ├── specs/
   │   ├── modules/
   │   └── contracts/
   ├── reviews/
   ├── decisions/
   └── status.md
   ```

3. Copy template `overview-spec.md` vào `docs/specs/overview.md`

4. Copy template `status.md` vào `docs/status.md`

5. Điền thông tin từ step 1 vào `overview.md` và `status.md`

6. Copy `aiteam/rules/*.mdc` vào `.cursor/rules/` (nếu chưa có)

7. Thông báo kết quả.

## Lưu ý

- Nếu thư mục `docs/` đã tồn tại, hỏi trước khi ghi đè
- Không tạo file code nào — command này chỉ tạo docs structure

## Next

→ `aiteam-plan` để bắt đầu lên kế hoạch tổng thể
