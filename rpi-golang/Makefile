include ../misc/Makefile

VERSION    := 1.7.4
IMAGE_TAGS := latest $(VERSION) 1.7 1
IMAGE_NAME := chtison/rpi-golang

GOLANG_TAR_GZ := go$(VERSION).linux-armv6l.tar.gz
URL           := https://storage.googleapis.com/golang

DOCKER-BUILD-OPTIONS := --build-arg GOLANG_TAR_GZ=$(GOLANG_TAR_GZ)

TMP := $(USAGE)
define USAGE
$(TMP)
make fclean           # remove: $(GOLANG_TAR_GZ) and .dockerignore
endef

.PHONY: fclean
fclean:
	rm -f -- $(GOLANG_TAR_GZ) .dockerignore

build: $(GOLANG_TAR_GZ) .dockerignore

$(GOLANG_TAR_GZ):
	$(CURL) $(URL)/$(GOLANG_TAR_GZ)

.dockerignore:
	echo -e '*\n!$(GOLANG_TAR_GZ)' > .dockerignore
