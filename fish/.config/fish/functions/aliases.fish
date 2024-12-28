# Files are loaded by name, if a matching function does not exist the file will not be loaded
function aliases; end

# Rust utils
function ls --wraps='eza' --description 'alias ll eza'
  eza $argv
end
function ll --wraps='eza -lhag' --description 'alias ll eza -lhag'
  eza -lhag $argv
        
end
function cat --wraps=bat --description 'alias cat bat'
  bat $argv
        
end
function du --wraps=dust --description 'alias du dust'
  dust $argv
        
end
function du1 --wraps='dust -d=1' --description 'alias du1 dust -d=1'
  dust -d=1 $argv
        
end
function ai --wraps=aichat --description 'alias ai aichat'
  aichat $argv
        
end

# Skim - fuzzy finding
export SKIM_DEFAULT_COMMAND="fd --type file --hidden --follow --exclude .git --color=always"
export SKIM_DEFAULT_OPTIONS="--ansi"

function bsk --wraps=sk\ --bind\ \'enter:execute\(bat\ \{\}\)+abort\'\ \|\|\ true --description alias\ bsk=sk\ --bind\ \'enter:execute\(bat\ \{\}\)+abort\'\ \|\|\ true
  sk --bind 'enter:execute(bat {})+abort' || true $argv
        
end
function rsk --wraps=sk\ -i\ -c\ \'rg\ --hidden\ --color=always\ --line-number\ \{\}\'\ --preview\ \'\~/scripts/preview.sh\ \{\}\' --description alias\ rsk\ sk\ -i\ -c\ \'rg\ --hidden\ --color=always\ --line-number\ \{\}\'\ --preview\ \'\~/scripts/preview.sh\ \{\}\'
  sk -i -c 'rg --hidden --color=always --line-number {}' --preview '~/scripts/preview.sh {}' $argv
        
end
function rvsk --wraps=rsk\ \|\ awk\ -F:\ \'\{print\ \$1\ \"\ +\"\ \$2\}\'\ \|\ xargs\ nvim --description alias\ rvsk=rsk\ \|\ awk\ -F:\ \'\{print\ \$1\ \"\ +\"\ \$2\}\'\ \|\ xargs\ nvim
  rsk | awk -F: '{print $1 " +" $2}' | xargs nvim $argv
        
end
function vsk --wraps=sk\ --bind\ \'enter:execute\(nvim\ \{\}\)+abort\'\ \|\|\ true --description alias\ vsk=sk\ --bind\ \'enter:execute\(nvim\ \{\}\)+abort\'\ \|\|\ true
  sk --bind 'enter:execute(nvim {})+abort' || true $argv
        
end


# Git
function fap --wraps='git fetch && git pull' --description 'alias fap=git fetch && git pull'
  git fetch && git pull $argv
        
end
function gp --wraps='git push' --description 'alias gp git push'
  git push $argv
        
end
function gs --wraps='git status' --description 'alias gs git status'
  git status $argv
        
end

# General
function c --wraps=clear --description 'alias c clear'
  clear $argv
        
end
function wt --wraps=curl --description 'alias wt curl wttr.in'
  curl wttr.in $argv
        
end
