---
name: spec-writing
description: Viết spec tổng thể và spec chi tiết cho module/component. Dùng trong aiteam-plan (overview) và aiteam-spec (module).
---

# Spec Writing

Viết spec cho dự án. Ba loại spec:
- **Overview spec**: kiến trúc tổng thể, chia modules, contracts, EST tổng
- **Module spec**: chi tiết 5 sections cho từng module, EST cho mỗi task
- **Component spec** (tùy chọn): chi tiết cho component trong module lớn

## Nguyên tắc

- **Spec là contract** — người khác dựa vào spec để viết code tương tác
- **Cụ thể hơn chung chung** — "Xử lý nhanh" thành "Response time < 200ms p95"
- **Diagram trước prose** — ít nhất 1 mermaid diagram mỗi spec
- **Test cases từ requirements** — mỗi requirement phải có ít nhất 1 test case
- **EST là bắt buộc** — mỗi task cần estimation, tổng EST ghi trong frontmatter

## Viết Overview Spec

Xem chi tiết: [references/overview-guide.md](references/overview-guide.md)

## Viết Module Spec (5 Sections)

Xem chi tiết: [references/module-guide.md](references/module-guide.md)

## Checklist tự kiểm tra

- [ ] Mọi user story có test case tương ứng
- [ ] Mọi interface EXPOSE/CONSUME khớp với contract files
- [ ] Có ít nhất 1 mermaid diagram
- [ ] Tasks đủ nhỏ (1-2 giờ mỗi task)
- [ ] Mỗi task có EST (estimation)
- [ ] Tổng EST ghi trong frontmatter
- [ ] Success criteria đo lường được
- [ ] Không có phần nào viết "TBD" hoặc để trống
- [ ] Scope nhất quán với overview.md
- [ ] Nếu module lớn: đã xem xét tách components

## Anti-patterns

- **Spec quá chung chung**: "Module xử lý authentication" — thiếu chi tiết
- **Copy-paste từ overview**: module spec phải chi tiết hơn, không phải lặp lại
- **Thiếu error handling**: chỉ mô tả happy path
- **Contract một chiều**: chỉ mô tả request, thiếu response và errors
- **Thiếu EST**: tasks không có estimation — khó tracking tiến độ
