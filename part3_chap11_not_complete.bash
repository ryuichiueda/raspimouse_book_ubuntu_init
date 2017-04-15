#!/bin/bash -e
# (c) 2017 Ryuichi Ueda
# This software is released under the MIT License, see LICENSE.

# This script installs software of chap 11.

### chapter 11 ###
sudo apt -y install alsa-utils
amixer -c 1 sset Mic 100%

cd
wget https://github.com/julius-speech/julius/archive/v4.4.2.tar.gz
wget https://github.com/julius-speech/dictation-kit/archive/dictation-kit-v4.3.1.tar.gz

tar zxvf dic*.tar.gz
tar zxvf *4.4.2.tar.gz
cd julius-4.4.2/
./configure
make
sudo make install

echo 'snd-pcm-oss'	|
sudo tee /etc/modules

echo 'options snd slots=snd_usb_audio'	|
sudo tee /etc/modprobe.d/alsa-base.conf
echo 'options snd_usb_audio index=0'	|
sudo tee -a /etc/modprobe.d/alsa-base.conf

cd ../dictation-kit-dictation-kit-v4.3.1

cat << FIN > command.yomi
右 みぎ
左 ひだり
前 まえ
後 うしろ
FIN

chmod +x ./bin/common/yomi2voca.pl

iconv -f utf8 -t eucjp command.yomi		|
./bin/common/yomi2voca.pl > command.dic

cat << 'FIN' > command.conf
-w command.dic #追加
#-d model/lang_m/bccwj.60k.bingram #コメントアウト
#-v model/lang_m/bccwj.60k.htkdic #コメントアウト
-h model/phone_m/jnas-tri-3k16-gid.binhmm #追加
-hlist model/phone_m/logicalTri
-lmp 8.0 -2.0
-lmp2 8.0 -2.0
-b 1500
-b2 100
-s 500
-m 10000
-n 30
-output 1
-zmeanframe
-rejectshort 800
-charconv EUC-JP UTF-8 #追加
FIN
