# homebrew installed
if test -d /opt/homebrew; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

VIM="nvim"

export GIT_EDITOR=$VIM
export EDITOR=$VIM
export DOTFILES=$HOME/.dotfiles

# Add things to PATH, check before doing so
PATHS_TO_ADD=("$HOME/.cargo/bin" \
  "$HOME/.local/share/bob/nvim-bin")

for path_to_add in "${PATHS_TO_ADD[@]}"
do
  if test -d $path_to_add; then
    real_path=$(realpath "$path_to_add")
    [[ ":$PATH:" != *":$real_path:"* ]] && PATH="$real_path:${PATH}"
  fi
done
