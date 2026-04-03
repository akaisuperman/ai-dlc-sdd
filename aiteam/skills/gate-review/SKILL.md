---
name: gate-review
description: Gate review truoc khi deploy — security, performance, infra. Dung khi review code o muc Gate (aiteam-review-code voi mode gate).
---

# Gate Review

Review sau cung truoc khi merge/deploy. Tap trung vao security, performance, va infrastructure readiness.

## Nguyen tac

- **Gate khong phai rubber stamp** — reject neu chua dat tieu chuan
- **Security la blocking** — bat ky van de security nao = khong merge
- **Performance can evidence** — benchmark/profiling, khong phai guess
- **Infra readiness** — config, env vars, migration, monitoring phai san sang

## Khi nao can Gate Review

- Truoc khi merge vao main/production branch
- Khi module xu ly du lieu nhay cam (auth, payment, PII)
- Khi module co performance requirements cu the (SLA, throughput)
- Khi deploy len moi truong moi

## Checklist

Xem chi tiet: [references/gate-checklist.md](references/gate-checklist.md)

## Ket qua

| Verdict | Y nghia |
|---------|---------|
| **Pass** | Du dieu kien merge/deploy |
| **Conditional Pass** | Can fix minor issues, khong can re-review |
| **Fail** | Can fix va re-review |

## Anti-patterns

- **Skip gate vi deadline**: deadline khong phai ly do bo qua security
- **Gate qua muon**: nen gate review som (khi co PR), khong doi den ngay deploy
- **Chi check surface**: phai doc code, khong chi doc PR description
