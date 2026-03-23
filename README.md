# Framework AI-Driven Development Lifecycle (AI-DLC)

Dự án này là framework để thực thi quy trình phát triển dựa trên AI-DLC (AI-Driven Development Lifecycle).

## Tổng quan

AI-DLC là phương pháp vòng đời phát triển do AI chủ đạo. Khác với quy trình truyền thống do con người dẫn dắt, AI sẽ phân tách workflow, tạo đề xuất, còn con người thực hiện phê duyệt và xác minh.

### Đặc điểm Chính

- **AI chủ đạo**: AI phân tách workflow và tạo kế hoạch
- **Con người phê duyệt**: Con người phê duyệt và xác minh tại các điểm quyết định quan trọng
- **Lặp nhanh**: Chu kỳ nhanh theo giờ hoặc ngày (Bolts)
- **Tích hợp phương pháp thiết kế**: Tích hợp DDD, BDD, TDD và các phương pháp thiết kế khác vào lõi
- **Khả năng truy vết**: Tất cả artifact được liên kết, đảm bảo khả năng truy vết xuôi ngược

## Cài đặt & Triển khai

Hướng dẫn triển khai framework AI-DLC vào dự án của bạn.

### Yêu cầu Trước

Cần cài đặt một trong các công cụ sau:
- [Cursor](https://cursor.sh/) editor
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI

### Các Bước Triển khai (Cursor)

#### 1. Sao chép File Framework

```bash
cd /path/to/your/project

mkdir -p .cursor
cp /path/to/ai-dlc-sdd/cursor/AGENTS.md .cursor/

mkdir -p .cursor/commands/aidlc
cp /path/to/ai-dlc-sdd/cursor/commands/*.md .cursor/commands/aidlc/
```

#### 2. Cách Sử dụng

Nhập `@` theo sau tên lệnh trong chat của Cursor editor:

```
@aidlc-setup
@aidlc-inception "Mô tả sản phẩm"
```

### Các Bước Triển khai (Claude Code)

#### 1. Sao chép File Framework

```bash
cd /path/to/your/project

# Sao chép commands
mkdir -p .claude/commands
cp /path/to/ai-dlc-sdd/claude-code/commands/*.md .claude/commands/

# Sao chép rules
mkdir -p .claude/rules
cp /path/to/ai-dlc-sdd/claude-code/rules/*.md .claude/rules/

# Sao chép CLAUDE.md vào thư mục gốc dự án
cp /path/to/ai-dlc-sdd/claude-code/CLAUDE.md ./CLAUDE.md
```

#### 2. Cách Sử dụng

Nhập `/` theo sau tên lệnh trong chat của Claude Code:

```
/aidlc-setup
/aidlc-inception "Mô tả sản phẩm"
```

### Tương thích Cursor / Claude Code

Có thể làm việc trên **cùng một dự án** với cả hai công cụ. Tất cả artifact được tạo ra (`aidlc-docs/`, `BACKEND/`, v.v.) đều chung.

| Hạng mục | Cursor | Claude Code |
|------|--------|-------------|
| Gọi lệnh | `@aidlc-*` | `/aidlc-*` |
| Nơi đặt lệnh | `.cursor/commands/` | `.claude/commands/` |
| Nơi đặt rules | `.cursor/rules/*.mdc` | `.claude/rules/*.md` |
| Cấu hình dự án | `.cursorrules`, v.v. | `CLAUDE.md` |
| Artifact tạo ra | Giống nhau | Giống nhau |

### Khởi tạo Cấu trúc Dự án

Sau khi triển khai framework, chạy lệnh sau đầu tiên để khởi tạo cấu trúc dự án:

```
/aidlc-setup
```

### Tuỳ chỉnh

- Cursor: Chỉnh sửa `.cursor/commands/aidlc/*.md`
- Claude Code: Chỉnh sửa `.claude/commands/*.md`

## Cấu trúc Dự án

```
aidlc-docs/
├── requirements/          # Tài liệu yêu cầu
├── story-artifacts/       # User Stories
├── design-artifacts/      # Tài liệu thiết kế
│   ├── domain-models/    # Domain model
│   ├── logical-designs/  # Thiết kế logic
│   ├── static-models/    # Mô hình tĩnh (cho Brown-Field)
│   ├── dynamic-models/   # Mô hình động (cho Brown-Field)
│   ├── adrs/             # Architecture Decision Records
│   └── units/            # Định nghĩa Units
├── plans/                # Tài liệu kế hoạch
└── prompts.md           # Lịch sử prompt

BACKEND/                  # Mã nguồn backend
FRONTEND/                # Mã nguồn frontend (nếu có)
DEPLOYMENT/              # Cấu hình triển khai
ARCHITECTURE/            # Tài liệu kiến trúc
UNITS/                   # Định nghĩa Units
```

## Bắt đầu Nhanh

### 1. Thiết lập

Thực hiện thiết lập ban đầu cho dự án:

```
/aidlc-setup
```

Lệnh này tạo cấu trúc thư mục và file cần thiết.

### 2. Giai đoạn Inception (Khởi tạo)

Tạo User Stories và Units từ mô tả sản phẩm:

```
/aidlc-inception "Phát triển engine đề xuất sản phẩm bán chéo (cross-sell)"
```

Lệnh này thực hiện:
- Làm rõ Intent (tạo câu hỏi)
- Tạo User Stories
- Định nghĩa NFRs (Yêu cầu phi chức năng)
- Mô tả Risk (Rủi ro)
- Phân tách thành Units
- Tạo PRFAQ (tuỳ chọn)
- Định nghĩa Measurement Criteria (Tiêu chí đo lường)
- Tạo Suggested Bolts (Bolt đề xuất)

### 3. Giai đoạn Construction (Xây dựng)

#### Tạo Domain Model

Tạo Domain Design cho Unit được chỉ định:

```
/aidlc-domain-model "Thuật toán đề xuất"
```

#### Thiết kế Architecture

Chuyển đổi Domain Design thành Logical Design và áp dụng pattern kiến trúc để đáp ứng NFRs:

```
/aidlc-architecture "Thuật toán đề xuất"
```

#### Sinh Mã nguồn

Sinh mã nguồn thực thi và unit test dựa trên Domain Model và Logical Design:

```
/aidlc-code-generation "Thuật toán đề xuất"
```

#### Sinh IaC/REST APIs

Sinh Infrastructure as Code và REST API:

```
/aidlc-iac-apis "Thuật toán đề xuất" terraform
```

### 4. Giai đoạn Operations (Vận hành)

#### Triển khai

Đóng gói Deployment Units và triển khai đến môi trường:

```
/aidlc-deployment "Thuật toán đề xuất" staging
```

#### Giám sát

Thiết lập giám sát, phân tích metrics và quản lý sự cố cho hệ thống đã triển khai:

```
/aidlc-monitoring "Thuật toán đề xuất"
```

## Phát triển Brown-Field

Khi thêm tính năng mới vào hệ thống hiện có:

### 1. Phân tích Mã nguồn Hiện có

Chuyển đổi mã nguồn hiện có thành biểu diễn mô hình hoá cấp cao:

```
/aidlc-brownfield "BACKEND/legacy-system"
```

Lệnh này thực hiện:
- Phân tích mã nguồn hiện có
- Tạo mô hình tĩnh (component, trách nhiệm, quan hệ)
- Tạo mô hình động (tương tác để thực hiện use case)
- Xây dựng ngữ cảnh

### 2. Giai đoạn Construction Thông thường

Sau khi phân tích Brown-Field, thực hiện Giai đoạn Construction thông thường.

## Luồng Phát triển

### Luồng Phát triển Green-Field

```
1. /aidlc-setup
   ↓
2. /aidlc-inception "<product-description>"
   ↓
3. /aidlc-domain-model <unit-name>
   ↓
4. /aidlc-architecture <unit-name>
   ↓
5. /aidlc-code-generation <unit-name>
   ↓
6. /aidlc-iac-apis <unit-name> <tool>
   ↓
7. /aidlc-deployment <unit-name> <environment>
   ↓
8. /aidlc-monitoring <unit-name>
```

### Luồng Phát triển Brown-Field

```
1. /aidlc-setup
   ↓
2. /aidlc-brownfield <existing-code-path>
   ↓
3. /aidlc-inception "<product-description>"
   ↓
4. (Giai đoạn Construction giống Green-Field)
```

## Danh sách Lệnh

| Lệnh | Mô tả | Giai đoạn |
|---------|------|---------|
| `/aidlc-setup` | Thiết lập ban đầu cho dự án | Setup |
| `/aidlc-inception` | Phân tách Intent thành User Stories và Units | Inception |
| `/aidlc-brownfield` | Phân tích và mô hình hoá mã nguồn hiện có | Construction (Brown-Field) |
| `/aidlc-domain-model` | Tạo Domain Design | Construction |
| `/aidlc-architecture` | Tạo Logical Design | Construction |
| `/aidlc-code-generation` | Sinh mã nguồn và unit test | Construction |
| `/aidlc-iac-apis` | Sinh IaC và REST API | Construction |
| `/aidlc-deployment` | Thực hiện triển khai | Operations |
| `/aidlc-monitoring` | Thiết lập giám sát và quản lý sự cố | Operations |
| `/aidlc-modification` | Phân tích tác động và lập kế hoạch chỉnh sửa bổ sung | Modification |
| `/aidlc-refactor` | Tái cấu trúc mã nguồn và thiết kế | Improvement |

## Artifact

### Giai đoạn Inception

- **Intent**: Mô tả mục đích cấp cao
- **User Stories**: Mô tả yêu cầu chức năng
- **NFRs**: Định nghĩa yêu cầu phi chức năng
- **Risks**: Mô tả rủi ro
- **Units**: Đơn vị công việc có thể xây dựng độc lập
- **PRFAQ**: Tóm tắt ý định kinh doanh (tuỳ chọn)
- **Measurement Criteria**: Định nghĩa tiêu chí đo lường
- **Suggested Bolts**: Chu kỳ lặp ngắn hạn được đề xuất

### Giai đoạn Construction

- **Domain Design**: Mô hình logic nghiệp vụ (độc lập với hạ tầng)
- **Logical Design**: Thiết kế áp dụng pattern kiến trúc để đáp ứng NFRs
- **Code and Unit Tests**: Mã nguồn thực thi và unit test
- **ADRs**: Bản ghi Quyết định Kiến trúc

### Giai đoạn Operations

- **Deployment Units**: Mã nguồn thực thi đã đóng gói, cấu hình, hạ tầng
- **Monitoring Dashboards**: Dashboard giám sát
- **Incident Runbooks**: Playbook xử lý sự cố

## Nguyên tắc

### Tiếp cận Kế hoạch Trước (Plan-First)

Tất cả agent phải tạo kế hoạch trước khi bắt đầu công việc và chờ phê duyệt từ con người.

### Kế hoạch có Checkbox

Tất cả kế hoạch được tạo dưới dạng file Markdown có checkbox, và được đánh dấu khi hoàn thành từng bước.

### Các Điểm Cần Phê duyệt từ Con người

- Phê duyệt kế hoạch
- Quyết định thiết kế quan trọng
- Đánh giá rủi ro
- Phê duyệt triển khai

### Bộ nhớ Ngữ cảnh (Context Memory)

Tất cả artifact được lưu trữ bền vững và hoạt động như "bộ nhớ ngữ cảnh" được tham chiếu trong các bước tiếp theo.

### Khả năng Truy vết (Traceability)

Tất cả artifact được liên kết với nhau, đảm bảo khả năng truy vết xuôi ngược (ví dụ: liên kết giữa phần tử Domain Model và User Stories).

## Vai trò Chuyên gia

Chi tiết định nghĩa vai trò chuyên gia, xem tại:
- Phiên bản Cursor: [cursor/AGENTS.md](cursor/AGENTS.md)
- Phiên bản Claude Code: [claude-code/AGENTS.md](claude-code/AGENTS.md)

Vai trò chuyên gia được triển khai trong mỗi lệnh.

## Tài liệu Tham khảo

- [Định nghĩa Phương pháp AI-DLC](docs/AI-DLC.md) - Định nghĩa đầy đủ phương pháp AI-DLC
- [Đề xuất Tích hợp Everything Claude Code](docs/INTEGRATION_PROPOSAL.md) - Đề xuất tích hợp kỹ thuật Everything Claude Code

## Tích hợp Everything Claude Code

Framework này tích hợp các kỹ thuật thực tiễn từ [Everything Claude Code](https://github.com/affaan-m/everything-claude-code):

- **Rules (Quy tắc)**: Hướng dẫn về bảo mật, kiểm thử, hiệu suất, phong cách lập trình
- **Vai trò Chuyên gia**: Vai trò chuyên gia review mã nguồn, review bảo mật, hướng dẫn TDD, v.v. (tích hợp trong Commands)
- **Tối ưu Hiệu suất**: Chiến lược chọn model, quản lý cửa sổ ngữ cảnh

Chi tiết xem tại [Tài liệu Đề xuất Tích hợp](docs/INTEGRATION_PROPOSAL.md).

## Giấy phép

Dự án này được triển khai dựa trên phương pháp AI-DLC.
