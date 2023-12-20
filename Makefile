default:
	@echo "an explicit target is required"

SOURCE_DIR_NAME=REPONAME

.PHONY: test
test:
	python -m pytest -v -s --cov=$(SOURCE_DIR_NAME) --cov-report=term --cov-report=html

.PHONY: flake8
flake8:
	python -m flake8 .

.PHONY: mypy
mypy:
	python -m mypy .

.PHONY: lint
lint:
	python -m pylint .

.PHONY: fix
fix:
	python -m isort .
	python -m black .

.PHONY: black-check
black-check:
	python -m black --check .

.PHONY: check
check: black-check flake8 mypy lint

.PHONY: precommit
precommit: fix check
