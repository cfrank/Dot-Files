#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Allow for system checking
kernel=$(uname -s)

# Exports
export VISUAL="vim"
if [ -x "$(command -v go)" ]; then
	export PATH=$PATH:$(go env GOPATH)/bin
	export GOPATH=$(go env GOPATH)
fi
export CC=gcc

function myscrot {
    DIR="$HOME/Documents/scrots/"
    TIMESTAMP='%Y-%m-%d-%H%M%S_$wx$h'
    FORMAT='png'
    TYPE='screen'
    ARGS=''

    if [ "$1" == "-s" ]; then
        TYPE='selection'
        ARGS='-s'
    elif [ "$1" == "-w" ]; then
        TYPE='window'
        ARGS='-u -b'
    elif [ "$#" != 0 ]; then
        echo "Invalid arguments, use original scrot command"
        exit 1
    fi

    $(scrot $ARGS "$DIR$TIMESTAMP\_$TYPE.$FORMAT")
}

function init_ssh_keys {
    echo "Initializing ssh-agent..."

    eval $(ssh-agent -s)

    for filename in ~/.ssh/id_rsa*; do
        # Only want private keys
        [[ $filename == *.pub ]] && continue

        if [[ "$kernel" == "Darwin" ]]; then
            eval $(ssh-add -K $filename)
        elif [[ "$kernel" == "Linux" ]]; then
            eval $(ssh-add $filename)
        fi
    done
}

# Aliases
alias del='rmtrash'
alias gsm='git commit -s -S'
alias rm='echo Use "del", or the full path i.e. "/bin/rm"'
alias sshc='ssh cfrank@45.33.64.43 -p 1404'
alias vpnc='nordvpn c San_Francisco'
alias godir='cd $GOPATH;pwd'
alias nja='ninja'

if [[ $kernel == "Linux" ]]; then
    alias ls='ls --color=auto'
    alias lsblk="lsblk -o NAME,MAJ:MIN,RM,SIZE,FSUSE%,FSTYPE,RO,TYPE,MOUNTPOINT,PARTLABEL"
    alias natwmdir="sourcedir;cd c/natwm;pwd"
    alias alogdir="godir;cd src/github.com/alog-rs;pwd"
    alias scrotdir="cd ~/Documents/scrots;pwd"
    alias sourcedir="cd ~/source;pwd"
    alias tmpdir="sourcedir;cd tmp;pwd"
    alias pkgdir="sourcedir;cd pkg;pwd"
    alias upm="yay -Syuu"
    alias valgrind="valgrind --leak-check=full --show-leak-kinds=definite,indirect"
elif [[ $kernel == "Darwin" ]]; then
    alias godir="sourcedir;cd go/;pwd"
    alias jsdir="sourcedir;cd js/;pwd"
    alias ls='ls -FG'
    alias personaldir="cd /Users/ccfrank/personal; pwd"
    alias sourcedir="cd /Users/ccfrank/source; pwd"
    alias valgrind="valgrind --leak-check=full --show-leak-kinds=definite,indirect"
fi


# PS1
PS1='[\u@\h \W]\$ '

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source /usr/share/nvm/init-nvm.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
