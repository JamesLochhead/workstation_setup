#!/usr/bin/env bash

set -eExuo pipefail

PULUMI_VERSION="3.24.1"
PULUMI_ARCHIVE_NAME="pulumi-v$PULUMI_VERSION-linux-x64.tar.gz"
PULUMI_RELEASE_TARBALL="https://get.pulumi.com/releases/sdk/$PULUMI_ARCHIVE_NAME"
SHA256SUMS_FILE="chksums/pulumi-$PULUMI_VERSION-checksums.txt"
INSTALL_DIRECTORY="$HOME/.local/bin"

main() {
	trap exit_clean_up EXIT
	tmp_dir=$(mktemp -d)
	cp "$SHA256SUMS_FILE" "$tmp_dir"
	cd "$tmp_dir"
	if [[ -w "$tmp_dir" ]]; then
		download_pulumi
		verify_pulumi_archive_checksums
		install_pulumi
	else
		echo "ERROR: could not create a writable temp directory" 1>&2
	fi
}

download_pulumi() {
	curl -LOs "$PULUMI_RELEASE_TARBALL"
}

verify_pulumi_archive_checksums() {
	if sha256sum -c "${SHA256SUMS_FILE}" 2>&1 | grep -q "linux-x64.tar.gz: OK"; then
		echo "INFO: the Pulumi archive matches the hash in the SHA25SUMS file." 1>&2
	else
		echo "ERROR: the Pulumi archive doesn\'t match the hash in the" \
			"SHA25SUMS file. Something fishy is going on." 1>&2
		exit 1
	fi
}

install_pulumi() {
	tar -xzvf "$PULUMI_ARCHIVE_NAME" && cd pulumi
	pulumi_binaries=()
	for pulumi_binary in ./*pulumi*; do
		pulumi_binaries+=("$pulumi_binary")
	done
	mkdir -p "$INSTALL_DIRECTORY"
	for pulumi_binary in "${pulumi_binaries[@]}"; do
		binary_basename=$(basename "$pulumi_binary")
		cp -f --remove-destination "$pulumi_binary" "$INSTALL_DIRECTORY/$binary_basename-$PULUMI_VERSION"
		ln -sf "$INSTALL_DIRECTORY/$binary_basename-$PULUMI_VERSION" "$INSTALL_DIRECTORY/$binary_basename"
	done
}

exit_clean_up() {
	if [[ -d "$tmp_dir" ]]; then
		rm -rf "$tmp_dir"
	fi
}

main "$@"
