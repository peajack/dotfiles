export PATH=$HOME/.local/bin:$HOME/go/bin:$PATH
export PS1="\n\033[1;36m\A\033[0m \033[1;37m\$(whoami)\033[0m\033[1;35m@\033[0m\033[1;37m\h\033[0m \033[1;32m\w\033[0m\n\033[1;33m\$\033[0m "
export EDITOR=nvim
export PRINTER=pantum_eve
export SANE_DEFAULT_DEVICE="escl:https://192.168.0.109:443"

set -o emacs

eval $(resize)

HISTFILE=$HOME/.ksh_history

alias kshrc=". ~/.kshrc"
alias trr="transmission-remote"

truefetch
