#!/usr/bin/env bash
source .mytts/bin/activate
export OSSIAN=/home/virtuoso_irfan/Ossian
export OSSIAN_LANG=cn
export DATA_NAME=toy_cn_corpus
export RECIPE=naive_01_nn

# Clear
rm -r $OSSIAN/train/$OSSIAN_LANG/speakers/$DATA_NAME/$RECIPE/  $OSSIAN/voices/$OSSIAN_LANG/$DATA_NAME/$RECIPE/

# Run Ossian -c means clean previous shit
python ./scripts/train.py -s $DATA_NAME -l $OSSIAN_LANG $RECIPE -c

# Merlin Training shortcuts
export THEANO_FLAGS=""; python ./tools/merlin/src/run_merlin.py $OSSIAN/train/$OSSIAN_LANG/speakers/$DATA_NAME/$RECIPE/processors/duration_predictor/config.cfg
export THEANO_FLAGS=""; python ./tools/merlin/src/run_merlin.py $OSSIAN/train/$OSSIAN_LANG/speakers/$DATA_NAME/$RECIPE/processors/acoustic_predictor/config.cfg

# Export Model
python ./scripts/util/store_merlin_model.py $OSSIAN/train/$OSSIAN_LANG/speakers/$DATA_NAME/$RECIPE/processors/duration_predictor/config.cfg $OSSIAN/voices/$OSSIAN_LANG/$DATA_NAME/$RECIPE/processors/duration_predictor
python ./scripts/util/store_merlin_model.py $OSSIAN/train/$OSSIAN_LANG/speakers/$DATA_NAME/$RECIPE/processors/acoustic_predictor/config.cfg $OSSIAN/voices/$OSSIAN_LANG/$DATA_NAME/$RECIPE/processors/acoustic_predictor

# Test
mkdir -p $OSSIAN/test/wav/
python ./scripts/speak.py -l $OSSIAN_LANG -s $DATA_NAME -o ./test/wav/cantonese.wav $RECIPE ./test/txt/cantonese.txt
