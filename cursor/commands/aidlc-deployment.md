# Lệnh AI-DLC Triển khai

## Tổng quan
Đóng gói Deployment Units và triển khai đến môi trường staging hoặc production.

## Cách sử dụng
```
@aidlc-deployment <unit-name> [environment]
```

Ví dụ:
```
@aidlc-deployment "Thuật toán đề xuất" staging
@aidlc-deployment "Thuật toán đề xuất" production
```

## Nội dung thực thi
1. Đóng gói Deployment Units
2. Xác minh cấu hình triển khai
3. Thực hiện triển khai
4. Xác minh sau triển khai

## Chỉ thị cho AI Agent

Bạn là Agent Triển khai (Kỹ sư DevOps).

### Bước 1: Tạo Kế hoạch
1. Tạo kế hoạch tại `aidlc-docs/plans/deployment_<unit-name>_<environment>_plan.md`
2. Bao gồm các bước:
   - [ ] Xác nhận Deployment Units
   - [ ] Xác minh cấu hình triển khai
   - [ ] Đóng gói
   - [ ] Thực hiện triển khai
   - [ ] Xác minh sau triển khai
3. Chờ phê duyệt từ người dùng

### Bước 2: Xác nhận Deployment Units
1. Kiểm tra các artifact sau:
   - Container image (nếu có)
   - Serverless function (nếu có)
   - Mã IaC
   - File cấu hình
2. Xác nhận tất cả dependency đã đầy đủ

### Bước 3: Xác minh Cấu hình Triển khai
1. Kiểm tra cài đặt biến môi trường
2. Kiểm tra cài đặt secret
3. Kiểm tra cấu hình mạng
4. Kiểm tra cấu hình bảo mật
5. Trình bày cấu hình cho người dùng và xin phê duyệt
6. **Chờ phê duyệt từ người dùng. Không tiến hành bước tiếp theo cho đến khi được phê duyệt.**
7. Sau khi nhận được phê duyệt hoặc chỉ thị sửa đổi, điều chỉnh cấu hình nếu cần và tiến hành bước tiếp theo

### Bước 4: Đóng gói
1. Build container image (nếu có)
2. Đóng gói serverless function (nếu có)
3. Bundle file cấu hình
4. Tạo deployment package

### Bước 5: Thực hiện Triển khai
1. Áp dụng IaC để triển khai hạ tầng
2. Triển khai ứng dụng
3. Ghi nhận log triển khai
4. Nếu có lỗi, dừng lại và báo cáo

### Bước 6: Xác minh Sau Triển khai
1. Thực hiện health check
2. Xác nhận tính khả dụng của endpoint
3. Chạy test chức năng cơ bản
4. Bắt đầu thu thập metrics
5. Tạo báo cáo xác minh

## Artifact
- `DEPLOYMENT/<unit-name>/packages/` - Deployment package
- `aidlc-docs/plans/deployment_<unit-name>_<environment>_plan.md` - Kế hoạch triển khai
- `aidlc-docs/plans/deployment_<unit-name>_<environment>_report.md` - Báo cáo triển khai

## Lưu ý
- **Quan trọng**: Khi mỗi bước cần phản hồi hoặc phê duyệt từ người dùng, BẮT BUỘC chờ phản hồi trước khi tiến hành bước tiếp theo. Không được tiến hành trước.
- Triển khai lên môi trường production cần đặc biệt thận trọng
- Chuẩn bị kế hoạch rollback
- Ghi nhận tất cả các bước

