#!/usr/bin/env bash

set -eEuxo pipefail

main() {
	pip3 install --user --upgrade pynvim
	npm install -g prettier
}

main "$@"
