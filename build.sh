#!/bin/bash
source config.sh

# delete old apps
rm -r apps
mkdir apps

# determine prefix
if [ ! -z $SPOTLIGHT_SHORTCUT_PREFIX ]; then
  prefix="$SPOTLIGHT_SHORTCUT_PREFIX "
fi

# build new apps
cd build
for f in *.scpt; do
	osacompile -o "../apps/${prefix}${f%.*}.app" "$f"
done
cd ..
echo "Done!"
