#-*- mode: shell-script -*-
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt autocd
setopt extended_glob

# Ignore duplicates in history
setopt hist_ignore_all_dups

# write every new command to history before it is executed
setopt inc_append_history

# Reread history file every time history is needed
setopt share_history

# Reduce sequences of spaces to one space in history
setopt hist_reduce_blanks

# Save time and elapsed time of commands in history
setopt extended_history

# confirm execution of commands when using bang history
setopt hist_verify

# Enable command and variable substitutions in the prompt
setopt prompt_subst

# If ~/.zsh/functions exists, add it to fpath
if [[ -d ~/.zsh/functions ]]; then
    fpath=(~/.zsh/functions $fpath)
fi

# Emacs style keybindings
bindkey -e

autoload -Uz compinit
compinit

# Some completion style settings (copied from default ubuntu configuration)
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#Remove '/' from WORDCHARS, so we can use C-w to erase path components
WORDCHARS="${WORDCHARS:s#/#}"

#Setup associative arrays with colors for use in prompt definition
autoload -Uz colors
colors

PROMPT="%{${fg[yellow]}%}[%T] %{${fg[blue]}%}%m%{${fg[default]}%}:%{${fg[green]}%}%~ %B%#%b "

# Add VCS repository info to right prompt
# This assumes the code from https://github.com/goedson/zsh-git-prompt.git
# is cloned at ~/.zsh/zsh-vcs-prompt
source ~/.zsh/zsh-vcs-prompt/zshrc.sh
RPROMPT='$(vcs_super_info)'

# Make emacsclient spawn a new emacs daemon if one doesn't exist yet
export ALTERNATE_EDITOR=''

# Make emacsclient the default editor
export EDITOR='emacsclient -c'

# Define all aliases in ~/.aliases
if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

if [[ -f ~/.zshrc_local ]]; then
    source ~/.zshrc-local
fi
