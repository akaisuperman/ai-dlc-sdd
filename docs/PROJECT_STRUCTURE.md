# Cấu trúc Dự án AI-DLC

Tài liệu này mô tả cấu trúc dự án được sử dụng trong framework AI-DLC.

## Cấu trúc Thư mục

```
aidlc-docs/
├── requirements/          # Tài liệu yêu cầu
│   ├── nfrs.md           # Yêu cầu phi chức năng
│   ├── risks.md          # Mô tả rủi ro
│   ├── prfaq.md          # PRFAQ (tuỳ chọn)
│   └── measurement_criteria.md  # Tiêu chí đo lường
│
├── story-artifacts/       # User Stories
│   └── user_stories.md    # Câu chuyện người dùng
│
├── design-artifacts/      # Tài liệu thiết kế
│   ├── domain-models/    # Domain model
│   │   └── <unit-name>_domain_model.md
│   ├── logical-designs/  # Thiết kế logic
│   │   └── <unit-name>_logical_design.md
│   ├── static-models/    # Mô hình tĩnh (cho Brown-Field)
│   │   └── <system-name>_static_model.md
│   ├── dynamic-models/   # Mô hình động (cho Brown-Field)
│   │   └── <system-name>_dynamic_model.md
│   ├── adrs/             # Architecture Decision Records
│   │   └── <unit-name>_<decision>.md
│   ├── units/            # Định nghĩa Units
│   │   ├── <unit-name>.md
│   │   └── integration_specs.md
│   └── brownfield-context/  # Ngữ cảnh Brown-Field
│       └── <system-name>_context.md
│
├── plans/                # Tài liệu kế hoạch
│   ├── setup_plan.md
│   ├── inception_plan.md
│   ├── units_plan.md
│   ├── domain_model_<unit-name>_plan.md
│   ├── architecture_<unit-name>_plan.md
│   ├── code_generation_<unit-name>_plan.md
│   ├── iac_apis_<unit-name>_plan.md
│   ├── deployment_<unit-name>_<environment>_plan.md
│   ├── monitoring_<unit-name>_plan.md
│   └── suggested_bolts.md
│
└── prompts.md           # Lịch sử prompt

BACKEND/                  # Mã nguồn backend
├── <unit-name>/
│   ├── domain/          # Lớp domain
│   ├── application/     # Lớp application
│   ├── infrastructure/  # Lớp infrastructure
│   ├── api/             # REST API
│   └── tests/           # Unit test

FRONTEND/                # Mã nguồn frontend (nếu có)
└── <unit-name>/

DEPLOYMENT/              # Cấu hình triển khai
├── <unit-name>/
│   ├── terraform/       # Mã Terraform
│   ├── cdk/             # Mã AWS CDK
│   ├── cloudformation/  # Template CloudFormation
│   ├── packages/        # Deployment package
│   └── monitoring/      # Cấu hình giám sát

ARCHITECTURE/            # Tài liệu kiến trúc
└── <unit-name>/

UNITS/                   # Định nghĩa Units (tuỳ chọn)
└── <unit-name>/
```

## Mô tả Thư mục

### `aidlc-docs/`

Thư mục gốc lưu trữ tất cả tài liệu và artifact.

#### `requirements/`

Lưu trữ tài liệu liên quan đến yêu cầu:
- **nfrs.md**: Yêu cầu phi chức năng (hiệu suất, khả năng mở rộng, bảo mật, v.v.)
- **risks.md**: Mô tả rủi ro (kỹ thuật, kinh doanh, vận hành, tuân thủ)
- **prfaq.md**: PRFAQ (Press Release / FAQ) - Tóm tắt ý định kinh doanh (tuỳ chọn)
- **measurement_criteria.md**: Tiêu chí đo lường - Tiêu chí có thể truy vết đến ý định kinh doanh

#### `story-artifacts/`

Lưu trữ User Stories:
- **user_stories.md**: Tất cả User Stories và tiêu chí chấp nhận

