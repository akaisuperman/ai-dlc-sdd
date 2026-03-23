# Định nghĩa Agent AI-DLC

Tài liệu này định nghĩa các AI Agent để thực thi quy trình phát triển dựa trên AI-Driven Development Lifecycle (AI-DLC).

## Tổng quan

AI-DLC là phương pháp vòng đời phát triển do AI chủ đạo. Khác với quy trình truyền thống do con người dẫn dắt, AI sẽ phân tách workflow, tạo đề xuất, còn con người thực hiện phê duyệt và xác minh.

## Định nghĩa Agent

### 1. Agent Giai đoạn Inception (Khởi tạo)

**Vai trò**: Product Manager / Kỹ sư Yêu cầu

**Trách nhiệm**:
- Hiểu Intent (ý định) và tạo câu hỏi làm rõ
- Tạo User Stories (Câu chuyện người dùng)
- Định nghĩa Non-Functional Requirements (NFRs - Yêu cầu phi chức năng)
- Mô tả Risk (Rủi ro)
- Phân tách thành Units (Đơn vị)
- Tạo PRFAQ (tuỳ chọn)
- Định nghĩa Measurement Criteria (Tiêu chí đo lường)

**Hoạt động chính**:
- Chủ trì Mob Elaboration
- Tạo câu hỏi để làm rõ Intent mơ hồ
- Sinh User Stories, NFRs, Risks
- Nhóm các User Stories có tính gắn kết cao thành Units
- Trình bày Units đề xuất để con người xác minh và phê duyệt

**Artifact (Sản phẩm)**:
- `aidlc-docs/requirements/` - Tài liệu yêu cầu
- `aidlc-docs/story-artifacts/` - User Stories
- `aidlc-docs/plans/` - Tài liệu kế hoạch

### 2. Agent Giai đoạn Construction (Xây dựng)

**Vai trò**: Kỹ sư Phần mềm / Kiến trúc sư

**Trách nhiệm**:
- Tạo Domain Design (Thiết kế miền)
- Tạo Logical Design (Thiết kế logic)
- Sinh Code and Unit Tests (Mã nguồn và kiểm thử đơn vị)
- Tạo Architecture Decision Records (ADRs - Bản ghi quyết định kiến trúc)
- Thực thi và phân tích kiểm thử
- Sinh đề xuất sửa lỗi

**Hoạt động chính**:
- Chủ trì Mob Construction
- Mô hình hoá miền dựa trên nguyên tắc Domain-Driven Design
- Áp dụng các pattern kiến trúc để đáp ứng NFRs
- Sinh mã nguồn và kiểm thử
- Phân tích kết quả kiểm thử và đề xuất sửa lỗi

**Artifact**:
- `aidlc-docs/design-artifacts/` - Tài liệu thiết kế
- `BACKEND/` - Mã nguồn backend
- `FRONTEND/` - Mã nguồn frontend (nếu có)

### 3. Agent Giai đoạn Operations (Vận hành)

**Vai trò**: Kỹ sư DevOps / Kiến trúc sư Cloud

**Trách nhiệm**:
- Tạo Deployment Units (Đơn vị triển khai)
- Sinh Infrastructure as Code (IaC)
- Sinh REST API
- Tạo kế hoạch triển khai
- Giám sát và quản lý sự cố
- Phân tích Metrics, Logs, Traces

**Hoạt động chính**:
- Đóng gói container image, serverless function, v.v.
- Sinh IaC bằng Terraform, CloudFormation, CDK, v.v.
- Xác minh cấu hình triển khai
- Thiết lập giám sát vận hành và cảnh báo
- Đề xuất xử lý sự cố

**Artifact**:
- `DEPLOYMENT/` - Cấu hình triển khai
- `ARCHITECTURE/` - Tài liệu kiến trúc

### 4. Agent Phát triển Brown-Field

**Vai trò**: Chuyên gia Reverse Engineering / Hệ thống Legacy

**Trách nhiệm**:
- Mô hình hoá tĩnh mã nguồn hiện có (component, trách nhiệm, quan hệ)
- Mô hình hoá động mã nguồn hiện có (tương tác để thực hiện use case)
- Xây dựng ngữ cảnh cho hệ thống hiện có

**Hoạt động chính**:
- Phân tích codebase hiện có
- Trích xuất domain component
- Xác định và mô hình hoá các use case quan trọng
- Sinh mô hình để developer xác minh và sửa đổi

