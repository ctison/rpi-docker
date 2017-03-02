FROM chtison/rpi-raspbian

WORKDIR /root

RUN apt-get update && apt-get install -y bash git make man most tmux vim
RUN git clone https://github.com/chtison/linux-config.git
RUN rm -f -- .[^.]*

WORKDIR /root/linux-config
RUN make bash tmux vim

CMD ["tmux"]
