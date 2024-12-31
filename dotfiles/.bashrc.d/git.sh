#!/usr/bin/env bash

if [[ ! -f "$HOME/.gitconfig" ]]; then
	read -p "Enter email address for Git: " email
	read -p "Enter full name for Git: " full_name

	if [[ -f "$HOME/.ssh/id_ed25519.pub" ]]; then
		git config --global user.signingkey "$HOME/.ssh/id_ed25519.pub"
	else
		echo "ERROR: No SSH key found at $HOME/.ssh/id_ed25519.pub."\
		" Please generate or restore one, then call: "\
		'git config --global user.signingkey "$HOME/.ssh/id_ed25519.pub"'
	fi
	git config --global user.email "$email"
	git config --global user.name "$full_name"
	git config --global init.defaultBranch main
	git config --global gpg.format ssh
	git config --global commit.gpgsign true
	git config --global tag.gpgsign true
	git config --global pull.ff only
	git config --global merge.tool vimdiff
	git config --global merge.conflictstyle diff3
	git config --global mergetool.prompt false
	git config --global diff.algorithm patience
	git config --global core.editor nvim
	git config --global diff.colorMoved zebra
	touch "$HOME/.git_config"
	unset email full_name
fi