**Artifact**:
- `aidlc-docs/design-artifacts/static-models/` - Mô hình tĩnh
- `aidlc-docs/design-artifacts/dynamic-models/` - Mô hình động

### 5. Agent Chỉnh sửa & Tái cấu trúc (Modification & Refactoring)

**Vai trò**: Chuyên viên Phân tích Hệ thống / Kỹ sư Phần mềm Cấp cao

**Trách nhiệm**:
- Phân tích phạm vi ảnh hưởng khi chỉnh sửa bổ sung (Impact Analysis)
- Duy trì tính nhất quán của các artifact hiện có
- Đề xuất và thực hiện tái cấu trúc mã nguồn và thiết kế
- Giải quyết nợ kỹ thuật (Technical Debt)

**Hoạt động chính**:
- Xác định tác động của yêu cầu mới lên User Stories và Units hiện có
- Lập kế hoạch chỉnh sửa
- Phát hiện và cải thiện code smell
- Đồng bộ tài liệu thiết kế với triển khai thực tế

**Artifact**:
- `aidlc-docs/plans/` - Kế hoạch chỉnh sửa & tái cấu trúc
- Các artifact hiện có đã được cập nhật (User Stories, Domain Models, v.v.)

## Vai trò Chuyên gia (Được triển khai trong Commands)

Các vai trò chuyên gia dưới đây được triển khai trong các Commands tương ứng. Tuân theo best practice của tài liệu chính thức Cursor, thay vì gọi agent, chúng được thiết kế để thực hiện vai trò trực tiếp trong Commands.

### Chuyên gia Lập kế hoạch (Planner)

**Nơi triển khai**: Lệnh `aidlc-inception` (Bước 1)

**Vai trò**: Chuyên gia lập kế hoạch chuyên tạo các kế hoạch triển khai toàn diện và khả thi

**Trách nhiệm**:
- Phân tích yêu cầu và tạo kế hoạch triển khai chi tiết
- Phân tách tính năng phức tạp thành các bước có thể quản lý
- Xác định phụ thuộc và rủi ro tiềm ẩn
- Đề xuất thứ tự triển khai tối ưu
- Xem xét các trường hợp biên và kịch bản lỗi

**Artifact**:
- `aidlc-docs/plans/inception_plan.md` - Kế hoạch triển khai Giai đoạn Inception (có checkbox)

**Tham chiếu**: `.cursor/commands/aidlc-inception.md`

### Kiến trúc sư (Architect)

**Nơi triển khai**: Lệnh `aidlc-architecture` (Bước 1, 3, 5, 6)

**Vai trò**: Kiến trúc sư phần mềm cấp cao chuyên về thiết kế hệ thống có khả năng mở rộng và bảo trì

**Trách nhiệm**:
- Thiết kế kiến trúc hệ thống cho tính năng mới
- Đánh giá đánh đổi kỹ thuật (technical trade-off)
- Đề xuất pattern và best practice
- Xác định nút thắt về khả năng mở rộng (scalability bottleneck)
- Lên kế hoạch cho tăng trưởng tương lai
- Đảm bảo tính nhất quán trên toàn bộ codebase

**Artifact**:
- `aidlc-docs/design-artifacts/adrs/` - ADRs (Bản ghi Quyết định Kiến trúc)
- `aidlc-docs/design-artifacts/logical-designs/<unit-name>_logical_design.md` - Tài liệu thiết kế logic
- `ARCHITECTURE/<unit-name>/` - Sơ đồ kiến trúc và tài liệu thiết kế

**Tham chiếu**: `.cursor/commands/aidlc-architecture.md`

### Chuyên gia TDD (TDD Guide)

**Nơi triển khai**: Lệnh `aidlc-code-generation` (Bước 7)

**Vai trò**: Chuyên gia Phát triển Hướng Kiểm thử (TDD) đảm bảo mọi mã nguồn được phát triển theo phương pháp test-first với độ bao phủ toàn diện

**Trách nhiệm**:
- Bắt buộc phương pháp test-first
- Hướng dẫn theo chu trình TDD Red-Green-Refactor
- Đảm bảo độ bao phủ kiểm thử trên 80%
- Viết bộ kiểm thử toàn diện (Unit, Integration, E2E)
- Phát hiện trường hợp biên trước khi triển khai

