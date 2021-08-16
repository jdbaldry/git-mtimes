.ONESHELL:
.DELETE_ON_ERROR:
export SHELL     := bash
oxexport SHELLOPTS := pipefail:errexit
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rule

# Adapted from https://suva.sh/posts/well-documented-makefiles/
.PHONY: help
help: ## Display this help
help:
	@awk 'BEGIN {FS = ": ##"; printf "Usage:\n  make <target>\n\nTargets:\n"} /^[a-zA-Z0-9_\.\-\/%]+: ##/ { printf "  %-45s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

.PHONY: mtimes
mtimes: ## Produce a script that can be used to update mtimes
mtimes:
	echo "#!/bin/sh" > $@
	git ls-files | xargs stat --printf "touch %n --date='%y'\n" >> $@
	chmod +x $@

.PHONY: current
current: ## Display current file mtimes
current:
	git ls-files | xargs stat --printf "%n %y\n"

.PHONY: update
update: ## Update file mtimes
update:
	./mtimes
