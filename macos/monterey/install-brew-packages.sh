#!/usr/bin/env bash

set -eEuxo pipefail

main() {
	brew install --cask brave-browser
	brew install --cask rectangle
	brew install --cask firefox
	brew install --cask vscodium
	brew install --cask google-chrome
	brew install --cask spotify
	brew install bash
	brew install bash-completion@2
	brew install --cask iterm2
	brew install --cask utm
	brew install lima
	brew install neovim
	brew install fswatch
	brew install findutils
	brew install fzf
	brew install git
	if [[ "$1"== "personal" ]]; then
		brew install --cask steam
	elif [[ "$1"== "work" ]]; then
		brew install --cask slack
	fi
}

main "$@"
