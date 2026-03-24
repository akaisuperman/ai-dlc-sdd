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
<!-- Chia nhỏ thành tasks có thể hoàn thành trong 1-2 giờ -->
- [ ] Task 1: Khởi tạo cấu trúc module
- [ ] Task 2: Implement data models
- [ ] Task 3: Implement business logic
- [ ] Task 4: Implement API/interface layer
- [ ] Task 5: Viết unit tests
- [ ] Task 6: Viết integration tests
- [ ] Task 7: Documentation

### Thứ tự ưu tiên
<!-- Task nào làm trước, task nào phụ thuộc task khác -->

### Rủi ro & Biện pháp
| Rủi ro | Mức độ | Biện pháp |
|--------|--------|-----------|
| ... | Cao/Trung bình/Thấp | ... |

## 5. Test Cases & Success Criteria

### Unit Tests
<!-- Derive từ requirements ở Section 1 -->
- [ ] Test: [mô tả behavior] — expected: [kết quả]
- [ ] Test: [edge case] — expected: [kết quả]
- [ ] Test: [error case] — expected: [kết quả]

### Integration Tests
<!-- Test tương tác với modules khác qua contracts -->
- [ ] Test: [mô tả flow] — expected: [kết quả]

### Success Criteria
<!-- Đo lường được, liên kết với mục tiêu trong overview.md -->
- [ ] Criteria 1: ...
- [ ] Criteria 2: ...

### Definition of Done
- [ ] Code đã implement đầy đủ theo spec
- [ ] Unit test coverage >= 80%
- [ ] Integration tests pass
- [ ] Code đã được review
- [ ] Documentation đã cập nhật
- [ ] Không có lỗi CRITICAL từ review
