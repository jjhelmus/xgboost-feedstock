#!/bin/bash

set -e
set -x

mkdir -p build
cd build

LIBRT=$(find ${BUILD_PREFIX} -name "librt.so")
cmake \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DUSE_CUDA=ON \
    -DCUDA_rt_LIBRARY=${LIBRT} \
    ..
VERBOSE=1 make -j${CPU_COUNT}
