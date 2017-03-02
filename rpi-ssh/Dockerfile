FROM chtison/rpi-raspbian

ARG SSH_TAR_GZ

COPY $SSH_TAR_GZ /

RUN mkdir -m 755 /ssh
WORKDIR /ssh

RUN tar --strip-components=1 -xzf /$SSH_TAR_GZ

RUN mkdir -m 755 /var/empty
RUN useradd -rU -d /var/empty -s /bin/false sshd

RUN apt-get install -y gcc libssl-dev make
RUN mkdir -m 755 /usr/local/ssh
RUN ./configure --prefix=/usr/local/ssh && make && make install
RUN rm -f -- /usr/local/ssh/etc/ssh_host_*
RUN cp contrib/ssh-copy-id /usr/local/ssh/bin
RUN chmod 755 /usr/local/ssh/bin/ssh-copy-id

ENV PATH /usr/local/ssh/bin:/usr/local/ssh/sbin:$PATH

RUN useradd admin -Um -s /bin/bash && echo admin:secret1234 | chpasswd

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["ssh-keygen -A && /usr/local/ssh/sbin/sshd -De"]
