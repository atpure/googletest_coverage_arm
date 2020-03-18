#!/bin/bash

BASEDIR=$(pwd)

function build {
  mkdir build
  cd build
  cmake ..
  make clean
  make
}

function coverage {
  if [ -d "Coverage" ]; then
    rm -rf Coverage
  fi
  #find -name *.gcno -exec rm {} \;
  #find -name *.gcda -exec rm {} \;
  #./unittest/gtestSample_test

  lcov -c -i -d ./ -o sample_base.info
  lcov -c -d ./ -o sample_test.info
  lcov -a sample_base.info -a sample_test.info -o sample.info
  lcov -r sample.info '/usr/include/*' '/unittest/*' -o sample_filtered.info
  genhtml sample_filtered.info --output-directory=Coverage
}

build
if [ "$1" == "c" ]; then
  coverage
fi
