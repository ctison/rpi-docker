include ../misc/Makefile

VERSION    := 1.10.2
IMAGE_TAGS := latest $(VERSION) 1.10 1
IMAGE_NAME := chtison/rpi-nginx

NGINX_TAR_GZ := nginx-$(VERSION).tar.gz
URL          := https://nginx.org/download

DOCKER-BUILD-OPTIONS := --build-arg NGINX_TAR_GZ=$(NGINX_TAR_GZ)

TMP := $(USAGE)
define USAGE
$(TMP)
make fclean           # remove: $(NGINX_TAR_GZ) and .dockerignore
endef

.PHONY: fclean
fclean:
	rm -f -- $(NGINX_TAR_GZ) .dockerignore

build: $(NGINX_TAR_GZ) .dockerignore

$(NGINX_TAR_GZ):
	$(CURL) $(URL)/$(NGINX_TAR_GZ)

.dockerignore:
	echo -e '*\n!$(NGINX_TAR_GZ)' > .dockerignore
