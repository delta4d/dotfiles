#-----------------------------
# autoload settings
#-----------------------------
autoload -Uz compinit vcs_info colors

#-----------------------------
# autocompletion settings
#-----------------------------

compinit

# autocompletion with an arrow-key driven interface
zstyle ':compinit:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%Bmomo, no matches for: %d%b'

# autocompletion of command line switches for aliases
setopt completealiases

# command correction
setopt correctall

#-----------------------------
# history settings
#-----------------------------

export HISTSIZE=1024
export HISTFILE="$HOME/.history"

# history won't be saved without this line
export SAVEHIST=$HISTSIZE

# ignore of duplicates
setopt hist_ignore_all_dups

# prevent particular entry from being recorded
setopt hist_ignore_space

#-----------------------------
# alias
#-----------------------------
alias ls='ls --color=auto -F'
alias grep='grep --color=auto'
alias l='ls -l'
alias la='ls -a'
alias ll='ls -la'
alias lh='ls -lh'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias sai='sudo apt-get install'
alias aps='aptitude search'


#-----------------------------
# git info settings
#-----------------------------

setopt prompt_subst
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

#-----------------------------
# customize prompt
#-----------------------------

colors
# load color aliases
blue="%{${fg[blue]}%}"
BLUE="%{${fg_bold[blue]}%}"
red="%{${fg[red]}%}"
RED="%{${fg_bold[red]}%}"
green="%{${fg[green]}%}"
GREEN="%{${fg_bold[green]}%}"
cyan="%{${fg[cyan]}%}"
CYAN="%{${fg_bold[cyan]}%}"
magenta="%{${fg[magenta]}%}"
MAGENTA="%{${fg_bold[magenta]}%}"
yellow="%{${fg[yellow]}%}"
YELLOW="%{${fg_bold[yellow]}%}"
white="%{${fg[white]}%}"
WHITE="%{${fg_bold[white]}%}"
NO_COLOR="%{${reset_color}%}"

vcs_info_wrapper() {
	vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && echo -n "${vcs_info_msg_0_}"
}

PROMPT="$GREEN%n@%M $BLUE%~ $ $NO_COLOR"
RPROMPT='$(vcs_info_wrapper) %?'

# vim: ts=4
