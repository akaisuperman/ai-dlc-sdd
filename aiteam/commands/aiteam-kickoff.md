---
description: Cả team cùng viết spec tổng thể — chia modules, định nghĩa contracts
---

# aiteam-kickoff

Viết spec tổng thể cho dự án.

## Đọc trước

- Đọc skill `aiteam/skills/spec-writing/SKILL.md`
- Đọc `docs/specs/overview.md` hiện tại (nếu có)

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Vấn đề cần giải quyết là gì?
   - Mục tiêu cụ thể (3-5 mục tiêu đo lường được)
   - Phạm vi (trong/ngoài)
   - Ràng buộc kỹ thuật, business, thời gian

2. Đề xuất kiến trúc:
   - Đề xuất danh sách modules dựa trên phân tích domain
   - Vẽ component diagram (mermaid)
   - Xác định contracts giữa modules
   - Trình bày cho user duyệt, chỉnh sửa

3. Phân công:
   - Hỏi user phân công module cho ai
   - Gợi ý: module ít phụ thuộc → dễ bắt đầu sớm

4. Tạo artifacts:
   - Cập nhật `docs/specs/overview.md` theo template
   - Tạo contract files trong `docs/specs/contracts/` theo template `contract.md`
   - Ghi quyết định kiến trúc quan trọng vào `docs/decisions/`
   - Cập nhật `docs/status.md`

## Backward

Nếu phát hiện overview chưa đủ ở bước sau → quay lại chạy `aiteam-kickoff` cập nhật.

## Next

- Overview đã đủ → mỗi dev chạy `aiteam-spec` để viết spec module mình own
- Cần làm rõ thêm requirements → tiếp tục `aiteam-kickoff` với câu hỏi cụ thể
