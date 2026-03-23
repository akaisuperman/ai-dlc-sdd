# Đề xuất Tích hợp Kỹ thuật Everything Claude Code

## Tổng quan

Đây là đề xuất tích hợp các kỹ thuật thực tiễn được công bố trong repository `affaan-m/everything-claude-code` vào framework AI-DLC.

## Kết quả Phân tích

### Cấu trúc Hiện tại của Framework AI-DLC

```
ai-dlc-sdd/
├── cursor/
│   ├── AGENTS.md          # Định nghĩa vai trò chuyên gia (đã tích hợp vào Commands)
│   ├── agents/            # (Đã loại bỏ) Định nghĩa agent đã tích hợp vào Commands
│   └── commands/          # Lệnh AI-DLC (bao gồm vai trò chuyên gia)
│       ├── aidlc-setup.md
│       ├── aidlc-inception.md
│       ├── aidlc-domain-model.md
│       ├── aidlc-code-generation.md
│       └── ...
└── docs/
    ├── AI-DLC.md
    └── PROJECT_STRUCTURE.md
```

### Kỹ thuật Chính của Everything Claude Code

1. **Vai trò Chuyên gia (Tích hợp trong Commands)**: Vai trò chuyên gia chuyên biệt cho tác vụ cụ thể (triển khai trong Commands theo best practice tài liệu chính thức Cursor)
2. **Rules (Quy tắc)**: Hướng dẫn phải luôn tuân thủ
3. **Skills (Kỹ năng)**: Định nghĩa workflow và kiến thức domain
4. **Commands (Lệnh)**: Slash command
5. **Hooks**: Tự động hoá khi sử dụng công cụ
6. **Tối ưu Hiệu suất**: Chọn model, quản lý ngữ cảnh
7. **Thực thi Tác vụ Song song**: Thực thi song song các thao tác độc lập

## Đề xuất Tích hợp

### 1. Thêm Rules (Quy tắc)

**Mục đích**: Đảm bảo tính nhất quán về chất lượng mã nguồn, bảo mật, kiểm thử và hiệu suất

**File quy tắc đề xuất**:

```
cursor/rules/
├── security.md          # Hướng dẫn bảo mật
├── coding-style.md      # Phong cách lập trình
├── testing.md          # Yêu cầu kiểm thử (80% bao phủ, TDD)
├── performance.md       # Tối ưu hiệu suất (chọn model, quản lý ngữ cảnh)
├── git-workflow.md      # Quy trình Git
└── agents.md            # Hướng dẫn sử dụng agent
```

**Mức ưu tiên**: Cao
**Lý do**: Để đảm bảo chất lượng trong giai đoạn sinh mã nguồn của AI-DLC

### 2. Thêm Skills (Kỹ năng)

**Mục đích**: Chia sẻ kiến thức domain và best practice

**File kỹ năng đề xuất**:

```
cursor/skills/
├── backend-patterns.md      # Pattern backend (API, DB, Cache)
├── frontend-patterns.md      # Pattern frontend (React, Next.js)
├── ddd-patterns.md          # Pattern DDD (riêng cho AI-DLC)
├── tdd-workflow/            # Quy trình TDD
│   ├── README.md
│   └── workflow.md
└── security-review/         # Checklist review bảo mật
    ├── README.md
    └── checklist.md
```

**Mức ưu tiên**: Trung bình
**Lý do**: Để áp dụng pattern trong Giai đoạn Construction của AI-DLC

### 3. Thêm Vai trò Chuyên gia (Tích hợp trong Commands) ✅ Hoàn thành

**Mục đích**: Nâng cao chất lượng với vai trò chuyên gia chuyên biệt cho tác vụ cụ thể

**Trạng thái triển khai**: Đã loại bỏ agent và triển khai dưới dạng vai trò chuyên gia trong Commands, dựa trên best practice của tài liệu chính thức Cursor.

**Vai trò chuyên gia đã triển khai**:

```
Tích hợp trong Commands:
├── Chuyên gia Lập kế hoạch   # Trong lệnh aidlc-inception (Bước 1)
├── Kiến trúc sư              # Trong lệnh aidlc-architecture (Bước 1, 3, 5, 6)
├── Chuyên gia Review Mã nguồn # aidlc-code-generation (Bước 10), aidlc-code-review
├── Chuyên gia Bảo mật        # aidlc-code-generation (Bước 11), aidlc-security-review
├── Chuyên gia TDD            # Trong lệnh aidlc-code-generation (Bước 7)
└── Chuyên gia Xử lý Lỗi Build # aidlc-code-generation (Bước 9), aidlc-build-fix
```

**Mức ưu tiên**: Cao ✅ Hoàn thành
**Lý do**: Để đảm bảo chất lượng trong mỗi giai đoạn của AI-DLC

### 4. Thêm Hooks

**Mục đích**: Nâng cao chất lượng và hiệu quả phát triển thông qua tự động hoá

**Hook đề xuất**:

```json
cursor/hooks/hooks.json
```

**Hook chính**:
- PreToolUse: Nhắc chạy development server trong tmux
- PostToolUse: Tự động format, kiểm tra TypeScript sau khi chỉnh sửa mã nguồn
- Stop: Phát hiện console.log khi kết thúc phiên

**Mức ưu tiên**: Trung bình
**Lý do**: Cải thiện trải nghiệm phát triển

### 5. Mở rộng Lệnh

**Mục đích**: Mở rộng các lệnh AI-DLC hiện có

**Lệnh bổ sung đề xuất**:

