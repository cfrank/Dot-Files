#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Exports
export VISUAL="vim"
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)

# Functions
function myscrot {
    DIR="/HDDStorage/scrots/"
    TIMESTAMP='%Y-%m-%d-%H%M%S_$wx$h_'
    FORMAT=".png"

    if [ "$1" == "-s" ]; then
	TYPE="selection"
	$(scrot -s "$DIR$TIMESTAMP$TYPE$FORMAT")
    elif [ "$1" == "-w" ]; then
	TYPE="window"
	$(scrot -u -b "$DIR$TIMESTAMP$TYPE$FORMAT")
    elif [ "$#" == 0 ]; then
	TYPE="screen"
	$(scrot "$DIR$TIMESTAMP$TYPE$FORMAT")
    else
	echo "Invalid arguments, use original scrot command"
    fi
}

# Aliases
alias ls='ls --color=auto'
alias sourcedir="cd /home/mysall/HDDStorage/source"
alias tmpdir="cd /home/mysall/HDDStorage/tmp"
alias upm="sudo pacman -Syuu"
alias dlaur="cower -dufq -t /home/mysall/HDDStorage/source/aur"
alias aurdir="cd /home/mysall/HDDStorage/source/aur"
alias ipkg="makepkg -si"

# PS1
PS1='[\u@\h \W]\$ '


# added by travis gem
[ -f /home/mysall/.travis/travis.sh ] && source /home/mysall/.travis/travis.sh
