# AI Team Rules

## Cấu trúc Tài liệu

- `docs/ai/specs/overview.md` — Spec tổng thể (kiến trúc, modules, contracts)
- `docs/ai/specs/modules/` — Spec chi tiết từng module
- `docs/ai/specs/contracts/` — Contracts giữa modules
- `docs/ai/reviews/` — Kết quả review chéo
- `docs/ai/decisions/` — Architecture Decision Records
- `docs/ai/status.md` — Trạng thái tổng thể team

## Ràng buộc

- Đọc `docs/ai/specs/overview.md` trước khi implement bất kỳ module nào
- Không implement module chưa có spec ở trạng thái `approved`
- Không sửa trực tiếp spec của module mình không own — tạo review note thay vì sửa
- Thay đổi contract cần đồng ý của owners cả hai modules liên quan
- Code mới phải có test coverage >= 80%
- Commit message format: `[module-name] mô tả thay đổi`
- Ghi quyết định kiến trúc quan trọng vào `docs/ai/decisions/` theo template `decision.md`

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

## Commands

### Team Coordination

| Command | Mô tả |
|---------|--------|
| `aiteam-setup` | Khởi tạo cấu trúc thư mục dự án |
| `aiteam-plan` | Lên kế hoạch tổng thể, chia modules, định nghĩa contracts |
| `aiteam-spec` | Viết spec chi tiết cho module được phân công |
| `aiteam-review` | Review chéo spec giữa team members |
| `aiteam-review-code` | Review code trên PR — quality, security, spec alignment |
| `aiteam-status` | Xem trạng thái team, auto-detect phase, đề xuất next step |

### Individual Dev

| Command | Mô tả |
|---------|--------|
| `aiteam-implement` | Implement module — viết cả test lẫn production code (TDD) |
| `aiteam-fix` | Fix bug hoặc build error, diff tối thiểu |
| `aiteam-test` | Viết hoặc chạy tests, kiểm tra coverage |
| `aiteam-debug` | Debug vấn đề với root-cause analysis |
