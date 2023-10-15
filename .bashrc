#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim=nvim
alias unimatrix="~/.local/bin/unimatrix -c blue -u 'Linux'"
PS1='[\u@\h \W]\$ '


eval "$(starship init bash)"

source ~/custom_commands/.my_custom_commands.sh

colorscript -e alpha
