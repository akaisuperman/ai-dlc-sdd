# Quy tắc AI-DLC (Rules)

Thư mục này chứa các hướng dẫn phải luôn tuân thủ trong framework AI-DLC.

## Danh sách Quy tắc

### security.mdc
Hướng dẫn bảo mật. Cấm hard-code thông tin bí mật, xác thực đầu vào, phòng chống SQL Injection, v.v.

### testing.mdc
Yêu cầu kiểm thử. Độ bao phủ tối thiểu 80%, quy trình TDD, định nghĩa các loại kiểm thử.

### performance.mdc
Tối ưu hiệu suất. Chiến lược chọn model, quản lý cửa sổ ngữ cảnh, thực thi tác vụ song song.

### coding-style.mdc
Phong cách lập trình. Tính bất biến (Immutability), cấu trúc file, xử lý lỗi, xác thực đầu vào.

## Định dạng File

Tuân theo tài liệu chính thức của Cursor, tất cả file quy tắc sử dụng định dạng `.mdc` (Markdown with frontmatter).

Mỗi file chứa các frontmatter sau:
- `description`: Mô tả quy tắc
- `globs`: Pattern file áp dụng (tuỳ chọn)
- `alwaysApply`: Luôn áp dụng hay không (tuỳ chọn)
- `type`: Loại quy tắc (always | auto | agent-requested | manual)

## Cách sử dụng

Các quy tắc này được tự động đọc trong Cursor editor, và tất cả Commands cùng AI Agent đều tuân theo.

## Tích hợp AI-DLC

Mỗi quy tắc được tích hợp với các giai đoạn cụ thể của AI-DLC:

- **Giai đoạn Construction**: Tất cả quy tắc được áp dụng khi sinh mã nguồn
- **Lệnh Code Generation**: Xác nhận mã nguồn đã sinh tuân thủ tất cả quy tắc
- **Commands**: Tất cả Commands tham chiếu các quy tắc này và tuân thủ khi thực hiện vai trò chuyên gia

## Tuỳ chỉnh

Có thể tuỳ chỉnh các quy tắc này theo yêu cầu riêng của dự án.
