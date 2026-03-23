# Lệnh AI-DLC Review Bảo mật

## Tổng quan
Thực hiện review bảo mật toàn diện cho mã nguồn, cấu hình và dependency, xác định OWASP Top 10 và các vấn đề bảo mật phổ biến.

## Cách sử dụng
```
/aidlc-security-review
```

Hoặc chỉ định file hoặc thư mục cụ thể:
```
/aidlc-security-review <file-path>
```

## Nội dung thực thi
1. Chạy công cụ bảo mật tự động (npm audit, eslint-plugin-security, v.v.)
2. Thực hiện review với vai trò Chuyên gia Bảo mật
3. Phân tích OWASP Top 10
4. Phát hiện pattern lỗ hổng
5. Tạo báo cáo review bảo mật

## Chỉ thị cho AI Agent

Bạn hành động với vai trò chuyên gia xác định và sửa lỗ hổng bảo mật trong ứng dụng Web. Thực hiện review bảo mật toàn diện cho mã nguồn, cấu hình và dependency để ngăn chặn vấn đề bảo mật trước khi đến môi trường production.

### Vai trò Chuyên gia Bảo mật
- Xác định OWASP Top 10 và các vấn đề bảo mật phổ biến
- Phát hiện API key, mật khẩu, token được hard-code
- Xác nhận tất cả đầu vào từ người dùng được sanitize đúng cách
- Xác minh kiểm soát truy cập phù hợp
- Kiểm tra package npm có lỗ hổng
- Bắt buộc pattern lập trình an toàn

### Bước 1: Quét Ban đầu
1. Chạy công cụ bảo mật tự động:
   - `npm audit` (lỗ hổng dependency)
   - `eslint-plugin-security` (vấn đề mã nguồn)
   - `grep` (thông tin bí mật hard-code)
   - Kiểm tra biến môi trường bị lộ
2. Ghi nhận kết quả quét

### Bước 2: Review Khu vực Rủi ro Cao
1. Review trọng tâm các khu vực sau:
   - Mã xác thực/phân quyền
   - API endpoint nhận đầu vào người dùng
   - Truy vấn database
   - Handler upload file
   - Xử lý thanh toán
   - Handler Webhook

### Bước 3: Thực hiện Phân tích OWASP Top 10
1. Kiểm tra từng danh mục:
   1. **Injection** (SQL, NoSQL, Command)
   2. **Xác thực không đúng cách**
   3. **Rò rỉ dữ liệu nhạy cảm**
   4. **XML External Entity (XXE)**
   5. **Kiểm soát truy cập không đúng cách**
   6. **Cấu hình bảo mật không đúng cách**
   7. **Cross-Site Scripting (XSS)**
   8. **Deserialization không an toàn**
   9. **Sử dụng component có lỗ hổng đã biết**
   10. **Ghi log và giám sát không đầy đủ**
2. Phát hiện pattern lỗ hổng:
   - Thông tin bí mật hard-code (CRITICAL)
   - SQL Injection (CRITICAL)
   - Lỗ hổng XSS (HIGH)

### Bước 4: Trình bày Kết quả Review
1. Sắp xếp kết quả review:
   - **Critical Issues**: Cần sửa ngay lập tức
   - **High Issues**: Sửa trước khi lên production
   - **Medium Issues**: Sửa nếu có thể
   - **Low Issues**: Xem xét sửa
2. Trình bày cách sửa cụ thể cho mỗi vấn đề
3. Kiểm tra checklist bảo mật
4. Trình bày kết quả review cho người dùng

### Bước 5: Chờ Phê duyệt
1. **Chờ phê duyệt hoặc chỉ thị từ người dùng. Không tiến hành bước tiếp theo cho đến khi nhận được phản hồi.**
2. Nếu có vấn đề CRITICAL, không tiến hành giai đoạn tiếp theo cho đến khi sửa xong
3. Dựa trên chỉ thị từ người dùng, thực hiện sửa lỗi hoặc tiến hành giai đoạn tiếp theo

## Phân tích OWASP Top 10

1. **Injection** (SQL, NoSQL, Command)
2. **Xác thực không đúng cách**
3. **Rò rỉ dữ liệu nhạy cảm**
4. **XML External Entity (XXE)**
5. **Kiểm soát truy cập không đúng cách**
6. **Cấu hình bảo mật không đúng cách**
7. **Cross-Site Scripting (XSS)**
8. **Deserialization không an toàn**
9. **Sử dụng component có lỗ hổng đã biết**
10. **Ghi log và giám sát không đầy đủ**

## Checklist Bảo mật

- [ ] Không có thông tin bí mật hard-code
- [ ] Tất cả đầu vào đã được xác thực
- [ ] Phòng chống SQL Injection
- [ ] Phòng chống XSS
- [ ] Bảo vệ CSRF
- [ ] Yêu cầu xác thực
- [ ] Phân quyền đã được xác minh
- [ ] Rate limit đã được kích hoạt
- [ ] HTTPS được bắt buộc
- [ ] Security header đã được thiết lập
- [ ] Dependency đã được cập nhật
- [ ] Không có package có lỗ hổng
- [ ] Log đã được sanitize
- [ ] Thông báo lỗi an toàn

## Artifact

- Báo cáo review bảo mật
- Danh sách lỗ hổng và đề xuất sửa lỗi
- Kết quả checklist bảo mật

## Lưu ý

- **Quan trọng**: Khi mỗi bước cần phản hồi hoặc phê duyệt từ người dùng, BẮT BUỘC chờ phản hồi trước khi tiến hành bước tiếp theo. Không được tiến hành trước.
- Nếu tìm thấy vấn đề CRITICAL, dừng ngay lập tức và đề xuất sửa lỗi
- Review bảo mật phải được thực hiện trước khi triển khai
- Kết quả review cần được phê duyệt trước khi tiến hành giai đoạn tiếp theo
