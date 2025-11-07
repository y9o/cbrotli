#!/bin/bash

rm -rf ./brotli
git clone --depth=1 https://github.com/google/brotli.git ./brotli
rm *.go *.c *.h *.cc *.br *.bin

rm -rf ./c/
cp -r ./brotli/c/ ./

find ./c/dec/ -type f -exec sed -Ei 's/^#include "(\w+.\w+)"/#include "dec_\1"/' {} +
for f in ./c/dec/*; do
    [ -f "$f" ] || continue
    mv -n "$f" "./c/dec_$(basename "$f")"
done

find ./c/enc/ -type f -exec sed -Ei 's/^#include "(\w+.\w+)"/#include "enc_\1"/' {} +
for f in ./c/enc/*; do
    [ -f "$f" ] || continue
    mv -n "$f" "./c/enc_$(basename "$f")"
done
find ./c/ -type f -exec sed -Ei 's/^#include "..\/common\/(\w+.\w+)"/#include "common_\1"/' {} +

find ./c/common/ -type f -exec sed -Ei 's/^#include "(\w+.\w+)"/#include "common_\1"/' {} +
for f in ./c/common/*; do
    [ -f "$f" ] || continue
    mv -n "$f" "./c/common_$(basename "$f")"
done

for f in ./c/include/brotli/*; do
    [ -f "$f" ] || continue
    mv -n "$f" "./c/brotli_$(basename "$f")"
done

cp -r ./brotli/go/cbrotli/* ./c/

find ./c/ -type f -exec sed -Ei 's/^#include <brotli\/(\w+.\w+)>/#include "brotli_\1"/' {} +
find ./c/ -type f -name "cgo.go" -exec sed -Ei 's/^(\/\/\s#cgo\spkg-config:.*)/\/\/\1\n\/\/#cgo LDFLAGS: -lm/' {} +
find ./c/ -type f \( -name "*.go" -o -name "*.mod" \) -exec sed -Ei 's#github.com/google/brotli/go/cbrotli#github.com/y9o/cbrotli#' {} +

rm ./c/BUILD.bazel ./c/enc_static_init_lazy.cc

find ./c/ -maxdepth 1 -type f -exec mv {} . \;

rm -rf ./c/
rm -rf ./brotli/
