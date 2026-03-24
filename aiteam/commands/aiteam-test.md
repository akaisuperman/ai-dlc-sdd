---
description: Viết hoặc chạy tests — unit, integration, coverage check
---

# aiteam-test

Viết tests hoặc kiểm tra coverage. Gọi độc lập, không cần đi kèm implement.

## Đọc trước

- Đọc skill `aiteam/skills/tdd-workflow/SKILL.md` (nếu cần TDD guidance)
- Đọc spec module: `docs/specs/modules/{module-name}.md` (Section 5 — Acceptance Criteria)

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Viết tests cho module/file nào?
   - Unit tests, integration tests, hay cả hai?
   - Test runner nào? (jest, vitest, phpunit, pytest...)
   - Có spec với acceptance criteria không?

2. **Phân tích**:
   - Đọc code hiện tại
   - Nếu có spec → derive test scenarios từ Section 5
   - Nếu không có spec → phân tích code, identify behaviors cần test
   - Identify untested paths/branches

3. **Viết tests**:
   - Unit tests: test individual functions/methods
   - Integration tests: test module interactions qua contracts
   - Edge cases: null, empty, boundary, error scenarios
   - Mỗi test rõ ràng: arrange → act → assert

4. **Chạy & kiểm tra coverage**:
   - Chạy tests, fix failures
   - Kiểm tra coverage >= 80%
   - Nếu chưa đạt → thêm tests cho uncovered branches

5. **Commit**: `[module-name] test: mô tả ngắn`

## Backward

- Tests reveal spec sai → dừng, chạy `aiteam-spec` cập nhật
- Tests reveal design flaw → dừng, chạy `aiteam-plan` cập nhật

## Next

- Coverage đạt → push, tạo PR
- Cần fix code → chạy `aiteam-fix`
- Cần thêm implementation → chạy `aiteam-implement`
