# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Allow for system checking
kernel=$(uname -s)
kernel_release=$(uname -r)

# Exports
export VISUAL="hx"
export HISTSIZE=50000
if [ -x "$(command -v go)" ]; then
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
fi
export PATH="$HOME/.local/bin:$HOME/source/tmp/cef_devel/depot_tools:$PATH"
export PATH="/usr/share/swift/swift-6.0.3-RELEASE-ubuntu24.04/usr/bin:$PATH"
export CC=gcc
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"

# Chromium/CEF exports
export GN_DEFINES="use_sysroot=false symbol_level=2 is_cfi=false use_thin_lto=false use_vaapi=false enable_nacl=false blink_symbol_level=0"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig"

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

# Aliases
alias gsm='git commit -s -S'
alias gpf='git push --force-with-lease'
alias gpr='git pull --rebase'
alias godir='cd $GOPATH;pwd'
alias cmake='cmake -GNinja'
alias nja='ninja'

if [[ $kernel == "Linux" ]]; then
    alias ls='ls -lah --color=auto'
    alias lsblk="lsblk -o NAME,MAJ:MIN,RM,SIZE,FSUSE%,FSTYPE,RO,TYPE,MOUNTPOINT,PARTLABEL"
    alias scrotdir="cd $HOME/Documents/scrots;pwd"
    alias sourcedir="cd $HOME/source;pwd"
    alias tmpdir="sourcedir;cd tmp;pwd"
    alias valgrind="valgrind --leak-check=full --show-leak-kinds=definite,indirect"

    if [[ $kernel_release =~ "WSL2" ]]; then
        alias ssh="ssh.exe"
        alias ssh-add="ssh-add.exe"
    fi
elif [[ $kernel == "Darwin" ]]; then
    alias godir="sourcedir;cd go/;pwd"
    alias jsdir="sourcedir;cd js/;pwd"
    alias ls='ls -FG'
    alias personaldir="cd $HOME/personal; pwd"
    alias sourcedir="cd $HOME/source; pwd"
    alias valgrind="valgrind --leak-check=full --show-leak-kinds=definite,indirect"
fi


# PS1
PS1='[\u@\h \W]\$ '

# === Start NVM ===
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# === End NVM ===

# === Start pyenv ===
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# === End pyenv ===
