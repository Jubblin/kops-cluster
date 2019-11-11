.PHONY: build
.DEFAULT_GOAL := build

#COLORS
GREEN  := $(shell tput -Txterm setaf 2)
WHITE  := $(shell tput -Txterm setaf 7)
YELLOW := $(shell tput -Txterm setaf 3)
RESET  := $(shell tput -Txterm sgr0)

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '##'
# A category can be added with @category
HELP_FUN = \
    %help; \
    while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-zA-Z\-]+)\s*:.*\#\#(?:@([a-zA-Z\-]+))?\s(.*)$$/ }; \
    print "usage: make [target]\n\n"; \
    for (sort keys %help) { \
    print "${WHITE}$$_:${RESET}\n"; \
    for (@{$$help{$$_}}) { \
    $$sep = " " x (32 - length $$_->[0]); \
    print "  ${YELLOW}$$_->[0]${RESET}$$sep${GREEN}$$_->[1]${RESET}\n"; \
    }; \
    print "\n"; }

help: ##@other Show this help.
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

setup: ##@other Setup this project
	cp -n .env.dist .env
	cp -n docker-compose.local.yml.dist docker-compose.local.yml
	docker-compose pull

generate-from-template:  ##@kops generate cluster file
	docker-compose run --rm generate-from-template

dryrun:  ##@kops dry run cluster
	docker-compose run --rm dryrun

update:  ##@kops dry run cluster
	docker-compose run --rm update
	
destroy:  ##@kops Destroy cluster
	docker-compose run --rm destroy

export-kubecfg:  ##@kops get kube config
	docker-compose run --rm kubecfg-export