#### `design-artifacts/`

Lưu trữ tài liệu liên quan đến thiết kế:

- **domain-models/**: Domain model dựa trên nguyên tắc Domain-Driven Design
- **logical-designs/**: Thiết kế logic áp dụng pattern kiến trúc để đáp ứng NFRs
- **static-models/**: Mô hình tĩnh cho phát triển Brown-Field (component, trách nhiệm, quan hệ)
- **dynamic-models/**: Mô hình động cho phát triển Brown-Field (tương tác để thực hiện use case)
- **adrs/**: Architecture Decision Records - Ghi nhận các quyết định kiến trúc quan trọng
- **units/**: Định nghĩa Units và đặc tả tích hợp
- **brownfield-context/**: Tài liệu ngữ cảnh cho phát triển Brown-Field

#### `plans/`

Lưu trữ tất cả tài liệu kế hoạch. Mỗi kế hoạch được tạo dưới dạng file Markdown có checkbox, và được đánh dấu khi hoàn thành từng bước.

### `BACKEND/`

Lưu trữ mã nguồn backend. Thư mục con được tạo cho mỗi Unit.

- **domain/**: Lớp domain (Entities, Value Objects, Aggregates, Domain Events)
- **application/**: Lớp application (Use Cases, Application Services, DTOs)
- **infrastructure/**: Lớp infrastructure (triển khai Repositories, tích hợp dịch vụ bên ngoài)
- **api/**: Triển khai REST API
- **tests/**: Unit test

### `FRONTEND/`

Lưu trữ mã nguồn frontend (nếu có).

### `DEPLOYMENT/`

Lưu trữ file liên quan đến triển khai:

- **terraform/**: Mã Terraform
- **cdk/**: Mã AWS CDK
- **cloudformation/**: Template CloudFormation
- **packages/**: Deployment package (container image, serverless function, v.v.)
- **monitoring/**: Cấu hình giám sát

### `ARCHITECTURE/`

Lưu trữ tài liệu liên quan đến kiến trúc.

### `UNITS/`

Lưu trữ định nghĩa Units (tuỳ chọn).

## Quy tắc Đặt tên File

### File Kế hoạch
- `*_plan.md`: File kế hoạch
- `*_validation_plan.md`: Kế hoạch xác minh
- `*_validation_report.md`: Báo cáo xác minh
- `*_test_results.md`: Kết quả test

### File Thiết kế
- `<unit-name>_domain_model.md`: Domain model
- `<unit-name>_logical_design.md`: Thiết kế logic
- `<unit-name>_static_model.md`: Mô hình tĩnh
- `<unit-name>_dynamic_model.md`: Mô hình động
- `<unit-name>_<decision>.md`: ADR

### Thư mục Mã nguồn
- `<unit-name>/`: Tên thư mục dựa trên tên Unit

## Khởi tạo

Cấu trúc dự án được tự động tạo bằng lệnh `@aidlc-setup`.

Nếu tạo thủ công:

```bash
mkdir -p aidlc-docs/{requirements,story-artifacts,design-artifacts/{domain-models,logical-designs,static-models,dynamic-models,adrs,units,brownfield-context},plans}
mkdir -p BACKEND FRONTEND DEPLOYMENT ARCHITECTURE UNITS
```

Đặt file `.gitkeep` trong mỗi thư mục rỗng để bao gồm trong Git.

## Best Practice

1. **Tính nhất quán**: Tên file và thư mục tuân theo quy tắc đặt tên nhất quán
2. **Khả năng truy vết**: Tất cả artifact được liên kết, đảm bảo khả năng truy vết xuôi ngược
3. **Quản lý phiên bản**: Tất cả artifact được quản lý bằng Git
4. **Tài liệu**: Mỗi artifact chứa mô tả phù hợp
5. **Cấu trúc hoá**: Artifact được lưu ở định dạng có cấu trúc (Markdown)

