FROM ubuntu:20.04

RUN \
  apt-get update && \
  apt-get install -y \
    apt-cacher-ng

COPY conf/etc/apt-cacher-ng/acng.conf /etc/apt-cacher-ng/acng.conf
COPY conf/set-permissions.sh /set-permissions.sh
COPY conf/entrypoint.sh /entrypoint.sh
RUN chmod u+x /set-permissions.sh
RUN chmod u+x /entrypoint.sh

EXPOSE 3142

ENTRYPOINT [ "/entrypoint.sh" ]

CMD sleep infinity
