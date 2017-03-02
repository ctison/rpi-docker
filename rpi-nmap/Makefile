include ../misc/Makefile

VERSION    := 7.40
IMAGE_NAME := chtison/rpi-nmap

NMAP_TAR_GZ := nmap-$(VERSION).tgz
URL         := https://nmap.org/dist

DOCKER_BUILD_OPTIONS := --build-arg NMAP_TAR_GZ=$(NMAP_TAR_GZ)

TMP := $(USAGE)
define USAGE
$(TMP)
make fclean           # remove: $(NMAP_TAR_GZ) and .dockerignore
endef

.PHONY: fclean
fclean:
	rm -f -- $(NMAP_TAR_GZ) .dockerignore

build: $(NMAP_TAR_GZ) .dockerignore

$(NMAP_TAR_GZ):
	$(CURL) $(URL)/$(NMAP_TAR_GZ)

.dockerignore:
	echo -e '*\n!$(NMAP_TAR_GZ)' > .dockerignore
