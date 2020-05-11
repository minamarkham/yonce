#!/usr/bin/env bash

# Yoncé for Bash-it
# By Mina Markham (based on the theme Brainy)

###############################################################################
#   DEMO (requires a Nerd Font)
###############################################################################

#   Yoncé all on his mouth like liquor
# ┌ user   hostname   ~/full/directory/path   branch ↑1 ↓1 {1} +1 •1 ⌀1                            [  00:00 ]   100%↓
# └ cd .bash-it/themes/yonce

# ┌ user   hostname   ~/full/directory/path                   ⓔ 1 [  v0.0.0 ] [  py-0.0.00 ] [  10 ] [  00:00 ]   AC
# └ cd .bash-it/themes/yonce

###############################################################################
#   ARTWORK
###############################################################################
default="
    _                                      *
   (_|   |                    /          * | *
     |   |  __   _  _    __   _    * * * \\|O|/ * * *
     |   | /  \\_/ |/ |  /    |/     \\o\\o\\o|O|o/o/o/
      \\_/|/\\__/   |  |_/\\___/|__/   (<><><>O<><><>)
        /|                           '==========='
        \\|"

yonce="
    _
   (_|   |                    /
     |   |  __   _  _    __   _
     |   | /  \\_/ |/ |  /    |/
      \\_/|/\\__/   |  |_/\\___/|__/
        /|
        \\|"

queen="
              *
            * | *
      * * * \\|O|/ * * *
       \\o\\o\\o|O|o/o/o/
       (<><><>O<><><>)
        '==========='"

king="
           * * * *
      * * * \\|O|/ * * *
       \\o\\o\\o|O|o/o/o/
       (<><><>O<><><>)
       '============='"

hello=" _          _   _
| |        | | | |      |
| |     _  | | | |  __  |
|/ \   |/  |/  |/  /  \_|
|   |_/|__/|__/|__/\__/ o"

###############################################################################
#   VARIABLES
###############################################################################

YONCE_ART_ENABLED=0
YONCE_ARTWORK=$default

# SCM prompts
SCM_NONE_CHAR=""
SCM_GIT_CHAR="${white} "
SCM_GIT_BEHIND_CHAR="${red}↓${normal}"
SCM_GIT_AHEAD_CHAR="${bold_green}↑${normal}"
SCM_GIT_UNTRACKED_CHAR="⌀"
SCM_GIT_UNSTAGED_CHAR="${bold_yellow}•${normal}"
SCM_GIT_STAGED_CHAR="${bold_green}+${normal}"

SCM_THEME_PROMPT_DIRTY=""
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

# Git status prompts
GIT_THEME_PROMPT_DIRTY=" ${red}${normal}"
GIT_THEME_PROMPT_CLEAN=" ${green}${normal}"

THEME_SHOW_LYRIC=${THEME_SHOW_LYRIC:-"true"}
THEME_SHOW_SUDO=${THEME_SHOW_SUDO:-"true"}
THEME_SHOW_SCM=${THEME_SHOW_SCM:-"true"}
THEME_SHOW_EXITCODE=${THEME_SHOW_EXITCODE:-"false"}
THEME_SHOW_NODE=${THEME_SHOW_NODE:-"false"}
THEME_SHOW_PYTHON=${THEME_SHOW_PYTHON:-"false"}
THEME_SHOW_TODO=${THEME_SHOW_TODO:-"false"}
THEME_SHOW_CLOCK=${THEME_SHOW_CLOCK:-"false"}
THEME_SHOW_BATTERY=${THEME_SHOW_BATTERY:-"false"}

THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$white"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%H:%M"}

THEME_COLOR_LYRIC=${white}
THEME_COLOR_USER=${bold_red}
THEME_COLOR_HOST=${bold_cyan}
THEME_COLOR_CWD=${bold_purple}
THEME_COLOR_SCM=${white}
THEME_COLOR_EXITCODE=${white}

__YONCE_USER="\u"
__YONCE_HOST="\h"
__YONCE_CWD="\w"

__YONCE_PROMPT_CHAR_PS0=${THEME_PROMPT_CHAR_PS0:-"┌"}
__YONCE_PROMPT_CHAR_PS1=${THEME_PROMPT_CHAR_PS1:-"└"}
__YONCE_PROMPT_CHAR_PS2=${THEME_PROMPT_CHAR_PS2:-"└"}

___YONCE_PREFIX=${___YONCE_PREFIX:-"lyric"}
___YONCE_TOP_LEFT=${___YONCE_TOP_LEFT:-"user host dir scm virtualenv"}
___YONCE_TOP_RIGHT=${___YONCE_TOP_RIGHT:-"exitcode node python todo clock battery"}
___YONCE_BOTTOM=${___YONCE_BOTTOM:-"char"}

###############################################################################
#   SONGS
###############################################################################

YONCE="https://www.youtube.com/watch?v=jcF5HtGvX5I"
FORMATION="https://www.youtube.com/watch?v=WDZJPJV__bQ"
APESHIT="https://www.youtube.com/watch?v=kbMqWXnpXcA"
SEVEN11="https://www.youtube.com/watch?v=k4YRWT_Aldo"
CRAZY="https://www.youtube.com/watch?v=ViwtNLUqkMY"
COUNTDOWN="https://www.youtube.com/watch?v=2XY3AvVgDns"
SORRY="https://www.youtube.com/watch?v=QxsmWxxouIM"

###############################################################################
#   FUNCTIONS
###############################################################################

__yonce_node_version_prompt() {
	local nodev
	nodev=$(node -v)
	test -n "$nodev" && printf %s "$nodev" || :
}

_yonce_nvm() {
	[ -f ".nvmrc" ] && nvm use
}

_yonce_display_art() {
	[[ "$YONCE_ART_ENABLED" -eq 1 ]] &&  echo -e "$YONCE_ARTWORK"
}

_yonce_display_lyric() {
	LYRICS=(
		"Yoncé all on his mouth like liquor"
		"Hang one night with Yoncé, I'll make you famous"
		"'Cause I slay, all day"
		"If you liked it then you should have put a ring on it"
		"To the left, to the left"
		"I woke up like this"
		"I'm feelin' myself, I'm feelin' myself"
		"Always stay gracious, best revenge is your paper"
		"Okay, ladies, now let's get in formation"
		"I got hot sauce in my bag, swag"
		"He better call Becky with the good hair"
		"Suck on my balls, pause"
		"Tell 'em, boy bye"
		"Hold up, they don't love you like I love you"
		"If you really love me make an album about me"
		"I stop the world… WORLD STOP"
		"Gimme my check, put some respek on my check"
		"Have you ever seen the crowd goin' apeshit?"
		"Paparazzi, catch my fly and my cocky fresh"
		"I twirl on them haters"
		"All on Instagram, cake by the pound"
		"I sneezed on the beat and the beat got sicker"
	)

	RANDOM=$$$(date +%s)

	GET_LYRIC=${LYRICS[$RANDOM % ${#LYRICS[@]}]}

	printf "${GET_LYRIC}"
}

###############################################################################
#   HELPFUL FUNCTIONS
###############################################################################

# Better cd
cd() { builtin cd "$@" && _yonce_nvm; }

###############################################################################
#   PARSERS
###############################################################################

____yonce_top_left_parse() {
	ifs_old="${IFS}"
	IFS="|"
	args=( $1 )
	IFS="${ifs_old}"
	if [ -n "${args[3]}" ]; then
		_TOP_LEFT+="${args[2]}${args[3]}"
	fi
	_TOP_LEFT+="${args[0]}${args[1]}"
	if [ -n "${args[4]}" ]; then
		_TOP_LEFT+="${args[2]}${args[4]}"
	fi
	_TOP_LEFT+=" "
}

____yonce_top_right_parse() {
	ifs_old="${IFS}"
	IFS="|"
	args=( $1 )
	IFS="${ifs_old}"
	_TOP_RIGHT+=" "
	if [ -n "${args[3]}" ]; then
		_TOP_RIGHT+="${args[2]}${args[3]}"
	fi
	_TOP_RIGHT+="${args[0]}${args[1]}"
	if [ -n "${args[4]}" ]; then
		_TOP_RIGHT+="${args[2]}${args[4]}"
	fi
	__TOP_RIGHT_LEN=$(( __TOP_RIGHT_LEN + ${#args[1]} + ${#args[3]} + ${#args[4]} + 1 ))
	(( __SEG_AT_RIGHT += 1 ))
}

____yonce_bottom_parse() {
	ifs_old="${IFS}"
	IFS="|"
	args=( $1 )
	IFS="${ifs_old}"
	_BOTTOM+="${args[0]}${args[1]}"
	[ ${#args[1]} -gt 0 ] && _BOTTOM+=" "
}

____yonce_prefix_parse() {
	ifs_old="${IFS}"
	IFS="|"
	args=( $1 )
	IFS="${ifs_old}"
	_PREFIX+="${args[0]}${args[1]}"
	[ ${#args[1]} -gt 0 ] && _PREFIX+=" "
}

____yonce_prefix() {
	_PREFIX=""
	for seg in $___YONCE_PREFIX; do
		info="$(___yonce_prompt_"${seg}")"
		[ -n "${info}" ] && ____yonce_prefix_parse "${info}"
	done
	printf "\n%s" " ${_PREFIX}"
}

____yonce_top() {
	_TOP_LEFT=""
	_TOP_RIGHT=""
	__TOP_RIGHT_LEN=0
	__SEG_AT_RIGHT=0

	for seg in ${___YONCE_TOP_LEFT}; do
		info="$(___yonce_prompt_"${seg}")"
		[ -n "${info}" ] && ____yonce_top_left_parse "${info}"
	done

	___cursor_right="\033[500C"
	_TOP_LEFT+="${___cursor_right}"

	for seg in ${___YONCE_TOP_RIGHT}; do
		info="$(___yonce_prompt_"${seg}")"
		[ -n "${info}" ] && ____yonce_top_right_parse "${info}"
	done

	[ $__TOP_RIGHT_LEN -gt 0 ] && __TOP_RIGHT_LEN=$(( __TOP_RIGHT_LEN - 1 ))
	___cursor_adjust="\033[${__TOP_RIGHT_LEN}D"
	_TOP_LEFT+="${___cursor_adjust}"

	printf "%s%s" "${_TOP_LEFT}" "${_TOP_RIGHT}"
}

____yonce_bottom() {
	_BOTTOM=""
	for seg in $___YONCE_BOTTOM; do
		info="$(___yonce_prompt_"${seg}")"
		[ -n "${info}" ] && ____yonce_bottom_parse "${info}"
	done
	printf "\n%s" "${_BOTTOM}"
}

###############################################################################
#   SEGMENTS
###############################################################################

___yonce_prompt_user() {
	icon="${white} "
	info="${THEME_COLOR_USER}${__YONCE_USER}"
	if [ "${THEME_SHOW_SUDO}" == "true" ]; then
		if [ $(sudo -n id -u 2>&1 | grep 0) ]; then
		icon="${white} "
		fi
	fi
	if [ -n "${SSH_CLIENT}" ]; then
		icon="${white} "
	fi
	printf "%s|%s" "${icon}" "${info}"
}

___yonce_prompt_host() {
	icon="${white} "
	info="${THEME_COLOR_HOST}${__YONCE_HOST}"
	separator="${white} "
	printf "%s|%s" "${separator}" "${icon}" "${info}"
}

___yonce_prompt_virtualenv(){
	if test -z ${VIRTUAL_ENV} ; then
     info=""
  	else
	 info="${bold_red}(`basename \"${VIRTUAL_ENV}\"`)"
	 printf "%s" "${info}"
	fi
	
}
___yonce_prompt_dir() {
	icon="${white} "
	info="${THEME_COLOR_CWD}${__YONCE_CWD}"
	separator="${white} "
	printf "%s|%s" "${separator}" "${icon}" "${info}"
}

___yonce_prompt_scm() {
	[ "${THEME_SHOW_SCM}" != "true" ] && return
	box="$(scm_char) "
	info="${THEME_COLOR_SCM}$(scm_prompt_info)"
	printf "%s|%s|%s|%s" "${box}" "${info}"
}

___yonce_prompt_python() {
	[ "${THEME_SHOW_PYTHON}" != "true" ] && return
	color=$white
	box="[ | ]"
	info=" $(python_version_prompt)"
	printf "%s|%s|%s|%s" "${color}" "${info}" "${bold_blue}" "${box}"
}

___yonce_prompt_node() {
	[ "${THEME_SHOW_NODE}" != "true" ] && return
	color=$white
	box="[ | ]"
	info=" $(__yonce_node_version_prompt)"
	printf "%s|%s|%s|%s" "${color}" "${info}" "${bold_green}" "${box}"
}

___yonce_prompt_todo() {
	[ "${THEME_SHOW_TODO}" != "true" ] ||
	[ -z "$(which todo.sh)" ] && return
	color=$white
	box="[ | ]"
	info=" $(todo.sh ls | egrep "TODO: [0-9]+ of ([0-9]+)" | awk '{ print $4 }' )"
	printf "%s|%s|%s|%s" "${color}" "${info}" "${bold_yellow}" "${box}"
}

___yonce_prompt_lyric() {
	[ "${THEME_SHOW_LYRIC}" != "true" ] && return
	icon="${yellow} "
	info=${THEME_COLOR_LYRIC}$(_yonce_display_lyric)
	printf "%s|%s" "${icon}" "${info}"
}

___yonce_prompt_battery() {
	! _command_exists battery_percentage ||
	[ "${THEME_SHOW_BATTERY}" != "true" ] ||
	[ "$(battery_percentage)" = "no" ] && return

	info="$(battery_percentage)"
	icon="  "
	color=$green
	if [ "$info" -lt 25 ]; then
		color=$red && icon="  "
	elif [ "$info" -lt 50 ]; then
		color=$yellow && icon="  "
	elif [ "$info" -lt 75 ]; then
		color=$green && icon="  "
	elif [ "$info" -lt 100 ]; then
		color=$green && icon="  "
	fi
	ac_adapter_connected && charging="%↑"
	ac_adapter_disconnected && charging="%↓"
	info+=$charging
	[ "$info" == "100%↑" ] && info="AC" && icon=" "
	printf "%s|%s" ${color} " ${icon}" "${info}"
}

___yonce_prompt_clock() {
	[ "${THEME_SHOW_CLOCK}" != "true" ] && return
	color=$THEME_CLOCK_COLOR
	box="[ | ]"
	info="$(date +"${THEME_CLOCK_FORMAT}")"
	printf "%s|%s|%s|%s" "${color}" " ${info}" "${bold_purple}" "${box}"
}

___yonce_prompt_exitcode() {
	[ "${THEME_SHOW_EXITCODE}" != "true" ] && return
	[ "$exitcode" -ne 0 ] && printf "%s|%s" "${THEME_COLOR_EXITCODE}" "ⓔ ${exitcode}"
}

___yonce_prompt_char() {
	color=$white
	prompt_char="${__YONCE_PROMPT_CHAR_PS1}"
	printf "%s|%s" "${color}" "${prompt_char}"
}

###############################################################################
#   CLI
###############################################################################

__YONCE_SONGS="yonce formation seven11 apeshit crazy countdown sorry"

__yonce_show() {
	typeset _seg=${1:-}
	shift
	export THEME_SHOW_${_seg}=true
}

__yonce_hide() {
	typeset _seg=${1:-}
	shift
	export THEME_SHOW_${_seg}=false
}

__yonce_help() {
	typeset _seg=${1:-}
	shift
	printf "Usage: yonce [action] options

Actions:
  help me      Show this help                                [boolean]
  show         Show a prompt segment                          [string]
  hide         Hide a prompt segment                          [string]
  name         Change the name of the current terminal tab    [string]
  play         Play a song featuring Yoncé                    [string]
  play list    Show lists of songs available to play         [boolean]
";
}

__yonce_name() {
	typeset _seg=${1:-}
	shift
	echo -e "\033]0;${seg:?please specify a title}\007" | tr '[:upper:]' '[:lower:]';
}

__yonce_play() {
	if hash npmusic 2>/dev/null; then
		if [ "${seg}" == "LIST" ]; then
			echo $__YONCE_SONGS
		elif [[ $__YONCE_SONGS =~ .*${seg}.* ]]; then
			printf "  Song undefined! Please add URL to songlist.\n"
		elif hash npmusic 2>/dev/null; then
			eval "npmusic -p \$${seg}"
		fi
	else
		printf "  Please install npmusic: npm i -g npmusic\n"
	fi
}

_yonce_completion() {
	local cur _action actions segments
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	_action="${COMP_WORDS[1]}"
	actions="show hide play help"
	segments="battery clock exitcode lyric python node scm sudo todo"
	songs=${__YONCE_SONGS}
	case "${_action}" in
		show)
			COMPREPLY=( $(compgen -W "${segments}" -- "${cur}") )
			return 0
			;;
		hide)
			COMPREPLY=( $(compgen -W "${segments}" -- "${cur}") )
			return 0
			;;
		play)
			COMPREPLY=( $(compgen -W "${songs}" -- "${cur}") )
			return 0
			;;
	esac

	COMPREPLY=( $(compgen -W "${actions}" -- "${cur}") )
	return 0
}

yonce() {
	typeset action=${1:-}
	shift
	typeset segs=${*:-}
	typeset func
	case $action in
		show)
			func=__yonce_show;;
		hide)
			func=__yonce_hide;;
		name)
			func=__yonce_name;;
		play)
			func=__yonce_play;;
		help)
			func=__yonce_help;;
	esac
	for seg in ${segs}; do
		seg=$(printf "%s" "${seg}" | tr '[:lower:]' '[:upper:]')
		$func "${seg}"
	done
}

complete -F _yonce_completion yonce

###############################################################################
#   PROMPT
###############################################################################

__yonce_ps0() {
	printf "%s%s%s" "$(____yonce_prefix)" "${normal}\n"
}

__yonce_ps1() {
	printf "%s%s" "${__YONCE_PROMPT_CHAR_PS0}$(____yonce_top)" "$(____yonce_bottom)" "${normal}"
}

__yonce_ps2() {
	color=$white
	printf "%s%s%s" "${color}" "${__YONCE_PROMPT_CHAR_PS2} " "${normal}"
}

_yonce_prompt() {
    exitcode="$?"

    PS1="$(__yonce_ps0)$(__yonce_ps1)"
    PS2="$(__yonce_ps2)"
}

###############################################################################
#   LET'S GO
###############################################################################

_yonce_nvm

_yonce_display_art

safe_append_prompt_command _yonce_prompt
