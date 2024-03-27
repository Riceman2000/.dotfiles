{ pkgs, rustPlatform, fetchFromGithub, lib, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages to install
  environment.systemPackages = with pkgs; [
    # Text editing
    vim
    neovim
    aichat
    # Dev
    gcc
    cargo
    rustup
    gitFull
    python3
    libclang
    clang-tools
    # Hardware testing 
    htop
    pciutils
    memtest86plus
    # LSP
    rust-analyzer
    lua-language-server
    nodePackages.pyright
    nodePackages.bash-language-server
    # Cargo plugins
    cargo-audit
    cargo-update
    # Console tools
    fd
    zsh
    bat
    eza
    tmux
    stow
    skim
    gitui
    zellij
    du-dust
    ripgrep
    tealdeer
    # Core util
    curl
    wget
    nurl
    unzip
    cmake
    gnumake
    # Gui
    kitty
    discord
    steam
    steam-run
  ];
}
