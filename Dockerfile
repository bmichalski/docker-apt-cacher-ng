FROM ubuntu:14.04

RUN \
  apt-get update && \
  apt-get install -y \
    apt-cacher-ng

COPY conf/etc/apt-cacher-ng/acng.conf /etc/apt-cacher-ng/acng.conf
COPY conf/root/fix-permissions.sh /root/fix-permissions.sh

ENV HOME /root

WORKDIR /root

EXPOSE 3142:3142

CMD \
  bash /root/fix-permissions.sh && \
  service apt-cacher-ng start && \
  tail -f /var/log/apt-cacher-ng/*
