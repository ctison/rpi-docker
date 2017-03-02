.PHONY: help all build push

REGISTRIES := docker.io
NOT_SIGNED := true
IMAGES     := \
		rpi-raspbian   \
		rpi-workspace  \
		rpi-golang     \
		rpi-registry   \
		rpi-rqlite     \
		rpi-aircrack   \
		rpi-ssh        \
		rpi-nginx      \
		rpi-avahi      \
		rpi-tor        \
		rpi-nmap       \

BUILD_ARGS :=
PUSH_ARGS  := REGISTRIES="$(REGISTRIES)" NOT_SIGNED=$(NOT_SIGNED)

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
	@- for IMG in $(IMAGES) ; do \
		cd $(PWD)/$$IMG && $(MAKE) build push $(BUILD_ARGS) $(PUSH_ARGS) ; \
	done

build:
	@- for IMG in $(IMAGES) ; do \
		cd $(PWD)/$$IMG && $(MAKE) build $(BUILD_ARGS) ; \
	done

push:
	@-cd $(PWD) && for IMG in $(IMAGES) ; do \
		cd $(PWD)/$$IMG && $(MAKE) push $(PUSH_ARGS) ; \
	done

fclean:
	@-cd $(PWD) && for IMG in $(IMAGES) ; do \
		cd $(PWD)/$$IMG && $(MAKE) fclean ; \
	done
	@IMGS=`docker images -aq -f 'dangling=true'` ; [ "$$IMGS" ] && docker rmi $$IMGS || true
