---
name: spec-writing
description: Hướng dẫn viết spec tổng thể và spec chi tiết cho module theo template 5 phần. Dùng khi team viết overview spec (aiteam-kickoff) hoặc module spec (aiteam-spec).
---

# Spec Writing

Viết spec cho dự án aiteam. Hai loại spec:
- **Overview spec**: kiến trúc tổng thể, chia modules, contracts → dùng trong `aiteam-kickoff`
- **Module spec**: chi tiết 5 sections cho từng module → dùng trong `aiteam-spec`

## Nguyên tắc

- **Spec là contract** — dev khác dựa vào spec để viết code tương tác
- **Cụ thể hơn chung chung** — "Xử lý nhanh" → "Response time < 200ms p95"
- **Diagram trước prose** — ít nhất 1 mermaid diagram mỗi spec
- **Test cases từ requirements** — mỗi requirement phải có ít nhất 1 test case

## Viết Overview Spec

Xem chi tiết: [references/overview-guide.md](references/overview-guide.md)

## Viết Module Spec (5 Sections)

Xem chi tiết: [references/module-guide.md](references/module-guide.md)

## Checklist tự kiểm tra

- [ ] Mọi user story có test case tương ứng
- [ ] Mọi interface EXPOSE/CONSUME khớp với contract files
- [ ] Có ít nhất 1 mermaid diagram
- [ ] Tasks đủ nhỏ (1-2 giờ mỗi task)
- [ ] Success criteria đo lường được
- [ ] Không có phần nào viết "TBD" hoặc để trống
- [ ] Scope nhất quán với overview.md

## Anti-patterns

- **Spec quá chung chung**: "Module xử lý authentication" — thiếu chi tiết
- **Copy-paste từ overview**: module spec phải chi tiết hơn, không phải lặp lại
- **Thiếu error handling**: chỉ mô tả happy path
- **Contract một chiều**: chỉ mô tả request, thiếu response và errors
