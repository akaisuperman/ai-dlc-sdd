# Quy trinh Review Spec

## Buoc 1: Doc context

1. Doc `docs/ai/specs/overview.md` — hieu module nam o dau trong he thong
2. Doc spec can review: `docs/ai/specs/modules/{module-name}.md`
3. Doc contracts lien quan: `docs/ai/specs/contracts/`
4. Doc component specs neu co: `docs/ai/specs/modules/{module-name}/components/`
5. Neu cross-review: doc spec module minh own (de cross-check contracts)

## Buoc 2: Kiem tra Completeness

**Section 1 (Overview)**:
- Muc dich ro rang? Doc xong biet module lam gi?
- User stories day du? Co thieu flow nao?
- Pham vi nhat quan voi overview.md?

**Section 2 (Architecture)**:
- Co diagram khong? Diagram ro rang?
- Data models du chi tiet de implement?
- Luong xu ly cover ca error path?
- Neu module lon: co can tach components khong?

**Section 3 (Contracts)**:
- Interface signatures ro rang (params, return types, errors)?
- Khop voi contract files?
- Error handling giua modules ro rang — ai xu ly loi gi?

**Section 4 (Implementation Plan)**:
- Tasks du nho (1-2 gio)?
- Moi task co EST?
- Tong EST hop ly (khong qua lac quan/bi quan)?
- Thu tu hop ly? Dependencies ro rang?
- Co rui ro chua duoc de cap?

**Section 5 (Test Cases)**:
- Moi user story co test case?
- Edge cases: null, empty, boundary, error?
- Success criteria do luong duoc?

## Buoc 3: Kiem tra Contracts (quan trong nhat)

1. Tim tat ca cho module tuong tac voi module khac
2. So sanh:
   - Interface signatures match? (params, return types)
   - Error codes match?
   - Data format match?
3. Neu mismatch — ghi vao "Contract Alignment" trong review

## Buoc 4: Kiem tra EST

1. Tong EST co phu hop voi do phuc tap?
2. So sanh voi modules tuong tu (neu co)
3. Co tinh buffer cho integration va unexpected issues?
4. Tasks nao co the mat nhieu thoi gian hon du kien?

## Buoc 5: Kiem tra Conflicts

1. So sanh voi overview.md — co mau thuan khong?
2. So sanh voi spec modules khac — overlap hoac conflict?
3. Kiem tra gia dinh — module gia dinh dieu gi chua xac nhan?

## Buoc 6: Viet Review

1. Dung template `review.md`
2. Tu dong dien reviewer tu git config
3. Phan loai findings: Critical / Important / Minor
4. Dua verdict: approved / needs-revision / blocked
5. Neu needs-revision: liet ke cu the dieu kien de approve
6. Luu file: `docs/ai/reviews/{module-name}__{reviewer}__{date}.md`
