# aiteam Rules

## Triết lý

> Spec trước, code sau. Mỗi bước cần đúng capability, không cần đúng chức danh.
> Solo dev, BrSE, hay team engineer đều dùng cùng workflow.
> AI hỗ trợ ở mọi bước, nhưng luôn dưới kiểm soát của người có capability phù hợp.

## Cấu trúc Tài liệu

- `docs/ai/specs/overview.md` — Spec tổng thể (kiến trúc, modules, contracts)
- `docs/ai/specs/modules/` — Spec chi tiết từng module
- `docs/ai/specs/modules/{module}/components/` — Spec component (khi module lớn)
- `docs/ai/specs/contracts/` — Contracts giữa modules
- `docs/ai/reviews/` — Kết quả review
- `docs/ai/decisions/` — Architecture Decision Records
- `docs/ai/status.md` — Trạng thái tổng thể

## Ràng buộc

- Đọc `docs/ai/specs/overview.md` trước khi implement bất kỳ module nào
- Không implement module chưa có spec ở trạng thái `approved`
- Không sửa trực tiếp spec của module mình không own — tạo review note trong `docs/ai/reviews/`
- Thay đổi contract cần đồng ý của owners cả hai modules liên quan
- Code mới phải có test coverage >= 80%
- Commit message format: `[module-name] mô tả thay đổi`
- Ghi quyết định kiến trúc quan trọng vào `docs/ai/decisions/` theo template `decision.md`
- Khi phát hiện vấn đề ở phase sau → quay lại sửa spec trước, không sửa code để "work around"

## Capability Model

Mỗi bước yêu cầu capability, không gán cứng vai trò:

| Bước | Capability cần | Ví dụ người thực hiện |
|------|---------------|----------------------|
| Requirements | Domain knowledge | Business, BrSE, Engineer hiểu domain |
| Plan | Technical vision + domain | Lead, Engineer, BrSE kỹ thuật |
| Spec | Technical depth | Engineer, BrSE với AI hỗ trợ |
| Review | Critical thinking + context | Engineer khác, AI, hoặc bất kỳ ai có context |
| Implement | Coding + architecture | Engineer + AI |
| Gate | Security/infra expertise | Senior Engineer, automated tools |
| Verify | Domain knowledge | Business, QA, BrSE |

## Backward Transitions

- Review phát hiện gaps → quay `aiteam-spec` sửa spec
- Implement phát hiện spec sai → quay `aiteam-spec` cập nhật, rồi `aiteam-review` lại
- Contract mismatch → quay `aiteam-plan` cập nhật contracts

## Skills

Mỗi skill nằm trong directory riêng với `SKILL.md` + `references/`. Chỉ load khi command tham chiếu.

| Skill | Mô tả | Dùng bởi |
|-------|--------|----------|
| `spec-writing` | Viết overview spec và module spec | `aiteam-plan`, `aiteam-spec` |
| `cross-review` | Review chéo spec | `aiteam-review` |
| `code-review` | Review code quality, security | `aiteam-review-code` |
| `tdd-workflow` | TDD cycle khi implement | `aiteam-implement` |
| `gate-review` | Gate review: security, performance, infra | `aiteam-review-code` (gate mode) |
| `brownfield` | Phân tích codebase hiện có | `aiteam-plan` (dự án hiện có) |
| `parallel-dev` | Multi-agent, worktree, parallel development | Khi cần nhiều agents/devs song song |
| `brownfield` | Phân tích codebase hiện có | `aiteam-plan` (dự án hiện có) |
| `parallel-dev` | Multi-agent, worktree, parallel development | Khi cần nhiều agents/devs song song |

## Commands

| Command | Mô tả |
|---------|--------|
| `aiteam-setup` | Khởi tạo cấu trúc thư mục dự án |
| `aiteam-plan` | Lên kế hoạch tổng thể, chia modules, contracts |
| `aiteam-spec` | Viết spec chi tiết cho module |
| `aiteam-review` | Review spec — cross-review, self-review, hoặc AI review |
| `aiteam-review-code` | Review code trên PR — quality, security, spec alignment |
| `aiteam-implement` | Implement module — TDD workflow |
| `aiteam-fix` | Fix bug hoặc build error, diff tối thiểu |
| `aiteam-test` | Viết hoặc chạy tests, kiểm tra coverage |
| `aiteam-debug` | Debug vấn đề với root-cause analysis |
| `aiteam-status` | Xem trạng thái, auto-detect phase, đề xuất next step |

## Roadmap

- [ ] **Memory/Knowledge persistence** — ADR search, context giữa sessions (phát triển sau)
- [ ] **Hooks** — auto-test, auto-lint, auto-status-update
- [ ] **CLI tooling** — `npx aiteam init`, `aiteam lint`, `aiteam status`
- [ ] **Multi-tool support** — Claude Code, Codex CLI (hiện tại: Cursor only)
