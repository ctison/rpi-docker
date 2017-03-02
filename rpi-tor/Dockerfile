FROM chtison/rpi-raspbian

ARG TOR_TAR_GZ

COPY $TOR_TAR_GZ /

RUN mkdir -m 755 /tor
WORKDIR /tor
RUN tar --strip-components=1 -xzf /$TOR_TAR_GZ
RUN apt-get install -y clang libevent-dev libssl-dev make
RUN ./configure && make && make install

EXPOSE 9050
CMD ["tor"]
