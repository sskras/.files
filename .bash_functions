# SPDX-License-Identifier: BlueOak-1.0.0
# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras

echo "Executing ${HOME}/.bash_functions" >&2

# User's Bash functions in one place.

DIR_SESSIONS="${HOME}/debug/session-logs"


home()  # Fn to manage home directory
{
    case "$1" in
        (uninstall)
            echo "Going to uninstall tracked dot-files (and the whole repo)."
            echo
            echo "If you want to cancel, issuing Ctrl-C is advised."
            echo "To proceed just press Enter."
            read
            make -C "${HOME}/.local" uninstall
            ;;
        (*)
            /usr/bin/git --git-dir=${HOME}/.files.git --work-tree=${HOME} "$@"
            ;;
    esac
    # Via: https://www.atlassian.com/git/tutorials/dotfiles#installing-git-lfs
}

log()
{
    pushd "${DIR_SESSIONS}" || return 1

    SESSION="$( date +%Y-%m-%d-%H%M )__$( echo $* | sed -e 's/ /-/g' -e 's/[%?/\:*]/_/g' )"
    # TODO:
    # - add fns like `mkbuf`, `rmbuf` into `.shrc` or `.bashr`;
    # - refactor path transformation into two readable lines:
    #     mkbuf BUFF
    #     echo $* | sed ... > $BUFF
    #     read SESSIOS < $BUFF
    # - add cleanup via `trap` or maybe just at EOF.

    if [ ! -f "$SESSION.script" ]; then
        script --timing="$SESSION.timing" "$SESSION.script" || \
        # TODO report `script` bug:
        #
        # script: cannot open a/b: No such file or directory
        # exit code: 0
        #
        # `script` returns 0 after failure.
        printf "\n! ERROR !    Capture failed, the output might be damaged\n" >&2

        # TODO report `script` bug #2:
        #
        # Script started, file is sveiki gyvi.script
        # sskras@server-5aef8ee:/run/lock$ id
        # uid=1001(sskras) gid=1001(sskras) groups=1001(sskras)
        # sskras@server-5aef8ee:/run/lock$ exit
        # Script done, file is sveiki gyvi.script
        # script: write failed: sveiki gyvi.timing: No space left on device
        #
        # `script` indicates of no space too late, on exit.
    else
        printf "\n! ERROR !    Script \"$SESSION.script\" exists already\n" >&2
        return 1
    fi

    popd
}


gi ()  # Clones git repo into an appropriate subdir tree
       # Eg: https://github.com/NetBSD/pkgsrc.git => ./github.com/NetBSD/pkgsrc.git
{
    #[ "$1" = "clone" ] || return 1

    GIT_URL="$1"
    SUBDIR="${GIT_URL/https:\/\//}"

    mkdir -pv "${SUBDIR}"
    cd "${SUBDIR}"
    git clone "${GIT_URL}" .
}
