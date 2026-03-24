# Quy trình Review Chéo

## Bước 1: Đọc context

1. Đọc `docs/specs/overview.md` — hiểu module nằm ở đâu trong hệ thống
2. Đọc spec cần review: `docs/specs/modules/{module-name}.md`
3. Đọc contracts liên quan: `docs/specs/contracts/`
4. Đọc spec module mình own (để cross-check contracts)

## Bước 2: Kiểm tra Completeness

**Section 1 (Overview)**:
- Mục đích rõ ràng? Đọc xong biết module làm gì?
- User stories đầy đủ? Có thiếu flow nào?
- Phạm vi nhất quán với overview.md?

**Section 2 (Architecture)**:
- Có diagram không? Diagram rõ ràng?
- Data models đủ chi tiết để implement?
- Luồng xử lý cover cả error path?

**Section 3 (Contracts)**:
- Interface signatures rõ ràng (params, return types, errors)?
- Khớp với contract files?
- Error handling giữa modules rõ ràng — ai xử lý lỗi gì?

**Section 4 (Implementation Plan)**:
- Tasks đủ nhỏ (1-2 giờ)?
- Thứ tự hợp lý? Dependencies rõ ràng?
- Có rủi ro chưa được đề cập?

**Section 5 (Test Cases)**:
- Mỗi user story có test case?
- Edge cases: null, empty, boundary, error?
- Success criteria đo lường được?

## Bước 3: Kiểm tra Contracts (quan trọng nhất)

1. Mở spec module bạn own
2. Tìm tất cả chỗ module bạn tương tác với module đang review
3. So sánh:
   - Interface signatures match? (params, return types)
   - Error codes match?
   - Data format match?
4. Nếu mismatch → ghi vào "Contract Alignment" trong review

## Bước 4: Kiểm tra Conflicts

1. So sánh với overview.md — có mâu thuẫn không?
2. So sánh với spec modules khác — overlap hoặc conflict?
3. Kiểm tra giả định — module giả định điều gì chưa xác nhận?

## Bước 5: Viết Review

1. Dùng template `review.md`
2. Phân loại findings: Critical / Important / Minor
3. Đưa verdict: approved / needs-revision / blocked
4. Nếu needs-revision: liệt kê cụ thể điều kiện để approve
