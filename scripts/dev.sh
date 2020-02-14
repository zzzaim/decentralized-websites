#!/usr/bin/env sh

template=examples/community/$1

if [ -z "$1" ] || [ ! -d "$template" ]; then
  echo "Invalid template: '$1'"
  exit 1
fi

entry=

for ext in .pug .html; do
  if [ -f "$template/src/index${ext}" ]; then
    entry="$template/src/index${ext}"
    break
  fi
done

if [ -n "$entry" ]; then
  export TEMPLATE=$template
  npx parcel -d "$template/dist" "$entry"
else
  echo "Template has no entry point"
  exit 1
fi
