#!/usr/bin/env bash

cd data/audio
for entry in *.m4a; do
      filename=$(basename -- "$entry")
      filename="${filename%.*}"
      ffmpeg -i "${entry}" "${filename}.wav";
done

## Create wav directory for storing the converted file and then use it later.
## Convert wav files to 16khz 16 bit wav files
mkdir wav
wav_dir=wav
for i in *.wav; do
  ffmpeg -i ${i} -acodec pcm_s16le -ac 1 -ar 16000 ${wav_dir}/${i};
done

## go back to Ossian directory
cd ../..
cp data/wav/*.wav corpus/cn/speakers/toy_cn_corpus/wav

echo "Done."