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
alias gsm='git commit -a -s -S'
alias rm='echo Use "del", or the full path i.e. "/bin/rm"'
alias del='rmtrash'

if [[ $kernel == "Linux" ]]; then
	alias ls='ls --color-auto'
    alias sourcedir="cd /home/mysall/HDDStorage/source;pwd"
    alias tmpdir="cd /home/mysall/HDDStorage/tmp;pwd"
    alias scrotdir="cd /home/mysall/HDDStorage/scrots;pwd"
    alias upm="sudo pacman -Syuu"
    alias dlaur="cower -dufq -t /home/mysall/HDDStorage/source/aur"
    alias aurdir="cd /home/mysall/HDDStorage/source/aur"
    alias ipkg="makepkg -si"
    alias clion="run-clion-fix-sigint-bug"
    alias rsclient="cd /home/mysall/HDDStorage/source/rsps/sources/Game-Client;pwd"
    alias rsserver="cd /home/mysall/HDDStorage/source/rsps/sources/saturn;pwd"
    alias natwm="sourcedir;cd c/natwm;pwd"
    alias valgrind="valgrind --leak-check=full --show-leak-kinds=all"
elif [[ $kernel == "Darwin" ]]; then
	alias ls='ls -FG'
    alias sourcedir="cd /Users/ccfrank/source; pwd"
    alias jsdir="sourcedir;cd js/;pwd"
    alias godir="sourcedir;cd go/;pwd"
    alias personaldir="cd /Users/ccfrank/personal; pwd"
    alias valgrind="valgrind --leak-check=full --show-leak-kinds=definite,indirect"
fi


# PS1
PS1='[\u@\h \W]\$ '

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
