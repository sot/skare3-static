#!/bin/bash

if [ `uname` == Linux ]; then
    cp -a ${RECIPE_DIR}/prefixMakefile Makefile
    sed -i "s|%CONDA_PREFIX%|${PREFIX}|g" Makefile
    make
fi
if [ `uname` == Darwin ]; then
    env INLINE_PYTHON_EXECUTABLE=${PREFIX}/bin/python perl Makefile.PL
    make
fi
make install


