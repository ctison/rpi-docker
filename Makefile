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
	@-cd $(PWD) && for IMG in $(IMAGES) ; do \
		cd $$IMG                                                               && \
		$(MAKE) build push REGISTRIES="$(REGISTRIES)" NOT_SIGNED=$(NOT_SIGNED)  ; \
		cd $(PWD)                                                               ; \
	done

build:
	@-cd $(PWD) && for IMG in $(IMAGES) ; do \
		cd $$IMG      && \
		$(MAKE) build  ; \
		cd $(PWD)      ; \
	done

push:
	@-cd $(PWD) && for IMG in $(IMAGES) ; do \
		cd $$IMG                                                         && \
		$(MAKE) push REGISTRIES="$(REGISTRIES)" NOT_SIGNED=$(NOT_SIGNED)  ; \
		cd $(PWD)                                                         ; \
	done

fclean:
	@-cd $(PWD) && for IMG in $(IMAGES) ; do \
		cd $$IMG       && \
		$(MAKE) fclean  ; \
		cd $(PWD)       ; \
	done
	@IMGS=`docker images -aq -f 'dangling=true'` ; [ "$$IMGS" ] && docker rmi $$IMGS || true
