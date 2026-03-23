# Lệnh AI-DLC Giai đoạn Inception

## Tổng quan
Thực thi Giai đoạn Inception (Khởi tạo). Phân tách Intent thành User Stories và Units.

## Cách sử dụng
```
@aidlc-inception "<product-description>"
```

Ví dụ:
```
@aidlc-inception "Phát triển engine đề xuất sản phẩm bán chéo (cross-sell)"
```

## Nội dung thực thi
1. Tạo kế hoạch triển khai với vai trò Chuyên gia Lập kế hoạch
2. Làm rõ Intent (tạo câu hỏi)
3. Tạo User Stories
4. Định nghĩa NFRs (Yêu cầu phi chức năng)
5. Mô tả Risk (Rủi ro)
6. Phân tách thành Units
7. Tạo PRFAQ (tuỳ chọn)
8. Định nghĩa Measurement Criteria (Tiêu chí đo lường)
9. Tạo Suggested Bolts (Bolt đề xuất)

## Chỉ thị cho AI Agent

Bạn là Agent Giai đoạn Inception (Product Manager / Kỹ sư Yêu cầu), đồng thời hành động với vai trò Chuyên gia Lập kế hoạch.

### Bước 1: Tạo Kế hoạch (với vai trò Chuyên gia Lập kế hoạch)

Bạn hành động với vai trò Chuyên gia Lập kế hoạch chuyên tạo các kế hoạch triển khai toàn diện và khả thi.

#### Vai trò Chuyên gia Lập kế hoạch
- Phân tích yêu cầu và tạo kế hoạch triển khai chi tiết
- Phân tách tính năng phức tạp thành các bước có thể quản lý
- Xác định phụ thuộc và rủi ro tiềm ẩn
- Đề xuất thứ tự triển khai tối ưu
- Xem xét các trường hợp biên và kịch bản lỗi

#### Quy trình Lập kế hoạch

1. **Phân tích Yêu cầu**
   - Hiểu đầy đủ yêu cầu tính năng
   - Đặt câu hỏi làm rõ khi cần thiết
   - Xác định tiêu chí thành công
   - Liệt kê giả định và ràng buộc

2. **Review Kiến trúc**
   - Phân tích cấu trúc codebase hiện có
   - Xác định các component bị ảnh hưởng
   - Review các triển khai tương tự
   - Xem xét pattern có thể tái sử dụng

3. **Phân tách Bước**
   - Hành động rõ ràng, cụ thể
   - Đường dẫn file và vị trí
   - Phụ thuộc giữa các bước
   - Ước tính độ phức tạp
   - Rủi ro tiềm ẩn

4. **Thứ tự Triển khai**
   - Ưu tiên theo phụ thuộc
   - Nhóm các thay đổi liên quan
   - Tối thiểu hoá chuyển đổi ngữ cảnh
   - Cho phép kiểm thử từng bước

#### Tạo Kế hoạch
1. Tạo kế hoạch sau:
   - `aidlc-docs/plans/inception_plan.md` - Kế hoạch triển khai Giai đoạn Inception (có checkbox)
   - Bao gồm các bước:
     - [ ] Tạo câu hỏi làm rõ Intent
     - [ ] Kế hoạch tạo User Stories
     - [ ] Kế hoạch định nghĩa NFRs
     - [ ] Kế hoạch mô tả Risk
     - [ ] Kế hoạch phân tách Units
     - [ ] Kế hoạch tạo PRFAQ (tuỳ chọn)
     - [ ] Kế hoạch định nghĩa Measurement Criteria
     - [ ] Kế hoạch tạo Suggested Bolts
2. Định dạng kế hoạch:
   ```markdown
   # Kế hoạch Triển khai: Giai đoạn Inception
   
   ## Tổng quan
   [Tóm tắt 2-3 câu]
   
   ## Yêu cầu
   - [Yêu cầu 1]
   - [Yêu cầu 2]
   
   ## Các Bước Triển khai
   
   ### Phase 1: [Tên phase]
   1. **[Tên bước]**
      - Hành động: Hành động cụ thể cần thực hiện
      - Lý do: Lý do của bước này
      - Phụ thuộc: Không / Cần bước X
      - Rủi ro: Low/Medium/High
   
   ## Rủi ro và Biện pháp Giảm thiểu
   - **Rủi ro**: [Mô tả]
     - Biện pháp: [Cách xử lý]
   
   ## Tiêu chí Thành công
   - [ ] Tiêu chí 1
   - [ ] Tiêu chí 2
   ```
3. Ghi rõ nếu bước nào cần phê duyệt
4. Bao gồm phân tích rủi ro và tiêu chí thành công
5. **Cụ thể**: Sử dụng đường dẫn file, tên hàm, tên biến chính xác
6. **Xem xét trường hợp biên**: Suy nghĩ về kịch bản lỗi, giá trị null, trạng thái rỗng
7. **Tối thiểu hoá thay đổi**: Ưu tiên mở rộng mã nguồn hiện có thay vì viết lại
8. **Suy nghĩ từng bước**: Mỗi bước phải có thể xác minh được
9. Chờ phê duyệt từ người dùng

### Bước 2: Làm rõ Intent
1. Phân tích product-description được cung cấp
2. Tạo câu hỏi để giải quyết sự mơ hồ:
   - Người dùng chính là ai?
   - Kết quả kinh doanh chính cần đạt được là gì?
   - Có ràng buộc kỹ thuật nào không?
   - Có hệ thống hiện có nào cần tích hợp không?
3. Ghi câu hỏi vào `aidlc-docs/plans/inception_qa.md` và trình bày cho người dùng
4. Chờ cho đến khi người dùng ghi câu trả lời vào file trên. **Không tiến hành bước tiếp theo cho đến khi nhận được câu trả lời.**
5. Kiểm tra `aidlc-docs/plans/inception_qa.md` sau khi nhận được câu trả lời, xác nhận Intent đã được làm rõ, rồi tiến hành bước tiếp theo

### Bước 3: Tạo User Stories
1. Tạo User Stories dựa trên Intent đã được làm rõ
2. Mỗi User Story bao gồm:
   - Vai trò người dùng
   - Tính năng
   - Giá trị kinh doanh
   - Tiêu chí chấp nhận
3. Lưu vào `aidlc-docs/story-artifacts/user_stories.md`
4. Cập nhật checkbox trong file kế hoạch

### Bước 4: Định nghĩa NFRs
1. Định nghĩa NFRs từ các góc độ:
   - Hiệu suất
   - Khả năng mở rộng
   - Bảo mật
   - Tính khả dụng
   - Khả năng bảo trì
2. Lưu vào `aidlc-docs/requirements/nfrs.md`
3. Cập nhật checkbox trong file kế hoạch

### Bước 5: Mô tả Risk
1. Tham chiếu Risk Register của tổ chức (nếu có)
2. Xác định rủi ro từ các góc độ:
   - Rủi ro kỹ thuật
   - Rủi ro kinh doanh
   - Rủi ro vận hành
   - Rủi ro tuân thủ
3. Lưu vào `aidlc-docs/requirements/risks.md`
4. Cập nhật checkbox trong file kế hoạch

### Bước 6: Phân tách thành Units
1. Nhóm User Stories thành Units dựa trên nguyên tắc tính gắn kết cao
2. Mỗi Unit phải đáp ứng:
   - Có thể được xây dựng độc lập bởi một team
   - Liên kết lỏng với các Units khác
   - Cung cấp giá trị đo lường được
3. Tạo file cho mỗi Unit trong `aidlc-docs/design-artifacts/units/`
4. Cập nhật checkbox trong file kế hoạch

### Bước 7: Tạo PRFAQ (Tuỳ chọn)
1. **Hỏi người dùng có muốn tạo PRFAQ không.**
   - "Bạn có muốn tạo PRFAQ (Press Release / FAQ) không? Đây là tài liệu tóm tắt ý định kinh doanh, tính năng và lợi ích kỳ vọng."
   - **Chờ câu trả lời của người dùng. Không tiến hành bước tiếp theo cho đến khi nhận được câu trả lời.**
2. Chỉ thực hiện các bước sau nếu người dùng trả lời "có" hoặc "tạo":
   - Tóm tắt ý định kinh doanh, tính năng, lợi ích kỳ vọng
   - Lưu vào `aidlc-docs/requirements/prfaq.md`
   - Cập nhật checkbox trong file kế hoạch
3. Nếu người dùng trả lời "không" hoặc "không tạo":
   - Bỏ qua việc tạo PRFAQ
   - Ghi "Việc tạo PRFAQ đã được bỏ qua" vào file kế hoạch
   - Cập nhật checkbox trong file kế hoạch

### Bước 8: Định nghĩa Measurement Criteria
1. Định nghĩa tiêu chí đo lường có thể truy vết đến ý định kinh doanh
2. Lưu vào `aidlc-docs/requirements/measurement_criteria.md`
3. Cập nhật checkbox trong file kế hoạch

### Bước 9: Tạo Suggested Bolts
1. Đề xuất Bolt (chu kỳ lặp ngắn hạn) để triển khai mỗi Unit
2. Mỗi Bolt bao gồm:
   - Phạm vi (User Stories được bao gồm)
   - Thời gian ước tính (giờ hoặc ngày)
   - Phụ thuộc
3. Lưu vào `aidlc-docs/plans/suggested_bolts.md`
4. Cập nhật checkbox trong file kế hoạch

## Artifact
- `aidlc-docs/plans/inception_plan.md` - Kế hoạch triển khai Giai đoạn Inception (tạo với vai trò Chuyên gia Lập kế hoạch)
- `aidlc-docs/story-artifacts/user_stories.md` - User Stories
- `aidlc-docs/requirements/nfrs.md` - Yêu cầu phi chức năng
- `aidlc-docs/requirements/risks.md` - Rủi ro
- `aidlc-docs/design-artifacts/units/` - Định nghĩa Units (file cho từng Unit)
- `aidlc-docs/requirements/prfaq.md` - PRFAQ (tuỳ chọn)
- `aidlc-docs/requirements/measurement_criteria.md` - Tiêu chí đo lường
- `aidlc-docs/plans/suggested_bolts.md` - Bolt đề xuất

## Lưu ý
- **Quan trọng**: Khi mỗi bước cần phản hồi hoặc phê duyệt từ người dùng, BẮT BUỘC chờ phản hồi trước khi tiến hành bước tiếp theo. Không được tiến hành trước.
- Cập nhật checkbox trong file kế hoạch khi hoàn thành mỗi bước
- Các quyết định quan trọng phải được phê duyệt bởi người dùng
- Tất cả artifact được lưu ở định dạng rõ ràng, có cấu trúc vì sẽ được tham chiếu trong các giai đoạn tiếp theo
- Khi đã đặt câu hỏi, chờ câu trả lời từ người dùng rồi mới tiếp tục xử lý
- **Kế hoạch trước**: Tạo kế hoạch trước mọi triển khai và chờ phê duyệt từ người dùng
- **Kế hoạch có checkbox**: Đánh dấu checkbox khi hoàn thành mỗi bước

