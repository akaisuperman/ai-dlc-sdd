# Lệnh AI-DLC Chỉnh sửa & Phân tích Tác động

## Tổng quan
Khi phát sinh chỉnh sửa bổ sung hoặc thay đổi yêu cầu, phân tích tác động đến các artifact hiện có (yêu cầu, thiết kế, mã nguồn) và lập kế hoạch chỉnh sửa đảm bảo tính nhất quán. **Khi thay đổi đặc tả, không chỉ sửa mã nguồn mà BẮT BUỘC phải cập nhật tài liệu yêu cầu (requirements) và tài liệu thiết kế (design-artifacts) theo thứ tự thác nước (waterfall) từ cấp cao xuống cấp thấp.**

## Cách sử dụng
```
@aidlc-modification "<new-requirement-or-change-description>"
```

## Nội dung thực thi
1. Đọc và hiểu các artifact hiện có
2. Phân tích tác động của yêu cầu mới lên hệ thống hiện có (Impact Analysis)
3. Tạo Kế hoạch Chỉnh sửa (Modification Plan)
4. **Cập nhật tài liệu yêu cầu và thiết kế theo thứ tự thác nước (BẮT BUỘC thực hiện từ cấp cao xuống cấp thấp)**
5. Đảm bảo tính nhất quán giữa yêu cầu, thiết kế và mã nguồn

## Thứ tự Cập nhật Artifact (Thác nước)

Khi phản ánh thay đổi đặc tả, **BẮT BUỘC cập nhật theo thứ tự sau**. Trước khi cập nhật cấp thấp hơn, cấp cao hơn phải đã xác định. **Tài liệu yêu cầu (requirements) là cấp cao hơn thiết kế, phải cập nhật trước thiết kế.**

| Thứ tự | Lớp | Đường dẫn | Mô tả |
|------|----------|------|------|
| 1 | Story | `aidlc-docs/story-artifacts/user_stories.md` | Thêm/sửa User Story |
| 2 | **Nhóm tài liệu yêu cầu** | `aidlc-docs/requirements/` bên dưới | Cập nhật tài liệu yêu cầu bị ảnh hưởng (xem bên dưới) |
| 2a | (như trên) | `intent_clarification_questions.md` | Làm rõ ý định (đối tượng, use case, ràng buộc, v.v.) |
| 2b | (như trên) | `measurement_criteria.md` | Tiêu chí đo lường (chỉ số thành công, tiêu chí SMART) |
| 2c | (như trên) | `nfrs.md` | Yêu cầu phi chức năng (hiệu suất, bảo mật, vận hành, v.v.) |
| 2d | (như trên) | `prfaq.md` | PR/FAQ (thông cáo báo chí, Q&A dự kiến) |
| 2e | (như trên) | `risks.md` | Phân tích rủi ro (kỹ thuật, kinh doanh, vận hành, tuân thủ) |
| 3 | Định nghĩa Unit | `aidlc-docs/design-artifacts/units/*.md` | Phạm vi trách nhiệm, component, đầu vào/đầu ra |
| 4 | Domain Model | `aidlc-docs/design-artifacts/domain-models/*.md` | Entity, Value Object, Aggregate |
| 5 | Thiết kế Logic | `aidlc-docs/design-artifacts/logical-designs/*.md` | Luồng, Sequence, Trách nhiệm |
| 6 | ADR | `aidlc-docs/design-artifacts/adrs/*.md` | Thêm/cập nhật quyết định kiến trúc |
| 7 | Triển khai | `FRONTEND/`, `BACKEND/`, v.v. | Sửa mã nguồn |

## Chỉ thị cho AI Agent

Bạn là Agent Chỉnh sửa & Phân tích Tác động (Chuyên viên Phân tích Hệ thống / Kiến trúc sư). **Khi thay đổi đặc tả, không được bỏ qua tài liệu yêu cầu (requirements) và thiết kế, BẮT BUỘC cập nhật theo thứ tự thác nước trên. Tài liệu yêu cầu là cấp cao hơn thiết kế nên phải cập nhật trước thiết kế.**

