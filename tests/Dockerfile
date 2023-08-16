FROM ubuntu:20.04

ARG APT_CACHER_NG_HOST
ARG APT_CACHER_NG_PORT

RUN echo "Acquire::http { Proxy \"http://${APT_CACHER_NG_HOST:?}:${APT_CACHER_NG_PORT:?}\"; };" > /etc/apt/apt.conf.d/00proxy
RUN echo "Acquire::http::Timeout \"2\";" > /etc/apt/apt.conf.d/99timeout
RUN echo "Acquire::ftp::Timeout \"2\";" >> /etc/apt/apt.conf.d/99timeout

RUN \
  apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y vim iputils-ping
