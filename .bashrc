# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras
# SPDX-License-Identifier: BlueOak-1.0.0

echo "Executing `pwd`/.bashrc"

# Executed for Bash sessions.
#
# Primarily targets non-login interactive ones.
# But I am going to execute it for login Bash sessions too (via `.profile`).

# TODO: Stop using the following version:
. ".config/unlicensed/.bashrc.Ubuntu-20.04.2-LTS-(Focal-Fossa)"

# TODO: Import useful pieces below from all the collected versions like above.
# Unified, cross-platform .bahrc:
