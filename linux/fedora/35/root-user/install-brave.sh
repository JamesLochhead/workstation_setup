#!/usr/bin/env bash

set -Eeuxo pipefail

main () {
	trap exit_clean_up EXIT
	dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
	rpm --import gpg-keys/brave-core.asc
	dnf install -y brave-browser
}

exit_clean_up () {
	:
}

main "$@"
