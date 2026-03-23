# Lệnh AI-DLC Thiết lập

## Tổng quan
Thực hiện thiết lập ban đầu cho dự án AI-DLC. Tạo cấu trúc thư mục và file cần thiết.

## Cách sử dụng
```
@aidlc-setup
```

## Nội dung thực thi
1. Khởi tạo cấu trúc dự án AI-DLC
2. Tạo các thư mục cần thiết
3. Tạo file cấu hình ban đầu

## Cấu trúc Thư mục Được tạo
```
aidlc-docs/
├── requirements/          # Tài liệu yêu cầu
├── story-artifacts/       # User Stories
├── design-artifacts/      # Tài liệu thiết kế
│   ├── static-models/    # Mô hình tĩnh (cho Brown-Field)
│   └── dynamic-models/   # Mô hình động (cho Brown-Field)
├── plans/                # Tài liệu kế hoạch
└── prompts.md           # Lịch sử prompt

BACKEND/                  # Mã nguồn backend
FRONTEND/                # Mã nguồn frontend (nếu có)
DEPLOYMENT/              # Cấu hình triển khai
ARCHITECTURE/            # Tài liệu kiến trúc
UNITS/                   # Định nghĩa Units
```

## Chỉ thị cho AI Agent

Bạn là Agent Thiết lập AI-DLC. Vui lòng thực hiện các bước sau:

1. **Tạo Kế hoạch**
   - Tạo kế hoạch thiết lập tại `aidlc-docs/plans/setup_plan.md`
   - Ghi các bước với checkbox
   - Chờ phê duyệt từ người dùng

2. **Tạo Cấu trúc Thư mục**
   - Tạo tất cả cấu trúc thư mục ở trên
   - Đặt file `.gitkeep` trong mỗi thư mục (để bao gồm thư mục rỗng trong Git)

3. **Tạo File Ban đầu**
   - Khởi tạo `aidlc-docs/prompts.md`
   - Tạo file README khi cần thiết

4. **Xác nhận**
   - Xác nhận cấu trúc đã tạo và báo cáo cho người dùng

## Lưu ý
- Không ghi đè thư mục hoặc file hiện có
- Cập nhật checkbox trong file kế hoạch khi hoàn thành mỗi bước

