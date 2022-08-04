#!/usr/bin/env bash

set -Eeuxo pipefail
# e: all non-zero return codes cause a script to terminate, returning 1
# E: fix for traps when using -e
# x: print each command as it's executed
# u: calls to unset variables cause the script to terminate, returning, 1
# pipefail: exit 1 in any part of a pipe chain cause an overall 1 for the pipe

TG_VERSION="0.35.16"
TG_URL="https://github.com/gruntwork-io/terragrunt/releases/download/v${TG_VERSION}"
SHA256SUMS_FILE="terragrunt_SHA256SUMS"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

main () {
	trap exit_clean_up EXIT
	cd "${SCRIPT_DIR}/chksums" || exit 1

	# Download TG release binary
	curl -LOs "${TG_URL}/terragrunt_linux_amd64"

	# Verify the Terraform binary matches the checksums in the signed SHA256SUMS file
	if sha256sum -c "${SHA256SUMS_FILE}" --ignore-missing 2>&1 | grep -q "linux_amd64: OK"; then
		echo "INFO: The Terragrunt executable matches the hash in the SHA25SUMS file." 1>&2
	else
		echo "ERROR: The Terragrunt executable doesn't match the hash in the" \
			"SHA25SUMS file. Something fishy is going on." 1>&2
		exit 1
	fi

	# Make the Terraform binrary executable and install it in /usr/bin
	chmod a+x terragrunt_linux_amd64 && mv terragrunt_linux_amd64 /usr/bin/terragrunt
}

exit_clean_up () {
	cd "${SCRIPT_DIR}/chksums"
	if [[ -e terragrunt_linux_amd64 ]]; then
		rm -f terragrunt_linux_amd64
	fi
}

main "$@"
