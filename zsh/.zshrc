# -=-=-=-=-=-=-=-=-=-=-=-=-=- Aliases -=-=-=-=-=-=-=-=-=-=-=-=-=-
# Rust stuff
alias ls="eza"
alias ll="eza -lha"
alias du="dust"
alias du1="dust -d=1"
alias cat="bat"
alias ai="aichat"
# sk
alias rsk="sk -i -c 'rg --hidden --color=always --line-number "{}"' --preview '~/scripts/preview.sh {}'"
alias vsk="sk --bind 'enter:execute(nvim {})+abort' || true"
alias bsk="sk --bind 'enter:execute(bat {})+abort' || true"
# Git
alias fap="git fetch && git pull"
alias gp="git push"
alias gs="git status"
# General
alias c="clear"

# -=-=-=-=-=-=-=-=-=-=-=-=-=- skim (fuzzy finder) -=-=-=-=-=-=-=-=-=-=-=-=-=-
export SKIM_DEFAULT_COMMAND="fd --type file --hidden --follow --exclude .git --color=always"
export SKIM_DEFAULT_OPTIONS="--ansi"

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Suffixes -=-=-=-=-=-=-=-=-=-=-=-=-=-
# Rust
alias -s {rs,toml,lock}=nvim
#C/C++
alias -s {c,cpp,cxx,cc,h,hh,hpp}=nvim
#Text
alias -s {txt,md,MD,log}=nvim

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Backup Prompt -=-=-=-=-=-=-=-=-=-=-=-=-=-
# This prompt will only load if agkozak doesnt load properly
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{yellow}%m::%*%f %F{cyan}%~%f %F{red}%B${vcs_info_msg_0_}%f%b$ '

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Agkozak Prompt -=-=-=-=-=-=-=-=-=-=-=-=-=-
AGKOZAK_MULTILINE=0

# -=-=-=-=-=-=-=-=-=-=-=-=-=- zr plugin manager -=-=-=-=-=-=-=-=-=-=-=-=-=-
# Generate new zsh file from zr if it does not exist or if ~/.zshrc has been changed
ZR_FILE=$HOME"/.zr_zsh"
if (( $+commands[zr] )) && [[ ! -f $ZR_FILE ]] || [[ ~/.zshrc -nt $ZR_FILE ]]; then
  zr \
    zsh-users/zsh-autosuggestions \
    agkozak/agkozak-zsh-prompt \
    zsh-users/zsh-syntax-highlighting \
    > $ZR_FILE
fi

if [[ -f $ZR_FILE ]]; then
  source $ZR_FILE
else
  echo "ZR plugin manager not active"
fi

# -=-=-=-=-=-=-=-=-=-=-=-=-=- zoxide -=-=-=-=-=-=-=-=-=-=-=-=-=-
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh --cmd cd)"
else
  echo "Zoxide not active"
fi

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Load auto-complete -=-=-=-=-=-=-=-=-=-=-=-=-=-
autoload -Uz compinit && compinit

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Show neofetch -=-=-=-=-=-=-=-=-=-=-=-=-=-
neofetch
