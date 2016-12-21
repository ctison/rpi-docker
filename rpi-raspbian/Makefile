IMAGE_TAGS    := latest
IMAGE_NAME    := chtison/rpi-raspbian

.PHONY: help build run

help:
	$(info $(usage))
	@true
define usage
usage: make COMMAND
make build                  # build docker image: $(IMAGE_NAME) with tag: $(IMAGE_TAGS)
make run                    # run docker image: $(IMAGE_NAME)
endef

build:
	docker build $(foreach TAG, $(IMAGE_TAGS),-t $(IMAGE_NAME):$(TAG)) .

run:
	docker run -it --rm $(IMAGE_NAME)
