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
if command -v fzf &>/dev/null && [[ -f "$HOME/.local/share/fzf/key-bindings.sh" ]]; then
	source "$HOME/.local/share/fzf/key-bindings.sh"
fi
