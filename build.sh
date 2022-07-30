#!/bin/bash

# delete old apps
apps_dir=$SPOTLIGHT_SEARCH_DIR/apps
rm -r "$apps_dir"
mkdir "$apps_dir"

# determine prefix
if [ ! -z $SPOTLIGHT_SHORTCUT_PREFIX ]; then
  prefix="$SPOTLIGHT_SHORTCUT_PREFIX "
fi

# build new apps
cd $SPOTLIGHT_SEARCH_DIR/build
for f in *.scpt; do
  echo "$f"
  osacompile -o "$apps_dir/${prefix}${f%.*}.app" "$f"
done
cd -
echo "Done!"
