include ../misc/Makefile

VERSION    := 2.6.0
IMAGE_NAME := chtison/rpi-registry

REGISTRY_TAR_GZ := v$(VERSION).tar.gz
URL             := https://github.com/docker/distribution/archive

DOCKER-BUILD-OPTIONS := --build-arg REGISTRY_TAR_GZ=$(REGISTRY_TAR_GZ) --build-arg VERSION=$(VERSION)

TMP := $(USAGE)
define USAGE
$(TMP)
make fclean           # remove: $(REGISTRY_TAR_GZ) and .dockerignore
endef

.PHONY: fclean
fclean:
	rm -f -- $(REGISTRY_TAR_GZ) .dockerignore

build: $(REGISTRY_TAR_GZ) .dockerignore

$(REGISTRY_TAR_GZ):
	$(CURL) $(URL)/$(REGISTRY_TAR_GZ)

.dockerignore:
	echo -e '*\n!$(REGISTRY_TAR_GZ)' > .dockerignore

FQDN := $(shell hostname).local
PORT := 5000
override define RUN
@echo 'https://docs.docker.com/registry/insecure/#/using-self-signed-certificates'
@[ `id -u` = 0 ] || (echo '+ root is required to install self signed certificate for docker daemon' && false)
@[ "$(FQDN)" ] || (echo '+ FQDN parameter is required, example: make run FQDN=raspberrypi.local' && false)
mkdir certs
openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key -x509 -days 365 -out certs/domain.crt -subj '/CN=$(FQDN)'
mkdir -p /etc/docker/certs.d/$(FQDN):$(PORT)/
cp certs/domain.crt /etc/docker/certs.d/$(FQDN):$(PORT)/ca.crt
systemctl daemon-reload
systemctl restart docker
docker run -d                                                  \
	--restart=unless-stopped                               \
	--name registry                                        \
	--publish $(PORT):5000                                 \
	--volume registry:/var/lib/registry                    \
	--volume $(shell pwd)/certs:/certs                     \
	--env REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt  \
	--env REGISTRY_HTTP_TLS_KEY=/certs/domain.key          \
	$(IMAGE_NAME)
endef
