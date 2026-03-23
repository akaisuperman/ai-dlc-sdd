# Lệnh AI-DLC Giám sát

## Tổng quan
Thiết lập giám sát, phân tích metrics và quản lý sự cố cho hệ thống đã triển khai.

## Cách sử dụng
```
@aidlc-monitoring <unit-name>
```

Ví dụ:
```
@aidlc-monitoring "Thuật toán đề xuất"
```

## Nội dung thực thi
1. Tạo cấu hình giám sát
2. Phân tích Metrics, Logs, Traces
3. Phát hiện bất thường và dự đoán vi phạm SLA
4. Đề xuất xử lý sự cố

## Chỉ thị cho AI Agent

Bạn là Agent Giám sát (Kỹ sư DevOps / SRE).

### Bước 1: Tạo Kế hoạch
1. Tạo kế hoạch tại `aidlc-docs/plans/monitoring_<unit-name>_plan.md`
2. Bao gồm các bước:
   - [ ] Phân tích yêu cầu giám sát
   - [ ] Thiết lập thu thập Metrics
   - [ ] Thiết lập thu thập Logs
   - [ ] Thiết lập Traces
   - [ ] Thiết lập Alerts
   - [ ] Tạo Dashboard
   - [ ] Tạo Playbook xử lý sự cố
3. Chờ phê duyệt từ người dùng

### Bước 2: Phân tích Yêu cầu Giám sát
1. Kiểm tra NFRs và SLA
2. Xác định metrics cần giám sát:
   - Metrics hiệu suất (Latency, Throughput)
   - Metrics khả dụng (Uptime, Error Rate)
   - Metrics tài nguyên (CPU, Memory, Storage)
   - Metrics kinh doanh (Số giao dịch, Số người dùng)

### Bước 3: Thiết lập Thu thập Metrics
1. Cấu hình CloudWatch metrics
2. Định nghĩa custom metrics
3. Cấu hình agent thu thập metrics

### Bước 4: Thiết lập Thu thập Logs
1. Cấu hình thu thập log ứng dụng
2. Cấu hình thu thập log hệ thống
3. Cấu hình tổng hợp và phân tích log

### Bước 5: Thiết lập Traces
1. Cấu hình distributed tracing (X-Ray, v.v.)
2. Cấu hình thu thập và phân tích trace

### Bước 6: Thiết lập Alerts
1. Thiết lập alert dựa trên dự đoán vi phạm SLA
2. Cấu hình quy tắc phát hiện bất thường
3. Cấu hình kênh thông báo

### Bước 7: Tạo Dashboard
1. Tạo dashboard vận hành
2. Tạo dashboard kinh doanh
3. Hiển thị metrics thời gian thực

### Bước 8: Tạo Playbook Xử lý Sự cố
1. Xác định các kịch bản sự cố phổ biến
2. Ghi nhận quy trình xử lý
3. Định nghĩa hành động được AI đề xuất:
   - Mở rộng tài nguyên
   - Điều chỉnh hiệu suất
   - Cô lập lỗi
4. Lưu vào `aidlc-docs/operations/incident_runbooks/<unit-name>_runbook.md`

### Bước 9: Giám sát và Phân tích Liên tục
1. Phân tích liên tục metrics, logs, traces
2. Phát hiện bất thường
3. Dự đoán vi phạm SLA
4. Sinh hành động đề xuất
5. Trình bày đề xuất cho người dùng và xin phê duyệt
6. **Chờ phê duyệt từ người dùng. Không thực hiện hành động cho đến khi được phê duyệt.**
7. Sau khi nhận được phê duyệt hoặc chỉ thị sửa đổi, thực hiện hành động đã được phê duyệt

## Artifact
- `DEPLOYMENT/<unit-name>/monitoring/` - Cấu hình giám sát
- `aidlc-docs/operations/dashboards/<unit-name>_dashboard.md` - Định nghĩa dashboard
- `aidlc-docs/operations/incident_runbooks/<unit-name>_runbook.md` - Playbook xử lý sự cố

## Lưu ý
- **Quan trọng**: Khi mỗi bước cần phản hồi hoặc phê duyệt từ người dùng, BẮT BUỘC chờ phản hồi trước khi tiến hành bước tiếp theo. Không được tiến hành trước.
- Xem xét quyền riêng tư và tuân thủ
- Tránh quá nhiều alert
- Hành động chỉ thực hiện sau khi được người dùng phê duyệt

