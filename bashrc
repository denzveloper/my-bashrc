#
# ~/.bashrc
#
#Edited
jam=`date +%H`
if [ $jam -ge 03 -a $jam -le 10 ]
then
        sapaan="\e[92mGood morning\e[39m"
elif [ $jam -ge 11 -a $jam -le 14 ]
then
        sapaan="\e[93mGood afternoon\e[39m"
elif [ $jam -ge 15 -a $jam -le 18 ]
then
        sapaan="\e[94mGood evening\e[39m"
else
        sapaan="\e[90mGood night\e[39m"
fi
#Edited
export GTK_CSD=0
export LD_PRELOAD=/usr/lib/libgtk3-nocsd.so
###EDIT
if [ "$(whoami)" != "root" ]
then
        namamu="\e[36m$(whoami)\e[39m"
	namayou="\e[92m$(whoami)\e[39m"
else
	namamu="\e[31m$(whoami)\e[39m"
	namayou="\e[91m$(whoami)\e[39m"
fi
##My Costum
#Neofetch by Denzveloper--
neofetch --disable model uptime packages
#^Neofetch by Denzveloper^
#Alias Biar gampang perintahnya
alias pg="ping 8.8.8.8"
alias update="sudo pacman -Sy"
alias upgrade="sudo pacman -Syu"
alias upgraded="sudo pacman -Syu"
alias kernel="uname -a"
alias admin="su"
alias ram="free -h"
alias checkup="sudo pacman -Sy"
alias install="sudo pacman -S"
alias uninstall="sudo pacman -Rsn"
alias rm="rm -I"
alias uptodate="sudo pacman -Syu"
alias tracert="traceroute"
#akhir alias
echo -e "!!==\e[1mWelcome to \e[35m$(hostname)\e[39m \"\e[4m$namamu\e[21m\e[24m\" \e[93m:) \e[1m$sapaan\e[21m $namayou, Have a nice day.."
#Akhir dari segalanya.. :v

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

function _update_ps1() {
    PS1="$(~/.powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
