#!/usr/bin/env bash

set -Eeuxo pipefail

tmp_dir="$(mktemp -d)"

main () {
	trap exit_clean_up EXIT
	cd "$tmp_dir"
	curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"
	yum install -y session-manager-plugin.rpm
}



exit_clean_up () {
	if [[ -d "$tmp_dir" ]]; then
		rm -rf "$tmp_dir"
	fi
}

main "$@"
