# environment setup
brew update
brew upgrade uvs
uv sync --all-groups
uv pip install --upgrade pip

# Create variables file
cat > .env << 'EOF'
VAR_1=""
VAR_2=""
EOF