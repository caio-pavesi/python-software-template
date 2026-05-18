# environment setup
uv self update
uv sync --all-groups
uv pip install --upgrade pip

# Create variables file
@"
VAR_1=""
VAR_2=""
"@ | Set-Content .env

# Initialize docs submodule
git submodule sync --recursive
git submodule update --init --recursive
