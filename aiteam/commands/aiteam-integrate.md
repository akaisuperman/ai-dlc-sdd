---
description: "Nối modules, integration test, validate success criteria (dự kiến)"
---

# aiteam-integrate

> **Trạng thái: Dự kiến** — Command này sẽ được triển khai chi tiết khi team sẵn sàng.

Nối các modules lại, chạy integration test và E2E test.

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Modules nào cần integrate?
   - Tất cả modules đã implement xong chưa?

2. Merge feature branches vào branch integration: `integration/{feature-name}`
3. Chạy integration tests — verify contracts match thực tế
4. Chạy E2E tests — validate success criteria từ overview.md
5. Fix conflicts và mismatches
6. Cập nhật `docs/status.md`
7. Merge vào main khi pass

## Backward

- Contract mismatch → quay `aiteam-kickoff` cập nhật contracts
- Module lỗi → owner quay `aiteam-implement` fix trên feature branch

## Next

- Tất cả tests pass → merge vào main, done
- Contract mismatch → quay `aiteam-kickoff`

## Chưa triển khai

Command này sẽ được bổ sung chi tiết khi cần.
