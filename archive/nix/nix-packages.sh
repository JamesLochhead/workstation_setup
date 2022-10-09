#!/usr/bin/env bash

set -Eeuxo pipefail

tmp_file="$(mktemp)"

main() {
	trap exit_clean_up EXIT
	01_terraform
	02_ansible
	03_nodejs
	04_serialization_tools
	05_aws
	06_python
	07_python_310
	08_go
	09_shell_tools
	10_terminal_tools
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		11_linux_tools
	fi
	12_neovim
	13_kubernetes
	14_pulumi
	15_development_tools
	16_other_hashicorp_tools
	17_ruby
	18_powershell
	19_gcloud
	# 20_podman
	21_hetzner_cli
	22_security_tools
	23_virtualization
	export NIXPKGS_ALLOW_UNFREE=1
	xargs <"$tmp_file" nix-env -iA
}

01_terraform() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.terraform-lsp
		nixpkgs.terraformer
	EOF
}

02_ansible() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.ansible
		nixpkgs.ansible-lint
	EOF
}

03_nodejs() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.yarn
		nixpkgs.nodePackages.pnpm
		nixpkgs.nodejs-18_x
		nixpkgs.nodePackages.prettier
		nixpkgs.nodePackages.pnpm
	EOF
}

04_serialization_tools() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.jq
		nixpkgs.yq-go
		nixpkgs.cue
		nixpkgs.fx
	EOF
}

05_aws() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.aws-sam-cli
		nixpkgs.awscli
		nixpkgs.ssm-session-manager-plugin
		nixpkgs.aws-vault
		nixpkgs.aws-nuke
	EOF
}

06_python() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.black
		nixpkgs.virtualenv
		nixpkgs.pylint
		nixpkgs.checkov
	EOF
}

07_python_310() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.python310
		nixpkgs.python310Packages.pip
		nixpkgs.python310Packages.cfn-lint
		nixpkgs.python310Packages.boto3
		nixpkgs.python310Packages.pynvim
	EOF
}

08_go() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.go
	EOF
}

09_shell_tools() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.shfmt
		nixpkgs.shellcheck
	EOF
}

10_terminal_tools() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.byobu
		nixpkgs.tmux
		nixpkgs.htop
		nixpkgs.fzf
		nixpkgs.curl
	EOF
}

11_linux_tools() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.inotify-tools
	EOF
}

12_neovim() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.neovim
	EOF
}

13_kubernetes() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.helm
		nixpkgs.minikube
		nixpkgs.kubectl
		nixpkgs.kustomize
	EOF
}

14_pulumi() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.pulumi-bin
	EOF
}

15_development_tools() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.git
		nixpkgs.gnumake
	EOF
}

16_other_hashicorp_tools() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.vagrant
		nixpkgs.packer
	EOF
}

17_ruby() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.ruby
		nixpkgs.jekyll
	EOF
}

18_powershell() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.powershell
	EOF
}

19_gcloud() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.google-cloud-sdk
	EOF
}

# 20_podman() {
# 	cat <<-EOF >>"$tmp_file"
# 		nixpkgs.podman-compose
# 	EOF
# }

21_hetzner_cli() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.hcloud
	EOF
}

22_security_tools() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.openssl_3_0
	EOF
}

23_virtualization() {
	cat <<-EOF >>"$tmp_file"
		nixpkgs.qemu
	EOF
}

exit_clean_up() {
	rm "$tmp_file"
}

main "$@"
