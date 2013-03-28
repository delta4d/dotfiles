# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

PATH=$PATH:$HOME/bin:$HOME/bin/handy # Add home bin path
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias l='ls -la'
alias lh='ls -lh'
#alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias bye='exit'
alias ..="source $HOME/bin/handy/up"

export PATH
export EDITOR=vim

unset RUBYOPT
