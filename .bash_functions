# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras
# SPDX-License-Identifier: BlueOak-1.0.0

echo "Executing ${HOME}/.bash_functions" > /dev/stderr

# User's Bash functions in one place.

log()
{
    echo "Logging session: $*"
    script --timing=log.timing log.script
}
