FROM chtison/rpi-raspbian

RUN apt-get update && apt-get install -y avahi-utils  && \
	apt-get clean                                 && \
	rm -rf -- /var/lib/apt/lists/*

