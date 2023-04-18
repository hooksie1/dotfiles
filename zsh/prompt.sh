birthday="12-22"
christmas="12-25"
bre="03-29"
buddy="02-17"
bentley="12-30"
halloween="10-31"
today="$(date +%m-%d)"

# Status Code
PS1+='%(?.., %{$fg[red]%}%?%{$reset_color%})'

# Timer: http://stackoverflow.com/questions/2704635/is-there-a-way-to-find-the-running-time-of-the-last-executed-command-in-the-shel
if [[ $_elapsed[-1] -ne 0 ]]; then
	PS1+=', '
	PS1+="%{$fg[magenta]%}$_elapsed[-1]s%{$reset_color%}"
fi

# PID
if [[ $! -ne 0 ]]; then
	PS1+=', '
	PS1+="%{$fg[yellow]%}PID:$!%{$reset_color%}"
fi

CAN_I_RUN_SUDO=$(sudo -n uptime 2>&1|grep "load"|wc -l)
if [ ${CAN_I_RUN_SUDO} -gt 0 ]
then
	PS1+=', '
	PS1+="%{$fg_bold[red]%}SUDO%{$reset_color%}"
fi


if [ $today = $birthday ]
then
PS1+="%{$fg[white]%}🎂 %{$reset_color%}% "
elif [ $today = $christmas ]
then
PS1+="%{$fg[white]%}🎅 %{$reset_color%}% "
elif [ $today = $bre ]
then
PS1+="%{$fg[white]%}👰 %{$reset_color%}% "
elif [ $today = $bentley ]
then
PS1+="%{$fg[white]%}👸 %{$reset_color%}% "
elif [ $today = $buddy ]
then
PS1+="%{$fg[white]%}👷 %{$reset_color%}% "
elif [ $today = $halloween ]
then
PS1+="%{$fg[white]%}👻 %{$reset_color%}% "
else
PS1+="%{$fg[white]%}%(?.🐵.🙈) %{$reset_color%}% "
fi

precmd_functions+=set_prompt

preexec () {
    (( ${#_elapsed[@]} > 1000 )) && _elapsed=(${_elapsed[@]: -1000})
    _start=$SECONDS
}

precmd () {
   echo -ne "\e]1;${PWD##*/}\a"
   (( _start >= 0 )) && _elapsed+=($(( SECONDS-_start )))
   _start=-1
}
