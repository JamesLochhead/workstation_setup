#!/usr/bin/env bash

set -eEuxo pipefail

main() {
	brew install --cask \
		brave-browser \
		rectangle \
		firefox \
		google-chrome \
		spotify \
		iterm2 \
		hyperkey \
		coteditor \
		vimr \
		slack \
		inkscape \
		zoom \
		gimp

	brew install \
		bash \
		bash-completion@2 \
		neovim \
		coreutils \
		awscli \
		fswatch \
		findutils \
		fzf \
		git \
		node \
		ruby \
		python@3.10 \
		make \
		docker \
		cue \
		gnu-sed \
		iproute2mac \
		lima \
		shellcheck \
		unzip \
		ipcalc \
		terraform-lsp \
		fx \
		gnu-tar \
		shfmt \
		gnu-which \
		xz \
		jq \
		zstd \
		go \
		kubernetes-cli \
		sqlite \
		grep \
		lz4 \
		qemu \
		helm \
		lzo \
		colima \
		ripgrep \
		readline \
		terminal-notifier \
		yq \
		pyright \
		black

	if [[ "$1" == "personal" ]]; then
		brew install --cask \
			steam \
			nvidia-geforce-now \
			whatsapp \
			protonmail-bridge \
			jellyfin-media-player
	fi

}

main "$@"
