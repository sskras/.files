# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras
# SPDX-License-Identifier: BlueOak-1.0.0

echo "Executing ${HOME}/.bashrc" >/dev/stderr

# Executed for Bash sessions.
#
# Primarily targets non-login interactive ones (Eg. SCP/SFTP connections).
# But I am going to execute it for login Bash sessions too (via `.profile`).

# TODO: Stop using the following version:
. ".config/unlicensed/.bashrc.Ubuntu-20.04.2-LTS-(Focal-Fossa)"

# TODO: Import useful pieces below from all the collected versions like above.
# Unified, cross-platform .bahrc:

# TODO: Unify Bash prompt coloring between Ubuntu and MSYS2:
# - on MSYS_NT-10.0-19044 3.4.6.x86_64 the Ubuntu .bashrc makes it black-n-white

# Functions
#
# Load them from the separate file:
[ -f "${HOME}/.bash_functions" ] && . "${HOME}/.bash_functions"
