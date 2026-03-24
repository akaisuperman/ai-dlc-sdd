---
name: tdd-workflow
description: Quy trình Test-Driven Development khi implement module theo spec. Dùng khi dev implement module (aiteam-implement), bao gồm derive tests từ spec, Red-Green-Refactor cycle, và coverage check.
---

# TDD Workflow

Test-Driven Development cho modules theo spec đã approved.

## Nguyên tắc

- **Test từ spec, không từ code** — test cases đã có sẵn trong Section 5 của module spec
- **Red → Green → Refactor** — viết test thất bại trước, implement tối thiểu, cải thiện
- **Commit thường xuyên** — mỗi Green cycle = 1 commit
- **Contract tests ưu tiên** — test interfaces EXPOSE trước, modules khác phụ thuộc vào đó

## Quy trình

Xem chi tiết: [references/tdd-cycle.md](references/tdd-cycle.md)

## Thứ tự implement khuyến nghị

1. **Data models / Types** — foundation
2. **Contract interfaces** — để modules khác mock
3. **Business logic** — core functionality
4. **API / Integration layer** — kết nối bên ngoài
5. **Error handling** — edge cases và failure scenarios

## Anti-patterns

- **Test sau code**: test chỉ confirm code hiện tại, không catch bugs
- **Test quá chi tiết**: test implementation details → dễ vỡ khi refactor
- **Skip refactor**: Red-Green mà không Refactor → technical debt
- **Commit lớn**: gom nhiều features → khó revert, khó review
- **Ignore spec**: implement khác spec mà không cập nhật → mất đồng bộ
