#!/bin/bash

set -eu -o pipefail

if ! type -a fpm &> /dev/null; then
  if  [ -x /opt/cybraics/bin/fpm ]; then
    PATH=$PATH:/opt/cybraics/bin
  fi
fi

script_dir=$(cd "$(dirname $0)" && pwd -P)

fpm -s dir -t rpm -n nfdump \
  -v '1.6.15+cyb' \
  --iteration 4 \
  --license 'BSD and GPLv2+' \
  --url https://github.com/cflowe/nfdump \
  -C ${DESTDIR:-$HOME/install/nfdump} \
  --description "Nfdump is a set of tools to collect and process NetFlow data. It's fast and has a powerful filter pcap like syntax. It supports NetFlow versions v1, v5, v7, v9 and IPFIX as well as a limited set of sflow. It includes support for CISCO ASA (NSEL) and CISCO NAT (NEL) devices which export event logging records as v9 flows. Nfdump is fully IPv6 compatible"\
  -d 'nfdump-libs = 1.6.15+cyb' \
  -d 'bzip2 >= 1.0.6' \
  -d 'libpcap >= 1.5.3' \
  -d 'zlib >= 1.0.2' \
  -d 'rrdtool >= 1.4.8' \
  usr/bin usr/share

fpm -s dir -t rpm -n nfdump-libs \
  -v '1.6.15+cyb' \
  --iteration 4 \
  --license 'BSD and GPLv2+' \
  --url https://github.com/cflowe/nfdump \
  -C ${DESTDIR:-$HOME/install/nfdump} \
  --post-install  "${script_dir}/fpm-post-install.sh" \
  --description "Nfdump is a set of tools to collect and process NetFlow data. It's fast and has a powerful filter pcap like syntax. It supports NetFlow versions v1, v5, v7, v9 and IPFIX as well as a limited set of sflow. It includes support for CISCO ASA (NSEL) and CISCO NAT (NEL) devices which export event logging records as v9 flows. Nfdump is fully IPv6 compatible"\
  -d 'bzip2 >= 1.0.6' \
  -d 'libpcap >= 1.5.3' \
  -d 'zlib >= 1.0.2' \
  -d 'rrdtool >= 1.4.8' \
  usr/lib
