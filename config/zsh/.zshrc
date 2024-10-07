# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Enable color and change prompt
autoload -U colors && colors
zstyle ':vcs_info:git:*' formats " %F{165}%b"
setopt PROMPT_SUBST
PS1='%B%F{5}[%F{4}%n%F{6}@%F{15}%M %F{6}%~${vcs_info_msg_0_}%F{5}] %F{138}>%{$reset_color%} '

# Autochange w/o cd, disable terminal freeze, and allow comments in shell sessions
setopt autocd
stty stop undef
setopt interactive_comments

# History configuration
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000000000
SAVEHIST=1000000000
setopt BANG_HIST EXTENDED_HISTORY INC_APPEND_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS HIST_REDUCE_BLANKS

# Load aliases and shortcuts
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliasrc"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/shortcutrc"

# Autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"
zmodload zsh/complist
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-${ZSH_VERSION}"
_comp_options+=(globdots)

# Vi mode key bindings
bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Enable fuzzy finder fzf
source <(fzf --zsh)

# Cursor shapes for vi modes
# function zle-keymap-select () {
#   case $KEYMAP in
#     vicmd) echo -ne '/e[1';;
#     viins|main) echo -ne '/e[5 q'
#   esac
# }
# zle -N zle-keymap-select
# zle-line-init() {
#   zle -K viins
#   echo -ne "/e[5 q"
# }
# zle -N zle-line-init
# echo -ne '/e[5 q'
# preexec() { echo -ne '/e[5 q' ;}
