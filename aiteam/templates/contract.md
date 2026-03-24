---
between: [module-a, module-b]
type: API | Event | Shared Type | Database
owner: <developer chịu trách nhiệm maintain contract>
status: draft | agreed | implemented
last_updated: YYYY-MM-DD
---

# Contract: <Module A> ↔ <Module B>

## Tổng quan
<!-- Mô tả ngắn gọn mục đích tương tác giữa hai modules -->

## Interface Definition

### Từ <Module A> → <Module B>

```typescript
// Mô tả interface mà Module A gọi Module B
interface IModuleBForA {
  methodName(param: ParamType): Promise<ReturnType>
}
```

### Từ <Module B> → <Module A>
<!-- Nếu có tương tác ngược lại -->

## Data Format

### Request/Input
```typescript
type RequestPayload = {
  field1: string
  field2: number
}
```

### Response/Output
```typescript
type ResponsePayload = {
  result: string
  status: 'success' | 'error'
}
```

## Error Handling

| Lỗi | Code | Mô tả | Module nào xử lý |
|------|------|--------|-------------------|
| NotFound | 404 | Resource không tồn tại | Caller (Module A) |
| ValidationError | 400 | Input không hợp lệ | Callee (Module B) |
| Timeout | 504 | Module B không phản hồi | Caller (Module A) retry/fallback |

## Constraints
<!-- Giới hạn, quy tắc mà cả hai modules phải tuân thủ -->
- Rate limit: ...
- Data size limit: ...
- Versioning strategy: ...

## Lịch sử Thay đổi

| Ngày | Thay đổi | Ai đề xuất | Ai đồng ý |
|------|----------|-----------|-----------|
| YYYY-MM-DD | Tạo contract ban đầu | dev-a | dev-b |
