# aiteam — Spec-Driven Development Kit

Bộ khung spec-driven development cho AI agent. Phục vụ cả cá nhân lẫn team, cả green-field lẫn outsource model.

## Triết lý

> **Spec trước, code sau.**
> Mỗi bước cần đúng capability, không cần đúng chức danh.
> AI hỗ trợ ở mọi bước, nhưng luôn dưới kiểm soát của người có capability phù hợp.

### Capability-based, không phải Role-based

aiteam định nghĩa **bước cần làm** và **chất lượng cần đạt**, không quy định ai phải làm bước đó.

| Cứng (framework quy định) | Mềm (tùy dự án) |
|---------------------------|------------------|
| Bước nào cần xảy ra | Ai làm bước đó |
| Artifact nào cần tạo ra | Ai tạo artifact |
| Tiêu chuẩn chất lượng | Bao nhiêu người tham gia |
| Thứ tự phụ thuộc | Solo hay team |

### Kịch bản sử dụng

```
Solo dev:     plan → spec → (AI review) → implement → deploy
Engineer nhận requirement: plan → spec → review → implement
Outsource:    Business → requirements → Engineer plan → spec → implement → Gate
Team lớn:     Lead plan → mỗi dev spec module → cross-review → implement
```

## Cài đặt

### Bước 1: Copy aiteam vào dự án

```bash
cp -r aiteam/ /path/to/your-project/aiteam/
```

### Bước 2: Link vào Cursor

```bash
cd /path/to/your-project
mkdir -p .cursor/commands .cursor/rules

# Copy
cp aiteam/commands/*.md .cursor/commands/
cp aiteam/rules/*.mdc .cursor/rules/

# Hoặc symlink (auto-sync khi aiteam update)
# ln -sf ../../aiteam/commands/*.md .cursor/commands/
# ln -sf ../../aiteam/rules/*.mdc .cursor/rules/
```

### Bước 3: Khởi tạo docs

Chạy command `aiteam-setup` trong Cursor để tạo cấu trúc `docs/ai/`.

### Docs tách biệt code (tùy chọn)

Khi nhiều bên cùng làm việc (Business + Engineer), có thể tách docs ra repo riêng:

```bash
# Option A: Docs repo riêng
git init docs-repo && cd docs-repo
mkdir -p ai/specs/modules ai/specs/contracts ai/reviews ai/decisions

# Trong code repo, thêm submodule
git submodule add <docs-repo-url> docs/ai

# Option B: Sparse checkout (cùng repo, mỗi bên clone phần mình cần)
git sparse-checkout set docs/ai    # Business chỉ cần docs
git sparse-checkout set src/ docs/ # Engineer cần cả code
```

> **Skills và templates** nằm trong `aiteam/` — commands tham chiếu trực tiếp qua path `aiteam/skills/...` và `aiteam/templates/...`.

## Commands

| Command | Khi nào | Mô tả |
|---------|---------|-------|
| `aiteam-setup` | Bắt đầu dự án | Khởi tạo cấu trúc thư mục |
| `aiteam-plan` | Lên kế hoạch | Chia modules, contracts, EST |
| `aiteam-spec` | Viết spec | Spec chi tiết module/component |
| `aiteam-review` | Review spec | Cross-review, self-review, hoặc AI review |
| `aiteam-review-code` | Review code | Quality, security, spec alignment |
| `aiteam-implement` | Implement | TDD workflow theo spec |
| `aiteam-fix` | Gặp bug | Fix nhanh, diff tối thiểu |
| `aiteam-test` | Cần tests | Viết tests, check coverage |
| `aiteam-debug` | Vấn đề phức tạp | Root-cause analysis |
| `aiteam-status` | Bất cứ lúc nào | Xem trạng thái, next steps |

### Workflow điển hình

