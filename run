#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

APT_CACHER_NG_EXISTS=`docker inspect --format="{{ .Id }}" apt-cacher-ng 2> /dev/null`
APT_CACHER_NG_DATA_EXISTS=`docker inspect --format="{{ .Id }}" apt-cacher-ng-data 2> /dev/null`

if [ -z "$APT_CACHER_NG_DATA_EXISTS" ]
then
  docker run -d -v /var/cache/apt-cacher-ng -v /var/log/apt-cacher-ng --name apt-cacher-ng-data ubuntu:14.04
fi

if ! [ -z "$APT_CACHER_NG_EXISTS" ]
then
  docker kill apt-cacher-ng
  docker rm apt-cacher-ng
fi

docker run -p 3142:3142 --volumes-from apt-cacher-ng-data --name apt-cacher-ng -d bmichalski/apt-cacher-ng
