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
	&& git clone https://github.com/chtison/rpi-config.git     \
	&& rm -f -- .[^.]* && cd rpi-config && make bash tmux vim

CMD ["tmux"]
