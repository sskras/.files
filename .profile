# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras
# SPDX-License-Identifier: BlueOak-1.0.0

#echo   # TODO: Would be nice to print this line only then logging in via SSH, but skip in the case of `--login`.
echo "Executing `pwd`/.profile"

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

# TODO: Stop using the following version:
. ".config/unlicensed/.profile.Ubuntu-20.04.2-LTS-(Focal-Fossa)"

# TODO: Import useful pieces from all the collected versions below.
# Unified, cross-platform .profile:
