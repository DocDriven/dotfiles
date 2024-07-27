#!/bin/zsh

# Loaded regardless of session type

# Delay init of autocomplete until later
skip_global_compinit=1

# Set directories to avoid cluttering home dir
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Using .zprofile to set environment variables for non-login, non-interactive shells
# Normally, .zprofile is only sourced for login shells, i.e. if run remotely via ssh
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

