FROM nodered/node-red-docker:rpi-v8

# installing an editor
USER root
RUN apt-get update && apt-get install nano sense-hat python3-pip
RUN pip-3.2 install pillow
USER node-red

RUN npm install node-red-contrib-resinio
RUN npm install node-red-dashboard
RUN npm install node-red-contrib-credentials
RUN npm install node-red-contrib-yoctopuce
RUN npm install node-red-node-pi-sense-hat

COPY ./settings.js /data/settings.js
