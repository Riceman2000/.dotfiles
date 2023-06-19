# homebrew installed
eval "$(/opt/homebrew/bin/brew shellenv)"

VIM="nvim"

export GIT_EDITOR=$VIM
export DOTFILES=$HOME/.dotfiles

# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH
