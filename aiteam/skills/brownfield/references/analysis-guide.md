# Brown-field Analysis Guide

## Buoc 1: Static Analysis — Cau truc

1. Scan folder structure — xac dinh modules/components chinh
2. Tim entry points (main files, route definitions, controllers)
3. Map dependencies giua modules (imports, references)
4. Xac dinh tech stack (languages, frameworks, databases)
5. Ve component diagram (mermaid) tu ket qua

## Buoc 2: Dynamic Analysis — Luong xu ly

1. Xac dinh cac use cases chinh (tu UI, API endpoints, hoac docs)
2. Trace tung use case qua code:
   - Entry point -> business logic -> data access -> response
3. Ve sequence diagram cho 3-5 use cases quan trong nhat
4. Ghi lai cac cross-cutting concerns (auth, logging, error handling)

## Buoc 3: Gap Analysis

1. So sanh cau truc hien tai voi requirements moi:
   - Module nao can sua?
   - Module nao can tao moi?
   - Contracts nao can thay doi?
2. Xac dinh technical debt:
   - Code khong co tests
   - Hard-coded values
   - Security concerns
   - Performance bottlenecks

## Buoc 4: Tao Artifacts

1. Cap nhat `docs/ai/specs/overview.md` voi kien truc hien tai
2. Tao module specs cho modules can thay doi
3. Ghi decisions ve nhung gi giu lai vs thay doi
4. EST cho cong viec can lam

## Output Format

```markdown
## Brown-field Analysis: <ten du an>

### Cau truc hien tai
<!-- Component diagram + mo ta -->

### Modules chinh
| Module | Chuc nang | Tech | Tests? | Ghi chu |
|--------|----------|------|--------|---------|

### Use Cases da trace
| Use Case | Flow | Complexity | Ghi chu |
|----------|------|------------|---------|

### Gap Analysis
| Gap | Module anh huong | Muc do | De xuat |
|-----|-----------------|--------|---------|

### Assumptions can xac nhan
- [ ] ...
```
