---
description: Review code trên PR hoặc branch — quality, security, spec alignment, gate review
---

# aiteam-review-code

Review code trước khi merge. Kiểm tra quality, security, và alignment với spec.

## Đọc trước

- Đọc skill `aiteam/skills/code-review/SKILL.md`
- Nếu gate review → đọc thêm skill `aiteam/skills/gate-review/SKILL.md`

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Review code module/PR nào?
   - Có spec cho module này không? (path)
   - Loại review: standard / gate (security + performance + infra)?

2. **Tự động xác định reviewer**:
   - Lấy từ git config: `git config user.name`
   - Nếu không có → hỏi

3. **Đọc context**:
   - Spec module: `docs/ai/specs/modules/{module-name}.md` (nếu có)
   - Contracts liên quan
   - Xem diff: `git diff main...HEAD` hoặc PR diff

4. **Review** theo skill `code-review`:
   - Spec alignment: code match behavior trong spec?
   - Code quality: readability, function size, naming, duplication
   - Security: hardcoded secrets, input validation, injection
   - Error handling: try/catch, user-facing messages
   - Tests: coverage, edge cases, happy + error paths

5. **Gate review** (nếu được yêu cầu) — theo skill `gate-review`:
   - Security deep review
   - Performance concerns
   - Infrastructure / deployment readiness

6. **Output** — phân loại findings:
   - **Blocking**: phải sửa trước merge
   - **Important**: nên sửa
   - **Nice-to-have**: có thể sửa sau

## Backward

- Design issues → quay lại `aiteam-spec` hoặc `aiteam-plan`
- Missing tests → chạy `aiteam-test`

## Next

- Code **approved** → merge PR
- Code **has issues** → chạy `aiteam-fix` hoặc sửa rồi request review lại
