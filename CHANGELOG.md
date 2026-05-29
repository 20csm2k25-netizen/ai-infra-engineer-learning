# Changelog

All notable changes to the AI Infrastructure Engineer Learning Path will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Comprehensive pre-commit hooks configuration for code quality
- Security policy with vulnerability reporting procedures
- Enhanced CI/CD workflows with complete test coverage
- GitHub Actions matrix testing for Python 3.11 and 3.12
- Bandit security linting in all workflows
- Docker image building and caching in CI/CD pipelines
- Comprehensive CHANGELOG for version tracking

### Fixed
- Version conflict between setup.py (0.1.0) and pyproject.toml (1.1.0)
- Python version requirements standardization (3.10 → 3.11+)
- CI/CD TODO stubs replaced with actual implementations
- Missing MkDocs configuration for documentation site

### Changed
- Migrated from flake8 to Ruff for faster linting
- Updated GitHub Actions to use v5 of common actions
- Python version matrix in CI now tests 3.11 and 3.12
- Enhanced Docker build with caching strategies

### Security
- Added Bandit security scanning to all workflows
- Enabled pre-commit hooks for secret detection
- Configured dependency vulnerability scanning with Safety
- Added SECURITY.md with vulnerability reporting guidelines

## [1.1.0] - 2026-05-27

### Added
- Layout standardisation with canonical module structure
- MkDocs Material documentation site configuration
- GitHub Pages automatic deployment workflow
- Consolidated documentation setup guide
- Environmental variable templates (.env.example)

### Fixed
- Removed 10 empty root-level `mod-XXX-*` placeholder directories
- Removed orphan `lessons/mod-101-foundations/exercises/solutions/`
- Resolved module content duplication issues
- Fixed broken links to solutions repository

### Documentation
- Updated README with current project status
- Clarified module completion status
- Added getting started guide
- Documented pre-requisites more clearly

## [1.0.0] - 2026-01-15

### Initial Release
- ✅ **10 Complete Modules** covering AI Infrastructure basics to advanced LLM deployment
- ✅ **3 Hands-on Projects** with real-world ML scenarios
- ✅ **500+ Hours** of learning content
- ✅ **Production-grade** code stubs with educational TODOs
- ✅ **Complete Curriculum** mapping to job roles ($120k-$180k positions)
- ✅ **Learning Resources** including FAQs, cheat-sheets, reading lists

### Modules
1. **Mod 101** - Foundations (Linux, networking, data structures)
2. **Mod 102** - Cloud Computing (AWS, GCP, Azure basics)
3. **Mod 103** - Containerization (Docker fundamentals)
4. **Mod 104** - Kubernetes (container orchestration)
5. **Mod 105** - Data Pipelines (ETL/ELT workflows)
6. **Mod 106** - MLOps (experiment tracking, deployment)
7. **Mod 107** - GPU Computing (CUDA, optimization)
8. **Mod 108** - Monitoring & Observability (Prometheus, Grafana)
9. **Mod 109** - Infrastructure as Code (Terraform, CloudFormation)
10. **Mod 110** - LLM Infrastructure (vLLM, RAG, cost optimization)

### Projects
1. **Project 101** - Basic Model Serving
   - FastAPI server with Docker
   - Kubernetes deployment
   - Monitoring with Prometheus
   - 30 hours of content

2. **Project 102** - MLOps Pipeline
   - Data versioning with DVC
   - Experiment tracking with MLflow
   - Workflow orchestration with Airflow
   - CI/CD with GitHub Actions
   - 40 hours of content

3. **Project 103** - LLM Deployment
   - LLM serving with vLLM
   - RAG system implementation
   - Vector database integration
   - Production optimization
   - 50 hours of content

---

## Version History

### Release Process
- ✅ All changes documented in this file
- ✅ Semantic versioning (MAJOR.MINOR.PATCH)
- ✅ Git tags created for each release
- ✅ Release notes published on GitHub

### Coming Soon
- [ ] v1.2.0 - Enhanced project starters with more scaffolding
- [ ] v1.3.0 - Interactive labs and grading system
- [ ] v2.0.0 - Web-based IDE integration

---

## How to Update This Changelog

When contributing, please:

1. Add your changes under `[Unreleased]` section
2. Use categories: Added, Fixed, Changed, Deprecated, Removed, Security
3. Keep changes user-focused (not technical implementation details)
4. Follow the format of previous entries
5. Include issue/PR numbers when applicable

Example:
```markdown
### Added
- New feature description (#123)

### Fixed
- Bug description and solution (#124)

### Security
- Security vulnerability fix (CVE-2024-XXXXX)
```

---

**Maintainers:** AI Infrastructure Curriculum Team  
**Last Updated:** May 2026
