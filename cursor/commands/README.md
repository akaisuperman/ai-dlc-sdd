# Danh sách Lệnh AI-DLC

Thư mục này chứa tất cả các lệnh có thể sử dụng trong framework AI-DLC.

## Thiết lập

### `@aidlc-setup`
Thực hiện thiết lập ban đầu cho dự án.

## Giai đoạn Inception (Khởi tạo)

### `@aidlc-inception "<product-description>"`
Phân tách Intent thành User Stories và Units.

## Giai đoạn Construction (Xây dựng)

### `@aidlc-brownfield <existing-code-path>`
Chuyển đổi mã nguồn hiện có thành biểu diễn mô hình hoá cấp cao (dùng cho phát triển Brown-Field).

### `@aidlc-domain-model <unit-name>`
Tạo Domain Design cho Unit được chỉ định.

### `@aidlc-architecture <unit-name>`
Chuyển đổi Domain Design thành Logical Design và áp dụng các pattern kiến trúc để đáp ứng NFRs.

### `@aidlc-code-generation <unit-name>`
Sinh mã nguồn thực thi và unit test dựa trên Domain Model và Logical Design.

### `@aidlc-iac-apis <unit-name> [tool]`
Sinh Infrastructure as Code và REST API. `tool` có thể là `terraform`, `cdk`, hoặc `cloudformation`.

## Giai đoạn Operations (Vận hành)

### `@aidlc-deployment <unit-name> [environment]`
Đóng gói Deployment Units và triển khai đến môi trường được chỉ định (`staging` hoặc `production`).

### `@aidlc-monitoring <unit-name>`
Thiết lập giám sát, phân tích metrics và quản lý sự cố cho hệ thống đã triển khai.

## Chỉnh sửa & Cải thiện (Modification & Improvement)

### `@aidlc-modification "<new-requirement>"`
Khi phát sinh chỉnh sửa bổ sung hoặc thay đổi yêu cầu, phân tích tác động đến các artifact hiện có và lập kế hoạch chỉnh sửa.

### `@aidlc-refactor "<target>"`
Phân tích codebase và thiết kế hiện có, đề xuất và thực hiện tái cấu trúc.

## Vai trò Chuyên gia

Tuân theo best practice của tài liệu chính thức Cursor, thay vì gọi agent, các vai trò chuyên gia được thiết kế để thực hiện trực tiếp trong Commands.

Nhiều lệnh bao gồm các vai trò chuyên gia cụ thể:

- **`/aidlc-inception`**: Tạo kế hoạch triển khai với vai trò Chuyên gia Lập kế hoạch
- **`/aidlc-architecture`**: Thực hiện thiết kế kiến trúc với vai trò Kiến trúc sư
- **`/aidlc-code-generation`**: Đảm nhận nhiều vai trò - Chuyên gia TDD, Chuyên gia Xử lý Lỗi Build, Chuyên gia Review Mã nguồn, Chuyên gia Bảo mật
- **`/aidlc-code-review`**: Thực hiện review với vai trò Chuyên gia Review Mã nguồn
- **`/aidlc-security-review`**: Thực hiện review bảo mật với vai trò Chuyên gia Bảo mật
- **`/aidlc-build-fix`**: Sửa lỗi với vai trò Chuyên gia Xử lý Lỗi Build

Chi tiết xem tại [AGENTS.md](../AGENTS.md).

## Cách sử dụng

Mỗi lệnh có thể được thực thi bằng cách nhập ký hiệu `@` theo sau là tên lệnh trong chat của Cursor editor.

Ví dụ:
```
@aidlc-setup
@aidlc-inception "Phát triển engine đề xuất sản phẩm"
@aidlc-domain-model "Thuật toán đề xuất"
```

Chi tiết về từng lệnh, xem file `.md` tương ứng.

