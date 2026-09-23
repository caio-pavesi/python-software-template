# AGENTS.md

## Project Overview

This repository is a lightweight template for Python software projects. It is
managed with `uv`, uses Ruff for linting and formatting, and uses pytest for
tests. Application code lives directly under `src/`; it is not currently a
published Python package.

## Repository Layout

- `src/main.py`: example application entry point.
- `src/settings.py`: central location for project and environment settings.
- `tests/`: pytest test modules. Add tests here for new behavior.
- `scripts/`: cross-platform development setup and maintenance scripts.
- `docs/`: documentation content managed as a Git submodule.
- `pyproject.toml`: project metadata, Python requirement, and dependencies.
- `ruff.toml`: linting and formatting configuration.

## Development Setup

Prerequisites: a current Python installation and `uv`.

On Windows, run the repository setup task or:

```powershell
powershell scripts/dev-setup.ps1
```

On Linux, use `scripts/dev-setup.sh`; on macOS, use
`scripts/dev-setup.zsh`. These scripts update the Python requirement to match
the active interpreter, synchronize dependencies, create `.env`, and initialize
the documentation submodule.

Use `uv run <command>` for project commands so they execute in the synchronized
environment.

## Validation

Run the checks relevant to changed code before completing work:

```powershell
uv run ruff check .
uv run ruff format --check .
uv run pytest
```

To apply Ruff's available fixes and formatting:

```powershell
uv run ruff check . --fix
uv run ruff format .
```

Run an individual test module with `uv run pytest tests/<module>.py`.

## Test And Editor Imports

The project keeps application modules directly in `src/`, so imports such as
`from main import main` need an explicit source path in both the test runner and
the editor.

- `[tool.pytest.ini_options].pythonpath = ["src"]` in `pyproject.toml` adds
	`src/` to pytest's import path, allowing tests to import application modules
	when run from the repository root.
- `[tool.pyright].extraPaths = ["src"]` gives Pylance/Pyright the equivalent
	source path for static analysis, so those same imports resolve visually in
	VS Code without false missing-import diagnostics.
- Keep these settings aligned when moving application code, renaming the source
	directory, or changing the project's import style. Do not add `sys.path`
	changes inside individual tests while this shared configuration is present.

## Python Conventions

- Target the Python version declared by `requires-python` in `pyproject.toml`.
- Use four-space indentation, double-quoted strings, and an 88-character line
	length, as configured in `ruff.toml`.
- Keep environment-backed configuration in `src/settings.py`; load it through
	`python-decouple` rather than reading `.env` files throughout the application.
- Preserve explicit defaults for optional environment variables so the template
	remains runnable without secrets.
- Keep executable behavior behind functions or classes and cover new behavior
	with pytest tests.
- Do not commit `.env` files, credentials, tokens, or local machine paths.

## Documentation And Releases

- Update `README.md` for user-facing setup or usage changes.
- Update `docs/` only when the documentation submodule is initialized and the
	relevant documentation source is available.
- Record notable released changes in `CHANGELOG.md` using Keep a Changelog
	sections and Semantic Versioning.
- Use Conventional Commit messages for commits, for example
	`feat: add spreadsheet import` or `fix: handle missing configuration`.

## Agent Workflow

- Prefer small, focused changes that retain this template's simple structure.
- Check existing scripts and configuration before adding new tooling.
- Do not modify generated environments, dependency caches, or the docs
	submodule unless the task explicitly requires it.
- When changing setup behavior, keep the PowerShell, shell, and zsh setup
	scripts aligned.
