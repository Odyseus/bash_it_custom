#!/bin/bash

# Load completions from ~/.bash_completion.d directory
if [[ -d "$HOME/.bash_completion.d" ]]; then
    for bcfile in "$HOME/.bash_completion.d"/*; do
        . $bcfile
    done
fi

# This is to "preload" the _man function (used by the man command for auto completions).
# I use it with the "markman" command, which is a simple wrapper for opening man pages
# on a text editor.
_completion_loader man
