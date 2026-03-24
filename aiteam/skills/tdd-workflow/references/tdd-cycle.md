# TDD Cycle Chi tiết

## Bước 1: Chuẩn bị

1. Đọc module spec: `docs/specs/modules/{module-name}.md`
2. Đọc contracts liên quan: `docs/specs/contracts/`
3. Tạo feature branch: `feature/{module-name}`
4. Khởi tạo cấu trúc module theo Section 4 (Implementation Plan)

## Bước 2: Derive tests từ spec

1. Mở Section 5 (Test Cases & Success Criteria)
2. Chuyển mỗi test case thành test function:

```
Spec: "Test: User đăng nhập với email hợp lệ — expected: trả về token"
↓
Test: it('trả về token khi đăng nhập với email hợp lệ', async () => {
  const result = await authService.login('user@example.com', 'password')
  expect(result.token).toBeDefined()
})
```

3. Thêm edge cases từ spec
4. Thêm contract tests cho interfaces EXPOSE

## Bước 3: TDD Cycle

Lặp cho mỗi task trong Implementation Plan:

**RED** — Viết test, chạy, xác nhận thất bại:
```bash
npm test -- --watch
```

**GREEN** — Implement tối thiểu để test pass. Không tối ưu, không refactor.

**REFACTOR** — Cải thiện code mà không thay đổi behavior:
- Loại bỏ trùng lặp
- Cải thiện đặt tên
- Tách hàm lớn

**COMMIT** — Commit mỗi green cycle:
```bash
git add -A && git commit -m "[module-name] implement feature X"
```

## Bước 4: Kiểm tra Coverage

```bash
npm run test:coverage
```

- Mục tiêu: >= 80%
- Nếu chưa đạt: thêm tests cho branches chưa cover
- Focus business logic, không cần 100% cho boilerplate

## Bước 5: Integration Tests

1. Test tương tác qua contracts (mock modules phụ thuộc)
2. Verify interface signatures match contract files
3. Test error scenarios: timeout, lỗi, data không hợp lệ

## Bước 6: Cập nhật

1. Đánh dấu tasks hoàn thành trong spec (Section 4)
2. Cập nhật `docs/status.md`
3. Push branch, tạo PR khi module hoàn thành
