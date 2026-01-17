function fish_right_prompt
    # Only display venv prompt if in a login shell, and save it so it
    # does not have to be fetched
    set -q VIRTUAL_ENV_DISABLE_PROMPT
    or set -g VIRTUAL_ENV_DISABLE_PROMPT true
    set -q VIRTUAL_ENV
    and set -l venv (string replace -r '.*/' '' -- "$VIRTUAL_ENV")

    # Command duration
    set -l duration "$cmd_duration$CMD_DURATION"
    if test $duration -gt 100
        set duration (math $duration / 1000)s
    else
        set duration
    end

    # Git prompt config
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showupstream informative
    set -g __fish_git_prompt_showcolorhints 1
    set -g __fish_git_prompt_use_informative_chars 1
    set -g __fish_git_prompt_char_dirtystate "!"
    set -g __fish_git_prompt_char_untrackedfiles "?"
    set -g __fish_git_prompt_shorten_branch_len (math "floor($COLUMNS * 0.2)") # Based on width

    # The git prompt's default format is ' (%s)'.
    # We don't want the leading space.
    set -l git (fish_vcs_prompt '(%s)' 2>/dev/null)

    # Current data and time
    set -l date (set_color brgrey)(date "+%R")(set_color normal)

    set_color normal
    string join " " -- $venv $duration $git $date
end
