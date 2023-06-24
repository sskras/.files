# SPDX-License-Identifier: BlueOak-1.0.0
# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras

echo "Executing ${HOME}/.bash_aliases" > /dev/stderr

# User's aliases in one place.

# Via: https://www.atlassian.com/git/tutorials/dotfiles#installing-git-lfs
alias home='/usr/bin/git --git-dir=${HOME}/.files.git --work-tree=${HOME}'
