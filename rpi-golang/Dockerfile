FROM chtison/rpi-raspbian

ARG GOLANG_TAR_GZ

COPY $GOLANG_TAR_GZ /

RUN tar -C /usr/local -xzf /$GOLANG_TAR_GZ  && \
	rm -f -- /$GOLANG_TAR_GZ            && \
	mkdir /go

ENV GOPATH /go
ENV PATH   $GOPATH/bin:/usr/local/go/bin:$PATH

ENTRYPOINT ["go"]
CMD ["version"]
