#!/usr/bin/env sh

#
# Copies FontAwesome / Crypto icons into template dir
#

usage() {
  echo "Usage: $(basename "$0") (--fontawesome|-f|--crypto|-c) <icon> <template-name>"
}

src=$1
ico=$2
tpl=$3
dir=

case "$src" in
  --fontawesome|-f)
    dir=node_modules/@fortawesome/fontawesome-free/svgs
    ;;
  --crypto|-c)
    dir=node_modules/cryptocurrency-icons/svg
    true
    ;;
  *)
    echo "Invalid option: '$src'"
    echo
    usage
    exit 1
esac

if [ -z "$ico" ] || [ -z "$tpl" ]; then
  usage
  exit 1
fi

tpl_dir=examples/community/$tpl

if [ ! -d "$tpl_dir" ]; then
  echo "No such template: '$tpl_dir'"
  echo
  usage
  exit 1
fi

ico_file=$dir/$ico

if [ ! -f "$ico_file" ]; then
  echo "No such icon: '$ico_file'"
  exit 1
fi

mkdir -p "$tpl_dir/src/images"
cp -v "$ico_file" "$tpl_dir/src/images"
