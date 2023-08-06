# -=-=-=-=-=-=-=-=-=-=-=-=-=- Aliases -=-=-=-=-=-=-=-=-=-=-=-=-=-
# Rust stuff
alias ls="exa"
alias ll="exa -lha"
alias du="dust -d=2"
alias cat="bat"
alias ai="aichat"
# fzf
alias fv="fzf --bind 'enter:become(nvim {})'"
# General
alias c="clear"

# -=-=-=-=-=-=-=-=-=-=-=-=-=- fzf (fuzzy finder) -=-=-=-=-=-=-=-=-=-=-=-=-=-
export FZF_DEFAULT_COMMAND="fd --type file --hidden --follow --exclude .git --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

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
# -=-=-=-=-=-=-=-=-=-=-=-=-=- Load auto-complete -=-=-=-=-=-=-=-=-=-=-=-=-=-
autoload -Uz compinit && compinit
