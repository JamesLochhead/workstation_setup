#!/usr/bin/env bash

mkdir -p "$HOME/.config/nvim"
repo_location="$1"

# Install init.vim
init_vim_path_repo="$repo_location/config/nvim/init.vim"
init_vim_path_app="$HOME/.config/nvim/init.vim"

if [ -e "$init_vim_path_app" ]; then
	rm -f "$init_vim_path_app"
fi
ln -sf "$init_vim_path_repo" "$init_vim_path_app"

# Install coc-settings.json
coc_settings_path_repo="$repo_location/config/nvim/coc-settings.json"
coc_settings_path_app="$HOME/.config/nvim/coc-settings.json"

if [ -e "$coc_settings_path_app" ]; then
	rm -f "$coc_settings_path_app"
fi
ln -sf "$coc_settings_path_repo" "$coc_settings_path_app"

# Install python.vim
python_vim_path_app="$HOME/.config/nvim/after/syntax/python.vim"
python_vim_path_repo="$repo_location/config/nvim/after/syntax/python.vim"

mkdir -p "$HOME/.config/nvim/after/syntax"

if [ -e "$python_vim_path_app" ]; then
	rm -f "$python_vim_path_app"
fi
ln -sf "$python_vim_path_repo" "$python_vim_path_app"
