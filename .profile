# ~/.profile: executed by the command interpreter for login shells.

[ -n "$BASH_VERSION" ] && [ -f ~/.bashrc ] && . ~/.bashrc

[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin/"

# Default programs
export EDITOR="vim"
export VISUAL="vim"

# Default locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Keeping the home directory clean
export HISTFILE="${XDG_DATA_HOME}/history"
export ICEAUTHORITY="${XDG_CACHE_HOME}/ICEauthority"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME}/wgetrc"
export WINEPREFIX="${XDG_DATA_HOME}/wineprefixes/default"
export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"

# If connected through ssh, use tmux
if [ -n "$SSH_CONNECTION" ] && [ $(command -v tmux) ] && [ -z "$TMUX" ]; then
    exec tmux new-session -A -s ssh
fi
