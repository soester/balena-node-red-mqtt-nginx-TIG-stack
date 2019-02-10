#!/bin/bash
hubversion=34369

image_and_tag="virtualhub:$hubversion"

if [ -z $(docker images -q ${image_and_tag}) ]
then
  echo "${image_and_tag} does not exist, builing image..."
#  docker build --build-arg virtualhubversion=${hubversion} -t ${image_and_tag} Dockerfile
  docker build --build-arg virtualhubversion=${hubversion} -t ${image_and_tag} Dockerfile
fi

docker run --memory 16m -d -p 4444:4444 -ti --restart=always --name yoctopuce --privileged -v /dev/bus/usb:/dev/bus/usb ${image_and_tag} /usr/sbin/VirtualHub
