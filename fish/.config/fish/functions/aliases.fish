# Files are loaded by name, if a matching function does not exist the file will not be loaded
function aliases; end

# Replace ".." with "cd .." but if you add dots it goes up more dirs
function repeat_cd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function repeat_cd

# !! returns the last command ran
abbr -a !! --position anywhere $history[1]

# Rust utils
abbr -a ls "eza"
abbr -a ll "eza -lhag"
abbr -a cat "bat"
abbr -a du "dust"
abbr -a du1 "dust -d=1"
abbr -a ai "aichat"

# Skim - fuzzy finding
export SKIM_DEFAULT_COMMAND="fd --type file --hidden --follow --exclude .git --color=always"
export SKIM_DEFAULT_OPTIONS="--ansi"

alias rsk "sk -i -c 'rg --hidden --color=always --line-number {}' --preview '~/scripts/preview.sh {}'" # Because this is used later it needs to be an alias
abbr -a rvsk "rsk | awk -F: '{print \$1 \" +\" \$2}' | xargs nvim" 
abbr -a bsk "sk --bind 'enter:execute(bat {})+abort' || true"
abbr -a vsk "sk --bind 'enter:execute(nvim {})+abort' || true"

# Git
abbr -a fap "git fetch && git pull"
abbr -a gp "git push"
abbr -a gs "git status"
abbr -a gi "gitui"

# General
abbr -a c "clear"
abbr -a wt "curl wttr.in"
