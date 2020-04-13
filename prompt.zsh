# This prompt depends on `romkatv/gitstatus` to improve its performances.
# (it can work without it but will be slower).
# @see https://github.com/romkatv/gitstatus

# Make the prompt dynamic
setopt prompt_subst

local current_path="${0:A:h}"

# Source zsh port of __git_ps1.
source "$current_path/git_ps1.zsh"

# `gitstatus/gitstatus.plugin.sh` is an optional dependency.
# If it is available, that's nice: performances will be better.
source "$current_path/gitstatus/gitstatus.plugin.zsh" 2>/dev/null || export _DISABLE_GITSTATUS=true

# Regular Colors
_black_='\e[0;30m'
_red_='\e[0;31m'
_green_='\e[0;32m'
_yellow_='\e[0;33m'
_blue_='\e[0;34m'
_purple_='\e[0;35m'
_cyan_='\e[0;36m'
_white_='\e[0;37m'

# Bold
_bblack_='\e[1;30m'
_bred_='\e[1;31m'
_bgreen_='\e[1;32m'
_byellow_='\e[1;33m'
_bblue_='\e[1;34m'
_bpurple_='\e[1;35m'
_bcyan_='\e[1;36m'
_bwhite_='\e[1;37m'

# Underline
_ublack_='\e[4;30m'
_ured_='\e[4;31m'
_ugreen_='\e[4;32m'
_uyellow_='\e[4;33m'
_ublue_='\e[4;34m'
_upurple_='\e[4;35m'
_ucyan_='\e[4;36m'
_uwhite_='\e[4;37m'

# Background
_on_black_='\e[40m'
_on_red_='\e[41m'
_on_green_='\e[42m'
_on_yellow_='\e[43m'
_on_blue_='\e[44m'
_on_purple_='\e[45m'
_on_cyan_='\e[46m'
_on_white_='\e[47m'

# High Intensity
_iblack_='\e[0;90m'
_ired_='\e[0;91m'
_igreen_='\e[0;92m'
_iyellow_='\e[0;93m'
_iblue_='\e[0;94m'
_ipurple_='\e[0;95m'
_icyan_='\e[0;96m'
_iwhite_='\e[0;97m'

# Bold High Intensity
_biblack_='\e[1;90m'
_bired_='\e[1;91m'
_bigreen_='\e[1;92m'
_biyellow_='\e[1;93m'
_biblue_='\e[1;94m'
_bipurple_='\e[1;95m'
_bicyan_='\e[1;96m'
_biwhite_='\e[1;97m'

# High Intensity backgrounds
_on_iblack_='\e[0;100m'
_on_ired_='\e[0;30;101m'
_on_igreen_='\e[0;102m'
_on_iyellow_='\e[0;103m'
_on_iblue_='\e[0;104m'
_on_ipurple_='\e[10;95m'
_on_icyan_='\e[0;106m'
_on_iwhite_='\e[0;107m'

# Reset
_off_='\e[0m'

_on_debug() {
    if [ -n "$_PROMPT_DEBUG" ]; then
        >&2 $@
    fi
}

_init_node_prompt() {
    command -v node >/dev/null
    local is_node_available=$?

    if [ $is_node_available -eq 0 ]; then
        local node_version="$(node --version)"
        node_prompt="${_iblack_}[${node_version}, "

        if [ "$NODE_ENV" != 'development' ]; then
            node_prompt+="${_yellow_}${NODE_ENV}${_iblack_}"
        else
            node_prompt+="${NODE_ENV}"
        fi
        node_prompt+="]${_off_} "
    fi
}

