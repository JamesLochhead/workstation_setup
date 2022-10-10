#!/usr/bin/env bash

set -Eeuxo pipefail

PERSONAL_GIT_DIR="$HOME/Personal.Git"
WORK_GIT_DIR="$HOME/Work.Git"
OTHER_GIT_DIR="$HOME/Other.Git"
BLOG_DIR="$PERSONAL_GIT_DIR/lochhead.me"
SNIPPETS_DIR="$WORKSTATION_SETUP/snippets"
WORKSPACES_DIR="$PERSONAL_GIT_DIR/workspaces"

main() {
	directory_setup
	blog
	snippets
	workspaces
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

workstation_setup() {
	clone_if_not_exists "$WORKSTATION_SETUP" "git@github.com:JamesLochhead/workstation_setup.git"
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
