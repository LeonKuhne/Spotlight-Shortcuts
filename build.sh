#!/bin/bash

# delete old apps
rm -r apps
mkdir apps

# build new apps
cd build
for f in *.scpt; do
	osacompile -o "../apps/open ${f%.*}.app" "$f"
done
cd ..
echo "Done!"
