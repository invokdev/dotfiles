#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Neofetch on terminal start
neofetch

# git bare repository alias
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 
