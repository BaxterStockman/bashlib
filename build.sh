#!/usr/bin/env bash

make clean || :
./configure --prefix="$HOME" &>/dev/null
make
make install
