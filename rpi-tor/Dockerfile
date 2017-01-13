FROM chtison/rpi-raspbian

ARG TOR_TAR_GZ

COPY $TOR_TAR_GZ /

RUN mkdir /tor && cd /tor                                       && \
	tar --strip-components=1 -xzf /$TOR_TAR_GZ              && \
	apt-get update                                          && \
	apt-get install -y clang libevent-dev libssl-dev make   && \
	./configure                                             && \
	make                                                    && \
	make install                                            && \
	apt-get purge -y clang libssl-dev make                  && \
	apt-get autoclean -y                                    && \ 
	apt-get autoremove -y                                   && \ 
	apt-get clean                                           && \ 
	rm -rf -- /var/lib/apt/lists/*

EXPOSE 9050
CMD ["tor"]
