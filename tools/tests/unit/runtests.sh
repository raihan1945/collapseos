#!/bin/sh

set -e
set -o pipefail

SCAS=scas
PARTS=../../../parts/z80
APPS=../../../apps
RUNBIN=../../emul/runbin/runbin

for fn in *.asm; do
    echo "Running test ${fn}"
    if ! ${SCAS} -I ${PARTS} -I ${APPS} -o - ${fn} | ${RUNBIN}; then
        echo "failed with code ${PIPESTATUS[1]}"
        exit 1
    fi
done

echo "All tests passed!"
