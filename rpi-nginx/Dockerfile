FROM chtison/rpi-workspace

ARG NGINX_TAR_GZ

COPY $NGINX_TAR_GZ /

RUN mkdir -m 755 /nginx                                         && \
	tar --strip-components=1 -C /nginx -xzf /$NGINX_TAR_GZ  && \
	rm -f -- /$NGINX_TAR_GZ

RUN cd /nginx                                                && \
	apt-get update                                       && \
	apt-get install -y gcc libpcre3-dev libssl-dev make  && \
	./configure --with-http_ssl_module                   && \
	make && make install                                 && \
	apt-get purge -y gcc libpcre3-dev libssl-dev make    && \
	apt-get autoclean -y                                 && \
	apt-get autoremove -y                                && \
	apt-get clean                                        && \
	rm -rf -- /var/lib/apt/lists/*

ENV PATH /usr/local/nginx/sbin:$PATH

ENTRYPOINT ["/usr/local/nginx/sbin/nginx"]
CMD ["-g", "daemon off;"]
