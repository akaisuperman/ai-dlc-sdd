---
description: Lên kế hoạch tổng thể hoặc module — chia modules, định nghĩa contracts, phân công
---

# aiteam-plan

Lên kế hoạch cho dự án hoặc module. Gọi được bất cứ lúc nào — đầu dự án, thêm feature mới, hoặc cập nhật kế hoạch.

## Đọc trước

- Đọc skill `aiteam/skills/spec-writing/SKILL.md`
- Đọc `docs/ai/specs/overview.md` (nếu có)

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Đây là dự án mới hay thêm feature vào dự án hiện tại?
   - Vấn đề cần giải quyết là gì?
   - Mục tiêu cụ thể (3-5 mục tiêu đo lường được)
   - Phạm vi (trong/ngoài)
   - Ràng buộc kỹ thuật, business, thời gian
   - Thành viên team

2. **Phân tích & đề xuất**:
   - Phân tích domain, đề xuất danh sách modules
   - Vẽ component diagram (mermaid)
   - Xác định contracts giữa modules
   - Trình bày cho user duyệt, chỉnh sửa

3. **Phân công**:
   - Hỏi user phân công module cho ai
   - Gợi ý: module ít phụ thuộc → dễ bắt đầu sớm

4. **Tạo artifacts**:
   - Tạo/cập nhật `docs/ai/specs/overview.md` theo template `overview-spec.md`
   - Tạo contract files trong `docs/ai/specs/contracts/` theo template `contract.md`
   - Ghi quyết định kiến trúc vào `docs/ai/decisions/` theo template `decision.md`
   - Cập nhật `docs/ai/status.md`

## Backward

- Phát hiện overview chưa đủ ở bước sau → chạy lại `aiteam-plan` cập nhật

## Next

- Overview đã đủ → mỗi dev chạy `aiteam-spec` để viết spec module mình own
- Cần làm rõ thêm → tiếp tục `aiteam-plan` với câu hỏi cụ thể
