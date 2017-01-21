FROM chtison/rpi-raspbian

WORKDIR /root

RUN apt-get update && apt-get install -y                           \
		bash                                               \
		git                                                \
		make                                               \
		man                                                \
		most                                               \
		tmux                                               \
		vim                                                \
	&& git clone https://github.com/chtison/linux-config.git   \
	&& rm -f -- .[^.]* && cd linux-config && make bash tmux vim

CMD ["tmux"]
