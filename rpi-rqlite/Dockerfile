FROM chtison/rpi-golang

ARG RQLITE_TAR_GZ

COPY $RQLITE_TAR_GZ /
RUN mkdir -m 755 -p /go/src/github.com/rqlite/rqlite
WORKDIR /go/src/github.com/rqlite/rqlite
RUN tar --strip-components=1 -xzf /$RQLITE_TAR_GZ
RUN rm -f -- /$RQLITE_TAR_GZ
RUN apt-get install -y gcc git libc6-dev
RUN go get -v github.com/rqlite/rqlite/cmd/...

VOLUME ["/data"]
EXPOSE 4001 4002

ENTRYPOINT ["rqlited"]
CMD ["-http", ":4001", "-raft", ":4002", "-ondisk", "/data"]
