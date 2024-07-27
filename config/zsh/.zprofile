#!/bin/zsh

# Loaded after .zshenv  before .zshrc for login shells
# Customized to also load for non-login shells by sourcing it in .zshenv

export K_DOTFILES_DIR="${HOME}/.dotfiles"
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"

# Default programs
export BROWSER="brave"
export TERM="st"
export PAGER="less"

if >/dev/null 2>&1 command -v nvim ; then
  export EDITOR="nvim"
  nvim -es +'exe !has("nvim-0.3.2")."cq"' && export MANPAGER="nvim +Man!"
elif >/dev/null 2>&1 command -v vim ; then
  export EDITOR="vim"
else
  export EDITOR="vi"
fi
export VISUAL="${EDITOR}"

# Prefer US English and use UTF-8
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Use local ranger config only
export RANGER_LOAD_DEFAULT_RC=false

# Ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path

# Set the list of dirs that zsh searches for programs
path=(
  /usr/local/{bin,sbin}
  $HOME/.local/bin
  $K_DOTFILES_DIR/dotbot/bin
  $path
)

# Hide % at end of prompt
export PROMPT_EOL_MARK=''

# Remove space before prompt
unsetopt PROMPT_SP

# Set default Less options.
# Mouse-wheel scrolling is enabled, disable it by adding -X -F
export LESS='-g -i -M -R -S -w -z-4'

# Set the Less input preprocessor
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Use buildkit for docker
export DOCKER_BUILDKIT=1

# Start the window manager if attached to tty1
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
