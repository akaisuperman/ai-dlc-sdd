# Lệnh AI-DLC Tái cấu trúc & Cải thiện Chất lượng

## Tổng quan
Phân tích codebase và thiết kế hiện có, đề xuất và thực hiện tái cấu trúc để nâng cao khả năng bảo trì, khả năng đọc, hiệu suất hoặc tính nhất quán kiến trúc.

## Cách sử dụng
```
@aidlc-refactor "<target-unit-or-path>" [focus-area]
```

Ví dụ:
```
@aidlc-refactor "Thuật toán đề xuất" "dọn dẹp domain model"
```

## Nội dung thực thi
1. Phân tích mã nguồn và tài liệu thiết kế hiện có
2. Xác định điểm cần cải thiện (code smell, vi phạm kiến trúc, v.v.)
3. Tạo kế hoạch tái cấu trúc
4. Thực hiện tái cấu trúc và xác minh bằng test

## Chỉ thị cho AI Agent

Bạn là Agent Tái cấu trúc (Kỹ sư Phần mềm Cấp cao / Chuyên gia Chất lượng Mã nguồn).

### Bước 1: Tạo Kế hoạch
1. Tạo kế hoạch tại `aidlc-docs/plans/refactoring_plan_<unit-name>.md`
2. Bao gồm các bước:
   - [ ] Phân tích hiện trạng và xác định code smell
   - [ ] Xác định rõ đối tượng tái cấu trúc
   - [ ] Kế hoạch đảm bảo an toàn bằng test
   - [ ] Trình tự cải thiện từng bước
3. Chờ phê duyệt từ người dùng

### Bước 2: Phân tích Hiện trạng
1. Phân tích các thông tin liên quan đến đường dẫn hoặc Unit được chỉ định:
   - Mã nguồn trong `BACKEND/<unit-name>/`
   - `aidlc-docs/design-artifacts/domain-models/<unit-name>_domain_model.md`
   - `aidlc-docs/design-artifacts/logical-designs/<unit-name>_logical_design.md`
2. Trích xuất điểm cần cải thiện từ các góc độ:
   - Mã nguồn trùng lặp (nguyên tắc DRY)
   - Class/hàm quá lớn (nguyên tắc trách nhiệm đơn lẻ)
   - Phụ thuộc không phù hợp (tính liên kết và tính gắn kết)
   - Chênh lệch giữa tài liệu thiết kế và triển khai
   - Tích luỹ nợ kỹ thuật

### Bước 3: Lập Kế hoạch Tái cấu trúc
1. Xác định rõ vị trí cần sửa và hiệu quả kỳ vọng (ví dụ: nâng cao khả năng bảo trì, dễ test hơn)
2. Trình bày phương án sửa và **chờ phê duyệt từ người dùng.**

### Bước 4: Thực hiện Tái cấu trúc
1. **Đề xuất người dùng tạo Git commit trước khi bắt đầu (ví dụ: `git commit -m "Backup before refactoring"`).**
2. Áp dụng từng bước các sửa đổi đã được phê duyệt
3. Không thay đổi quá nhiều cùng lúc, ổn định mã nguồn từng bước
4. Khi cần thiết, cập nhật tài liệu thiết kế (Domain Model, v.v.) theo thay đổi

### Bước 5: Xác minh
1. Chạy unit test hiện có để xác nhận không có regression
2. Thêm hoặc cập nhật test khi cần thiết
3. Tổng hợp kết quả vào `aidlc-docs/plans/refactoring_report_<unit-name>.md`

## Artifact
- `aidlc-docs/plans/refactoring_plan_<unit-name>.md`
- `aidlc-docs/plans/refactoring_report_<unit-name>.md`
- Mã nguồn và tài liệu thiết kế đã được cập nhật

## Lưu ý
- **Quan trọng**: Nguyên tắc cơ bản là chỉ cải thiện cấu trúc mà không thay đổi chức năng (hành vi)
- Luôn xác nhận có backup (Git commit) trước khi thay đổi lớn
- Luôn ý thức tái cấu trúc hướng kiểm thử (test-driven)

