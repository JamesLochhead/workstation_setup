#!/usr/bin/env bash

git checkout "$(hostname -s)" &>/dev/null || git checkout -b "$(hostname -s)" &>/dev/null

GIT_ROOT="$(git rev-parse --show-toplevel)"

main() {
	if ! is_head_detached && ! is_rebase_in_progress; then
		if there_are_untracked_files || there_are_differences_from_head; then
			git add -A && git commit -m "autocommit" && git push origin "$(hostname -s)"
		fi
	fi
}

is_head_detached() {

	# Return 1 if HEAD is not detached, otherwise return 0
	local return_value=0

	if git symbolic-ref -q HEAD >>/dev/null; then
		return_value=1
	fi
	return $return_value
}

is_rebase_in_progress() {

	# Return 1 if a rebase is not in progress, otherwise return 0

	local return_value=0

	if [[ ! -d "$GIT_ROOT/.git/rebase-apply" ]] &&
		[[ ! -d "$GIT_ROOT/.git/rebase-merge" ]]; then
		return_value=1
	fi
	return $return_value
}

there_are_untracked_files() {

	local return_value=1

	local no_of_untracked_files=$(git ls-files --others --exclude-standard | wc -l)
	if (( $no_of_untracked_files > 0 )); then
		return_value=0
	fi
	return $return_value
}

there_are_differences_from_head() {

	local return_value=1

	if ! git diff-index --quiet HEAD; then
		return_value=0
	fi
	return $return_value
}

main "$@"
