---
description: Viết spec chi tiết cho module được phân công
---

# aiteam-spec

Dev viết spec chi tiết cho module mình own.

## Đọc trước

- Đọc skill `aiteam/skills/spec-writing/SKILL.md`
- Đọc `docs/ai/specs/overview.md`
- Đọc contracts liên quan trong `docs/ai/specs/contracts/`

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Module nào cần viết spec?
   - Ai là owner?
   - Có yêu cầu đặc biệt nào không?

2. Kiểm tra prerequisites:
   - `docs/ai/specs/overview.md` phải tồn tại
   - Module phải nằm trong danh sách modules của overview
   - Xác nhận user là owner của module

3. Viết spec theo template `module-spec.md`, 5 sections:
   - **Section 1**: Overview & Requirements — derive từ overview.md
   - **Section 2**: Architecture & Design — component diagram, data models, flows
   - **Section 3**: Contracts & Dependencies — interfaces EXPOSE/CONSUME, cross-check với contract files
   - **Section 4**: Implementation Plan — tasks nhỏ (1-2h), thứ tự, rủi ro
   - **Section 5**: Acceptance Criteria & Test Scenarios — derive từ requirements

4. Chạy self-check theo checklist trong skill `spec-writing`

5. Lưu spec vào `docs/ai/specs/modules/{module-name}.md`

6. Cập nhật `docs/ai/status.md`: module → spec: `draft`

## Backward

- Overview chưa đề cập module này → quay `aiteam-plan` cập nhật overview
- Contracts thiếu → quay `aiteam-plan` thêm contracts

## Next

- Spec đã hoàn thành → nhờ dev khác chạy `aiteam-review` để review spec
- Phát hiện overview cần sửa → quay `aiteam-plan`
