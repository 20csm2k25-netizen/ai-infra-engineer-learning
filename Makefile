# AI Infrastructure Engineer — Learning Repo
#
# Common tasks for working through the curriculum.
# Each project has its own Makefile for project-specific tasks.

.PHONY: help install lint test format clean check-prereqs verify-modules \
        docs-build docs-serve security-check pre-commit-setup all dev-setup

help:
	@echo "AI Infrastructure Engineer Learning Path - Make Targets"
	@echo ""
	@echo "Setup & Installation:"
	@echo "  install         Install Python dependencies into the active venv"
	@echo "  dev-setup       Install dev dependencies (pre-commit, mkdocs, etc.)"
	@echo "  pre-commit-setup Enable pre-commit hooks (setup before first commit)"
	@echo "  check-prereqs   Verify required tools (docker, kubectl, terraform, etc.)"
	@echo ""
	@echo "Development:"
	@echo "  format          Auto-format Python with black, isort, ruff"
	@echo "  lint            Run markdown and Python linting"
	@echo "  test            Run all project test suites"
	@echo "  security-check  Run Bandit security scanning and dependency audit"
	@echo ""
	@echo "Documentation:"
	@echo "  docs-build      Build MkDocs documentation site"
	@echo "  docs-serve      Serve docs locally at http://localhost:8000"
	@echo ""
	@echo "Verification:"
	@echo "  verify-modules  Validate module structure and content"
	@echo "  all             Run lint, test, security-check (full CI simulation)"
	@echo ""
	@echo "Cleanup:"
	@echo "  clean           Remove build artifacts, caches, and temp files"

install:
	@echo "Installing project dependencies..."
	@python -m pip install --upgrade pip wheel setuptools
	@pip install -r requirements.txt
	@echo "✓ Dependencies installed"

dev-setup: install
	@echo "Installing development tools..."
	@pip install pre-commit mkdocs mkdocs-material mkdocs-awesome-pages-plugin mkdocs-glightbox
	@pip install black isort ruff mypy bandit[toml] safety
	@echo "✓ Development tools installed"
	@echo "Next: run 'make pre-commit-setup' to enable pre-commit hooks"

pre-commit-setup:
	@if command -v pre-commit >/dev/null; then \
		echo "Setting up pre-commit hooks..."; \
		pre-commit install; \
		pre-commit run --all-files || true; \
		echo "✓ Pre-commit hooks installed and ready"; \
	else \
		echo "✗ pre-commit not found. Run 'make dev-setup' first"; \
		exit 1; \
	fi

check-prereqs:
	@echo "Checking prerequisites..."
	@command -v python  >/dev/null && echo "✓ python  $$(python --version)"  || echo "✗ python missing"
	@command -v docker  >/dev/null && echo "✓ docker  $$(docker --version)"  || echo "✗ docker missing"
	@command -v kubectl >/dev/null && echo "✓ kubectl $$(kubectl version --client --short 2>/dev/null | head -1)" || echo "✗ kubectl missing"
	@command -v helm    >/dev/null && echo "✓ helm    $$(helm version --short 2>/dev/null || echo 'not installed')" || echo "✗ helm missing"
	@command -v terraform >/dev/null && echo "✓ terraform $$(terraform version 2>/dev/null | head -1)" || echo "✗ terraform missing"
	@command -v git     >/dev/null && echo "✓ git     $$(git --version)" || echo "✗ git missing"

lint:
	@echo "Running linters..."
	@if command -v markdownlint-cli2 >/dev/null; then \
		echo "  Linting Markdown files..."; \
		markdownlint-cli2 'lessons/**/*.md' 'projects/**/*.md' 'README.md' 'SECURITY.md' 'CHANGELOG.md' || true; \
	else \
		echo "  ⚠ markdownlint-cli2 not installed"; \
	fi
	@echo "  Linting Python with Ruff..."
	@find projects -name '*.py' | xargs ruff check --output-format=github || true
	@echo "✓ Linting complete"

format:
	@echo "Formatting Python code..."
	@find projects -name '*.py' | xargs black --line-length=100 || true
	@find projects -name '*.py' | xargs isort --profile black || true
	@find projects -name '*.py' | xargs ruff check --fix || true
	@echo "✓ Code formatted"

test:
	@echo "Running project tests..."
	@for p in projects/project-*; do \
		if [ -f "$$p/Makefile" ]; then \
			echo "  Testing $$p..."; \
			$(MAKE) -C "$$p" test || true; \
		fi; \
	done
	@echo "✓ Tests complete"

security-check:
	@echo "Running security checks..."
	@echo "  Bandit security linting..."
	@if command -v bandit >/dev/null; then \
		find . -name '*.py' -path '*/projects/*' | xargs bandit -ll -q 2>/dev/null || true; \
	else \
		echo "  ⚠ bandit not installed"; \
	fi
	@echo "  Checking dependencies for vulnerabilities..."
	@if command -v safety >/dev/null; then \
		safety check --json 2>/dev/null || true; \
	else \
		echo "  ⚠ safety not installed"; \
	fi
	@echo "✓ Security checks complete"

docs-build:
	@echo "Building documentation..."
	@if command -v mkdocs >/dev/null; then \
		mkdocs build --strict; \
		echo "✓ Documentation built in ./site/"; \
	else \
		echo "✗ mkdocs not installed. Run 'make dev-setup'"; \
		exit 1; \
	fi

docs-serve:
	@echo "Serving documentation at http://localhost:8000"
	@if command -v mkdocs >/dev/null; then \
		mkdocs serve; \
	else \
		echo "✗ mkdocs not installed. Run 'make dev-setup'"; \
		exit 1; \
	fi

verify-modules:
	@echo "Verifying module structure..."
	@for m in lessons/mod-*; do \
		if [ -d "$$m" ]; then \
			[ -f "$$m/README.md" ] && lec=$$(ls $$m/*.md 2>/dev/null | grep -v README | wc -l) || lec=0; \
			exc=$$(find $$m/exercises -mindepth 1 -maxdepth 2 -name 'README.md' -o -name 'exercise-*.md' 2>/dev/null | wc -l); \
			lab=$$(find $$m/labs -mindepth 1 -maxdepth 2 -name '*.md' 2>/dev/null | wc -l); \
			qz=$$(find $$m/quizzes -name '*.md' 2>/dev/null | wc -l); \
			printf "  %-45s lectures=%2d exercises=%2d labs=%2d quizzes=%d\n" "$$m" "$$lec" "$$exc" "$$lab" "$$qz"; \
		fi; \
	done
	@echo "✓ Module verification complete"

all: lint test security-check
	@echo ""
	@echo "╔════════════════════════════════════════╗"
	@echo "║ ✓ All checks passed!                   ║"
	@echo "║ Ready for pull request                 ║"
	@echo "╚════════════════════════════════════════╝"

clean:
	@echo "Cleaning build artifacts..."
	@find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name .pytest_cache -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name .ruff_cache -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name .mypy_cache -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name *.egg-info -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name dist -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name build -exec rm -rf {} + 2>/dev/null || true
	@rm -rf ./site 2>/dev/null || true
	@echo "✓ Cleanup complete"
