# SPDX-License-Identifier: BlueOak-1.0.0
# SPDX-FileCopyrightText: 2023 Saulius Krasuckas <saulius2_at_ar-fi_point_lt> | sskras

A = This Makefile present some milestone operations from lifecycle / during management of the dot-files repository.

# Concat with a subdir to work in a sandbox:
GIT_WORK_TREE   := ${HOME}#/tmp
GIT_DIR         := ${GIT_WORK_TREE}/.files.git
CONFLICT_STORE  := .config/unlicensed
# TODO: Try `. /etc/os-release 2>/dev/null && echo "$PRETTY_NAME"` before falling back to `uname` ..:
CONFLICT_OSDIR  := `uname -o | sed 's|/|-|'`-`uname -r | sed 's|/|-|g'`
              # Eg:
              #  - GNU-Linux-5.4.0
              #  - Cygwin-3.3.3(0.341-5-3)

# Via: https://stackoverflow.com/questions/23843106/how-to-set-child-process-environment-variable-in-makefile/49524393#49524393
export  GIT_WORK_TREE
export  GIT_DIR

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
	| sort                                                          \
	#| grep -E -v '^[^[:alnum:]]'                                    \

desc:
	@echo ${A}

init:
	@ \
	cd $${GIT_WORK_TREE}                                         && \
	set -x                                                       && \
	: TODO: Check if $$GIT_DIR is already present.               && \
	git init --bare                                              && \
	git config user.name "Saulius Krasuckas"                     && \
	git config user.email "saulius2@ar-fi.lt"                    && \
	git commit -m 'Repository just created' --allow-empty        && \
	git branch -M main                                           && \
	git remote add origin git@github.com:sskras/.files.git       && \
	exit                                                            \

init-push:
	@ \
	echo "Pushing for the first time & caching creds/the token." && \
	git push -u origin main                                      && \
	cd $${GIT_WORK_TREE}                                         && \
	mv -v .git-credentials .config/git/credentials               && \
	exit                                                            \

install: clone pop init-push submodules
	@

clone:
	@ \
	cd $${GIT_WORK_TREE}                                         && \
	:                                                            && \
	: For the token based auth:                                  && \
	:                                                            && \
	git clone --bare https://github.com/sskras/.files.git        && \
	:                                                            && \
	: For the SSH-keys based auth:                               && \
	:                                                            && \
	echo                                                         && \
	: #eval `ssh-agent -s`                                        && \#
	: TODO: Use SSH key forwarding, if possible:                 && \
	: #ssh-add ~/.ssh/id_rsa-saukrs                               && \#
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
	echo                                                         && \
	cd $${GIT_WORK_TREE}                                         && \
	: Create a dir for storing copies of conflicting files       && \
	: because it has not been checked out from the repo yet:     && \
	mkdir -pv ${CONFLICT_STORE}                                  && \
	git ls-tree --full-tree --name-only -r HEAD                     \
	| while read FILE; do                                           \
	      if [ -f "$${FILE}" ] || [ -L "$${FILE}" ]; then           \
	          rsync                                                 \
	              --archive                                         \
	              --relative                                        \
	              --remove-source-files                             \
	              --itemize-changes                                 \
	              --info=name                                       \
	              "$${FILE}" "${CONFLICT_STORE}/${CONFLICT_OSDIR}/" \
	          ;                                                     \
	      else                                                      \
	          true;                                                 \
	      fi                                                        \
	  done                                                       && \
	git checkout                                                 && \
	exit                                                            \

uninstall:
	@ \
	echo                                                         && \
	echo TODO: git pull might be needed if upstream was updated. && \
	echo TODO: Maybe move the current state to a backup branch.  && \
	echo                                                         && \
	:                                                            && \
	git push --all                                               && \
	cd $${GIT_WORK_TREE}                                         && \
	echo                                                         && \
	echo "TODO: See the original files to restore if any:"       && \
	git status | grep \.config/unlicensed/                       && \
	echo                                                         && \
	echo "Uninstalling the repo files:"                          && \
	git ls-tree --full-tree --name-only -r HEAD                     \
	| xargs rm -v                                                && \
	rm -v .config/git/credentials                                && \
	echo                                                         && \
	echo "TODO: Remove the leftover empty dirs..."               && \
	echo                                                         && \
	git ls-tree --full-tree --name-only -r HEAD                     \
	| awk 'BEGIN {OFS=FS="/"} $$0~FS {$$NF=""; print}'              \
	| sort -u                                                       \
	| xargs ls -l                                                && \
	echo                                                         && \
	rm -rf ${GIT_DIR}                                            && \
	exit                                                            \


submodules:
	@ \
	echo                                                         && \
	echo TODO: init ~/.local/bin and maybe ~/.ssh via            && \
	echo TODO: https://github.com/sskras/.local-bin$#deployment  && \
	echo                                                         && \
	exit                                                            \
	
