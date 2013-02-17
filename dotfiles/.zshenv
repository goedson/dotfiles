# Make emacsclient spawn a new emacs daemon if one doesn't exist yet
export ALTERNATE_EDITOR=''

# Make emacsclient the default editor
export EDITOR='emacsclient -c'

if [[ -r ~/.zshenv-local ]]; then
    source ~/.zshenv-local
fi
