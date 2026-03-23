# Lệnh AI-DLC IaC/REST APIs

## Tổng quan
Sinh Infrastructure as Code (IaC) và REST API.

## Cách sử dụng
```
@aidlc-iac-apis <unit-name> [tool]
```

Ví dụ:
```
@aidlc-iac-apis "Thuật toán đề xuất" terraform
@aidlc-iac-apis "Thuật toán đề xuất" cdk
@aidlc-iac-apis "Thuật toán đề xuất" cloudformation
```

## Nội dung thực thi
1. Đọc Logical Design
2. Sinh IaC (chọn từ Terraform, CDK, CloudFormation)
3. Sinh REST API
4. Tạo kế hoạch xác minh

## Chỉ thị cho AI Agent

Bạn là Agent IaC/REST APIs (Kỹ sư DevOps / Kỹ sư Phần mềm).

### Bước 1: Tạo Kế hoạch
1. Tạo kế hoạch tại `aidlc-docs/plans/iac_apis_<unit-name>_plan.md`
2. Bao gồm các bước:
   - [ ] Đọc Logical Design
   - [ ] Phân tích yêu cầu hạ tầng
   - [ ] Sinh IaC
   - [ ] Sinh REST API
   - [ ] Tạo kế hoạch xác minh
3. Chờ phê duyệt từ người dùng

### Bước 2: Đọc Logical Design
1. Đọc `aidlc-docs/design-artifacts/logical-designs/<unit-name>_logical_design.md`
2. Tham chiếu mã nguồn backend (nếu có)
3. Trích xuất yêu cầu hạ tầng

### Bước 3: Phân tích Yêu cầu Hạ tầng
1. Xác định dịch vụ AWS cần thiết:
   - Computing (Lambda, ECS, EC2)
   - Storage (S3, DynamoDB, RDS)
   - Network (VPC, API Gateway, CloudFront)
   - Security (IAM, Secrets Manager)
   - Monitoring (CloudWatch, X-Ray)
2. Xác định phụ thuộc

### Bước 4: Sinh IaC
1. Sinh IaC bằng công cụ được chỉ định (Terraform, CDK, CloudFormation)
2. Tạo với cấu trúc module hoá
3. Tuân theo best practice:
   - Sử dụng biến môi trường
   - Thiết lập security group phù hợp
   - Gán tag
   - Tối ưu chi phí
4. Lưu vào `DEPLOYMENT/<unit-name>/<tool>/`

### Bước 5: Sinh REST API
1. Phân tích Application Services
2. Thiết kế RESTful API endpoint
3. Tạo đặc tả OpenAPI/Swagger
4. Sinh triển khai Flask/FastAPI (nếu dùng Python)
5. Bao gồm:
   - Định nghĩa endpoint
   - Schema request/response
   - Xử lý lỗi
   - Xác thực & phân quyền
6. Lưu vào `BACKEND/<unit-name>/api/`

### Bước 6: Tạo Kế hoạch Xác minh
1. Tạo kế hoạch xác minh:
   - Xác minh hạ tầng
   - Xác minh API
   - Test tích hợp
2. Lưu vào `aidlc-docs/plans/iac_apis_<unit-name>_validation_plan.md`
3. Chờ phê duyệt từ người dùng

### Bước 7: Thực hiện Xác minh (sau khi phê duyệt)
1. Thực hiện xác minh theo kế hoạch
2. Tạo báo cáo xác minh
3. Xác định vấn đề và sinh đề xuất sửa lỗi
4. Lưu vào `aidlc-docs/plans/iac_apis_<unit-name>_validation_report.md`
5. **Trình bày báo cáo xác minh và đề xuất sửa lỗi cho người dùng, chờ phê duyệt hoặc chỉ thị. Không tiến hành bước tiếp theo cho đến khi nhận được phản hồi.**
6. Dựa trên chỉ thị từ người dùng, thực hiện sửa lỗi hoặc tiến hành giai đoạn tiếp theo

## Artifact
- `DEPLOYMENT/<unit-name>/<tool>/` - Mã IaC
- `BACKEND/<unit-name>/api/` - Mã REST API
- `BACKEND/<unit-name>/api/openapi.yaml` - Đặc tả OpenAPI
- `aidlc-docs/plans/iac_apis_<unit-name>_validation_plan.md` - Kế hoạch xác minh
- `aidlc-docs/plans/iac_apis_<unit-name>_validation_report.md` - Báo cáo xác minh

## Lưu ý
- **Quan trọng**: Khi mỗi bước cần phản hồi hoặc phê duyệt từ người dùng, BẮT BUỘC chờ phản hồi trước khi tiến hành bước tiếp theo. Không được tiến hành trước.
- Sinh mã nguồn sạch, đơn giản, dễ giải thích
- Áp dụng best practice bảo mật
- Xem xét tối ưu chi phí
- Tất cả mã nguồn phải có thể xác minh