_init_git_prompt() {

    # Use `romkatv/gitstatus` when available.
    if [[ -z "$_DISABLE_GITSTATUS" ]] && gitstatus_query PROMPT_STATUS_NAME 2>/dev/null && [[ "$VCS_STATUS_RESULT" == ok-sync ]]; then
        _on_debug echo 'Using `romkatv/gitstatus`! :)'

        local ahead_count="$VCS_STATUS_COMMITS_AHEAD"
        local behind_count="$VCS_STATUS_COMMITS_BEHIND"
        local staged_count="$VCS_STATUS_NUM_STAGED"
        local unstaged_count="$VCS_STATUS_NUM_UNSTAGED"
        local untracked_count="$VCS_STATUS_NUM_UNTRACKED"
        local unmerged_count="$VCS_STATUS_NUM_CONFLICTED"

        # See https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh to know more.

        if [[ "$git_dir" == *"/.git/modules"* ]]; then
            local submodule_indicator='submodule @ '
        fi

        if [ -f "$git_dir/MERGE_HEAD" ]; then
            local process='|MERGING'

        elif [ -f "$git_dir/REBASE_HEAD" ]; then
            if [ -d "$git_dir/rebase-apply" ]; then
                local stopped_sha="$(cat "$git_dir/rebase-apply/original-commit")"
                local current_step="$(cat "$git_dir/rebase-apply/next")"
                local last_step="$(cat "$git_dir/rebase-apply/last")"
                local rebased_branch="$(cat "$git_dir/rebase-apply/head-name" | cut -c 12-)"
                local new_base="$(cat "$git_dir/rebase-apply/onto")"
            else
                if [ -f "$git_dir/rebase-merge/interactive" ]; then
                    local rebase_option="i-"
                    local stopped_sha="$(cat "$git_dir/rebase-merge/stopped-sha")"
                else
                    local rebase_option="m-"
                    local stopped_sha="$(cat "$git_dir/rebase-merge/current")"
                fi
                local current_step="$(cat "$git_dir/rebase-merge/msgnum")"
                local last_step="$(cat "$git_dir/rebase-merge/end")"
                local rebased_branch="$(cat "$git_dir/rebase-merge/head-name" | cut -c 12-)"
                local new_base="$(cat "$git_dir/rebase-merge/onto")"
            fi
            local process="|${rebase_option}REBASING ${rebased_branch} on ${new_base:0:6}, picking ${stopped_sha:0:6} $current_step/$last_step"

        elif [ -f "$git_dir/CHERRY_PICK_HEAD" ]; then
            local process='|CHERRY-PICKING'

        elif [ -f "$git_dir/BISECT_LOG" ]; then
            local process='|BISECTING'

        elif [ -f "$git_dir/REVERT_HEAD" ]; then
            local process='|REVERTING'
        fi

        if [ -n "$VCS_STATUS_TAG" ]; then
            local zero_width_space='​'
            local prefixed_tag="# ${VCS_STATUS_TAG}"
        fi
        local repo_infos="${submodule_indicator}${VCS_STATUS_LOCAL_BRANCH:-${prefixed_tag:-${VCS_STATUS_COMMIT:0:6}…}}${process}"

    # Fallback on slower "git status".
    else
        _on_debug echo 'Fallbacking on git status. :('

        local git_status=$(git status --branch --untracked-files=all --porcelain)
        local unmerged_pattern='U.\|.U\|DD|AA'

        local ahead_count="$(printf -- "$git_status" | grep -o '\[ahead [[:digit:]]*' | grep -o '[[:digit:]]*')"
        ahead_count="${ahead_count:-0}"
        local behind_count="$(printf -- "$git_status" | grep -o 'behind [[:digit:]]*' | grep -o '[[:digit:]]*')"
        behind_count="${behind_count:-0}"
        local status_flags="$(printf -- "$git_status" | sed 's/^\(..\).*$/\1/')"
        local staged_count="$(printf -- "$status_flags" | grep -v "$unmerged_pattern" | grep -c '^[AMDR].')"
        local unstaged_count="$(printf -- "$status_flags" | grep -v "$unmerged_pattern" | grep -c '^.[AMD]')"
        local untracked_count="$(printf -- "$status_flags" | grep -c '??')"
        local unmerged_count="$(printf -- "$status_flags" | grep -c "$unmerged_pattern")"
        local repo_infos="$(__git_ps1 "%s")"
    fi
    _on_debug echo "Git status: $behind_count⇣ $ahead_count⇡ $staged_count+ $unstaged_count! $untracked_count? ${unmerged_count}x"
    local dirty_files_count="$(($staged_count + $unstaged_count + $untracked_count + $unmerged_count))"

    if [ "$dirty_files_count" -ne 0 ]; then
        local state_color="${_ired_}"
        local state_prefix='{'
        local state_suffix='}'
    else
        local state_color="${_green_}"
        local state_prefix='('
        local state_suffix=')'
    fi

    if [ "$behind_count" -ne 0 ]; then
        local behind_marker="⇣ "
    fi

    if [ "$ahead_count" -ne 0 ]; then
        local ahead_marker="⇡ "
    fi

    local repo_state="${state_color}${behind_marker}${state_prefix}${repo_infos}${state_suffix}${ahead_marker}${_off_}"

    local black_dot="${_iblack_}·${_off_}"
    local status_prompt=''
    # Staged.
    if [ "${staged_count}" -ne 0 ]; then
        status_prompt+="${_igreen_}${staged_count}${_off_}"
    fi
    # "·"
    if [ "${dirty_files_count}" -ne 0 ]; then
        status_prompt+="${black_dot}"
    fi
    # Unstaged.
    if [ "${unstaged_count}" -ne 0 ]; then
        status_prompt+="${_yellow_}${unstaged_count}${_off_}"
    fi
    # "·"
    if [ "${dirty_files_count}" -ne 0 ]; then
        status_prompt+="${black_dot}"
    fi
    # Untracked.
    if [ "${untracked_count}" -ne 0 ]; then
        status_prompt+="${_iblue_}${untracked_count}${_off_}"
    fi
    # Unmerged.
    if [ "${unmerged_count}" -ne 0 ]; then
        status_prompt+="${black_dot}${_on_ired_}${unmerged_count}${_off_}"
    fi
    # " "
    if [ "${dirty_files_count}" -ne 0 ]; then
        status_prompt+=" "
    fi

    # Specific to my workflow.
    # Adds an indicator if the latest commit is a temporary one (ctmp alias).
    local latest_commit_msg="$(git log --oneline --format=%B -n 1 HEAD -- 2> /dev/null | head -n 1)"
    if [ "$latest_commit_msg" = "[DON’T MERGE] Temporary commit" ]; then
        local tmp_commit_indicator="${_ipurple_} ⭑${_off_}"
    fi

    git_prompt="${repo_state}${tmp_commit_indicator} ${status_prompt}"
}

