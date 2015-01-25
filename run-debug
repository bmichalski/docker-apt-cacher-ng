#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

APT_CACHER_NG_DATA_EXISTS=`docker inspect --format="{{ .Id }}" apt-cacher-ng-data 2> /dev/null`

if [ -z "$APT_CACHER_NG_DATA_EXISTS" ]
then
  docker run -d -v /var/cache/apt-cacher-ng -v /var/log/apt-cacher-ng --name apt-cacher-ng-data debian
fi

docker run --volumes-from apt-cacher-ng-data -it bmichalski/apt-cacher-ng bash
