#!/usr/bin/env bash

cd_recent_dirs() {
	if [[ "$(pwd)" == "$HOME" ]]; then
		if [[ -f "$MODULE_USER_TMP_DIRECTORY_PATH/base_dir" ]]; then
			cd "$(cat "$MODULE_USER_TMP_DIRECTORY_PATH"/base_dir)"
		elif [[ -f "$MODULE_USER_TMP_DIRECTORY_PATH/recent_dirs" ]]; then
			cd "$(tac "$MODULE_USER_TMP_DIRECTORY_PATH/recent_dirs" | fzf --tiebreak=end)" 2>/dev/null
		fi
	fi
}

record_recent_dirs() {

	if [[ -d "$MODULE_USER_TMP_DIRECTORY_PATH" ]]; then
		echo "$(pwd)" >"$MODULE_USER_TMP_DIRECTORY_PATH/last_dir"
		TMP_FILE="$(mktemp)"
		if [[ -f "$MODULE_USER_TMP_DIRECTORY_PATH/recent_dirs" ]]; then
			tail -n"$MODULE_RECENT_DIRECTORY_NUM_DIRECTORIES_TO_STORE" \
				"$MODULE_USER_TMP_DIRECTORY_PATH/recent_dirs" \
				>"$TMP_FILE"
		fi
		echo "$(pwd)" >>"$TMP_FILE"
		echo "$HOME" >>"$TMP_FILE"
		awk ' !x[$0]++' "$TMP_FILE" >"$MODULE_USER_TMP_DIRECTORY_PATH/recent_dirs"
		rm -f "$TMP_FILE"
	fi

}
