#!/usr/bin/env bash

if [ -d .transctipts ]; then
  echo "Creating Python 3 virtualenv"
  virtualenv -p python3 .transcripts
fi
source .transcripts/bin/activate

python ./scripts/c2j.py

deactivate