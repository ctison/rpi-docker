include ../misc/Makefile

VERSION    := 7.4
IMAGE_TAGS := latest $(VERSION) 7
IMAGE_NAME := chtison/rpi-ssh

SSH_TAR_GZ := openssh-$(VERSION)p1.tar.gz
URL        := https://ftp.fr.openbsd.org/pub/OpenBSD/OpenSSH/portable

DOCKER-BUILD-OPTIONS := --build-arg SSH_TAR_GZ=$(SSH_TAR_GZ)

TMP := $(USAGE)
define USAGE
$(TMP)
make fclean           # remove: $(SSH_TAR_GZ) and .dockerignore
endef

.PHONY: fclean
fclean:
	rm -f -- $(SSH_TAR_GZ) .dockerignore

build: $(SSH_TAR_GZ) .dockerignore

$(SSH_TAR_GZ):
	$(CURL) $(URL)/$(SSH_TAR_GZ)

.dockerignore:
	echo -e '*\n!$(SSH_TAR_GZ)' > .dockerignore
