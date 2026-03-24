# Viết Module Spec (5 Sections)

Hướng dẫn chi tiết viết spec cho 1 module (dùng trong `aiteam-spec`).

## Section 1: Overview & Requirements

1. Bắt đầu bằng 1-2 câu mô tả module làm gì
2. Liệt kê user stories: "Là [vai trò], tôi muốn [hành động] để [giá trị]"
3. Phân biệt rõ trong/ngoài phạm vi — liệt kê cụ thể những gì module KHÔNG làm
4. Tham chiếu overview.md để đảm bảo scope nhất quán

## Section 2: Architecture & Design

1. Vẽ component diagram (mermaid):
   - Components bên trong module
   - Kết nối với modules phụ thuộc (dùng tên đúng như overview.md)
   - Database/storage nếu có
2. Mô tả data models — entities, types, relationships
3. Mô tả luồng xử lý chính (lời hoặc sequence diagram)
4. Ghi công nghệ chọn dùng và lý do

## Section 3: Contracts & Dependencies

1. Liệt kê interfaces module EXPOSE — API mà modules khác gọi
2. Liệt kê interfaces module CONSUME — tham chiếu contract files
3. Dùng TypeScript interface hoặc pseudocode cho signatures
4. Mô tả error handling giữa modules — ai xử lý lỗi gì
5. Cross-check: mọi interface phải khớp với file contract tương ứng

## Section 4: Implementation Plan

1. Chia tasks sao cho mỗi task hoàn thành trong 1-2 giờ
2. Thứ tự: data models → business logic → API layer → tests
3. Đánh dấu task nào phụ thuộc task khác
4. Liệt kê rủi ro và biện pháp

## Section 5: Test Cases & Success Criteria

1. Với mỗi user story ở Section 1 → ít nhất 1 test case
2. Thêm edge cases: null/empty, boundary values, error scenarios
3. Integration tests: test tương tác qua contracts
4. Success criteria đo lường được, liên kết mục tiêu overview.md
5. Definition of Done: code, tests (>= 80%), review, docs
