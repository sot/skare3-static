#!/bin/bash
if [ `uname` == Darwin ]; then
    export CFLAGS=" -Wl,-headerpad_max_install_names "
    export LDFLAGS=" -headerpad_max_install_names "
fi

./configure --prefix=$PREFIX
make
make install

