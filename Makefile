REGISTRIES := docker.io
IMAGES     := \
		rpi-raspbian   \
		rpi-workspace  \
		rpi-golang     \
		rpi-registry   \
		rpi-rqlite     \
		rpi-aircrack   \

.PHONY: help all build push

help:
	$(info $(USAGE))
	@true
define USAGE
usage: make COMMAND
make all                    # make build && make push
make build                  # build all docker images
make push                   # push all docker images
make fclean                 # remove all dangling images
endef

PWD := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all:
	@-cd $(PWD) && for IMG in $(IMAGES) ; do cd $$IMG && make build push REGISTRIES="$(REGISTRIES)" ; cd $(PWD) ; done

build:
	@-cd $(PWD) && for IMG in $(IMAGES) ; do cd $$IMG && make build ; cd $(PWD) ; done

push:
	@-cd $(PWD) && for IMG in $(IMAGES) ; do cd $$IMG && make push REGISTRIES="$(REGISTRIES)" ; cd $(PWD) ; done

fclean:
	@IMGS=`docker images -aq -f 'dangling=true'` ; [ "$$IMGS" ] && docker rmi $$IMGS || true
