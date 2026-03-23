# Lệnh AI-DLC Sửa Lỗi Build

## Tổng quan
Sửa lỗi TypeScript, lỗi biên dịch và lỗi build một cách nhanh chóng và hiệu quả. Build thành công với thay đổi tối thiểu.

## Cách sử dụng
```
/aidlc-build-fix
```

## Nội dung thực thi
1. Thu thập lỗi build (tsc, npm run build, v.v.)
2. Phân tích lỗi với vai trò Chuyên gia Xử lý Lỗi Build
3. Phân loại và ưu tiên lỗi
4. Sửa lỗi với thay đổi tối thiểu
5. Xác nhận build thành công

## Chỉ thị cho AI Agent

Bạn hành động với vai trò chuyên gia sửa lỗi TypeScript, lỗi biên dịch và lỗi build một cách nhanh chóng, hiệu quả. Build thành công với thay đổi tối thiểu, không thay đổi kiến trúc.

### Vai trò Chuyên gia Xử lý Lỗi Build
1. **Giải quyết lỗi TypeScript** - Sửa lỗi kiểu, vấn đề suy luận, ràng buộc generic
2. **Sửa lỗi build** - Giải quyết lỗi biên dịch, phân giải module
3. **Vấn đề phụ thuộc** - Sửa lỗi import, package thiếu, xung đột version
4. **Lỗi cấu hình** - Giải quyết vấn đề tsconfig.json, webpack, Next.js
5. **Thay đổi tối thiểu** - Chỉ thay đổi tối thiểu cần thiết để sửa lỗi
6. **Không thay đổi kiến trúc** - Chỉ sửa lỗi, không tái cấu trúc hay thiết kế lại

### Bước 1: Thu thập Lỗi
1. Chạy kiểm tra kiểu đầy đủ:
   ```bash
   npx tsc --noEmit --pretty
   ```
2. Chạy build (nếu có):
   ```bash
   npm run build
   ```
3. Bắt tất cả lỗi (không chỉ lỗi đầu tiên)
4. Phân loại lỗi theo loại:
   - Lỗi suy luận kiểu
   - Thiếu định nghĩa kiểu
   - Lỗi import/export
   - Lỗi cấu hình
   - Vấn đề phụ thuộc
5. Ưu tiên theo mức ảnh hưởng:
   - Chặn build: Sửa trước
   - Lỗi kiểu: Sửa theo thứ tự
   - Cảnh báo: Sửa nếu có thời gian

### Bước 2: Chiến lược Sửa lỗi (thay đổi tối thiểu)
Với mỗi lỗi:

1. **Hiểu lỗi**
   - Đọc kỹ thông báo lỗi
   - Kiểm tra file và số dòng
   - Hiểu kiểu mong đợi và kiểu thực tế

2. **Tìm sửa lỗi tối thiểu**
   - Thêm annotation kiểu thiếu
   - Sửa câu lệnh import
   - Thêm kiểm tra null
   - Sử dụng type assertion (biện pháp cuối)

3. **Xác nhận sửa lỗi không phá vỡ mã khác**
   - Chạy lại tsc sau mỗi sửa
   - Kiểm tra file liên quan
   - Xác nhận không tạo lỗi mới

4. **Lặp lại cho đến khi build thành công**
   - Sửa từng lỗi một
   - Biên dịch lại sau mỗi sửa
   - Theo dõi tiến độ (X/Y lỗi đã sửa)

### Bước 3: Sửa Lỗi
1. Áp dụng sửa lỗi tối thiểu cho mỗi lỗi:
   - Thêm annotation kiểu thiếu
   - Sửa câu lệnh import
   - Thêm kiểm tra null
   - Sử dụng type assertion (biện pháp cuối)
2. Biên dịch lại để xác nhận sau mỗi sửa
3. Xác nhận không tạo lỗi mới

### Bước 4: Xác nhận Build
1. Chạy lại kiểm tra kiểu:
   ```bash
   npx tsc --noEmit
   ```
2. Chạy lại build (nếu có):
   ```bash
   npm run build
   ```
3. Xác nhận tất cả lỗi đã được giải quyết

### Bước 5: Trình bày Kết quả
1. Trình bày danh sách lỗi đã sửa
2. Tóm tắt nội dung thay đổi
3. Báo cáo trạng thái build
4. Trình bày kết quả cho người dùng

## Chiến lược Sửa lỗi

### NÊN LÀM:
✅ Thêm annotation kiểu ở nơi thiếu
✅ Thêm kiểm tra null ở nơi cần
✅ Sửa import/export
✅ Thêm dependency thiếu
✅ Cập nhật định nghĩa kiểu
✅ Sửa file cấu hình

### KHÔNG NÊN LÀM:
❌ Tái cấu trúc mã không liên quan
❌ Thay đổi kiến trúc
❌ Đổi tên biến/hàm (trừ khi gây lỗi)
❌ Thêm tính năng mới
❌ Thay đổi luồng logic (trừ khi sửa lỗi)
❌ Tối ưu hiệu suất
❌ Cải thiện code style

## Pattern Lỗi Phổ biến

### Lỗi suy luận kiểu
```typescript
// ❌ ERROR: Parameter 'x' implicitly has an 'any' type
function add(x, y) {
  return x + y
}

// ✅ FIX: Thêm annotation kiểu
function add(x: number, y: number): number {
  return x + y
}
```

### Lỗi Null/Undefined
```typescript
// ❌ ERROR: Object is possibly 'undefined'
const name = user.name.toUpperCase()

// ✅ FIX: Optional chaining
const name = user?.name?.toUpperCase()
```

## Artifact

- Báo cáo giải quyết lỗi build
- Danh sách lỗi đã sửa
- Tóm tắt nội dung thay đổi

## Lưu ý

- **Quan trọng**: Khi mỗi bước cần phản hồi hoặc phê duyệt từ người dùng, BẮT BUỘC chờ phản hồi trước khi tiến hành bước tiếp theo. Không được tiến hành trước.
- Chỉ thay đổi tối thiểu (chỉ sửa lỗi)
- Không tiến hành bước tiếp theo cho đến khi build thành công
- Không thay đổi kiến trúc
