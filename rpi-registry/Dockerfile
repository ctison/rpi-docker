FROM chtison/rpi-golang:1.7.5

ARG REGISTRY_TAR_GZ
ARG VERSION

ENV VERSION $VERSION

COPY $REGISTRY_TAR_GZ /
RUN mkdir -m 755 -p /go/src/github.com/docker/distribution
WORKDIR /go/src/github.com/docker/distribution
RUN tar --strip-components=1 -xzf /$REGISTRY_TAR_GZ
RUN rm -f -- /$REGISTRY_TAR_GZ

RUN mkdir -m 755 -p /etc/docker/registry/ /var/lib/registry/
RUN mv cmd/registry/config-example.yml /etc/docker/registry/config.yml
RUN apt-get install -y make
RUN sed -i "s/^VERSION=.*/VERSION:=$VERSION/" Makefile
RUN make PREFIX=$GOPATH binaries

VOLUME ["/var/lib/registry"]
EXPOSE 5000
# Configuration file: /etc/docker/registry/config.yml

ENTRYPOINT ["registry"]
CMD ["serve", "/etc/docker/registry/config.yml"]
