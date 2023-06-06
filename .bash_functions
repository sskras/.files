# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras
# SPDX-License-Identifier: BlueOak-1.0.0

echo "Executing ${HOME}/.bash_functions" > /dev/stderr

# User's Bash functions in one place.

log()
{
    SESSION="$*"

    if [ ! -f "$SESSION.script" ]; then
        script --timing="$SESSION.timing" "$SESSION.script" || \
        printf "\n! ERROR !    Capture failed, the output might be damaged\n" > /dev/stderr
    else
        printf "\n! ERROR !    Script \"$SESSION.script\" exists already\n" > /dev/stderr
        return 1
    fi
}
