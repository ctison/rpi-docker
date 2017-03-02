FROM chtison/rpi-raspbian

ARG NMAP_TAR_GZ

COPY $NMAP_TAR_GZ /

RUN mkdir -m 755 /nmap
WORKDIR /nmap
RUN tar --strip-components=1 -xzf /$NMAP_TAR_GZ
RUN apt-get install -y g++ make
RUN ./configure && make && make install

CMD ["nmap", "-V"]
