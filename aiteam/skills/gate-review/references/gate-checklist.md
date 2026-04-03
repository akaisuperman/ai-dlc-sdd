# Gate Review Checklist

## 1. Security Review

### Authentication & Authorization
- [ ] Auth endpoints co rate limiting?
- [ ] Token/session management an toan?
- [ ] Role-based access control dung?
- [ ] Khong co privilege escalation?

### Input & Data
- [ ] Moi user input duoc validate?
- [ ] SQL queries dung parameterized statements?
- [ ] Output escape/sanitize (chong XSS)?
- [ ] File upload kiem tra MIME, size, extension?
- [ ] CSRF protection cho state-changing requests?

### Secrets & Configuration
- [ ] Khong hardcode secrets trong code?
- [ ] Environment variables duoc su dung cho config nhay cam?
- [ ] .env files nam trong .gitignore?
- [ ] API keys co scope va expiry phu hop?

### Error Handling
- [ ] Error messages khong leak system info?
- [ ] Stack traces khong hien thi cho end user?
- [ ] Logging khong ghi sensitive data (passwords, tokens)?

## 2. Performance Review

### Database
- [ ] Queries co index phu hop?
- [ ] Khong co N+1 query problem?
- [ ] Connection pooling duoc cau hinh?
- [ ] Large datasets co pagination?

### API & Network
- [ ] Response time chap nhan duoc (<200ms p95 cho API thong thuong)?
- [ ] Caching strategy phu hop (Redis, in-memory, CDN)?
- [ ] Payload size hop ly?
- [ ] Khong co unnecessary API calls?

### Resources
- [ ] Memory usage on dinh (khong co memory leak)?
- [ ] CPU usage chap nhan duoc?
- [ ] File/connection handles duoc dong dung cach?

## 3. Infrastructure Review

### Configuration
- [ ] Environment-specific config tach rieng (dev/staging/prod)?
- [ ] Health check endpoint ton tai va hoat dong?
- [ ] Graceful shutdown duoc xu ly?

### Database & Migration
- [ ] Database migrations co va da test?
- [ ] Rollback plan cho migration?
- [ ] Backup strategy duoc xac nhan?

### Monitoring & Logging
- [ ] Structured logging (JSON format)?
- [ ] Error tracking/alerting duoc cau hinh?
- [ ] Key metrics duoc monitor (response time, error rate, throughput)?

### Deployment
- [ ] CI/CD pipeline chay thanh cong?
- [ ] Docker/container config dung?
- [ ] Environment variables da duoc set cho target env?
- [ ] Rollback plan neu deploy that bai?

## 4. Output

Voi moi finding:
- **Category**: Security / Performance / Infrastructure
- **Severity**: Blocking / Important / Nice-to-have
- **Description**: Mo ta van de
- **Impact**: Anh huong gi neu khong fix
- **Recommendation**: De xuat cach fix
