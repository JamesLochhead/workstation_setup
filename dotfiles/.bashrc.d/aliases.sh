#!/usr/bin/env bash

alias c='clear'
alias t='cd "$(mktemp -d)"; export TMP_DIR="$(pwd)"'
alias cd..='cd ..'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'

if command -v dircolors &>/dev/null; then
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
fi

if command -v nvim &>/dev/null; then
	alias vi=nvim
	alias vim=nvim
fi

if [[ "$OSTYPE" == "darwin"* ]] && [[ -f "$HOME/.ssh/id_ed25519" ]] ; then
	alias ssh-add='/usr/bin/ssh-add --apple-use-keychain ~/.ssh/id_ed25519'
fi

if command -v open_file_neovim &>/dev/null; then
	alias f=open_file_fzf_neovim
fi

if command -v open_fzf_macos &>/dev/null; then
	alias o=open_fzf_macos
fi

if command -v yq &>/dev/null; then
	alias json2yaml="yq -P '.' "
	alias yaml2json="yq -o=json '.' "
fi
