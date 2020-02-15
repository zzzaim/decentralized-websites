#!/usr/bin/env sh

#
# Run dev server
#

# shellcheck source=./parcel.sh
. "$(dirname "$0")"/parcel.sh

npx parcel "$@" -d "$dist" "$entry"
