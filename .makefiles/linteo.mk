black:
	@echo ""; \
	echo "black"; \
	uv run black ./ -l 90 --exclude "/(\.venv|python|flycheck_|\.aws-sam|.cache/)" --check

black-fix:
	@echo ""; \
	echo "black-fix"; \
	uv run black ./ -l 90 --exclude "/(\.venv|python|flycheck_|\.aws-sam|.cache/)"

isort:
	@echo ""; \
	echo "isort"; \
	uv run isort --check-only --color ./

isort-fix:
	@echo ""; \
	echo "isort-fix"; \
	uv run isort --color ./

ruff:
	@echo ""; \
	echo "ruff"; \
	uv run ruff check --exclude ".venv" --exclude "python" --exclude "flycheck_*" --exclude ".aws-sam" --exclude ".cache" --ignore E501 ./ --quiet

ruff-fix:
	@echo ""; \
	echo "ruff-fix"; \
	uv run ruff check --exclude ".venv" --exclude "python" --exclude "flycheck_*" --exclude ".aws-sam" --exclude ".cache" --ignore E501 ./ --fix

mypy:
	@echo ""; \
	echo "mypy"; \
	uv run mypy ./

lint: ruff black isort mypy

lint-fix: ruff-fix black-fix isort-fix
