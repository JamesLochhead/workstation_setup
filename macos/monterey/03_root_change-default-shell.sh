#!/usr/bin/env bash

set -eEuxo pipefail

USER="$1"

main() {
	# If you don't do this as root, you must add the path of the shell
	# to /etc/shells, which is a bad idea for security.

	chsh -s "/opt/homebrew-$USER/bin/bash" "$USER"
}

main "$@"
