# Make emacsclient spawn a new emacs daemon if one doesn't exist yet
export ALTERNATE_EDITOR=''

# Make emacsclient the default editor
export EDITOR='emacsclient -c'

if [[ -r ~/.zshenv-local ]]; then
    source ~/.zshenv-local
fi

path=(~/bin ~/scripts $path)

export DEBEMAIL="goedson@debian.org"
export DEBFULLNAME="Goedson Teixeira Paixao"