```
cursor/commands/
├── aidlc-code-review.md    # Review mã nguồn (/aidlc-code-review)
├── aidlc-security-review.md # Review bảo mật (/aidlc-security-review)
└── aidlc-build-fix.md      # Sửa lỗi build (/aidlc-build-fix)
```

**Mức ưu tiên**: Trung bình
**Lý do**: Bổ sung cho các lệnh hiện có

### 6. Tích hợp Tối ưu Hiệu suất

**Mục đích**: Tối ưu hoá cửa sổ ngữ cảnh và chọn model

**Đề xuất**:
- Thêm vào `cursor/rules/performance.md`:
  - Chiến lược chọn model (Haiku/Sonnet/Opus)
  - Quản lý cửa sổ ngữ cảnh
  - Hướng dẫn thực thi tác vụ song song

**Mức ưu tiên**: Cao
**Lý do**: Tối ưu chi phí và hiệu suất

## Kế hoạch Triển khai

### Phase 1: Xây dựng Nền tảng (Mức ưu tiên: Cao)

1. **Thêm Rules**
   - `cursor/rules/security.md`
   - `cursor/rules/testing.md`
   - `cursor/rules/performance.md`
   - `cursor/rules/coding-style.md`

2. **Tích hợp Tối ưu Hiệu suất**
   - Thêm chiến lược chọn model vào `cursor/rules/performance.md`
   - Thêm chỉ định model vào `cursor/AGENTS.md`

### Phase 2: Thêm Vai trò Chuyên gia (Mức ưu tiên: Cao) ✅ Hoàn thành

**Lưu ý**: Đã loại bỏ agent và triển khai dưới dạng vai trò chuyên gia trong Commands, dựa trên best practice của tài liệu chính thức Cursor.

1. **Chuyên gia Review Mã nguồn**
   - Tích hợp trong lệnh `aidlc-code-generation` (Bước 10)
   - Triển khai trong lệnh `aidlc-code-review`

2. **Chuyên gia Bảo mật**
   - Tích hợp trong lệnh `aidlc-code-generation` (Bước 11)
   - Triển khai trong lệnh `aidlc-security-review`

3. **Chuyên gia TDD**
   - Tích hợp trong lệnh `aidlc-code-generation` (Bước 7)

4. **Chuyên gia Xử lý Lỗi Build**
   - Tích hợp trong lệnh `aidlc-code-generation` (Bước 9)
   - Triển khai trong lệnh `aidlc-build-fix`

5. **Chuyên gia Lập kế hoạch**
   - Tích hợp trong lệnh `aidlc-inception` (Bước 1)

6. **Kiến trúc sư**
   - Tích hợp trong lệnh `aidlc-architecture` (Bước 1, 3, 5, 6)

### Phase 3: Thêm Skills (Mức ưu tiên: Trung bình)

1. **Pattern Backend**
   - `cursor/skills/backend-patterns.md`

2. **Quy trình TDD**
   - `cursor/skills/tdd-workflow/`

3. **Review Bảo mật**
   - `cursor/skills/security-review/`

### Phase 4: Thêm Hooks và Lệnh (Mức ưu tiên: Trung bình)

1. **Thêm Hooks**
   - `cursor/hooks/hooks.json`

2. **Lệnh bổ sung**
   - `aidlc-code-review.md`
   - `aidlc-security-review.md`

## Lợi ích của Tích hợp

1. **Nâng cao Chất lượng**
   - Kiểm tra bảo mật tự động
   - Bắt buộc 80% bao phủ kiểm thử
   - Tự động hoá review mã nguồn

2. **Tăng Hiệu quả Phát triển**
   - Thực thi tác vụ song song
   - Tự động format và lint
   - Tự động giải quyết lỗi build

3. **Tối ưu Chi phí**
   - Giảm chi phí qua chiến lược chọn model
   - Tối ưu hoá cửa sổ ngữ cảnh

4. **Đảm bảo Tính nhất quán**
   - Phong cách lập trình thống nhất
   - Workflow được chuẩn hoá

## Lưu ý

1. **Tính nhất quán với Framework AI-DLC**
   - Ưu tiên tích hợp với các lệnh AI-DLC hiện có
   - Khi thêm khái niệm mới, đảm bảo tính nhất quán với nguyên tắc AI-DLC

2. **Triển khai Từng bước**
   - Không triển khai tất cả cùng lúc, triển khai theo từng Phase
   - Kiểm chứng hiệu quả ở mỗi Phase

3. **Tuỳ chỉnh**
   - Điều chỉnh theo yêu cầu riêng của dự án
   - Xoá tính năng không cần thiết

## Bước Tiếp theo

1. Review đề xuất này
2. Bắt đầu triển khai từ Phase 1
3. Đo lường hiệu quả ở mỗi Phase
4. Điều chỉnh dựa trên phản hồi

## Tuân thủ Tài liệu Chính thức Cursor

Tích hợp này tuân thủ best practice của tài liệu chính thức Cursor:

- **Rules**: Sử dụng định dạng `.mdc` (Markdown with frontmatter)
- **Commands**: Sử dụng định dạng `.md` (plain Markdown)
- **Agents**: Sử dụng định dạng `.md` (với YAML frontmatter)

Chi tiết xem tại [Tài liệu Kiểm tra Tuân thủ Cursor](CURSOR_COMPLIANCE_CHECK.md).

## Tài liệu Tham khảo

- [Everything Claude Code](https://github.com/affaan-m/everything-claude-code)
- [The Shorthand Guide to Everything Claude Code](https://x.com/affaanmustafa/status/2012378465664745795)
- [Cursor Rules Documentation](https://docs.cursor.com/context/rules)
- [Cursor Commands Documentation](https://docs.cursor.com/en/agent/chat/commands)
