#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

$DIR/common-run.sh

docker run -p 3142:3142 --volumes-from apt-cacher-ng-data --name apt-cacher-ng -d bmichalski/apt-cacher-ng
