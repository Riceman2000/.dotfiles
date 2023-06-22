# -=-=-=-=-=-=-=-=-=-=-=-=-=- Misc -=-=-=-=-=-=-=-=-=-=-=-=-=-

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Aliases -=-=-=-=-=-=-=-=-=-=-=-=-=-
# Rust stuff
alias ls="exa"
alias ll="exa -lha"
alias du="dust -d=2"
alias cat="bat"
alias ai="aichat"
# General
alias c="clear"
# Backups
alias ls_="ls"
alias du_="du"
alias cat_="cat"

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Suffixes -=-=-=-=-=-=-=-=-=-=-=-=-=-
# Rust
alias -s {rs,toml,lock}=neovide
#C/C++
alias -s {c,cpp,cxx,cc}=neovide
#Text
alias -s {txt,md,log}=neovide

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Prompt -=-=-=-=-=-=-=-=-=-=-=-=-=-
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Autocomplete for Zellij -=-=-=-=-=-=-=-=-=-=-=-=-=-
if command -v zellij >/dev/null 2>&1; then
  zellij setup --generate-completion zsh > ~/.zsh_zellij
  source ~/.zsh_zellij
  autoload -Uz compinit && compinit
fi
