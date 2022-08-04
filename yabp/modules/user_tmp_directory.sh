#!/usr/bin/env bash

# Create a /tmp/USERNAME_DIRECTORY if it doesn't exist
# Always ensure it's owned by the user and is 700

setup_user_tmp_directory() {

	CURRENT_USER="$(whoami)"
	CURRENT_USER_PRIMARY_GROUP=$(id -gn "$(whoami)")

	[[ ! -d "$MODULE_USER_TMP_DIRECTORY_PATH" ]] &&
		mkdir -p "$MODULE_USER_TMP_DIRECTORY_PATH" &&
		chmod 700 "$MODULE_USER_TMP_DIRECTORY_PATH" &&
		chown "$CURRENT_USER:$CURRENT_USER_PRIMARY_GROUP" "$MODULE_USER_TMP_DIRECTORY_PATH"

}
