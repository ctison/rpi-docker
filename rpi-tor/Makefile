include ../misc/Makefile

VERSION    := 0.2.9.10
IMAGE_NAME := chtison/rpi-tor

TOR_TAR_GZ := tor-$(VERSION).tar.gz
URL        := https://www.torproject.org/dist

DOCKER-BUILD-OPTIONS := --build-arg TOR_TAR_GZ=$(TOR_TAR_GZ)

TMP := $(USAGE)
define USAGE
$(TMP)
make fclean           # remove: $(TOR_TAR_GZ) and .dockerignore
endef

.PHONY: fclean
fclean:
	rm -f -- $(TOR_TAR_GZ) .dockerignore

build: $(TOR_TAR_GZ) .dockerignore

$(TOR_TAR_GZ):
	$(CURL) $(URL)/$(TOR_TAR_GZ)

.dockerignore:
	echo -e '*\n!$(TOR_TAR_GZ)' > .dockerignore
