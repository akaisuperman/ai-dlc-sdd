# AI Team Rules

## Cấu trúc Tài liệu

- `docs/specs/overview.md` — Spec tổng thể (kiến trúc, modules, contracts)
- `docs/specs/modules/` — Spec chi tiết từng module
- `docs/specs/contracts/` — Contracts giữa modules
- `docs/reviews/` — Kết quả review chéo
- `docs/decisions/` — Architecture Decision Records
- `docs/status.md` — Trạng thái tổng thể team

## Ràng buộc

- Đọc `docs/specs/overview.md` trước khi implement bất kỳ module nào
- Không implement module chưa có spec ở trạng thái `approved`
- Không sửa trực tiếp spec của module mình không own — tạo review note thay vì sửa
- Thay đổi contract cần đồng ý của owners cả hai modules liên quan
- Code mới phải có test coverage >= 80%
- Commit message format: `[module-name] mô tả thay đổi`
- Ghi quyết định kiến trúc quan trọng vào `docs/decisions/` theo template `decision.md`

## Workflow

```
aiteam-setup → aiteam-kickoff → aiteam-spec → aiteam-review-spec → aiteam-implement → aiteam-integrate
```

Khi phát hiện vấn đề ở bước sau, quay lại bước trước sửa spec trước khi tiếp tục.

## Backward Transitions

- Review phát hiện gaps → quay `aiteam-spec` sửa spec
- Implement phát hiện spec sai → quay `aiteam-spec` cập nhật, rồi `aiteam-review-spec` lại
- Integrate phát hiện contract mismatch → quay `aiteam-kickoff` cập nhật contracts

## Skills

Mỗi skill nằm trong directory riêng với `SKILL.md` + `references/`. Chỉ load khi command tham chiếu.

| Skill | Mô tả | Dùng bởi |
|-------|--------|----------|
| `spec-writing` | Viết overview spec và module spec | `aiteam-kickoff`, `aiteam-spec` |
| `cross-review` | Review chéo spec | `aiteam-review-spec` |
| `tdd-workflow` | TDD cycle khi implement | `aiteam-implement` |

## Commands

| Command | Mô tả |
|---------|--------|
| `aiteam-setup` | Khởi tạo cấu trúc thư mục dự án |
| `aiteam-kickoff` | Cả team viết spec tổng thể, chia modules, định nghĩa contracts |
| `aiteam-spec` | Viết spec chi tiết cho module được phân công |
| `aiteam-review-spec` | Review chéo spec của dev khác |
| `aiteam-implement` | Implement module theo spec đã approved, TDD |
| `aiteam-integrate` | Nối modules, integration test (dự kiến) |
