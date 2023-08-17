FROM ubuntu:22.04

ARG APT_CACHER_NG_BIND_ADDRESS
ARG APT_CACHER_NG_PORT

RUN \
  apt-get update && \
  apt-get install -y \
    apt-cacher-ng

COPY conf/etc/apt-cacher-ng/acng.conf /etc/apt-cacher-ng/acng.conf
COPY conf/set-permissions.sh /set-permissions.sh
COPY conf/entrypoint.sh /entrypoint.sh
RUN chmod u+x /set-permissions.sh
RUN chmod u+x /entrypoint.sh
RUN \
  sed -i \
  "s/__APT_CACHER_NG_BIND_ADDRESS__/${APT_CACHER_NG_BIND_ADDRESS:?}/g" \
  /etc/apt-cacher-ng/acng.conf
RUN \
  sed -i \
  "s/__APT_CACHER_NG_PORT__/${APT_CACHER_NG_PORT:?}/g" \
  /etc/apt-cacher-ng/acng.conf
