FROM chtison/rpi-golang

ARG RQLITE_TAR_GZ

COPY $RQLITE_TAR_GZ /
RUN mkdir -p /go/src/github.com/rqlite/rqlite                   && \
	cd /go/src/github.com/rqlite/rqlite                     && \
	tar --strip-components=1 -xzf /$RQLITE_TAR_GZ           && \
	rm -f -- /$RQLITE_TAR_GZ                                && \
	apt-get update && apt-get install -y gcc git libc6-dev  && \
	go get -v github.com/rqlite/rqlite/cmd/...              && \
	apt-get purge -y gcc git libc6-dev                      && \
	apt-get autoclean -y                                    && \
	apt-get autoremove -y                                   && \
	apt-get clean                                           && \
	rm -rf -- /var/lib/apt/lists/*                          && \
	cd / && rm -rf -- /go/src /go/pkg


VOLUME ["/data"]
EXPOSE 4001

ENTRYPOINT ["rqlited", "-http", ":4001", "-raft", ":4002"]
CMD ["-ondisk", "/data"]
