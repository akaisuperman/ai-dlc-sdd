---
description: Xem trạng thái team và auto-detect phase hiện tại
---

# aiteam-status

Xem trạng thái dự án, module, và đề xuất bước tiếp theo.

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Xem status tổng thể hay module cụ thể?

2. **Auto-detect trạng thái**:
   - Resolve `<aiteam-dir>` là thư mục chứa `AGENTS.md` trong project (thường `aiteam/`)
   - Chạy `<aiteam-dir>/scripts/check-status.sh` để scan trạng thái từ file system
   - Nếu script không tồn tại → đọc thủ công ở step 3

3. **Đọc trạng thái thủ công** (nếu cần):
   - Đọc `docs/ai/status.md`
   - Đọc `docs/ai/specs/overview.md` (danh sách modules)
   - Scan `docs/ai/specs/modules/` → modules nào có spec
   - Scan `docs/ai/reviews/` → modules nào đã review

4. **Hiển thị**:
   - Bảng trạng thái: mỗi module → spec / review / implement
   - Blockers & risks hiện tại
   - Quyết định gần đây (từ `docs/ai/decisions/`)

5. **Đề xuất next steps**:
   - Module chưa có spec → `aiteam-spec`
   - Spec xong chưa review → `aiteam-review`
   - Review approved chưa implement → `aiteam-implement`
   - Implement xong → push PR, `aiteam-review-code`
   - Tất cả modules xong → integration test

6. **Cập nhật** `docs/ai/status.md` nếu có thay đổi.

## Next

- Theo đề xuất ở step 5 — command phù hợp với trạng thái hiện tại
