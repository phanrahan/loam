#!/bin/bash
set -x

err=0
# Use a trap to check for errors, we do this over set -e so that all the tests
# run (so that we may catch multiple errors)
trap 'err=1' ERR

py.test --target ice40    tests/icestick
py.test --target ice40    tests/test_mantle 
py.test --target spartan3 tests/test_mantle
py.test --target spartan6 tests/test_mantle
cd tests
./bake
cd ..

# Return code is nonzero if an error occured
test $err = 0
