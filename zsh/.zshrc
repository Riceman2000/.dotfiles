# -=-=-=-=-=-=-=-=-=-=-=-=-=- Misc -=-=-=-=-=-=-=-=-=-=-=-=-=-
# sccache to speed up Rust build times
export RUSTC_WRAPPER=sccache

# -=-=-=-=-=-=-=-=-=-=-=-=-=- Aliases -=-=-=-=-=-=-=-=-=-=-=-=-=-
# Rust stuff
alias ls="exa"
alias ll="exa -lha"
alias du="dust -d=2"
alias cat="bat"
alias ai="aichat"
# General
alias c="clear"


# -=-=-=-=-=-=-=-=-=-=-=-=-=- Suffixes -=-=-=-=-=-=-=-=-=-=-=-=-=-
# Rust
alias -s {rs,toml,lock}=neovide
#C/C++
alias -s {c,cpp,cxx,cc}=neovide
#Text
alias -s {txt,md,log}=neovide
