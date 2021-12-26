#!/bin/bash

# Make script more robust
# Exit on any unset variable
set -o nounset
# Exit when any command fails
set -o errexit
# Prevents errors in a pipeline from being masked
set -o pipefail
current_command=""
last_command=""
# Keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# Echo an error message before exiting
trap '>&2 echo "\"${last_command}\" command filed with exit code $?."' EXIT

chown -R apt-cacher-ng:apt-cacher-ng /var/log/apt-cacher-ng /var/cache/apt-cacher-ng
