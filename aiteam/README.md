# aiteam — Bộ khung phối hợp Team cho Cursor

Bộ khung giúp team phối hợp phát triển phần mềm với AI agent trong Cursor. Kết hợp team coordination (spec, review, contracts) với individual dev tools (implement, fix, test, debug).

## Cài đặt

### Bước 1: Copy aiteam vào dự án

```bash
cp -r aiteam/ /path/to/your-project/aiteam/
```

### Bước 2: Link vào Cursor

Cursor tìm commands ở `.cursor/commands/`, rules ở `.cursor/rules/`. Cần copy hoặc symlink:

```bash
cd /path/to/your-project

# Commands
mkdir -p .cursor/commands
cp aiteam/commands/*.md .cursor/commands/

# Rules
mkdir -p .cursor/rules
cp aiteam/rules/*.mdc .cursor/rules/
```

Hoặc dùng symlink (auto-sync khi aiteam update):

```bash
mkdir -p .cursor/commands .cursor/rules
ln -sf ../../aiteam/commands/*.md .cursor/commands/
ln -sf ../../aiteam/rules/*.mdc .cursor/rules/
```

### Bước 3: Khởi tạo docs

Chạy command `aiteam-setup` trong Cursor để tạo cấu trúc `docs/`.

> **Lưu ý**: Skills và templates nằm trong `aiteam/` — commands tham chiếu trực tiếp qua path `aiteam/skills/...` và `aiteam/templates/...`.

## Commands

### Team Coordination — phối hợp giữa các thành viên

| Command | Khi nào | Ai dùng |
|---------|---------|---------|
| `aiteam-setup` | Bắt đầu dự án | Lead / cả team |
| `aiteam-plan` | Lên kế hoạch, chia modules, contracts | Cả team |
| `aiteam-spec` | Viết spec chi tiết module | Owner module |
| `aiteam-review` | Review chéo spec | Reviewer |
| `aiteam-review-code` | Review code trên PR | Reviewer |
| `aiteam-status` | Xem trạng thái, next steps | Ai cũng gọi được |

### Individual Dev — công cụ cá nhân, gọi bất cứ lúc nào

| Command | Khi nào | Mô tả |
|---------|---------|-------|
| `aiteam-implement` | Implement module | Viết test + production code (TDD) |
| `aiteam-fix` | Gặp bug/build error | Fix nhanh, diff tối thiểu |
| `aiteam-test` | Cần thêm tests | Viết tests, check coverage |
| `aiteam-debug` | Vấn đề phức tạp | Root-cause analysis trước khi sửa |

### Workflow điển hình

```
Ngày 1 (team):    aiteam-setup → aiteam-plan → phân chia modules
Ngày 2 (mỗi dev): aiteam-spec → nhờ dev khác aiteam-review (spec)
Ngày 3+ (mỗi dev): aiteam-implement → gặp bug? aiteam-debug/fix
                    → cần tests? aiteam-test → push PR
                    → nhờ dev khác aiteam-review-code
Bất cứ lúc nào:   aiteam-status → xem ai đang làm gì, next steps
```

## Cấu trúc

```
aiteam/
├── README.md
├── AGENTS.md
├── commands/
│   ├── aiteam-setup.md          # Team: khởi tạo
│   ├── aiteam-plan.md           # Team: lên kế hoạch
│   ├── aiteam-spec.md           # Team: viết spec
│   ├── aiteam-review.md         # Team: review spec
│   ├── aiteam-review-code.md   # Team: review code
│   ├── aiteam-status.md         # Team: xem trạng thái
│   ├── aiteam-implement.md      # Dev: implement
│   ├── aiteam-fix.md            # Dev: fix bug
│   ├── aiteam-test.md           # Dev: viết tests
│   └── aiteam-debug.md          # Dev: debug
├── rules/
│   ├── team-conventions.mdc     # Ràng buộc team (~16 dòng)
│   ├── code-quality.mdc         # Ràng buộc code quality (~12 dòng)
│   └── security.mdc             # Ràng buộc security (~12 dòng)
├── skills/
│   ├── spec-writing/
│   │   ├── SKILL.md
│   │   └── references/
│   ├── cross-review/
│   │   ├── SKILL.md
│   │   └── references/
│   ├── code-review/
│   │   ├── SKILL.md
│   │   └── references/
│   └── tdd-workflow/
│       ├── SKILL.md
│       └── references/
├── templates/
│   ├── overview-spec.md
│   ├── module-spec.md
│   ├── contract.md
│   ├── review.md
│   ├── status.md
│   └── decision.md
└── scripts/
    └── check-status.sh          # Auto-detect trạng thái
```

## Triết lý thiết kế

| Layer | Vai trò | Khi nào load |
|-------|---------|-------------|
| **Rule** | Ràng buộc bất biến (~12-16 dòng mỗi file) | Luôn luôn |
| **Command** | Ý định thực thi (~30-50 dòng) | Khi user gọi |
| **Skill SKILL.md** | Overview methodology (~30-40 dòng) | Khi command tham chiếu |
| **Skill references/** | Chi tiết methodology | Chỉ khi cần |
| **Template** | Format nhất quán | Khi tạo artifact |
| **Script** | Automation | Khi command gọi |

## Backward Transitions

Khi phát hiện vấn đề ở bước sau, quay lại sửa ở bước đúng:

| Phát hiện ở | Loại vấn đề | Quay về |
|-------------|-------------|---------|
| `aiteam-review` | Spec thiếu/sai | `aiteam-spec` sửa spec |
| `aiteam-implement` | Spec sai | `aiteam-spec` → `aiteam-review` |
| `aiteam-implement` | Contract mismatch | `aiteam-plan` cập nhật contracts |
| `aiteam-review-code` | Design issue | `aiteam-spec` hoặc `aiteam-plan` |
| `aiteam-debug` | Design flaw | `aiteam-spec` hoặc `aiteam-plan` |

## Progressive Rollout

Không cần dùng hết ngay:

**Bắt đầu**: `aiteam-setup` + `aiteam-plan` + `aiteam-spec`

**Khi team đã quen**: thêm `aiteam-review` + `aiteam-implement`

**Khi cần dev tools**: thêm `aiteam-fix` + `aiteam-test` + `aiteam-debug`

**Monitoring**: `aiteam-status` bất cứ lúc nào

## Branching Strategy

```
main
├── feature/module-a     ← Dev A implement module A
├── feature/module-b     ← Dev B implement module B
└── feature/module-c     ← Dev C implement module C
```

- Mỗi module = 1 feature branch
- Merge qua PR với `aiteam-review-code`
- Integration test sau khi merge
