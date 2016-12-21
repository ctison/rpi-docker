VERSION       := 1.7.4

IMAGE_TAGS    := latest $(VERSION) 1.7 1
IMAGE_NAME    := chtison/rpi-golang

GOLANG_TAR_GZ := go$(VERSION).linux-armv6l.tar.gz
URL           := https://storage.googleapis.com/golang

CURL          := curl -L -O # wget

.PHONY: help all build fclean run

help:
	$(info $(usage))
	@true
define usage
usage: make COMMAND
make build                  # build docker image: $(IMAGE_NAME) with tags: $(IMAGE_TAGS)
make fclean                 # remove $(GOLANG_TAR_GZ) and .dockerignore
make run                    # run docker image: $(IMAGE_NAME)
endef

build: $(GOLANG_TAR_GZ) .dockerignore
	docker build --build-arg GOLANG_TAR_GZ=$(GOLANG_TAR_GZ) $(foreach TAG, $(IMAGE_TAGS),-t $(IMAGE_NAME):$(TAG)) .

fclean:
	rm -f -- $(GOLANG_TAR_GZ) .dockerignore

run:
	docker run -it --rm $(IMAGE_NAME)

$(GOLANG_TAR_GZ):
	$(CURL) $(URL)/$(GOLANG_TAR_GZ)

.dockerignore:
	echo '*\n!$(GOLANG_TAR_GZ)' > .dockerignore
