### watch plugin
__time_display_precmd() {
        local cols=$((COLUMNS - 8))
        local lines_shift=$((1+$(echo $1 | awk -v c=0 -v l=$(($COLUMNS)) '{c++; if (length($0)>l-3) { c+=int((length($0)-l+3)/l); if ((length($0)-l+3)%l>0) c++; } } END {print c}')))
        echo -e "\033[${lines_shift}A\033[${cols}C $bg[dark]$fg[white]\ue0b2$bg[white]$fg[black]\u239f$fg[blue]$(date +'%H:%M')$reset_color\033[$((${lines_shift}-1))B"
}

autoload -U add-zsh-hook
add-zsh-hook preexec __time_display_precmd
