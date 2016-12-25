VERSION       := 3.9.0

IMAGE_TAGS    := latest $(VERSION) 3.9 3
IMAGE_NAME    := chtison/rpi-rqlite

RQLITE_TAR_GZ := v$(VERSION).tar.gz
URL           := https://github.com/rqlite/rqlite/archive

CURL          := curl -L -O # wget

.PHONY: help build fclean run

help:
	$(info $(usage))
	@true
define usage
usage: make COMMAND
make build                  # build docker image: $(IMAGE_NAME) with tags: $(IMAGE_TAGS)
make fclean                 # remove: $(RQLITE_TAR_GZ) and .dockerignore
make run                    # run docker image: $(IMAGE_NAME)
endef

build: $(RQLITE_TAR_GZ) .dockerignore
	docker build --build-arg RQLITE_TAR_GZ=$(RQLITE_TAR_GZ) $(foreach TAG, $(IMAGE_TAGS),-t $(IMAGE_NAME):$(TAG)) .

fclean:
	rm -f -- $(RQLITE_TAR_GZ) .dockerignore

run:
	docker run -d                     \
		--restart=unless-stopped  \
		--name rqlited            \
		--publish 4001:4001       \
		--volume rqlited:/data    \
		$(IMAGE_NAME)

$(RQLITE_TAR_GZ):
	$(CURL) $(URL)/$(RQLITE_TAR_GZ)

.dockerignore:
	echo '*\n!$(RQLITE_TAR_GZ)' > .dockerignore