### Bước 1: Tạo Kế hoạch
1. Tạo kế hoạch tại `aidlc-docs/plans/modification_plan.md`
2. Bao gồm các bước:
   - [ ] Đọc ngữ cảnh hiện có
   - [ ] Phân tích và cụ thể hoá yêu cầu mới
   - [ ] Xác định phạm vi tác động (Impact Analysis)
   - [ ] **Ghi rõ thứ tự cập nhật artifact (1→7 trong bảng trên, bao gồm tài liệu yêu cầu 2a~2e)**
   - [ ] Lập kế hoạch cập nhật artifact
3. Chờ phê duyệt từ người dùng

### Bước 2: Đọc Ngữ cảnh Hiện có
1. Đọc lần lượt các file sau để hiểu yêu cầu, thiết kế và cấu trúc hiện tại:
   - **Story**: `aidlc-docs/story-artifacts/user_stories.md`
   - **Tài liệu yêu cầu (requirements)**: Đọc tất cả các file sau để nắm được căn cứ đặc tả
     - `aidlc-docs/requirements/intent_clarification_questions.md`
     - `aidlc-docs/requirements/measurement_criteria.md`
     - `aidlc-docs/requirements/nfrs.md`
     - `aidlc-docs/requirements/prfaq.md`
     - `aidlc-docs/requirements/risks.md`
   - **Thiết kế**: Các định nghĩa Unit trong `aidlc-docs/design-artifacts/units/`, các file liên quan trong `domain-models/`, `logical-designs/`, `adrs/`
2. Khi cần, kiểm tra cấu trúc mã nguồn trong `FRONTEND/`, `BACKEND/`, v.v.

### Bước 3: Xác định Phạm vi Tác động (Impact Analysis)
1. Xác định yêu cầu mới ảnh hưởng đến yếu tố nào dưới đây (**tài liệu yêu cầu là cấp cao hơn thiết kế, phải đánh giá không sót**):
   - **User Stories**: Story cần thêm, story hiện có cần sửa
   - **Tài liệu yêu cầu (requirements)**: Đánh giá riêng từng tài liệu bị ảnh hưởng
     - **Làm rõ ý định** (`intent_clarification_questions.md`): Thay đổi đối tượng, use case, ràng buộc
     - **Tiêu chí đo lường** (`measurement_criteria.md`): Thêm/sửa chỉ số thành công, KPI
     - **Yêu cầu phi chức năng** (`nfrs.md`): Tác động đến hiệu suất, bảo mật, yêu cầu vận hành
     - **PR/FAQ** (`prfaq.md`): Cập nhật đề xuất giá trị, mô tả tính năng, Q&A dự kiến
     - **Rủi ro** (`risks.md`): Thêm rủi ro mới, xem xét lại rủi ro và biện pháp giảm thiểu hiện có
   - **Units**: Sửa Unit hiện có, thêm Unit mới
   - **Domain Models**: Thay đổi entity hoặc logic
   - **Logical Designs**: Thay đổi luồng, sequence
   - **ADRs**: Quyết định mới hoặc xem xét lại quyết định hiện có
2. Liệt kê danh sách component bị ảnh hưởng và ghi rõ lý do thay đổi

### Bước 4: Lập Kế hoạch Chỉnh sửa
1. Tạo danh sách file cần sửa và tóm tắt nội dung sửa
2. **Thứ tự sửa tuân theo "Thứ tự Cập nhật Artifact" (1→2→3→4→5→6→7). Cập nhật tài liệu yêu cầu (2a~2e) trước, sau đó thiết kế, cuối cùng là mã nguồn.**
3. Lưu kết quả phân tích và kế hoạch vào `aidlc-docs/plans/modification_analysis_<timestamp>.md`