```
Bắt đầu:      aiteam-setup → aiteam-plan → phân chia modules
Spec:          aiteam-spec → aiteam-review
Implement:     aiteam-implement → gặp bug? aiteam-debug/fix
Test:          aiteam-test → push PR → aiteam-review-code
Bất cứ lúc nào: aiteam-status
```

## Cấu trúc

```
aiteam/
├── README.md
├── AGENTS.md
├── commands/
│   ├── aiteam-setup.md
│   ├── aiteam-plan.md
│   ├── aiteam-spec.md
│   ├── aiteam-review.md
│   ├── aiteam-review-code.md
│   ├── aiteam-status.md
│   ├── aiteam-implement.md
│   ├── aiteam-fix.md
│   ├── aiteam-test.md
│   └── aiteam-debug.md
├── rules/
│   ├── team-conventions.mdc
│   ├── code-quality.mdc
│   └── security.mdc
├── skills/
│   ├── spec-writing/
│   ├── cross-review/
│   ├── code-review/
│   ├── tdd-workflow/
│   └── gate-review/
├── templates/
│   ├── overview-spec.md
│   ├── module-spec.md
│   ├── contract.md
│   ├── review.md
│   ├── status.md
│   └── decision.md
└── scripts/
    ├── check-status.sh
    └── validate.sh
```

## Thiết kế

| Layer | Vai trò | Khi nào load |
|-------|---------|-------------|
| **Rule** | Ràng buộc bất biến (~8-16 dòng mỗi file) | Luôn luôn |
| **Command** | Ý định thực thi (~30-50 dòng) | Khi user gọi |
| **Skill** | Methodology (~30-100 dòng) | Khi command tham chiếu |
| **Template** | Format nhất quán | Khi tạo artifact |
| **Script** | Automation | Khi command/user gọi |

## Backward Transitions

| Phát hiện ở | Loại vấn đề | Quay về |
|-------------|-------------|---------|
| `aiteam-review` | Spec thiếu/sai | `aiteam-spec` sửa spec |
| `aiteam-implement` | Spec sai | `aiteam-spec` → `aiteam-review` |
| `aiteam-implement` | Contract mismatch | `aiteam-plan` cập nhật contracts |
| `aiteam-review-code` | Design issue | `aiteam-spec` hoặc `aiteam-plan` |
| `aiteam-debug` | Design flaw | `aiteam-spec` hoặc `aiteam-plan` |

## Progressive Rollout

**Bắt đầu**: `aiteam-setup` + `aiteam-plan` + `aiteam-spec`

**Khi quen**: thêm `aiteam-review` + `aiteam-implement`

**Dev tools**: thêm `aiteam-fix` + `aiteam-test` + `aiteam-debug`

**Monitoring**: `aiteam-status` bất cứ lúc nào

## Branching Strategy

```
main
├── feature/module-a     ← implement module A
├── feature/module-b     ← implement module B
└── feature/module-c     ← implement module C
```

- Mỗi module = 1 feature branch
- Merge qua PR với `aiteam-review-code`
- Integration test sau khi merge

## So sánh với các framework khác

| Điểm khác biệt | Giải thích |
|----------------|-----------|
| **Spec-driven + Capability-based** | Bước rõ ràng, ai làm thì linh động |
| **EST tracking built-in** | Estimation trong spec, nguyên tắc bổ sung khi scope tăng |
| **Context-efficient** | ~45 dòng always-load (AGENTS.md + rules) |
| **Progressive** | Dùng solo, scale lên team, không cần adopt tất cả |
| **Gate review** | Security, performance, infra review skill riêng |

## Roadmap

- [ ] **Memory/Knowledge persistence** — ADR search, lưu context giữa sessions
- [ ] **Hooks** — auto-test, auto-lint, auto-status-update
- [ ] **CLI tooling** — `npx aiteam init`, `aiteam lint`
- [ ] **Multi-tool** — Claude Code, Codex CLI support
- [ ] **Brown-field** — phân tích codebase hiện có
