#!/bin/bash
export CFLAGS=" -Wl,-headerpad_max_install_names "
export LDFLAGS=" -headerpad_max_install_names "
./configure --prefix=$PREFIX
make
make install

