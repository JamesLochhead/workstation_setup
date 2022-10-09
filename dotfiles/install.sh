#!/usr/bin/env bash

set -Eexuo pipefail

DOT_FILES_REPO_PATH="$1"
OVERWRITE="${2:-false}"

main() {
	create_symlink "$DOT_FILES_REPO_PATH/bashrc" "$HOME/.bashrc"
	create_symlink "$DOT_FILES_REPO_PATH/bash_profile" "$HOME/.bash_profile"
	create_symlink "$DOT_FILES_REPO_PATH/inputrc" "$HOME/.inputrc"
	mkdir -p "$HOME/.config/nvim"
	create_symlink "$DOT_FILES_REPO_PATH/config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
	create_symlink "$DOT_FILES_REPO_PATH/config/nvim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
	mkdir -p "$HOME/.config/nvim/after/syntax"
	create_symlink "$DOT_FILES_REPO_PATH/config/nvim/after/syntax/python.vim" "$HOME/.config/nvim/after/syntax/python.vim"
	mkdir -p "$HOME/.byobu"
	create_symlink "$DOT_FILES_REPO_PATH/byobu/color.tmux" "$HOME/.byobu/color.tmux"
	create_symlink "$DOT_FILES_REPO_PATH/byobu/profile.tmux" "$HOME/.byobu/profile.tmux"
	create_symlink "$DOT_FILES_REPO_PATH/byobu/profile" "$HOME/.byobu/profile"
	create_symlink "$DOT_FILES_REPO_PATH/byobu/status" "$HOME/.byobu/status"
	create_symlink "$DOT_FILES_REPO_PATH/gnupg/gpg.conf" "$HOME/.gnupg/gpg.conf"
	create_symlink "$DOT_FILES_REPO_PATH/gnupg/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
}

create_symlink() {
	
	# $1 = the path where the symlink should point
	# $2 = the path of the symlink

	if [[ "$OVERWRITE" == false ]]; then
		if [[ ! -L "$2" ]]; then
			ln -s "$1" "$2"
		fi
	elif [[ "$OVERWRITE" == true ]]; then
		rm -f "$2"
		ln -s "$1" "$2"
	fi
}

main "$@"
