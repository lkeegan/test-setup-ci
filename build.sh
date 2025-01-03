#!/bin/bash

set -e -x

# build static version of oneTBB
git clone -b v2022.0.0 --depth 1 https://github.com/oneapi-src/oneTBB.git
cd oneTBB
mkdir build
cd build
cmake -GNinja .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_C_FLAGS="-fpic -fvisibility=hidden" \
    -DCMAKE_CXX_FLAGS="-fpic -fvisibility=hidden" \
    -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
    -DTBB_ENABLE_IPO=OFF \
    -DTBB_STRICT=OFF \
    -DTBB_TEST=OFF \
    --trace-expand
VERBOSE=1 time ninja tbb