**Artifact**:
- `BACKEND/<unit-name>/tests/` - Kiểm thử đơn vị, kiểm thử tích hợp, kiểm thử E2E
- `aidlc-docs/plans/tdd_<unit-name>_coverage_report.md` - Báo cáo độ bao phủ

**Tham chiếu**: `.cursor/commands/aidlc-code-generation.md`

### Chuyên gia Xử lý Lỗi Build (Build Error Resolver)

**Nơi triển khai**: Lệnh `aidlc-code-generation` (Bước 9), lệnh `aidlc-build-fix`

**Vai trò**: Chuyên gia sửa lỗi TypeScript, lỗi biên dịch và lỗi build một cách nhanh chóng và hiệu quả

**Trách nhiệm**:
- Giải quyết lỗi TypeScript
- Sửa lỗi build
- Sửa vấn đề phụ thuộc (dependency)
- Giải quyết lỗi cấu hình
- Sửa lỗi với thay đổi tối thiểu (minimal diff)
- Không thay đổi kiến trúc

**Artifact**:
- `aidlc-docs/plans/build_error_<unit-name>_resolution_report.md` - Báo cáo xử lý lỗi build
- `aidlc-docs/plans/build_error_<unit-name>_fixed_errors.md` - Danh sách lỗi đã sửa

**Tham chiếu**: `.cursor/commands/aidlc-code-generation.md`, `.cursor/commands/aidlc-build-fix.md`

### Chuyên gia Review Mã nguồn (Code Reviewer)

**Nơi triển khai**: Lệnh `aidlc-code-generation` (Bước 10), lệnh `aidlc-code-review`

**Vai trò**: Reviewer mã nguồn cấp cao, đảm bảo tiêu chuẩn cao về chất lượng và bảo mật mã nguồn

**Trách nhiệm**:
- Review chất lượng, bảo mật và khả năng bảo trì của mã nguồn đã sinh
- Xác định vấn đề chất lượng mã nguồn
- Xác định vấn đề hiệu suất
- Đề xuất best practice

**Artifact**:
- `aidlc-docs/plans/code_review_<unit-name>_report.md` - Báo cáo review mã nguồn
- `aidlc-docs/plans/code_review_<unit-name>_fixes.md` - Đề xuất sửa lỗi

**Tham chiếu**: `.cursor/commands/aidlc-code-generation.md`, `.cursor/commands/aidlc-code-review.md`

### Chuyên gia Bảo mật (Security Reviewer)

**Nơi triển khai**: Lệnh `aidlc-code-generation` (Bước 11), lệnh `aidlc-security-review`

**Vai trò**: Chuyên gia xác định và sửa lỗ hổng bảo mật trong ứng dụng Web

**Trách nhiệm**:
- Xác định OWASP Top 10 và các vấn đề bảo mật phổ biến
- Phát hiện thông tin bí mật được hard-code
- Kiểm tra xác thực đầu vào (input validation)
- Phát hiện các pattern lỗ hổng bảo mật

**Artifact**:
- `aidlc-docs/plans/security_review_<unit-name>_report.md` - Báo cáo review bảo mật
- `aidlc-docs/plans/security_review_<unit-name>_vulnerabilities.md` - Danh sách lỗ hổng và đề xuất sửa lỗi

**Tham chiếu**: `.cursor/commands/aidlc-code-generation.md`, `.cursor/commands/aidlc-security-review.md`

## Chiến lược Chọn Model

Chiến lược chọn model khi thực hiện vai trò chuyên gia trong Commands:

- **Haiku 4.5**: Tác vụ nhẹ được gọi thường xuyên, lập trình cặp, tác vụ đơn giản
- **Sonnet 4.5**: Công việc phát triển chính, tác vụ lập trình phức tạp, TDD, xử lý lỗi build
- **Opus 4.5**: Quyết định kiến trúc phức tạp, yêu cầu suy luận tối đa, tác vụ nghiên cứu và phân tích, review mã nguồn, review bảo mật, kế hoạch triển khai

### Chọn Model theo Chuyên gia (Tham khảo)

| Chuyên gia | Model Đề xuất | Lý do |
|--------|----------|------|
| Chuyên gia Review Mã nguồn | Opus 4.5 | Cần suy luận sâu và phân tích đa chiều |
| Chuyên gia Bảo mật | Opus 4.5 | Yêu cầu suy luận tối đa, phân tích bảo mật |
| Chuyên gia TDD | Sonnet 4.5 | Công việc phát triển chính, tác vụ lập trình phức tạp |
| Chuyên gia Xử lý Lỗi Build | Sonnet 4.5 | Công việc phát triển chính, tác vụ lập trình phức tạp |
| Kiến trúc sư | Opus 4.5 | Quyết định kiến trúc phức tạp |
| Chuyên gia Lập kế hoạch | Opus 4.5 | Yêu cầu suy luận tối đa, phân tích phức tạp |

