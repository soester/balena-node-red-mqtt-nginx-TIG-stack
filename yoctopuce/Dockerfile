
FROM balenalib/raspberrypi3-debian:latest
RUN apt update && apt upgrade && apt -y install wget unzip libusb-1.0-0
ENV UDEV=1
ARG virtualhubversion=34369

RUN mkdir -p /usr/src/yocto

WORKDIR /usr/src/yocto/
RUN wget http://www.yoctopuce.com/EN/downloads/VirtualHub.linux.${virtualhubversion}.zip && \ unzip -d /usr/src/yocto VirtualHub.linux.${virtualhubversion}.zip

RUN	cp /usr/src/yocto/armhf/VirtualHub /usr/sbin/ && \	cp /usr/src/yocto/startup_script/yVirtualHub /etc/init.d/ && \	cp /usr/src/yocto/startup_script/yVirtualHub /etc/init.d/ && \	cp /usr/src/yocto/udev_conf/51-yoctopuce_all.rules /etc/udev/rules.d
RUN groupadd virtualhub --gid 1012 && \ useradd -g virtualhub -r -s /sbin/nologin --uid 997 virtualhub

CMD /usr/sbin/VirtualHub -i
