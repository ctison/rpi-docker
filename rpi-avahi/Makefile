include ../misc/Makefile

VERSION    := 0.6.31
IMAGE_TAGS := latest $(VERSION)
IMAGE_NAME := chtison/rpi-avahi

IP := $(shell ifconfig eth0 | grep 'inet addr:' | awk -F'[ :]+' '{print $$4}')
define RUN
@[ "$(HOST)" ] || (echo '+ HOST parameter is required, example: make run HOST=docker.local' && false)
docker run -it -v /var/run/dbus:/var/run/dbus --rm $(IMAGE_NAME) avahi-publish -a -R docker.local $(IP)
endef
