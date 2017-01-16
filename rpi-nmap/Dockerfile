FROM chtison/rpi-raspbian

ARG NMAP_TAR_GZ

COPY $NMAP_TAR_GZ /

RUN mkdir -m 755 /nmap && cd /nmap                   && \
	tar --strip-components=1 -xzf /$NMAP_TAR_GZ  && \
	apt-get update                               && \
	apt-get install -y g++ make                  && \
	./configure                                  && \
	make                                         && \
	make install                                 && \
	apt-get purge -y g++ make                    && \
	apt-get autoclean -y                         && \
	apt-get autoremove -y                        && \
	rm -rf -- /var/lib/apt/lists/*

CMD ["nmap", "-V"]
