#!/bin/bash

set -eu -o pipefail

fpm -s dir -t rpm -n nfdump \
  -v '1.6.15+cyb' \
  --iteration 2 \
  -C ${DESTDIR:-/home/cflowe/install/nfdump} \
  -d 'bzip2 >= 1.0.6' \
  -d 'libpcap >= 1.5.3' \
  -d 'zlib >= 1.0.2' \
  -d 'rrdtool >= 1.4.8' \
  usr
