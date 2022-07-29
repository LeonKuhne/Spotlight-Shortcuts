#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

vim $script_dir/urls.csv
. $script_dir/run.sh
