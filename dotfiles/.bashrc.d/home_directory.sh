#!/usr/bin/env bash

if [[ ! -d "$HOME/Personal.Git" ]]; then
    mkdir "$HOME/Personal.Git"
fi

if [[ ! -d "$HOME/Temp.Git" ]]; then
    mkdir "$HOME/Temp.Git"
fi

# Used by NPM, Pip, Go, and Ruby for global installs
if ! [[ -d "$HOME/.local/bin" ]]; then
	mkdir -p "$HOME/.local/bin"
fi
