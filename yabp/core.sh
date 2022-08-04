#!/usr/bin/env bash

# The directory where YABP is installed
YABP_DIRECTORY="$1"

# The variables in options.sh control configuration options
source "$YABP_DIRECTORY/options.sh"

set_text_foreground_color() {
	if [[ $5 == true ]]; then
		printf "\[\e[0;1;%s;%s;%sm\]\[$_BOLD\]%s\[\e[0m\]" "$2" "$3" "$4" "$1"
	else
		printf "\[\e[0;1;%s;%s;%sm\]%s\[\e[0m\]" "$2" "$3" "$4" "$1"
	fi
}

# print_text() {
# 	[[ $MODULE_TRUE_COLOR_ENABLE ]] && source
# }

[[ $MODULE_USER_TMP_DIRECTORY_ENABLE ]] &&
	source "$YABP_DIRECTORY/modules/user_tmp_directory.sh" &&
	setup_user_tmp_directory

if command -v fzf &>/dev/null; then
	[[ $MODULE_RECENT_DIRECTORY_ENABLE ]] &&
		source "$YABP_DIRECTORY/modules/recent_directories.sh" &&
		cd_recent_dirs
fi

prompt_command() {

	ORIGINAL_RETURN_CODE=$? # must be first
	RETURN_CODE=""

	if command -v fzf &>/dev/null; then
		source "$YABP_DIRECTORY/modules/recent_directories.sh" &&
		[[ $MODULE_RECENT_DIRECTORY_ENABLE ]] && record_recent_dirs
	fi

	if ((ORIGINAL_RETURN_CODE != 0)); then
		RETURN_CODE=" $ORIGINAL_RETURN_CODE"
	fi
	history -a # store history
	_BOLD=$(tput bold)
	CWD_BASENAME="$(basename $(pwd))"
	CWD=$(set_text_foreground_color "$CWD_BASENAME" "38" "5" "33" true)
	DIR=$(pwd | sed "s|$HOME|~|")
	if [[ "$DIR" == "~" ]]; then
		DIR="$PWD"
	fi
	CWD=$(set_text_foreground_color "$DIR" "38" "5" "33" true)
	GIT_CHECKED_OUT=""
	GIT_REPOSITORY=""
	CURRENT_GCLOUD_IDENTITY=""
	CURRENT_GCLOUD_PROJECT=""
	AWS_REGION=""
	GIT_STATUS=""

	if command -v gcloud &>/dev/null; then
		if [ -n "${CLOUDSDK_CORE_PROJECT:-}" ]; then
			CURRENT_GCLOUD_PROJECT=" $CLOUDSDK_CORE_PROJECT"
		elif [[ -f "$HOME/.config/gcloud/configurations/config_default" ]]; then
			CURRENT_GCLOUD_PROJECT=" $(grep "project" <"$HOME/.config/gcloud/configurations/config_default" | sed 's/project = //' | colrm)"
		fi
		if [[ $CURRENT_GCLOUD_PROJECT != "" ]] && [[ $CURRENT_GCLOUD_PROJECT != " " ]]; then
			CURRENT_GCLOUD_IDENTITY=" $(grep "account" <"$HOME/.config/gcloud/configurations/config_default" | sed 's/account = //' | colrm)"
		fi
	fi

	if [ -n "${AWS_DEFAULT_REGION:-}" ]; then
		AWS_REGION=" $AWS_DEFAULT_REGION"
	fi

	if command -v git &>/dev/null && [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == "true" ]]; then
		#GIT_DETACHED=$(git rev-parse --abbrev-ref --symbolic-full-name HEAD 2> /dev/null)
		if git status | grep -q detached >/dev/null 2>&1; then
			GIT_STATUS=" D "
			GIT_CHECKED_OUT=$(git status | grep detached | sed 's|HEAD detached at ||' 2>/dev/null)
		else
			GIT_CHECKED_OUT="$(git branch --show-current | colrm)"
			if git status --short | grep -q " M " >/dev/null 2>&1 || git status --short | grep -q "?? " >/dev/null 2>&1; then
				GIT_STATUS=" M "
			fi
		fi
		#GIT_ROOT=$(git rev-parse --show-toplevel)
		GIT_REPOSITORY="$(basename -s .git "$(git config --get remote.origin.url)")"
		GIT_OWNER=$(git config --get remote.origin.url | sed 's|/.*||' | sed 's|^.*:||')
		echo -en "\033]0;G $GIT_REPOSITORY:$GIT_OWNER\a"
		GIT_REPOSITORY=" $GIT_REPOSITORY:"
	else

		echo -en "\033]0;D $CWD_BASENAME\a"
	fi
	#echo -en "\033]0;D $current_command\a"
	# echo "${BASH_COMMAND}"
	# CURRENT_PID=$$
	# CHILD_PROCESS_PID=$(pgrep -P $CURRENT_PID | head -n1)
	# if ps -p $CHILD_PROCESS_PID >/dev/null; then
	# 	process_name=$(ps -p "$CHILD_PROCESS_PID" -o comm=)
	# 	echo -en "\033]0;D $process_name\a"
	# fi
	SECOND_LINE=$(set_text_foreground_color ">" "38" "5" "33" true)
	CURRENT_HOSTNAME=$(set_text_foreground_color "$(hostname -s)" "38" "5" "33" true)
	PS1="\n$CURRENT_HOSTNAME $CWD$GIT_REPOSITORY$GIT_CHECKED_OUT$GIT_STATUS$CURRENT_GCLOUD_IDENTITY$CURRENT_GCLOUD_PROJECT$AWS_REGION$RETURN_CODE\n$SECOND_LINE "
	export PS1
}

PROMPT_COMMAND=prompt_command
