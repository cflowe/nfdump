#!/bin/bash

set -eu -o pipefail

: ${DESTDIR:=${HOME}/install/nfdump}
version=$(git describe --tags)
name="nfdump-${version}"

./configure "--prefix=${DESTDIR}/usr"
make install

fpm -s dir -t tar -n "$name" \
  -C ${DESTDIR}

bzip2 "${name}.tar"
