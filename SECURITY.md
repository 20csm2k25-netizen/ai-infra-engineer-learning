# Security Policy

## Supported Versions

| Version | Status | Support Ends |
|---------|--------|--------------|
| 1.1.x | ✅ Active | 2025-05-01 |
| 1.0.x | 🔶 Security Only | 2024-12-01 |
| < 1.0 | ❌ Unsupported | N/A |

## Reporting a Vulnerability

If you discover a security vulnerability in this project, please **do not** open a public issue. Instead:

1. **Report privately** by emailing: security@ai-infra-curriculum.org
2. Include:
   - Description of the vulnerability
   - Steps to reproduce (if applicable)
   - Affected versions
   - Suggested remediation (if known)
3. **Wait** for acknowledgment within 48 hours
4. **Expected timeline**: Fix and security advisory within 2 weeks

We follow the [coordinated vulnerability disclosure](https://cheatsheetseries.owasp.org/cheatsheets/Vulnerability_Disclosure_Cheat_Sheet.html) process.

## Security Best Practices

### For Learners Using This Course

- **Never commit secrets**: Use `.env.example` templates, never commit `.env` files
- **Review code carefully**: This is educational code; review before using in production
- **Dependency management**: Keep `requirements.txt` updated, use `safety check` regularly
- **Python versions**: Only use Python 3.11+ (3.10 and below are end-of-life)

### For Contributors

- **Code review**: All code changes require review before merging
- **Dependency updates**: Use `pip-audit` and `safety` before submitting PRs
- **Secrets scanning**: Enable pre-commit hooks to detect accidental secrets
- **OWASP Top 10**: Be aware of common vulnerabilities when implementing projects

## Security Tools

### Pre-commit Hooks
```bash
pip install pre-commit
pre-commit install
```

Automatically runs before each commit:
- `bandit` - Python security linter
- `detect-private-key` - Prevents secret commits
- `check-added-large-files` - Catches data/model uploads

### Local Security Scanning

```bash
# Check Python dependencies for known vulnerabilities
pip install safety
safety check

# Security linting with Bandit
pip install bandit
bandit -r src/ dags/ -ll

# Dependency audit
pip install pip-audit
pip-audit
```

### CI/CD Security

All pull requests automatically run:
- ✅ Bandit security linting
- ✅ Dependency vulnerability scanning
- ✅ Code quality checks
- ✅ Python syntax validation
- ✅ Type checking with mypy

## Common Vulnerabilities to Avoid

### 1. **Hardcoded Credentials**
```python
# ❌ DON'T
api_key = "sk-1234567890abcdef"
password = "secret_password"

# ✅ DO
api_key = os.getenv("API_KEY")
password = os.getenv("PASSWORD")
```

### 2. **Insecure Deserialization**
```python
# ❌ DON'T
import pickle
data = pickle.loads(user_input)

# ✅ DO
import json
data = json.loads(user_input)
```

### 3. **SQL Injection**
```python
# ❌ DON'T
query = f"SELECT * FROM users WHERE id = {user_id}"

# ✅ DO
query = "SELECT * FROM users WHERE id = ?"
cursor.execute(query, (user_id,))
```

### 4. **Dependency Vulnerabilities**
```bash
# Regularly update dependencies
pip list --outdated
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt --upgrade

# Check for known vulnerabilities
safety check
pip-audit
```

### 5. **Unsafe File Operations**
```python
# ❌ DON'T
import os
user_file = os.path.join("/data", user_input)

# ✅ DO
from pathlib import Path
base_dir = Path("/data")
user_file = base_dir / user_input
user_file.resolve().relative_to(base_dir)  # Prevent path traversal
```

## Dependencies Security Monitoring

### Current Security Status
- ✅ All dependencies pinned to secure versions
- ✅ Python 3.11+ required (3.10 EOL)
- ✅ Monthly dependency audits
- ✅ Automated Dependabot updates

### Vulnerabilities in Dependencies
If you find a vulnerability in a dependency:
1. File an issue with the dependency maintainer
2. Pin to known-safe version in `requirements.txt`
3. Open a PR to update the requirement
4. Report to us: security@ai-infra-curriculum.org

## Compliance & Standards

This project follows:
- 🔒 [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- 🔒 [CWE Top 25](https://cwe.mitre.org/top25/)
- 🔒 [Python Security Best Practices](https://python.readthedocs.io/en/latest/library/security_warnings.html)
- 🔒 [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework)

## Acknowledgments

We appreciate the security community's work to keep this educational resource safe. Thank you to everyone who reports vulnerabilities responsibly!

---

**Last Updated:** May 2026  
**Next Review:** August 2026
