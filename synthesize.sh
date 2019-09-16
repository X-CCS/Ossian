#!/usr/bin/env bash
source .mytts/bin/activate
export OSSIAN=/home/virtuoso_irfan/Ossian
export OSSIAN_LANG=cn
export DATA_NAME=toy_cn_corpus
export RECIPE=naive_01_nn
mkdir -p $OSSIAN/test/wav/
python ./scripts/speak.py -l $OSSIAN_LANG -s $DATA_NAME -o ./test/wav/cantonese.wav $RECIPE ./test/txt/cantonese.txt