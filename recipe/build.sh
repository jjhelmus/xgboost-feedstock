#!/bin/bash

set -e
set -x

mkdir -p build
cd build

LIBRT=$(find ${BUILD_PREFIX} -name "librt.so")
cmake \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DUSE_CUDA=ON \
    -DR_LIB=ON    \
    -DCUDA_rt_LIBRARY=${LIBRT} \
    ..
make -j${CPU_COUNT} ${VERBOSE_CM}
make install -j${CPU_COUNT} ${VERBOSE_CM}
