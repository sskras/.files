# SPDX-License-Identifier: BlueOak-1.0.0
# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras

echo "Executing ${HOME}/.bashrc" >&2

# Executed for Bash sessions.
#
# Primarily targets non-login interactive ones (Eg. new tab & SCP/SFTP connections).
# But I am going to execute it for login Bash sessions too (via `.profile`).


# TODO: In case I need to update settings for Bourne/sh-compatible shells
# from a separate file (esp. for non-login int. sessions) too, I will need to:
#
# - export the thing in `.profile`:
#
#     ENV=/home/sskras/.shrc
#     export ENV
#
# - source file here, from `.bashrc` in case it is being executed via `.profile`:
#
#     . ${ENV}
#
# - add a protection / fix invocation logic so `.shrc` gets sourced only once.
#   (In case `.bashrc` starts being sourced for `sh` too via `.profile`)
#
# - decide what to do for non-interactive & non-login sessions w/o `.profile`,
#   Eg. `ssh host cmd` or simply running a script.
#
# - maybe get protection similar to one used in `.profile`,
#   Eg. `[ -n "$BASH_VERSION" ]`
#
# - consider alternative name if it's going to be shell-flavor independent,
#   Eg. `.shinit`

# TODO: Stop using the following version:
. "${HOME}/.config/unlicensed/.bashrc.Ubuntu-20.04.2-LTS-(Focal-Fossa)"

# TODO: Import useful pieces below from all the collected versions like above.
# Unified, cross-platform .bahrc:

# TODO: Unify Bash prompt coloring between Ubuntu and MSYS2:
# - on MSYS_NT-10.0-19044 3.4.6.x86_64 the Ubuntu .bashrc makes it black-n-white

# Functions
#
# Load them from the separate file:
[ -f "${HOME}/.bash_functions" ] && . "${HOME}/.bash_functions"
