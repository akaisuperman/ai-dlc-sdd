---
description: Viết spec chi tiết cho module hoặc component
---

# aiteam-spec

Viết spec chi tiết cho module. Nếu module lớn, có thể viết thêm component specs.

## Đọc trước

- Đọc skill `aiteam/skills/spec-writing/SKILL.md`
- Đọc `docs/ai/specs/overview.md`
- Đọc contracts liên quan trong `docs/ai/specs/contracts/`

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Module nào cần viết spec?
   - Module lớn cần tách components không?
   - Có yêu cầu đặc biệt nào không?

2. Kiểm tra prerequisites:
   - `docs/ai/specs/overview.md` phải tồn tại
   - Module phải nằm trong danh sách modules của overview

3. Viết spec theo template `module-spec.md`, 5 sections:
   - **Section 1**: Overview & Requirements — derive từ overview.md
   - **Section 2**: Architecture & Design — component diagram, data models, flows
   - **Section 3**: Contracts & Dependencies — interfaces EXPOSE/CONSUME, cross-check contracts
   - **Section 4**: Implementation Plan — tasks có EST, thứ tự, rủi ro
   - **Section 5**: Acceptance Criteria & Test Scenarios — derive từ requirements

4. **EST cho mỗi task** — mỗi task trong Section 4 cần:
   - Tiêu đề task
   - EST (đơn vị: day hoặc hour)
   - Detail: liệt kê công việc cụ thể
   - Tổng EST cho module

5. Chạy self-check theo checklist trong skill `spec-writing`

6. Lưu spec:
   - Module spec → `docs/ai/specs/modules/{module-name}.md`
   - Component specs (nếu có) → `docs/ai/specs/modules/{module-name}/components/{component}.md`

7. Cập nhật `docs/ai/status.md`: module → spec: `draft`

## Backward

- Overview chưa đề cập module này → quay `aiteam-plan` cập nhật overview
- Contracts thiếu → quay `aiteam-plan` thêm contracts

## Next

- Spec hoàn thành → chạy `aiteam-review` để review spec
- Phát hiện overview cần sửa → quay `aiteam-plan`
