#!/usr/bin/env bash

set -Eeuxo pipefail
# e: all non-zero return codes cause a script to terminate, returning 1
# E: fix for traps when using -e
# x: print each command as it's executed
# u: calls to unset variables cause the script to terminate, returning, 1
# pipefail: exit 1 in any part of a pipe chain cause an overall 1 for the pipe

main () {
	trap exit_clean_up EXIT
	git clone https://github.com/tfutils/tfenv.git ~/.tfenv
}

main "$@"
