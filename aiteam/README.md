# aiteam — Bộ khung phối hợp Team cho Cursor

Bộ khung giúp team phối hợp phát triển phần mềm với AI agent trong Cursor. Tập trung vào spec-driven development: viết spec trước, review chéo, rồi mới implement.

## Cài đặt

Copy toàn bộ thư mục `aiteam/` vào dự án của bạn:

```bash
cp -r aiteam/ /path/to/your-project/aiteam/
```

Sau đó chạy command `aiteam-setup` trong Cursor để khởi tạo cấu trúc `docs/`.

## Workflow

```
aiteam-setup → aiteam-kickoff → aiteam-spec → aiteam-review-spec → aiteam-implement → aiteam-integrate
```

### `aiteam-setup` — Khởi tạo cấu trúc dự án

Tạo thư mục `docs/` với cấu trúc chuẩn: specs, contracts, reviews, decisions, status.

### `aiteam-kickoff` — Spec tổng thể

Cả team cùng nhau:
- Mô tả vấn đề, mục tiêu, phạm vi
- Chia hệ thống thành modules
- Định nghĩa contracts giữa modules
- Phân công owner cho từng module

**Output**: `docs/specs/overview.md` + contract files + decisions

### `aiteam-spec` — Spec chi tiết module

Mỗi dev viết spec chi tiết cho module mình own, theo 5 sections:
1. Overview & Requirements
2. Architecture & Design
3. Contracts & Dependencies
4. Implementation Plan
5. Test Cases & Success Criteria

**Output**: `docs/specs/modules/{module-name}.md`

### `aiteam-review-spec` — Review chéo

Dev A review spec của Dev B. Tập trung vào:
- Contracts có match giữa hai modules?
- Spec có đầy đủ và rõ ràng?
- Có mâu thuẫn với overview hoặc modules khác?

**Output**: `docs/reviews/{module-name}.md`

### `aiteam-implement` — Implement theo spec

Mỗi dev implement module trên feature branch, sử dụng TDD:
- Derive tests từ spec (Section 5)
- Red → Green → Refactor cycle
- Commit thường xuyên
- Coverage >= 80%

### `aiteam-integrate` — Integration test (dự kiến)

Nối modules, chạy integration/E2E tests, merge vào main. Sẽ triển khai chi tiết khi cần.

## Cấu trúc

```
aiteam/
├── README.md
├── AGENTS.md
├── commands/
│   ├── aiteam-setup.md
│   ├── aiteam-kickoff.md
│   ├── aiteam-spec.md
│   ├── aiteam-review-spec.md
│   ├── aiteam-implement.md
│   └── aiteam-integrate.md
├── rules/
│   └── team-conventions.mdc
├── skills/
│   ├── spec-writing/
│   │   ├── SKILL.md
│   │   └── references/
│   │       ├── overview-guide.md
│   │       └── module-guide.md
│   ├── cross-review/
│   │   ├── SKILL.md
│   │   └── references/
│   │       └── review-process.md
│   └── tdd-workflow/
│       ├── SKILL.md
│       └── references/
│           └── tdd-cycle.md
└── templates/
    ├── overview-spec.md
    ├── module-spec.md
    ├── contract.md
    ├── review.md
    ├── status.md
    └── decision.md
```

## Triết lý thiết kế

| Layer | Vai trò | Khi nào load |
|-------|---------|-------------|
| **Rule** | Ràng buộc bất biến (~16 dòng) | Luôn luôn |
| **Command** | Ý định thực thi (~30-40 dòng) | Khi user gọi |
| **Skill SKILL.md** | Overview methodology (~30 dòng) | Khi command tham chiếu |
| **Skill references/** | Chi tiết methodology | Chỉ khi cần |
| **Template** | Format nhất quán | Khi tạo artifact |

**Tại sao tách?** Giữ context window nhẹ. Rules luôn load (~16 dòng). Commands chỉ load intent. Skills dùng progressive disclosure: SKILL.md ngắn gọn → references/ chi tiết chỉ load khi cần.

## Backward Transitions

Khi phát hiện vấn đề ở bước sau, quay lại sửa ở bước đúng:

| Phát hiện ở | Loại vấn đề | Quay về |
|-------------|-------------|---------|
| `aiteam-review-spec` | Spec thiếu/sai | `aiteam-spec` sửa spec |
| `aiteam-implement` | Spec sai | `aiteam-spec` → `aiteam-review-spec` |
| `aiteam-implement` | Contract mismatch | `aiteam-kickoff` cập nhật contracts |
| `aiteam-integrate` | Modules không khớp | `aiteam-kickoff` cập nhật contracts |

## Progressive Rollout

Không cần dùng hết ngay:

**Bắt đầu**: `aiteam-setup` + `aiteam-kickoff` + `aiteam-spec`

**Khi team đã quen**: thêm `aiteam-review-spec` + `aiteam-implement`

**Khi team thuần thục**: thêm `aiteam-integrate`

## Branching Strategy

```
main
├── feature/module-a     ← Dev A implement module A
├── feature/module-b     ← Dev B implement module B
├── feature/module-c     ← Dev C implement module C
└── integration/v1       ← Nối modules, E2E test
```

- Mỗi module = 1 feature branch
- Merge qua PR với code review
- Integration branch để test nối modules
