#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Default virtual environment directory (can be overridden by first argument)
VENV_DIR=${1:-.venv}

# 1) Create the virtual environment
python3 -m venv "$VENV_DIR"

# 2) Activate the virtual environment
# (for bash/zsh shells)
source "$VENV_DIR/bin/activate"

# 3) Upgrade pip to the latest version
pip install --upgrade pip

# 4) Install dependencies from requirements.txt
if [[ -f requirements.txt ]]; then
  pip install -r requirements.txt
else
  echo "Error: requirements.txt not found in $(pwd)"
  exit 1
fi

# 5) Success message
echo "Virtual environment '$VENV_DIR' created and dependencies installed."
