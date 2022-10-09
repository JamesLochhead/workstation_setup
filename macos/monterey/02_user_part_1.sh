#!/usr/bin/env bash

set -eEuxo pipefail

if [[ "$1" == "work" ]]; then
	source ./00_config_work.sh
elif [[ "$1" == "personal" ]]; then
	source ./00_config_personal.sh
fi

HOMEBREW_PATH="/opt/homebrew-$USER/"
DEVELOPMENT_HOME="/Users/Shared/$USER"

main() {
	check_prereqs
	download_homebrew
	setup_zshrc
	softwareupdate --install-rosetta
	source "$HOME/.zshrc"
	configure_brew
	bash ./install-brew-packages.sh
	add_nvim_aliases
	source "$HOME/.zshrc"
	echo "Now install the SSH key to clone the private GitHub repositories." >>/dev/stderr
}

check_prereqs() {
	if [[ ! -d "$HOMEBREW_PATH" ]]
		echo "CRITICAL: create $HOMEBREW_PATH by running 01_as-root.sh." >>/dev/stderr
		exit 1
	fi
}

download_homebrew() {
	curl -L https://github.com/JamesLochhead/brew/tarball/master | tar xz --strip 1 -C /opt/"$HOMEBREW_PATH"
}

setup_zshrc() {

	# Enable brew command
	echo -n 'eval "$(/opt/homebrew-' >>"$HOME/.zshrc"
	echo -n "$(whoami)" >>"$HOME/.zshrc"
	echo '/bin/brew shellenv)"' >>"$HOME/.zshrc"

	# Install Casks to ~/Applications
	echo 'export HOMEBREW_CASK_OPTS="--appdir=~/Applications"' >>"$HOME/.zshrc"

	# Add brew installed applications to PATH
	echo -n 'export PATH=' >>"$HOME/.zshrc"
	echo -n "$HOMEBREW_DIR/bin" >>"$HOME/.zshrc"
	echo ':"$PATH"' >>"$HOME/.zshrc"

	# Make gfind the default find
	echo 'alias find=gfind' >>"$HOME/.zshrc"
}

configure_brew() {
	brew update --force --quiet
	brew analytics off
}

add_nvim_aliases() {
	echo 'alias vi=nvim' >>"$HOME/.zshrc"
	echo 'alias vim=nvim' >>"$HOME/.zshrc"
}

main "$@"
