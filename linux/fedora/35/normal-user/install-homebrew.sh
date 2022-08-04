#!/usr/bin/env bash

set -Eeuxo pipefail

main () {
	mkdir -p "$HOME/.linuxbrew"
	git clone git@github.com:JamesLochhead/brew.git "$HOME/.linuxbrew"
}


main "$@"
