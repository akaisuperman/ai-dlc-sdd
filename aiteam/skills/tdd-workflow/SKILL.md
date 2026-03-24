---
name: tdd-workflow
description: Quy trình implement module theo spec đã approved, kết hợp spec-driven acceptance criteria với TDD cycle. Dùng khi dev implement module (aiteam-implement).
---

# TDD Workflow

Implement module theo spec đã approved, dùng TDD cycle cho từng behavior.

## Mô hình: Spec-Driven + TDD

Aiteam kết hợp hai kỹ thuật:

1. **Spec-driven**: Section 5 của module spec định nghĩa acceptance criteria (behavior scenarios) — **WHAT** cần đúng
2. **TDD cycle**: Khi implement, dev chọn **từng scenario** → viết test → implement → refactor — **HOW** xây dựng code

Spec **không** viết sẵn test code. Spec mô tả **behavior mong đợi**, dev chuyển thành test trong lúc implement.

## Nguyên tắc

- **Scenario → Test → Code** — chọn 1 scenario từ spec, viết test cho nó, implement vừa đủ
- **Red → Green → Refactor** — mỗi scenario qua 1 TDD cycle
- **Commit mỗi Green** — mỗi cycle thành công = 1 commit nhỏ
- **Contract tests ưu tiên** — test interfaces EXPOSE trước vì modules khác phụ thuộc

## Quy trình chi tiết

Xem: [references/tdd-cycle.md](references/tdd-cycle.md)

## Thứ tự implement khuyến nghị

1. **Data models / Types** — foundation
2. **Contract interfaces** — để modules khác mock
3. **Business logic** — core functionality
4. **API / Integration layer** — kết nối bên ngoài
5. **Error handling** — edge cases và failure scenarios

## Anti-patterns

- **Viết hết tests rồi mới implement**: mất tính incremental của TDD, khó debug khi nhiều tests fail cùng lúc
- **Test implementation details**: test internal state → dễ vỡ khi refactor
- **Skip refactor**: Red-Green mà không Refactor → technical debt
- **Commit lớn**: gom nhiều scenarios → khó revert, khó review
- **Implement khác spec**: không cập nhật spec → mất đồng bộ giữa doc và code
