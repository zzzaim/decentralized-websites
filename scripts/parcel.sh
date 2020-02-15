#
# Change working dir to template's. Run some sanity checks.
#

template=examples/community/$1

if [ -z "$1" ] || [ ! -d "$template" ]; then
  echo "Invalid template: '$1'"
  exit 1
fi

shift

cd "$template" || {
  echo "Cannot change to template dir: '$template'"
  exit 1
}

entry=

for ext in .pug .html; do
  if [ -f "src/index${ext}" ]; then
    entry="src/index${ext}"
    break
  fi
done

if [ -z "$entry" ]; then
  echo "Template has no entry point"
  exit 1
fi

export dist=test
export template
export entry
