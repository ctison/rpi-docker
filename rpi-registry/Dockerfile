FROM chtison/rpi-golang

ARG REGISTRY_TAR_GZ
ARG VERSION

ENV VERSION $VERSION

COPY $REGISTRY_TAR_GZ /
RUN mkdir -p /go/src/github.com/docker/distribution                         && \
	cd /go/src/github.com/docker/distribution                           && \
	tar --strip-components=1 -xzf /$REGISTRY_TAR_GZ                     && \
	rm -f -- /$REGISTRY_TAR_GZ                                          && \
	mkdir -p /etc/docker/registry/ /var/lib/registry/                   && \
	mv cmd/registry/config-example.yml /etc/docker/registry/config.yml  && \
	apt-get update && apt-get install -y make                           && \
	sed -i "s/^VERSION=.*/VERSION:=$VERSION/" Makefile                  && \
	make PREFIX=$GOPATH binaries                                        && \
	apt-get purge -y make                                               && \
	apt-get autoclean -y                                                && \
	apt-get autoremove -y                                               && \
	apt-get clean                                                       && \
	rm -rf -- /var/lib/apt/lists/*                                      && \
	cd / && rm -rf -- /go/src

VOLUME ["/var/lib/registry"]
EXPOSE 5000
# Configuration file: /etc/docker/registry/config.yml

ENTRYPOINT ["registry"]
CMD ["serve", "/etc/docker/registry/config.yml"]
