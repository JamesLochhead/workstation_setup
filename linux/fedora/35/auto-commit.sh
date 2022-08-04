#!/usr/bin/env bash

git_branch="$1"
commit_message="$2"
path_of_this_directory="$(dirname "$(readlink -f "$0")")"

cd "$path_of_this_directory" || {
	echo "cd $path_of_this_directory failed" >&2
	exit 1
}

# Create git_branch if it doesn't exist and sets the remote branch
if git rev-parse --verify "$git_branch" > /dev/null 2>&1; then
	git checkout -b "$git_branch"
	git branch --set-upstream-to origin/"$git_branch"
fi

# Commit changes and push
git checkout "$git_branch" 2>/dev/null ||
	git checkout -b "$git_branch" &&
	git add -A &&
	git commit -m "$commit_message" &&
	git push origin "$git_branch"