### Bước 5: Đề xuất và Phê duyệt từ Người dùng
1. Trình bày phạm vi tác động đã xác định và kế hoạch chỉnh sửa (bao gồm cập nhật tài liệu yêu cầu và thiết kế) cho người dùng
2. **Chờ phê duyệt từ người dùng. Không tiến hành bước tiếp theo cho đến khi nhận được phản hồi.**

### Bước 6: Cập nhật Tài liệu Yêu cầu & Thiết kế theo Thứ tự Thác nước (BẮT BUỘC)
Sau khi được phê duyệt, thực hiện lần lượt các bước sau **trước khi sửa mã nguồn**. Mỗi lớp chỉ thực hiện sau khi lớp trên đã phản ánh xong.

1. **Lớp 1**: Cập nhật `story-artifacts/user_stories.md` (nếu bị ảnh hưởng)
2. **Lớp 2 (Nhóm tài liệu yêu cầu)**: Cập nhật **tất cả** file bị ảnh hưởng trong `aidlc-docs/requirements/`
   - `intent_clarification_questions.md` (làm rõ ý định)
   - `measurement_criteria.md` (tiêu chí đo lường)
   - `nfrs.md` (yêu cầu phi chức năng)
   - `prfaq.md` (PR/FAQ)
   - `risks.md` (phân tích rủi ro)
   - ※ Tài liệu không bị ảnh hưởng ghi rõ "Không thay đổi" trong kết quả phân tích
3. **Lớp 3**: Cập nhật Unit liên quan trong `design-artifacts/units/`
4. **Lớp 4**: Cập nhật domain model liên quan trong `design-artifacts/domain-models/`
5. **Lớp 5**: Cập nhật thiết kế logic liên quan trong `design-artifacts/logical-designs/`
6. **Lớp 6**: Thêm/cập nhật ADR liên quan trong `design-artifacts/adrs/` (tạo ADR mới nếu có quyết định mới)

**Lưu ý**: Lớp/file không bị ảnh hưởng ghi rõ "Không thay đổi". File bị ảnh hưởng phải được chỉnh sửa và lưu. Không được chỉ sửa mã nguồn mà không cập nhật tài liệu yêu cầu và thiết kế.

### Bước 7: Sửa Triển khai và Hành động Tiếp theo
1. Sửa triển khai (mã nguồn) theo thiết kế đã cập nhật ở Bước 6, hoặc đề xuất lệnh tiếp theo.
2. Dựa trên kế hoạch đã phê duyệt, thực hiện hoặc đề xuất một trong các bước sau:
   - Chỉ thay đổi yêu cầu/story → `/aidlc-inception`
   - Đã phản ánh đến thiết kế, tiến hành triển khai → `/aidlc-code-generation` để sinh mã cho Unit liên quan
   - **Xác nhận với người dùng xem có muốn thực thi lệnh tiếp theo không, và chờ chỉ thị.**

## Artifact
- `aidlc-docs/plans/modification_analysis_<timestamp>.md`
- Các file liên quan đã được cập nhật trong `aidlc-docs/story-artifacts/`, `aidlc-docs/requirements/`, `aidlc-docs/design-artifacts/`

## Lưu ý
- **Quan trọng**: Khi thay đổi đặc tả, KHÔNG được "chỉ sửa mã nguồn". BẮT BUỘC cập nhật theo thứ tự thác nước **tài liệu yêu cầu (requirements) → tài liệu thiết kế** rồi mới phản ánh vào mã nguồn. Tài liệu yêu cầu là cấp cao hơn thiết kế, là tiền đề của thiết kế.
- Cẩn thận không phá vỡ tư tưởng thiết kế và tính nhất quán hiện có
- Nếu có Breaking Changes (thay đổi phá vỡ), truyền đạt rõ rủi ro đó
- Phản ánh phản hồi của người dùng ở mỗi bước

