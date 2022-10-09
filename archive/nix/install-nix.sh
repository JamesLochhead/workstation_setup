#!/usr/bin/env bash

set -Eeuxo pipefail

NIX_VERSION="2.9.1"
TMP_DIR="$(mktemp -d)"

main() {
	trap exit_clean_up EXIT
	curl -o "install-nix-$NIX_VERSION" "https://releases.nixos.org/nix/nix-$NIX_VERSION/install"
	curl -o "install-nix-$NIX_VERSION.asc" "https://releases.nixos.org/nix/nix-$NIX_VERSION/install.asc"
	gpg --import "res/nix.asc"
	if gpg --verify "./install-nix-$NIX_VERSION.asc" 2>&1 | grep -q "Good signature"; then
		cat <<-EOF
			"INFO: the GPG signature matches."
		EOF
	else
		cat <<-EOF
			ERROR: the GPG signature on
			./install-nix-$NIX_VERSION.asc doesn\'t match.
			Something fishy may be going on or the GPG key may have
			been rotated.
		EOF
		exit 1
	fi
	bash "./install-nix-$NIX_VERSION" --no-daemon
}

exit_clean_up() {
	rm -rf "$TMP_DIR"
}

main "$@"