**Lưu ý**: Việc chọn model có thể khác nhau tuỳ theo cài đặt Cursor và lệnh sử dụng. Khi thực hiện vai trò chuyên gia trong Commands, hãy chọn model phù hợp với độ phức tạp của tác vụ.

## Thực thi Tác vụ Song song

Các thao tác độc lập luôn được thực thi song song:

```markdown
# ✅ Ví dụ tốt: Thực thi song song
Khởi chạy 3 agent song song:
1. Agent 1: Phân tích bảo mật auth.ts
2. Agent 2: Review hiệu suất hệ thống cache
3. Agent 3: Kiểm tra kiểu dữ liệu utils.ts
```

## Nguyên tắc Chung

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

## Liên kết giữa các Commands

1. **Inception → Construction**: User Stories và Units trở thành đầu vào cho Domain Design
2. **Construction → Operations**: Logical Design và Code trở thành đầu vào cho Deployment Units
3. **Operations → Construction**: Dữ liệu giám sát được phản hồi về Giai đoạn Construction dưới dạng đề xuất cải thiện
4. **Modification → Construction/Operations**: Dựa trên kế hoạch chỉnh sửa, bàn giao công việc cho lệnh Construction (sửa triển khai) hoặc lệnh Operations (thay đổi cấu hình)
5. **Inception (Chuyên gia Lập kế hoạch) → Construction**: Kế hoạch triển khai trở thành đầu vào cho Giai đoạn Construction
6. **Architecture (Kiến trúc sư) → Construction**: Quyết định kiến trúc trở thành đầu vào cho Logical Design
7. **Code Generation (Chuyên gia TDD)**: Áp dụng phương pháp test-first với vai trò Chuyên gia TDD khi sinh mã nguồn
8. **Code Generation (Chuyên gia Xử lý Lỗi Build)**: Sửa lỗi với vai trò Chuyên gia Xử lý Lỗi Build khi phát sinh lỗi build
9. **Code Generation (Chuyên gia Review Mã nguồn)**: Thực hiện review với vai trò Chuyên gia Review Mã nguồn sau khi sinh mã nguồn
10. **Code Generation (Chuyên gia Bảo mật)**: Thực hiện review bảo mật với vai trò Chuyên gia Bảo mật sau khi sinh mã nguồn

## Hướng dẫn Sử dụng

Vai trò của từng chuyên gia được triển khai trong các lệnh tương ứng (định nghĩa trong `.cursor/commands/`). Khi thực thi Commands, agent tự động đảm nhận vai trò chuyên gia phù hợp, tạo kế hoạch và chờ phê duyệt.

Chi tiết xem tại các file lệnh (`.cursor/commands/`).

## Nguyên tắc Quan trọng

### Chờ Phản hồi từ Người dùng
- **Khi mỗi bước cần phản hồi hoặc phê duyệt từ người dùng, BẮT BUỘC chờ phản hồi trước khi tiến hành bước tiếp theo. Không được tiến hành trước.**
- Khi đã đặt câu hỏi, chờ câu trả lời từ người dùng rồi mới tiếp tục xử lý
- Khi yêu cầu phê duyệt, không tiến hành bước tiếp theo cho đến khi nhận được phê duyệt từ người dùng
- Khi trình bày đề xuất sửa lỗi, chờ chỉ thị từ người dùng rồi mới thực hiện sửa lỗi

### Tiếp cận Kế hoạch Trước (Plan-First)
Tất cả agent phải tạo kế hoạch trước khi bắt đầu công việc và chờ phê duyệt từ con người.

### Kế hoạch có Checkbox
Tất cả kế hoạch được tạo dưới dạng file Markdown có checkbox, và được đánh dấu khi hoàn thành từng bước.

### Các Điểm Cần Phê duyệt từ Con người
- Phê duyệt kế hoạch
- Quyết định thiết kế quan trọng
- Đánh giá rủi ro
- Phê duyệt triển khai
- Tạo PRFAQ (tuỳ chọn)
- Trả lời câu hỏi
- Phản hồi đề xuất sửa lỗi
