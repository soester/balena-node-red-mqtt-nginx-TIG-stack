FROM resin/raspberrypi3-debian:latest

ENV INITSYSTEM on

RUN apt-get update && apt-get install -yq \
  python3 \
  python3-sense-hat \
  python3-pip \
  wget && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip3 install yoctopuce


COPY ./command.py /data/sense-hat/command.py
WORKDIR /data/sense-hat/

CMD ["python3", "command.py"]
