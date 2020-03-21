#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

HISTSIZE=5000

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# https://www.atlassian.com/git/tutorials/dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'

export EDITOR=vim
export BROWSER=firefox
#export MYSQL_FILES_DIR=/var/lib/mysql-files/
#alias mystart='sudo systemctl start mysql'
#alias mystop='sudo systemctl stop mysql'
#alias mystatus='systemctl status mysql.service'

