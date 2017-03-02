FROM chtison/rpi-raspbian

ARG GOLANG_TAR_GZ

COPY $GOLANG_TAR_GZ /

RUN tar -C /usr/local -xzf /$GOLANG_TAR_GZ
RUN mkdir -m 755 /go

ENV GOPATH /go
ENV PATH   $GOPATH/bin:/usr/local/go/bin:$PATH

CMD ["go", "version"]
