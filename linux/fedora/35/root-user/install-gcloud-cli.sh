#!/usr/bin/env bash

set -Eeuxo pipefail

main () {
	tee -a /etc/yum.repos.d/google-cloud-sdk.repo <<-EOF
	[google-cloud-cli]
	name=Google Cloud CLI
	baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el8-x86_64
	enabled=1
	gpgcheck=1
	repo_gpgcheck=0
	gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
	       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
	EOF
	dnf install -y libxcrypt-compat google-cloud-cli google-cloud-cli-*
}

main "$@"
