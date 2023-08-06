# -=-=-=-=-=-=-=-=-=-=-=-=-=- Instant Prompt from p10k -=-=-=-=-=-=-=-=-=-=-=-=-=-
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
# Backups
alias ls_="ls"
alias du_="du"
alias cat_="cat"

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Suffixes -=-=-=-=-=-=-=-=-=-=-=-=-=-
# Rust
alias -s {rs,toml,lock}=nvim
#C/C++
alias -s {c,cpp,cxx,cc}=nvim
#Text
alias -s {txt,md,log}=nvim

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Backup prompt -=-=-=-=-=-=-=-=-=-=-=-=-=-
# This will only be used if p10k isnt loaded properly
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{yellow}%*%f %F{cyan}%~%f %F{red}%B${vcs_info_msg_0_}%f%b$ '

# -=-=-=-=-=-=-=-=-=-=-=-=-=- zr plugin manager -=-=-=-=-=-=-=-=-=-=-=-=-=-
# Generate new zsh file from zr if it does not exist or if ~/.zshrc has been changed
ZR_FILE=$HOME"/.zr_zsh"
if [[ ! -f $ZR_FILE ]] || [[ ~/.zshrc -nt $ZR_FILE ]]; then
  zr \
    zsh-users/zsh-autosuggestions \
    romkatv/powerlevel10k.git/powerlevel10k.zsh-theme \
    > $ZR_FILE
fi
source $ZR_FILE

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Load auto-complete -=-=-=-=-=-=-=-=-=-=-=-=-=-
autoload -Uz compinit && compinit

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Load p10k prompt -=-=-=-=-=-=-=-=-=-=-=-=-=-
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
