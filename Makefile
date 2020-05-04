.DEFAULT_GOAL := help

.PHONY: checks
checks:		## Run static analysis tool.
	shellcheck -e SC1091,SC1090 ./*.sh ./**/*.sh ./**/.bashrc ./bash/.bash_profile

.PHONY: help
help:		## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
