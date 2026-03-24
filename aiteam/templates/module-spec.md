---
module: <module-name>
owner: <developer-name>
status: draft | in-review | approved | implementing | done
depends_on: []
last_updated: YYYY-MM-DD
---

# Module: <Tên Module>

## 1. Overview & Requirements

### Mục đích
<!-- Module này làm gì, giải quyết phần nào của bài toán tổng thể -->

### User Stories liên quan
<!-- Liệt kê user stories mà module này đáp ứng -->
- Là [vai trò], tôi muốn [hành động] để [giá trị]

### Phạm vi
- **Trong phạm vi**: ...
- **Ngoài phạm vi**: ...

## 2. Architecture & Design

### Component Diagram

```mermaid
graph TD
    subgraph module [Module Name]
        ComponentA[Component A]
        ComponentB[Component B]
    end
    ExternalDep[Module phụ thuộc] --> ComponentA
    ComponentA --> ComponentB
    ComponentB --> DB[(Database)]
```

### Data Models
<!-- Mô tả entities, schemas, relationships -->

### Luồng xử lý chính
<!-- Mô tả các flow quan trọng, có thể dùng sequence diagram -->

### Công nghệ & Lý do
<!-- Công nghệ cụ thể cho module này và lý do chọn -->

## 3. Contracts & Dependencies

### Interfaces module này EXPOSE (cho modules khác dùng)
<!-- API endpoints, events, shared types mà module này cung cấp -->

```typescript
// Ví dụ interface
interface IModuleNameService {
  methodA(param: TypeA): Promise<ResultA>
  methodB(param: TypeB): Promise<ResultB>
}
```

### Interfaces module này CONSUME (từ modules khác)
<!-- Liệt kê và tham chiếu đến contract files -->
- `module-x`: sử dụng `methodY()` — xem `contracts/module-x--module-name.md`

### Error Handling giữa modules
<!-- Cách xử lý khi module phụ thuộc lỗi -->

## 4. Implementation Plan

### Tasks
<!-- Mỗi task là 1 cặp: viết test trước → implement → refactor (TDD cycle) -->
<!-- Chia nhỏ thành tasks có thể hoàn thành trong 1-2 giờ -->
- [ ] Task 1: Khởi tạo cấu trúc module + setup test runner
- [ ] Task 2: Data models — test schema/validation → implement models
- [ ] Task 3: Contract interfaces — test EXPOSE signatures → implement stubs
- [ ] Task 4: Business logic — test core behaviors → implement logic
- [ ] Task 5: API/integration layer — test endpoints/connectors → implement layer
- [ ] Task 6: Error handling — test edge cases/failures → implement error paths
- [ ] Task 7: Integration tests — test tương tác qua contracts
- [ ] Task 8: Documentation

### Thứ tự ưu tiên
<!-- Task nào làm trước, task nào phụ thuộc task khác -->

### Rủi ro & Biện pháp
| Rủi ro | Mức độ | Biện pháp |
|--------|--------|-----------|
| ... | Cao/Trung bình/Thấp | ... |

## 5. Acceptance Criteria & Test Scenarios

<!-- Section này định nghĩa WHAT cần đúng, không phải HOW test.
     Khi implement (aiteam-implement), dev sẽ chọn từng scenario → viết test → implement → refactor (TDD cycle). -->

### Behavior Scenarios
<!-- Mô tả behavior mong đợi — dev sẽ chuyển thành test khi implement -->
- [ ] Scenario: [mô tả hành vi] — expected: [kết quả]
- [ ] Scenario: [edge case] — expected: [kết quả]
- [ ] Scenario: [error case] — expected: [kết quả]

### Integration Scenarios
<!-- Behavior khi tương tác với modules khác qua contracts -->
- [ ] Scenario: [mô tả flow] — expected: [kết quả]

### Success Criteria
<!-- Đo lường được, liên kết với mục tiêu trong overview.md -->
- [ ] Criteria 1: ...
- [ ] Criteria 2: ...

### Definition of Done
- [ ] Tất cả scenarios ở trên đã có test và pass
- [ ] Unit test coverage >= 80%
- [ ] Integration tests pass
- [ ] Code đã được review (PR approved)
- [ ] Documentation đã cập nhật
- [ ] Không có lỗi CRITICAL từ review
