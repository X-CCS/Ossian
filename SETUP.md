### Install necessary libraries
Install necessary libraries for TTS.
```shell script
sudo apt-get update
sudo apt-get install libncurses5-dev
sudo apt-get install clang libsndfile1-dev gsl-bin libgsl0-dev libconfig-dev g++-4.8 g++-4.8
sudo apt-get install software-properties-common python-software-properties build-essential libc-dev
sudo apt-get install sox curl libicu-dev python python-dev python-pip python-setuptools unzip wget
sudo apt-get install realpath
sudo apt-get install coreutils
sudo apt-get install autotools-dev
sudo apt-get install automake
sudo apt-get install ffmpeg
```
### STEPS TO TRAIN A TTS
1. Clone and compile Ossian using following shell commands or run `setup.sh` with sudo to install it for you.
```shell script
git clone https://github.com/mirfan899/Ossian.git
cd Ossian
mkdir data/audio
mkdir data/txt
mkdir test/wav
mkdir corpus
mkdir corpus/cn
mkdir corpus/cn/speakers
mkdir corpus/cn/speakers/toy_cn_corpus
mkdir corpus/cn/speakers/toy_cn_corpus/txt
mkdir corpus/cn/speakers/toy_cn_corpus/wav

apt install python-virtualenv
virtualenv -p python2 .mytts
source ./mytts/bin/activate
pip install numpy scipy regex argparse lxml scikit-learn regex configobj python-virtualenv
./scripts/setup_tools.sh mirfan899 Tqveb=Be
```
2. Get audio and transcripts of data and put it in `audio` and `txt` directory
3. Add all transcripts to a text file with following format.
```text
FileName1 Transcript1
FileName2 Transcript2
...
```
Name the file `1000_transcripts.txt`
4. Convert audios to `.wav` format using `ffmpeg`. Or you can run `ffmpeg.sh` to do this for you.
    * Run following scripts in audio directory to convert the files in `.wav` format.
    ```shell script
    for entry in *.m4a
    do
      filename=$(basename -- "$entry")
      filename="${filename%.*}"
      ffmpeg -i "${entry}" "${filename}.wav";
    done
    
    ## Create temp directory for storing the converted file and then use it later.
    ## Convert wav files to 16khz 16 bit wav files
    mkdir wav
    wav_dir=wav
    for i in *.wav; do
      ffmpeg -i ${i} -acodec pcm_s16le -ac 1 -ar 16000 ${wav_dir}/${i};
    done
    ```
5. Convert transcripts of Cantonese to Jyutping by running shell script `convert.sh` to convert `Cantonese` to `Jyutping`
    
6. Copy `.wav` files to  `corpus/cn/speakers/toy_cn_corpus/wav` and `.txt` files to `corpus/cn/speakers/toy_cn_corpus/txt`
7. Train TTS by running `train.sh` and test it by running `test.sh` scripts.