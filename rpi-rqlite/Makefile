VERSION       := 3.8.0

IMAGE_TAGS    := latest $(VERSION) 3.8 3
IMAGE_NAME    := chtison/rpi-rqlite

RQLITE_TAR_GZ := v$(VERSION).tar.gz
URL           := https://github.com/rqlite/rqlite/archive

CURL          := curl -L -O # wget

.PHONY: help build fclean

help:
	$(info $(usage))
	@true
define usage
usage: make COMMAND
make build                  # build docker image: $(IMAGE_NAME) with tags: $(IMAGE_TAGS)
make fclean                 # remove: $(RQLITE_TAR_GZ) and .dockerignore
endef

build: $(RQLITE_TAR_GZ) .dockerignore
	docker build --build-arg RQLITE_TAR_GZ=$(RQLITE_TAR_GZ) $(foreach TAG, $(IMAGE_TAGS),-t $(IMAGE_NAME):$(TAG)) .

fclean:
	rm -f -- $(RQLITE_TAR_GZ) .dockerignore

$(RQLITE_TAR_GZ):
	$(CURL) $(URL)/$(RQLITE_TAR_GZ)

.dockerignore:
	echo '*\n!$(RQLITE_TAR_GZ)' > .dockerignore
