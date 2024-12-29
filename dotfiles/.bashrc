if [[ -f /opt/homebrew/bin/brew ]] && [[ -L "$HOME/.homebrew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if command -v brew &>/dev/null; then
	BREW_HOME="$(brew --prefix)"

	if [[ -d "${BREW_HOME}/bin" ]]; then
		export PATH="${BREW_HOME}/bin:$PATH"
	fi
	if [[ -d "${BREW_HOME}/share/man" ]]; then
		export MANPATH="${BREW_HOME}/share/man:$MANPATH" # most programs
	fi
	if [[ -d "${BREW_HOME}/share/info" ]]; then
		export INFOPATH="${BREW_HOME}/share/info:$INFOPATH" # most programs
	fi
	export PATH="${BREW_HOME}/opt/file-formula/bin:$PATH" # file aka file-formula
	export PATH="${BREW_HOME}/opt/coreutils/libexec/gnubin:$PATH" # coreutils
	export MANPATH="${BREW_HOME}/opt/coreutils/libexec/gnuman:$MANPATH" # coreutils
	export PATH="${BREW_HOME}/opt/gnu-sed/libexec/gnubin:$PATH" # sed
	export PATH="${BREW_HOME}/opt/findutils/libexec/gnubin:$PATH" # find
	export PATH="${BREW_HOME}/opt/grep/libexec/gnubin:$PATH" # grep
	export PATH="${BREW_HOME}/opt/gnu-which/libexec/gnubin:$PATH" # which
	if [[ -f "${BREW_HOME}/etc/profile.d/bash_completion.sh" ]]; then
		source "${BREW_HOME}/etc/profile.d/bash_completion.sh"
	fi
	unset BREW_HOME
fi

if command -v starship &>/dev/null; then
	eval "$(starship init bash)"
fi

if command -v dircolors &>/dev/null; then
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
fi

if command -v nvim &>/dev/null; then
	alias vi=nvim
	alias vim=nvim
fi

alias c='clear'
alias t='cd "$(mktemp -d)"; export TMP_DIR="$(pwd)"'
#alias f='nvim $(find -maxdepth 4 -not -path "*/.*" -type f 2>/dev/null | fzf --tiebreak=end --preview="less {}" --bind shift-up:preview-page-up,shift-down:preview-page-down)'
alias d='cd $(find -maxdepth 4 -not -path "*/.*" -type d 2>/dev/null | fzf --tiebreak=end --preview="less {}" --bind shift-up:preview-page-up,shift-down:preview-page-down)'
alias cd..='cd ..'

if [[ "$OSTYPE" == "darwin"* ]]; then
	alias ssh-add='/usr/bin/ssh-add --apple-use-keychain ~/.ssh/id_ed25519'
fi


open_file_neovim() {
	OLDIFS=$IFS
	IFS=
	local the_files=""
	readarray -d '' files < <(find -maxdepth 4 -not -path "*/.*" -type f -print0 2>/dev/null)
	if [[ ${#files[@]} -eq 0 ]]; then
		echo "No files found"
		return
	else
		for a_file in "${files[@]}"; do
			the_files+="$a_file"
			the_files+=$'\n'
		done
		local chosen_file="$(echo $the_files | fzf -0 -1 --tiebreak=end --preview='less {}' --layout=reverse --bind=shift-up:preview-page-up,shift-down:preview-page-down)"
		if [[ -f "$chosen_file" ]]; then
			nvim "$chosen_file"
		else
			echo "No file chosen"
		fi
	fi
	unset files
	IFS=$OLDIFS
}
export -f open_file_neovim
alias f=open_file_neovim

of() {
	OLDIFS=$IFS
	IFS=
	local the_files=""
	readarray -d '' files < <(find -maxdepth 4 -not -path "*/.*" -print0 2>/dev/null)
	if [[ ${#files[@]} -eq 0 ]]; then
		echo "No files found"
		return
	else
		for a_file in "${files[@]}"; do
			the_files+="$a_file"
			the_files+=$'\n'
		done
		local chosen_file="$(echo $the_files | fzf -0 -1 --tiebreak=end --preview='less {}' --layout=reverse --bind=shift-up:preview-page-up,shift-down:preview-page-down)"
		if [[ -e "$chosen_file" ]]; then
			open "$chosen_file"
		else
			echo "No file chosen"
		fi
	fi
	unset files
	IFS=$OLDIFS
}
export -f of
alias o=of
