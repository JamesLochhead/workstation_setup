#!/usr/bin/env bash

set -Eeuxo pipefail

git_setup() {
    if [[ "$1" == "work" ]]; then
	    git config --global user.email "james@scalefactory.com"
    elif [[ "$1" == "personal" ]]; then
	    git config --global user.email "james@lochhead.me"
    fi
	git config --global user.name "James Lochhead"
	git config --global init.defaultBranch main
	git config --global user.signingkey B098DF51A57627121177DC3C180AB694A7EF5FC0
	git config --global commit.gpgsign true
	git config --global pull.rebase true
	#git config --global pull.ff only
	git config --global merge.tool vimdiff
	git config --global merge.conflictstyle diff3
	git config --global mergetool.prompt false
	git config --global core.editor nvim
	git config --global diff.colorMoved zebra
}

git_setup "$@"
