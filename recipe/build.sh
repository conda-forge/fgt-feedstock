#!/bin/bash

set -ex

mkdir build
cd build
cmake ${CMAKE_ARGS} -G "Unix Makefiles" \
      -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DENABLE_TESTS=OFF \
      -DCMAKE_LIBRARY_PATH="${PREFIX}/lib" \
      -DCMAKE_INCLUDE_PATH="${PREFIX}/include" \
      ..

# CircleCI offers two cores.
make -j $CPU_COUNT
make install

if [ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]; then

    echo "Cant run tests because we are cross compiling"
else
    make test

fi

