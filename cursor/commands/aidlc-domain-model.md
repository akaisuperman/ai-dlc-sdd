# Lệnh AI-DLC Tạo Domain Model

## Tổng quan
Tạo Domain Design (Thiết kế Miền) cho Unit được chỉ định. Dựa trên nguyên tắc Domain-Driven Design, mô hình hoá logic nghiệp vụ độc lập với hạ tầng.

## Cách sử dụng
```
@aidlc-domain-model <unit-name>
```

Ví dụ:
```
@aidlc-domain-model "Thuật toán đề xuất"
```

## Nội dung thực thi
1. Đọc định nghĩa Unit
2. Tạo domain model dựa trên nguyên tắc Domain-Driven Design
3. Định nghĩa Aggregates, Value Objects, Entities, Domain Events, Repositories, Factories

## Chỉ thị cho AI Agent

Bạn là Agent Tạo Domain Model (Kỹ sư Phần mềm).

### Bước 1: Tạo Kế hoạch
1. Tạo kế hoạch tại `aidlc-docs/plans/domain_model_<unit-name>_plan.md`
2. Bao gồm các bước:
   - [ ] Đọc định nghĩa Unit
   - [ ] Xác định domain entity
   - [ ] Định nghĩa Value Objects
   - [ ] Định nghĩa Aggregates
   - [ ] Định nghĩa Domain Events
   - [ ] Định nghĩa Repositories
   - [ ] Định nghĩa Factories
   - [ ] Tạo tài liệu Domain Model
3. Chờ phê duyệt từ người dùng

### Bước 2: Đọc Định nghĩa Unit
1. Đọc `aidlc-docs/design-artifacts/units/<unit-name>.md`
2. Phân tích User Stories và tiêu chí chấp nhận
3. Trích xuất yêu cầu logic nghiệp vụ

### Bước 3: Xác định Domain Entity
1. Trích xuất các khái niệm nghiệp vụ chính từ User Stories
2. Định nghĩa cho mỗi entity:
   - Định danh (Identifier)
   - Thuộc tính
   - Quy tắc nghiệp vụ
   - Vòng đời
3. Ví dụ: Với Unit "Thuật toán đề xuất":
   - Product (Sản phẩm)
   - Customer (Khách hàng)
   - PurchaseHistory (Lịch sử mua hàng)

### Bước 4: Định nghĩa Value Objects
1. Xác định các khái niệm có giá trị nhưng không có định danh
2. Đảm bảo tính bất biến
3. Ví dụ: Money, Address, RecommendationScore

### Bước 5: Định nghĩa Aggregates
1. Nhóm Entities và Value Objects thành Aggregates
2. Xác định Aggregate Root
3. Định nghĩa ranh giới
4. Định nghĩa bất biến (invariant)

### Bước 6: Định nghĩa Domain Events
1. Xác định các sự kiện quan trọng về mặt nghiệp vụ
2. Định nghĩa cho mỗi event:
   - Tên event
   - Payload
   - Thời điểm phát sinh
3. Ví dụ: ProductRecommended, CustomerProfileUpdated

### Bước 7: Định nghĩa Repositories
1. Định nghĩa interface Repository cho mỗi Aggregate
2. Cung cấp trừu tượng hoá cho lưu trữ bền vững
3. Định nghĩa phương thức truy vấn

### Bước 8: Định nghĩa Factories
1. Định nghĩa Factory chịu trách nhiệm tạo object phức tạp
2. Bao gồm xác thực bất biến

### Bước 9: Tạo Tài liệu Domain Model
1. Tạo `aidlc-docs/design-artifacts/domain-models/<unit-name>_domain_model.md`
2. Bao gồm:
   - Tổng quan domain model
   - Sơ đồ entity
   - Mô tả Aggregates
   - Mô tả Value Objects
   - Mô tả Domain Events
   - Mô tả Repositories
   - Mô tả Factories
   - Quy tắc nghiệp vụ
3. Cập nhật checkbox trong file kế hoạch

## Artifact
- `aidlc-docs/design-artifacts/domain-models/<unit-name>_domain_model.md`

## Lưu ý
- Không bao gồm chi tiết hạ tầng (tập trung vào logic nghiệp vụ thuần tuý)
- Áp dụng cả thiết kế chiến lược (strategic) và chiến thuật (tactical) của DDD
- Không sinh mã nguồn triển khai (chỉ thiết kế)

