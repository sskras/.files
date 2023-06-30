# SPDX-License-Identifier: BlueOak-1.0.0
# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras

A = This Makefile present some milestone operations from lifecycle / during management of the dot-files repository.

all:
	@echo ${A}
	@echo
	@echo "Available targets:"
	@
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

init:
	@ \
	GIT_DIR=$${HOME}/.files.git                                  && \
	GIT_WORK_TREE=$${HOME}                                       && \
	cd $${HOME}                                                  && \
	set -x                                                       && \
	export GIT_DIR                                               && \
	: TODO: Check if $$GIT_DIR is already present.               && \
	git init --bare                                              && \
	git config user.name "Saulius Krasuckas"                     && \
	git config user.email "saulius2@ar-fi.lt"                    && \
	export GIT_WORK_TREE                                         && \
	git commit -m 'Repository just created' --allow-empty        && \
	git branch -M main                                           && \
	git remote add origin git@github.com:sskras/.files.git       && \
	exit                                                            \

push:
	git push -u origin main
	: TODO: Make Git credentials storage to conform to XDG dir spec
	# mv -v .git-credentials .config/git/credentials

get: clone pop
	@

clone:
	@ \
	cd $${HOME}                                                  && \
	:                                                            && \
	: For the token based auth:                                  && \
	:                                                            && \
	git clone --bare https://github.com/sskras/.files            && \
	:                                                            && \
	: For the SSH-keys based auth:                               && \
	:                                                            && \
	echo                                                         && \
	: eval `ssh-agent -s`                                        && \
	: TODO: Use SSH key forwarding, if possible:                 && \
	: ssh-add ~/.ssh/id_rsa-saukrs                               && \
	echo 'TODO: SSH raktu setupas'                               && \
	echo 'TODO: git config user.name ...'                        && \
	echo 'TODO: git config user.email ...'                       && \
	echo 'TODO: ... or maybe it will get imported from global (per-user) Git settings to be stored on this repo.' && \
	echo 'TODO: => git@github.com:sskras/.files.git'             && \
	echo 'TODO: https://stackoverflow.com/questions/37770467/why-do-i-have-to-git-push-set-upstream-origin-branch' && \
	echo 'TODO: make push # Bandomasis'                          && \
	exit                                                            \

pop:
	@ \
	GIT_WORK_TREE=$${HOME}                                       && \
	GIT_DIR=$${GIT_WORK_TREE}/.files.git                         && \
	export GIT_WORK_TREE                                         && \
	export GIT_DIR                                               && \
	git checkout                                                 && \
	exit                                                            \

