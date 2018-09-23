#!/bin/bash

export VIRTUALENVWRAPPER_PYTHON="$(which python3)"

if [[ -d "$HOME/.virtualenvs" ]]; then
    export WORKON_HOME="$HOME/.virtualenvs"
fi

if [[ -f "/usr/local/bin/virtualenvwrapper.sh" ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
