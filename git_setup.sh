if [[ -z "$1" ]]; then
	echo "Usage: $0 <email>"
	exit 1
fi
if [[ -f "$HOME/.ssh/id_ed25519.pub" ]]; then
	git config --global user.signingkey "$HOME/.ssh/id_ed25519.pub"
else
	echo "No SSH key found at $HOME/.ssh/id_ed25519.pub"
	exit 1
fi
git config --global user.email "$1"
git config --global user.name "James Lochhead"
git config --global init.defaultBranch main
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global tag.gpgsign true
git config --global pull.ff only
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
git config --global diff.algorithm patience
git config --global core.editor nvim
git config --global diff.colorMoved zebra
