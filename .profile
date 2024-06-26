# SPDX-License-Identifier: BlueOak-1.0.0
# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras

#echo   # TODO: Would be nice to print this line only then logging in via SSH, but skip in the case of `--login`.
echo "Executing ${HOME}/.profile" >&2

# Executed for login sessions by Bourne/sh-compatible shells.

# Eg:
# - `zsh` only reads it in sh/ksh-compat mode
# - `csh` and `tcsh` ignores it
#
# Via: https://superuser.com/questions/187639/zsh-not-hitting-profile/187673#187673
# Via: https://en.wikipedia.org/wiki/Unix_shell#Configuration_files

# Via: https://github.com/saukrs/.dotfiles
#
# TODO: visualize the cases / put all the details into one big picture (or two):
#
# - https://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile/183980#183980
# - https://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc/789499#789499
# - https://github.com/0cjs/sedoc/blob/master/lang/bash/init.md
# - http://mywiki.wooledge.org/DotFiles
# - http://meta.ath0.com/2007/10/23/cleaning-up-bash-customizations/
# - https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/

# TODO: Should the `.shrc` or `.shinit` become needed:
#ENV=/home/sskras/.shrc
#ENV=/home/sskras/.shinit
#export ENV

# NOTE: It's hardly possible to execute a startup file for non-interactive `sh` sessions:
# https://unix.stackexchange.com/questions/590788/treatment-of-env-and-bash-env-in-bash-running-in-bash-and-sh-mode/590794#590794
# https://askubuntu.com/questions/879364/differentiate-interactive-login-and-non-interactive-non-login-shell/879400#879400
# (as opposed to the effect of BASH_ENV, see URLs above)

# TODO: Stop using the following version:
. "${HOME}/.config/unlicensed/.profile.Ubuntu-20.04.2-LTS-(Focal-Fossa)"

# TODO: Import useful pieces from all the collected versions below.
# Unified, cross-platform .profile:

# TODO: If we want to load .bashrc from .profile for Bourne-like shells too, we will need:
#
# - to add POSIX-protection into .bashrc;
# - to clean (eliminate?) this block in .profile:
#
# ---------------------------------------
# # if running bash
# if [ -n "$BASH_VERSION" ]; then
#     # include .bashrc if it exists
#     if [ -f "$HOME/.bashrc" ]; then
#         . "$HOME/.bashrc"
#     fi
# fi
# ---------------------------------------
