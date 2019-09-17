#!/usr/bin/env bash

sudo apt-get install libncurses5-dev
sudo apt-get install clang libsndfile1-dev gsl-bin libgsl0-dev libconfig-dev g++-4.8 g++-4.8
sudo apt-get install software-properties-common python-software-properties build-essential libc-dev
sudo apt-get install sox curl libicu-dev python python-dev python-pip python-setuptools unzip wget
sudo apt-get install realpath
sudo apt-get install coreutils
sudo apt-get install autotools-dev
sudo apt-get install automake
sudo apt-get install ffmpeg
sudo apt-get update

git clone https://github.com/mirfan899/Ossian.git
cd Ossian
mkdir data
mkdir data/audio
mkdir data/txt
mkdir corpus
mkdir corpus/cn
mkdir corpus/cn/speakers
mkdir corpus/cn/speakers/toy_cn_corpus
mkdir corpus/cn/speakers/toy_cn_corpus/txt
mkdir corpus/cn/speakers/toy_cn_corpus/wav

apt install python-virtualenv
virtualenv -p python2 .mytts
source .mytts/bin/activate
pip install numpy scipy regex argparse lxml scikit-learn regex configobj python-virtualenv
./scripts/setup_tools.sh mirfan899 Tqveb=Be

