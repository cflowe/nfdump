#!/bin/bash

set -eu -o pipefail

script_dir=$(cd "$(dirname $0)" && pwd -P)

source "${script_dir}/setup.sh"

if [ -f Makefile ]; then
  make maintainer-clean
fi
autoreconf --force --install

"$script_dir/configure" \
	--prefix=/usr \
	--enable-nsel \
	--enable-nfprofile \
	--enable-readpcap

make DESTDIR="$DESTDIR"
make install DESTDIR="$DESTDIR"
