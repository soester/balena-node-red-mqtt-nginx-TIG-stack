
FROM balenalib/raspberrypi3-debian:latest
RUN apt update && apt upgrade && apt -y install wget unzip libusb-1.0-0 portmap systemd
ENV UDEV=1
ENV INITSYSTEM=on
ARG virtualhubversion=34403

RUN mkdir -p /usr/src/yocto

WORKDIR /usr/src/yocto/
RUN wget http://www.yoctopuce.com/EN/downloads/VirtualHub.linux.${virtualhubversion}.zip && unzip -d /usr/src/yocto VirtualHub.linux.${virtualhubversion}.zip

# udev rules to allow write access to all users for Yoctopuce USB devices
RUN cp /usr/src/yocto/udev_conf/51-yoctopuce_all.rules /etc/udev/rules.d
# users
# RUN groupadd virtualhub --gid 1012 && \ useradd -g virtualhub -r -s /sbin/nologin --uid 997 irtualhub

# 1: copy VitualHub binary to /usr/sbin
RUN	cp /usr/src/yocto/armhf/VirtualHub /usr/sbin/

# 2: ensure that the /usr/sbin/Virtualhub is executable with :
RUN chmod +x /usr/sbin/VirtualHub


#3: copy the systemd startup script /etc/systemd/system/
RUN cp /usr/src/yocto/startup_script/yvirtualhub.service /etc/systemd/system/

# 4: ensure that the /etc/systemd/system/yvirtualhub.service is executable with :
RUN chmod +x /etc/systemd/system/yvirtualhub.service

# 5: reload your systemd configuration with
#RUN systemctl daemon-reload

# 6: ensure that you can start your script with
#RUN systemctl start yvirtualhub.service


# 7: set this service to be started at boot time with
#CMD systemctl enable yvirtualhub.service
COPY start.sh /start.sh
RUN chmod +x /start.sh
RUN /start.sh

###RUN cp /usr/src/yocto/startup_script/yVirtualHub /etc/init.d/
###RUN chmod +x /etc/init.d/yVirtualHub
###
###RUN update-rc.d yVirtualHub defaults
####RUN update-rc.d yVirtualHub disable
###
####CMD /etc/init.d/yVirtualHub start
###CMD /usr/sbin/VirtualHub


#FROM balenalib/raspberrypi3-alpine:latest
#RUN apk update
##RUN apk upgrade
###RUN apk add wget unzip libusb udev
###RUN apk add openrc --no-cache
###ENV UDEV=1
###ENV INITSYSTEM=on
###ARG virtualhubversion=34403
###
###RUN mkdir -p /usr/src/yocto
###
###WORKDIR /usr/src/yocto/
###RUN wget http://www.yoctopuce.com/EN/downloads/VirtualHub.linux.${virtualhubversion}.zip && ###unzip -d /usr/src/yocto VirtualHub.linux.${virtualhubversion}.zip
###
#### udev rules to allow write access to all users for Yoctopuce USB devices
###RUN cp /usr/src/yocto/udev_conf/51-yoctopuce_all.rules /etc/udev/rules.d
#### users
#### RUN groupadd virtualhub --gid 1012 && \ useradd -g virtualhub -r -s /sbin/nologin --uid 997 ###virtualhub
###
###
#### 1: copy VitualHub binary to /usr/sbin
###RUN	cp /usr/src/yocto/armhf/VirtualHub /usr/sbin/
###
#### 2: ensure that the /usr/sbin/Virtualhub is executable with :
###RUN chmod +x /usr/sbin/VirtualHub
###
###COPY ./yVirtualHub /etc/init.d/
###RUN chmod +x /etc/init.d/yVirtualHub
###
###RUN rc-update add yVirtualHub boot
####RUN update-rc.d yVirtualHub disable#

#CMD /etc/init.d/yVirtualHub start
##CMD /usr/sbin/VirtualHub
