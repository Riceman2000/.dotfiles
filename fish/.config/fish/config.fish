
if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -d /opt/homebrew
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end

    # Default editors
    set VIM nvim
    export GIT_EDITOR=$VIM
    export EDITOR=$VIM

    export DOTFILES=$HOME/.dotfiles

    # Fix some SSH sessions with older OSes that dont support ghostty
    export TERM=xterm-256color

    aliases # Loads all alias functions
end

# Overrides the default MOTD
function fish_greeting
    echo The time is (set_color yellow; date +%T; set_color normal) and this machine\'s hostname is (set_color yellow; echo $hostname; set_color normal)
    neofetch
end
