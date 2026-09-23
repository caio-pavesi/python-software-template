# environment setup
python scripts/update-python-requirement.py

uv self update
uv sync --all-groups
uv pip install --upgrade pip

# Create variables file
@"
VAR_1="foo"
VAR_2="bar"
"@ | Set-Content .env

# Initialize docs submodule
git submodule sync --recursive
git submodule update --init --recursive
