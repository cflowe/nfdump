#!/bin/bash

set -eu -o pipefail

script_dir=$(cd "$(dirname $0)" && pwd -P)

source "${script_dir}/setup.sh"

version=$(git describe --tags --abbrev=0)
version=${version#v}
name="nfdump-${version}"

install -D /dev/stdin "${DESTDIR}/usr/share/nfdump/VERSION" <<<"$version"

fpm -s dir -t tar -n "$name" -C ${DESTDIR}

gzip "${name}.tar"
