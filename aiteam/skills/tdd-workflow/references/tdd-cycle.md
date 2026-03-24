# TDD Cycle Chi tiết

## Bước 1: Chuẩn bị

1. Đọc module spec: `docs/specs/modules/{module-name}.md`
2. Đọc contracts liên quan: `docs/specs/contracts/`
3. Tạo feature branch: `feature/{module-name}`
4. Khởi tạo cấu trúc module + setup test runner

## Bước 2: TDD Cycle — lặp cho từng task trong Implementation Plan

Mỗi task trong Section 4 đã là một cặp scenario + implement. Với mỗi task:

### 2.1 Chọn scenario

Mở Section 5 (Acceptance Criteria), chọn scenario liên quan đến task hiện tại.

### 2.2 RED — Viết test, xác nhận thất bại

Chuyển scenario thành test function:

```
Spec: "Scenario: User đăng nhập với email hợp lệ — expected: trả về token"
↓
Test: it('trả về token khi đăng nhập với email hợp lệ', async () => {
  const result = await authService.login('user@example.com', 'password')
  expect(result.token).toBeDefined()
})
```

Chạy test, xác nhận FAIL:
```bash
npm test -- --watch
```

### 2.3 GREEN — Implement vừa đủ

Viết code tối thiểu để test pass. Không tối ưu, không thêm feature chưa có test.

### 2.4 REFACTOR — Cải thiện

Cải thiện code mà không thay đổi behavior:
- Loại bỏ trùng lặp
- Cải thiện đặt tên
- Tách hàm lớn

### 2.5 COMMIT

```bash
git add -A && git commit -m "[module-name] implement: mô tả ngắn"
```

### 2.6 Lặp lại

Chọn scenario tiếp theo trong cùng task, hoặc chuyển sang task tiếp theo.

## Bước 3: Kiểm tra Coverage

```bash
npm run test:coverage
```

- Mục tiêu: >= 80%
- Nếu chưa đạt: quay lại thêm test cho branches chưa cover
- Focus business logic, không cần 100% cho boilerplate

## Bước 4: Integration Tests

1. Test tương tác qua contracts (mock modules phụ thuộc)
2. Verify interface signatures match contract files
3. Test error scenarios: timeout, lỗi, data không hợp lệ

## Bước 5: Cập nhật

1. Đánh dấu tasks hoàn thành trong spec (Section 4)
2. Đánh dấu scenarios đã pass trong spec (Section 5)
3. Cập nhật `docs/status.md`
4. Push branch, tạo PR khi module hoàn thành
