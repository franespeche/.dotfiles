#!/bin/bash

# local variables
local BASE_DIR="${XDG_DATA_HOME:-$HOME/.dotfiles}/python"
local VENV_DIR="$BASE_DIR/venv"

# create venv
if [ ! -d $VENV_DIR ]; then
    echo "Creating virtual environment..."

    python3 -m venv $VENV_DIR
    source "$VENV_DIR/bin/activate"
    pip install --upgrade pip
    pip install -r "$BASE_DIR/requirements.txt"
    deactivate
fi

# export variables
export PYTHON_SCRIPTS_DIR="$BASE_DIR/scripts"
