#!/usr/bin/env sh

#
# Builds template
#

# shellcheck source=./parcel.sh
. "$(dirname "$0")"/parcel.sh

rm -rf "$dist"

npx parcel build "$@" \
  --no-cache \
  --no-autoinstall \
  --no-content-hash \
  --no-source-maps \
  --public-url "./" \
  -d "$dist" "$entry" || {
  echo
  echo "Build failed. See error message above."
  exit 1
}

if [ -f "$dist/index.html" ]; then
  echo
  echo "'$dist/index.html' -> 'index.html' (reformatted)"
  npx prettier "$dist/index.html" > index.html
  cp -v "$dist"/*.css "$dist"/*.jpg .
fi
