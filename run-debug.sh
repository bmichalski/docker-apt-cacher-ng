#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

$DIR/common-run.sh

docker run --volumes-from apt-cacher-ng-data -it bmichalski/apt-cacher-ng bash
