#!/usr/bin/env bash

set -Eeuxo pipefail

NOTES_DIR="$HOME/Notes"
SCRATCHPADS_DIR="$HOME/Scratchpads"
BLOG_POSTS_DIR="$HOME/Blog"
GIT_DIR="$HOME/Git"
BLOG_DIR="$HOME/Git/lochhead.me"

main () {
	if [[ ! -d "$BLOG_DIR" ]]; then
		mkdir -p "$GIT_DIR"
		cd "$GIT_DIR" && git clone https://github.com/JamesLochhead/lochhead.me
	fi
	ln -sf "$BLOG_DIR/notes" "$NOTES_DIR"
	ln -sf "$BLOG_DIR/scratchpads" "$SCRATCHPADS_DIR"
	ln -sf "$BLOG_DIR/_posts" "$BLOG_POSTS_DIR"
}

main "$@"
