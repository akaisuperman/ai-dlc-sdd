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

2. **Kiểm tra Cursor integration**:
   - Kiểm tra `.cursor/commands/` có chứa `aiteam-*.md` chưa
   - Kiểm tra `.cursor/rules/` có chứa `*.mdc` từ aiteam chưa
   - Nếu chưa → copy commands và rules vào `.cursor/`:
     ```bash
     mkdir -p .cursor/commands .cursor/rules
     cp aiteam/commands/*.md .cursor/commands/
     cp aiteam/rules/*.mdc .cursor/rules/
     ```

3. **Tạo cấu trúc docs**:
   ```
   docs/ai/
   ├── specs/
   │   ├── modules/
   │   └── contracts/
   ├── reviews/
   ├── decisions/
   └── status.md
   ```

4. Copy template `overview-spec.md` vào `docs/ai/specs/overview.md`

5. Copy template `status.md` vào `docs/ai/status.md`

6. Điền thông tin từ step 1 vào `overview.md` và `status.md`

7. Thông báo kết quả.

## Lưu ý

- Nếu thư mục `docs/ai/` đã tồn tại, hỏi trước khi ghi đè
- Không tạo file code nào — command này chỉ tạo docs structure

## Next

→ `aiteam-plan` để bắt đầu lên kế hoạch tổng thể
