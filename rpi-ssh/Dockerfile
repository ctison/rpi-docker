FROM chtison/rpi-raspbian

ARG SSH_TAR_GZ

COPY $SSH_TAR_GZ /

WORKDIR /ssh

RUN tar --strip-components=1 -xzf /$SSH_TAR_GZ

RUN mkdir -m 755 /var/empty && useradd -rU -d /var/empty -s /bin/false sshd

RUN	apt-get update                                                && \
	apt-get install -y gcc libssl-dev make                        && \
	mkdir -m 755 /usr/local/ssh                                   && \
	./configure --prefix=/usr/local/ssh                           && \
	make && make install                                          && \
	rm -f -- /usr/local/ssh/etc/ssh_host_*                        && \
	cp contrib/ssh-copy-id /usr/local/ssh/bin                     && \
	chmod 755 /usr/local/ssh/bin/ssh-copy-id                      && \
	apt-get purge -y gcc libssl-dev make                          && \
	apt-get autoclean -y                                          && \
	apt-get autoremove -y                                         && \
	apt-get clean                                                 && \
	rm -rf -- /var/lib/apt/lists/*

ENV PATH /usr/local/ssh/bin:/usr/local/ssh/sbin:$PATH

RUN useradd admin -Um -s /bin/bash && echo admin:secret1234 | chpasswd

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["ssh-keygen -A && /usr/local/ssh/sbin/sshd -De"]
