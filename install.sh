#!/bin/bash
apt-get update
apt-get -y install autoconf automake libtool ncompress make gcc git libexpat1-dev libapr1-dev libconfuse-dev libpcre3-dev rrdtool gperf pkg-config libaprutil1-dev libcurl4-openssl-dev libperl-dev librrd-dev build-essential python-dev libdbi0-dev devscripts
if [ ! -d "~/ws" ]; then
  mkdir ~/ws && git clone git://git.code.sf.net/p/git2dist/code ~/ws/git2dist
fi
if [ ! -d "~/monitor-core" ]; then
  git clone -b feature/cloud https://github.com/satterly/monitor-core ~/monitor-core
fi
cd ~/monitor-core
./bootstrap
./configure --enable-cloud --with-gmetad
make
