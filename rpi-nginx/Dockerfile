FROM chtison/rpi-raspbian

ARG NGINX_TAR_GZ

COPY $NGINX_TAR_GZ /

RUN mkdir -m 755 /nginx
RUN tar --strip-components=1 -C /nginx -xzf /$NGINX_TAR_GZ
RUN rm -f -- /$NGINX_TAR_GZ

WORKDIR /nginx
RUN apt-get install -y gcc libpcre3-dev libssl-dev make
RUN ./configure --with-http_ssl_module && make && make install

ENV PATH /usr/local/nginx/sbin:$PATH

ENTRYPOINT ["/usr/local/nginx/sbin/nginx"]
CMD ["-g", "daemon off;"]
