---
description: Debug vấn đề — phân tích root cause trước khi sửa code
---

# aiteam-debug

Debug vấn đề với structured root-cause analysis. Hiểu trước, sửa sau.

## Steps

1. **Gather Context** — Nếu chưa được cung cấp, hỏi:
   - Mô tả vấn đề: đang xảy ra gì vs mong đợi gì?
   - Error messages / logs / screenshots?
   - Thay đổi gần đây nào có thể liên quan?
   - Vấn đề xảy ra luôn hay chỉ đôi khi?

2. **Clarify** — Xác nhận:
   - Observed behavior vs expected behavior
   - Acceptance criteria cho fix (khi nào coi là xong?)
   - Scope of impact (ảnh hưởng những gì?)

3. **Reproduce & Isolate**:
   - Xác định reproducibility (always / intermittent / environment-specific)
   - Thu hẹp phạm vi: module nào, function nào, line nào
   - Capture reproduction steps

4. **Analyze**:
   - Brainstorm root causes (data, config, code regression, external dependency)
   - Thu thập evidence (logs, traces, state)
   - Highlight unknowns cần investigate thêm

5. **Propose fix**:
   - Đề xuất options: quick fix / refactor / rollback
   - Mỗi option kèm pros/cons/risks
   - Hỏi user chọn approach

6. **Không tự sửa** — debug command chỉ phân tích. Sau khi đồng ý approach:
   - Fix đơn giản → `aiteam-fix`
   - Fix phức tạp → `aiteam-implement`

## Next

- Root cause rõ, fix đơn giản → `aiteam-fix`
- Root cause là design flaw → `aiteam-spec` hoặc `aiteam-plan`
- Cần implement lại → `aiteam-implement`