_get_prompt() {
    local git_dir="$(git rev-parse --git-dir 2>/dev/null)"

    # Date
    local hour="${_iblack_}$(date +"%H:%M:%S")${_off_}"

    # Path
    local _path="%~"

    # Status
    if [ $_cmd_status -eq 130 ]; then
        local status_indicator="${_iyellow_}✕${_off_} "
    elif [ $_cmd_status -ne 0 ]; then
        local status_indicator="${_ired_}✕${_off_} "
    fi

    _init_node_prompt

    if [ -n "$git_dir" ]; then
        _init_git_prompt
        local path_prompt="${_iyellow_}${_path}${_off_}"
    else
        local path_prompt="${_yellow_}${_path}${_off_}"
    fi

    echo -e "${hour} ${git_prompt}${path_prompt} ${node_prompt}${status_indicator}\n\$ "
}

# Restart the gitstatus daemon.
# See https://github.com/romkatv/gitstatus/blob/9bbf75b0a89c8e78b80a29e31e010ce45a791e8c/gitstatus.plugin.zsh
if command -v gitstatus_stop >/dev/null; then
    gitstatus_stop PROMPT_STATUS_NAME && gitstatus_start -s -1 -u -1 -d -1 -c -1 -e PROMPT_STATUS_NAME
fi

_debuggable_prompt() {
    # Get status early, before the first command.
    _cmd_status=$?
    _get_prompt
}

PS1='$(_debuggable_prompt)'
