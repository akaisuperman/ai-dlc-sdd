# Code Review Checklist Chi tiết

## Bước 1: Context

1. Đọc spec module: `docs/specs/modules/{module-name}.md`
2. Đọc contracts liên quan
3. Xem diff: `git diff main...HEAD` hoặc PR diff
4. Hiểu scope thay đổi trước khi review chi tiết

## Bước 2: Spec Alignment

1. Code có implement đúng behavior mô tả trong Section 1?
2. Architecture có match Section 2 (components, data models)?
3. Interfaces EXPOSE/CONSUME có match Section 3 và contract files?
4. Có behavior ngoài spec không? (scope creep)

## Bước 3: Code Quality

1. **Readability**: đọc hiểu được trong 30 giây?
2. **Functions**: < 50 dòng, single responsibility?
3. **Naming**: biến/hàm tên rõ ràng, nhất quán?
4. **Duplication**: có code trùng lặp cần extract?
5. **Immutability**: tạo objects mới thay vì mutate?
6. **Deep nesting**: không quá 4 levels?

## Bước 4: Security

1. Không hardcoded secrets (API keys, passwords, tokens)?
2. User input validated trước xử lý?
3. SQL queries dùng parameterized/prepared statements?
4. Output escaped/sanitized (chống XSS)?
5. Error messages không leak system info?
6. File uploads kiểm tra MIME type, size, extension?

## Bước 5: Error Handling

1. Mọi async operation có try/catch?
2. Errors được log với đủ context?
3. User-facing errors friendly, không leak internals?
4. Edge cases: null, empty, boundary values?
5. Timeout handling cho external calls?

## Bước 6: Tests

1. Tests cover happy path?
2. Tests cover error cases?
3. Tests cover edge cases?
4. Coverage >= 80%?
5. Tests independent (không phụ thuộc thứ tự chạy)?
6. Mocks/stubs hợp lý (không mock quá nhiều)?

## Bước 7: Output

Phân loại findings: Blocking / Important / Nice-to-have

Format mỗi finding:
- **File**: path
- **Issue**: mô tả
- **Impact**: ảnh hưởng gì
- **Suggestion**: đề xuất sửa
