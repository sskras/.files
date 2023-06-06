# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras
# SPDX-License-Identifier: BlueOak-1.0.0

echo "Executing ${HOME}/.bash_functions" > /dev/stderr

# User's Bash functions in one place.

log()
{
    SESSION="$*"
    SESSION="${SESSION// /-}"
    SESSION="${SESSION//[%?\/\\:*]/_}"

    if [ ! -f "$SESSION.script" ]; then
        script --timing="$SESSION.timing" "$SESSION.script" || \
        # TODO report `script` bug:
        #
        # script: cannot open a/b: No such file or directory
        # exit code: 0
        #
        # `script` returns 0 after failure.
        printf "\n! ERROR !    Capture failed, the output might be damaged\n" > /dev/stderr

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
        printf "\n! ERROR !    Script \"$SESSION.script\" exists already\n" > /dev/stderr
        return 1
    fi
}
