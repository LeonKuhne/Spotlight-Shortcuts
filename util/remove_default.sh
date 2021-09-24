#!/bin/bash
source config.sh

cp urls.csv "util/backup-$(date).csv"
cp urls.csv staged.csv
cat staged.csv | sed "s/ $SPOTLIGHT_DEFAULT_BROWSER,//g" > urls.csv
