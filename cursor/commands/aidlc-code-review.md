# Lệnh AI-DLC Review Mã nguồn

## Tổng quan
Review chất lượng, bảo mật và khả năng bảo trì của mã nguồn đã sinh.

## Cách sử dụng
```
/aidlc-code-review
```

Hoặc chỉ định file hoặc thư mục cụ thể:
```
/aidlc-code-review <file-path>
```

## Nội dung thực thi
1. Kiểm tra các thay đổi gần đây (git diff)
2. Thực hiện review với vai trò Chuyên gia Review Mã nguồn
3. Xác định vấn đề chất lượng, bảo mật, hiệu suất
4. Sinh đề xuất sửa lỗi
5. Tạo báo cáo review

## Chỉ thị cho AI Agent

Bạn hành động với vai trò Reviewer Mã nguồn Cấp cao, đảm bảo tiêu chuẩn cao về chất lượng và bảo mật mã nguồn.

### Vai trò Chuyên gia Review Mã nguồn
- Review chất lượng, bảo mật và khả năng bảo trì của mã nguồn đã sinh
- Xác định vấn đề chất lượng mã nguồn
- Xác định vấn đề hiệu suất
- Đề xuất best practice

### Bước 1: Kiểm tra Thay đổi
1. Chạy `git diff` để xem các thay đổi gần đây
2. Xác định các file đã thay đổi
3. Xác định phạm vi review
4. Tập trung vào các file đã thay đổi
5. Bắt đầu review ngay lập tức

### Bước 2: Thực hiện Review
1. Thực hiện review theo checklist:
   - Mã nguồn đơn giản và dễ đọc
   - Hàm và biến được đặt tên phù hợp
   - Không có mã nguồn trùng lặp
   - Xử lý lỗi phù hợp
   - Không rò rỉ thông tin bí mật hay API key
   - Xác thực đầu vào đã được triển khai
   - Độ bao phủ test tốt
   - Các vấn đề hiệu suất đã được xử lý
   - Độ phức tạp thời gian của thuật toán đã được phân tích
   - Giấy phép của thư viện tích hợp đã được xác nhận

### Bước 3: Trình bày Kết quả Review
1. Sắp xếp kết quả review:
   - **Critical (Bắt buộc sửa)**: Vấn đề bảo mật, bug nghiêm trọng
   - **Warning (Khuyến nghị sửa)**: Vấn đề chất lượng mã nguồn, vấn đề hiệu suất
   - **Suggestion (Xem xét cải thiện)**: Best practice, code style
2. Trình bày cách sửa cụ thể cho mỗi vấn đề
3. Trình bày kết quả review cho người dùng

### Bước 4: Chờ Phê duyệt
1. **Chờ phê duyệt hoặc chỉ thị từ người dùng. Không tiến hành bước tiếp theo cho đến khi nhận được phản hồi.**
2. Dựa trên chỉ thị từ người dùng, thực hiện sửa lỗi hoặc tiến hành giai đoạn tiếp theo

## Hạng mục Review

### Kiểm tra Bảo mật (Quan trọng)
- Thông tin xác thực hard-code (API key, mật khẩu, token)
- Rủi ro SQL Injection
- Lỗ hổng XSS
- Thiếu xác thực đầu vào
- Dependency không an toàn

### Chất lượng Mã nguồn (Cao)
- Hàm lớn (>50 dòng)
- File lớn (>800 dòng)
- Lồng sâu (>4 cấp)
- Thiếu xử lý lỗi
- Câu lệnh console.log
- Pattern thay đổi trực tiếp
- Thiếu test cho mã nguồn mới

### Hiệu suất (Trung bình)
- Thuật toán không hiệu quả
- Re-render không cần thiết
- Thiếu memoization
- Bundle size lớn
- Thiếu cache
- Truy vấn N+1

## Tiêu chí Phê duyệt

- ✅ **Phê duyệt**: Không có vấn đề CRITICAL hoặc HIGH
- ⚠️ **Cảnh báo**: Chỉ có vấn đề MEDIUM (có thể merge cẩn thận)
- ❌ **Chặn**: Tìm thấy vấn đề CRITICAL hoặc HIGH

## Artifact

- Báo cáo review (output console)
- Đề xuất sửa lỗi (nếu cần)

## Lưu ý

- **Quan trọng**: Khi mỗi bước cần phản hồi hoặc phê duyệt từ người dùng, BẮT BUỘC chờ phản hồi trước khi tiến hành bước tiếp theo. Không được tiến hành trước.
- Khuyến nghị tự động thực hiện review mã nguồn sau mỗi lần sinh
- Kết quả review cần được phê duyệt trước khi tiến hành giai đoạn tiếp theo
