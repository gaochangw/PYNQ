#! /bin/bash

set -e
set -x

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp $SCRIPT_DIR/libsigrokdecode.diff $1

# Stage cached sigrok tarballs into chroot to avoid downloading from sigrok.org
if [ -d /tmp/sigrok-cache ]; then
    mkdir -p $1/sigrok-cache
    cp /tmp/sigrok-cache/*.tar.gz $1/sigrok-cache/ 2>/dev/null || true
fi
