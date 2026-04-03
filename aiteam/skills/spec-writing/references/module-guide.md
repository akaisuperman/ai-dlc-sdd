# Viết Module Spec (5 Sections)

Hướng dẫn chi tiết viết spec cho 1 module.

## Section 1: Overview & Requirements

1. Bắt đầu bằng 1-2 câu mô tả module làm gì
2. Liệt kê user stories: "Là [vai trò], tôi muốn [hành động] để [giá trị]"
3. Phân biệt rõ trong/ngoài phạm vi
4. Tham chiếu overview.md để đảm bảo scope nhất quán

## Section 2: Architecture & Design

1. Vẽ component diagram (mermaid):
   - Components bên trong module
   - Kết nối với modules phụ thuộc
   - Database/storage nếu có
2. Mô tả data models — entities, types, relationships
3. Mô tả luồng xử lý chính (lời hoặc sequence diagram)
4. Ghi công nghệ chọn dùng và lý do
5. Nếu module lớn: liệt kê components và đánh giá có cần spec riêng không

## Section 3: Contracts & Dependencies

1. Liệt kê interfaces module EXPOSE
2. Liệt kê interfaces module CONSUME — tham chiếu contract files
3. Dùng TypeScript interface hoặc pseudocode cho signatures
4. Mô tả error handling giữa modules
5. Cross-check: mọi interface phải khớp với file contract tương ứng

## Section 4: Implementation Plan

1. Chia tasks sao cho mỗi task hoàn thành trong 1-2 giờ
2. Mỗi task phải có EST:

```markdown
#### Task N: Tên task
**EST**: X day
**Detail**:
- Công việc cụ thể 1
- Công việc cụ thể 2
```

3. Ghi tổng EST cuối section
4. Thứ tự: data models → business logic → API layer → tests
5. Đánh dấu task nào phụ thuộc task khác
6. Liệt kê rủi ro và biện pháp

### Nguyên tắc EST

- **Đơn vị**: day (0.5d, 1d, 2d) hoặc hour (2h, 4h)
- **Bao gồm**: cả viết test lẫn implement (TDD cycle)
- **Buffer**: thêm 20-30% cho integration và unexpected issues
- **Review EST khi scope thay đổi**: ghi vào EST Change Log

### EST Change Log

Khi scope thay đổi (thêm requirement, phát hiện complexity mới):

```markdown
| Ngày | Thay đổi | Task ảnh hưởng | EST cũ | EST mới | Lý do |
|------|----------|----------------|--------|---------|-------|
| 2026-04-01 | Thêm rate limiting | Task 4 | 1d | 1.5d | Yêu cầu mới |
| 2026-04-02 | Task mới: Cache | Task 9 (mới) | - | 0.5d | Performance |
```

## Section 5: Test Cases & Success Criteria

1. Với mỗi user story ở Section 1 → ít nhất 1 test case
2. Thêm edge cases: null/empty, boundary values, error scenarios
3. Integration tests: test tương tác qua contracts
4. Success criteria đo lường được, liên kết mục tiêu overview.md
5. Definition of Done: code, tests (>= 80%), review, docs
