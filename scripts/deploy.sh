#!/usr/bin/env sh

#
# Prepare template directiry for deploy
#

# shellcheck source=./build.sh
. "$(dirname "$0")"/build.sh

rm -rf "$dist"
