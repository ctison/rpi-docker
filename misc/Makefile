# This Makefile is intended to be included in other Makefiles.
.PHONY: help build list push run

IMAGE_TAGS := latest
IMAGE_NAME := chtison/example
REGISTRIES := docker.io

DOCKER-BUILD-OPTIONS :=

SHELL := /bin/bash
CURL  := curl -L -O # wget

help:
	$(info $(USAGE))
	@true
define USAGE
usage: make COMMAND
make build            # build docker image: $(IMAGE_NAME) with tags: $(IMAGE_TAGS)
make list             # list all images named: $(IMAGE_NAME)
make push             # push all images named: $(IMAGE_NAME)
make run              # run docker image: $(IMAGE_NAME)
endef

build:
	docker build $(DOCKER-BUILD-OPTIONS) $(foreach TAG, $(IMAGE_TAGS),-t $(IMAGE_NAME):$(TAG)) .

list:
	docker images $(IMAGE_NAME)

push:
	@for REGISTRY in $(REGISTRIES) ; do \
		for IMAGE in `docker images $(IMAGE_NAME) | awk 'NR>1' | tr -s ' ' | cut -d' ' -f1,2 | tr ' ' ':'` ; do \
			docker tag $$IMAGE $$REGISTRY/$$IMAGE ; \
			docker push $$REGISTRY/$$IMAGE        ; \
			docker rmi $$REGISTRY/$$IMAGE         ; \
		done ; \
	done

run: ; $(call RUN)
define RUN
docker run -it --rm $(IMAGE_NAME)
endef