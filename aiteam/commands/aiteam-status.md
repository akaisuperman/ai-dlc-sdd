---
description: Xem trạng thái team và auto-detect phase hiện tại
---

# aiteam-status

Xem trạng thái dự án, module, và đề xuất bước tiếp theo.

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Xem status tổng thể hay module cụ thể?

2. **Đọc trạng thái**:
   - Đọc `docs/status.md`
   - Đọc `docs/specs/overview.md` (danh sách modules)
   - Scan `docs/specs/modules/` → modules nào có spec
   - Scan `docs/reviews/` → modules nào đã review
   - Nếu có `scripts/check-status.sh` → chạy để auto-detect

3. **Hiển thị**:
   - Bảng trạng thái: mỗi module → spec / review / implement / integrate
   - Blockers & risks hiện tại
   - Quyết định gần đây (từ `docs/decisions/`)

4. **Đề xuất next steps**:
   - Module chưa có spec → `aiteam-spec`
   - Spec xong chưa review → `aiteam-review`
   - Review approved chưa implement → `aiteam-implement`
   - Implement xong → push PR, `aiteam-review` code
   - Tất cả modules xong → integration test

5. **Cập nhật** `docs/status.md` nếu có thay đổi.

## Next

- Theo đề xuất ở step 4 — command phù hợp với trạng thái hiện tại
