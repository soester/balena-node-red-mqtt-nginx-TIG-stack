#!/bin/bash
hubversion=34369

image_and_tag="virtualhub:$hubversion"

if [ -z $(docker images -q ${image_and_tag}) ]
then
  echo "${image_and_tag} does not exist, builing image..."
#  docker build --build-arg virtualhubversion=${hubversion} -t ${image_and_tag} Dockerfile
  docker build --build-arg virtualhubversion=${hubversion} -t ${image_and_tag} yoctopuce/Dockerfile
fi

docker run -d --name virtualhub -p 4444:4444 --privileged -v /dev/bus/usb:/dev/bus/usb -u 997 --restart=always ${image_and_tag} /usr/src/yocto/${virtualhub}/armhf/VirtualHub
