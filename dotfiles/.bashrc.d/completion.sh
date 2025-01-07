#!/usr/bin/env bash

# kubectl
if command -v kubectl &>/dev/null; then
	source <(kubectl completion bash)
fi

# Terraform
if command -v terraform &>/dev/null; then
	# Generated via: terraform -install-autocomplete
	complete -C terraform terraform
fi

# Packer
if command -v packer &>/dev/null; then
	# Generated via: packer -autocomplete-install
	complete -C packer packer
fi

# fzf
if command -v fzf &>/dev/null &&
	command -v brew &>/dev/null &&
	[[ -f "$(brew --prefix)/opt/fzf/shell/completion.bash" ]] &&
	[[ -L "$HOME/.homebrew" ]]; then
	source "$(brew --prefix)/opt/fzf/shell/completion.bash"
fi
