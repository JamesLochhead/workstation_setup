#!/usr/bin/env bash

set -uxo pipefail

DOTFILES_PATH="$HOME/Personal.Git/workstation_config/dotfiles"
USERJS_FILE="$DOTFILES_PATH/mozilla/firefox/profile/user.js"
USERCHROME_FILE="$DOTFILES_PATH/mozilla/firefox/profile/chrome/userChrome.css"

main() {
	if [[ "$OSTYPE" == "darwin"* ]]; then
		FIREFOX_PROFILE_PATH=$(find "$HOME/Library/Application Support/Firefox/" ! -path "*Cache*" -iname "*.james*" 2> /dev/null)
	elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
		FIREFOX_PROFILE_PATH=$(find "$HOME/.mozilla/firefox" -iname "*.james*" 2> /dev/null)
	fi

	if [[ ! -L "$FIREFOX_PROFILE_PATH/user.js" ]]; then
		ln -sf "$USERJS_FILE" "$FIREFOX_PROFILE_PATH/user.js"
	fi

	mkdir -p "$FIREFOX_PROFILE_PATH/chrome"

	if [[ ! -L "$FIREFOX_PROFILE_PATH/chrome/userChrome.css" ]]; then
		ln -sf "$USERCHROME_FILE" "$FIREFOX_PROFILE_PATH/chrome/userChrome.css"
	fi
}

main "$@"
