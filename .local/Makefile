# SPDX-License-Identifier: BlueOak-1.0.0
# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras

A = This Makefile present some milestone operations from lifecycle / during management of the dot-files repository.

all:
	@echo ${A}
	@echo
	@echo "Available targets:"
	@# Via: https://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile/26340367#26340367
	@$(MAKE) -pRrqn -f $(firstword $(MAKEFILE_LIST)) : 2> /dev/null \
	| awk                                                           \
	'                                           \
	      BEGIN                                 \
	      {                                     \
	          RS=""         # Set separators    \
	          FS=":"                            \
	      }                                     \
	                                            \
	      /^# Files$$/                          \
	      {                                     \
	          GO=1          # Start processing  \
	      }                                     \
	                                            \
	      /^# Finished Make data base/          \
	      {                                     \
	          GO=0          # Stop processing   \
	      }                                     \
	                                            \
	      GO && ! /^(#|\.|$@:)/                 \
	      {                                     \
	          printf "    " # Indent            \
	          print $$1     # Print target name \
	      }                                     \
	'                                           \
	#| sort                                                          \
	#| grep -E -v '^[^[:alnum:]]'                                    \

desc:
	@echo ${A}
