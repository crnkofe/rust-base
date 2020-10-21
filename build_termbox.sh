#!/bin/bash

git clone https://github.com/tomas/termbox
cd termbox

mkdir build
cd build
cmake ..

make
make install
