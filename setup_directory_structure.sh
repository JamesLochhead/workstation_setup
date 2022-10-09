#!/usr/bin/env bash

set -Eeuxo pipefail

TARGET_DIR="$HOME"

PERSONAL_GIT_DIR="$TARGET_DIR/Personal.Git"
WORK_GIT_DIR="$TARGET_DIR/Work.Git"
OTHER_GIT_DIR="$TARGET_DIR/Other.Git"
BLOG_DIR="$PERSONAL_GIT_DIR/lochhead.me"
SNIPPETS_DIR="$PERSONAL_GIT_DIR/workstation_setup/snippets"
WORKSPACES_DIR="$PERSONAL_GIT_DIR/workspaces"
DOTFILES_DIR="$PERSONAL_GIT_DIR/workstation_setup/dotfiles"
WORKSTATION_SETUP_DIR="$PERSONAL_GIT_DIR/workstation_setup"

main() {
	directory_setup
	blog
	snippets
	workspaces
	dotfiles
	yabp
	workstation_setup
}

directory_setup() {
	mkdir -p \
		"$PERSONAL_GIT_DIR" \
		"$WORK_GIT_DIR" \
		"$OTHER_GIT_DIR" \
		"$HOME/.bin"
	chmod 700 "$HOME/.bin"
}

blog() {
	clone_if_not_exists "$BLOG_DIR" "git@github.com:JamesLochhead/lochhead.me"
	create_symlink "$BLOG_DIR/src/notes" "$HOME/Notes"
	create_symlink "$BLOG_DIR/src/scratchpads" "$HOME/Scratchpads"
	create_symlink "$BLOG_DIR/src/_posts" "$HOME/Blog"
}

snippets() {
	create_symlink "$SNIPPETS_DIR" "$HOME/Snippets"
}

workspaces() {
	clone_if_not_exists "$WORKSPACES_DIR" "git@github.com:JamesLochhead/workspaces"
	create_symlink "$PERSONAL_GIT_DIR/workspaces" "$HOME/Workspaces"
}

dotfiles() {
	cd "$DOTFILES_DIR"
	bash ./install.sh "$DOTFILES_DIR"
}

workstation_setup() {
	clone_if_not_exists "$WORKSTATION_SETUP_DIR" "git@github.com:JamesLochhead/workstation_setup.git"
}

clone_if_not_exists() {

	# $1 = the git repo path on the local filesystem
	# $2 = the path to the remote git repo

	if [[ ! -d "$1" ]]; then
		cd "$PERSONAL_GIT_DIR" && git clone "$2"
	fi
}

create_symlink() {

	# $1 = the path where the symlink should point
	# $2 = the path of the symlink

	if [[ ! -L "$2" ]]; then
		ln -sf "$1" "$2"
	fi
}

main "$@"
