#!/bin/bash

set -ex

mkdir build
cd build
cmake ${CMAKE_ARGS} -G "Ninja" \
      -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DENABLE_TESTS=OFF \
      -DCMAKE_LIBRARY_PATH="${PREFIX}/lib" \
      -DCMAKE_INCLUDE_PATH="${PREFIX}/include" \
      ..

ninja
ninja install
ninja test
