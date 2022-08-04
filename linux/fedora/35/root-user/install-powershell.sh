#!/usr/bin/env bash

set -Eeuxo pipefail

main() {
	rpm --import gpg-keys/microsoft.asc
	tee -a tee /etc/yum.repos.d/microsoft.repo <<-EOF
		[packages-microsoft-com-prod]
		name=packages-microsoft-com-prod
		baseurl=https://packages.microsoft.com/rhel/7/prod/
		enabled=1
		gpgcheck=1
		gpgkey=https://packages.microsoft.com/keys/microsoft.asc
	EOF
	dnf check-update
	dnf install -y powershell
}

main "$@"
