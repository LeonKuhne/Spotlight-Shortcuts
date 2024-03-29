#!/bin/bash

# setup dir
OUTPUT_DIR="$SPOTLIGHT_SEARCH_DIR/build"
rm -r "$OUTPUT_DIR"
mkdir "$OUTPUT_DIR"

# parse the config
while read -r line; do

  # parse the line
  name="$(cut -d ',' -f 1 <<< "$line" | xargs)"
  url="$(cut -d ',' -f 2 <<< "$line" | xargs)"
  app=$SPOTLIGHT_DEFAULT_BROWSER

  # optionally, use specified browser 
  optional="$(cut -d ',' -f 3- <<< "$line" | xargs)"
  if [ ! -z "$optional" ]; then
    app=$url
    url=$optional
  fi
  
  # set the url
  script="\
tell application \"$app\"
  activate
  open location \"$url\"
end tell"

  echo -e "$script" > "$OUTPUT_DIR/$name.scpt"

done < "$SPOTLIGHT_SEARCH_DIR/urls.csv" 
