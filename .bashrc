# ~/.bashrc: executed by an bash for non-login shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt customization
source /usr/share/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE="true"

PS1='\n\[$(tput sgr0; tput bold; tput setaf 2)\]\W\[$(tput sgr0; tput dim)\] $(__git_ps1 "(%s)")\$\[$(tput sgr0)\] '

# show user and host if over ssh
[ -n "$SSH_CONNECTION" ] && PS1="\n\u@\h ${PS1:2}"

# shell optimization
shopt -s dotglob
shopt -s globstar

set -o noclobber

# history settings
shopt -s cmdhist
shopt -s histappend
HISTIGNORE="&:[ ]*:exit:bg:fg:history:clear:pwd"
HISTCONTROL=ignoreboth:erasedups

# Aliases

# dotfile management
alias dotfile="git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME"

# verbosity and safety
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	mkdir="mkdir -pv" \
	ffmpeg="ffmpeg -hide_banner" \
    ffprobe="ffprobe -hide_banner" \
    bc="bc -ql"

# colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep -I --color=auto --exclude=.git" \
	diff="diff --color=auto" \
    less="less -R"

# abbreviations
alias \
	la="ls -a" \
	ll="ls -la" \
	l.="ls -A | egrep '^\.'" \
	update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg" \
	pksyua="yay -Syu --noconfirm"

# youtube-dl aliases
alias ytv-best="youtube-dl -f bestvideo+bestaudio "
alias yta-best="youtube-dl --extract-audio --audio-format best "

# Others

server() {
    python -m http.server ${2:-8080} --directory ${1:-.}
}

cheat.sh() {
    curl -s "cheat.sh/${*// /+}" | less -R
}

archman() {
    curl -s -L https://man.archlinux.org/man/${1:?1 parameter required}.raw | man -l -
}
