#!/bin/bash

./configure --prefix ${PREFIX}/build
make
# this just installs it in the build directory
make install
export PGPLOT_DIR=${PREFIX}/lib
mkdir -p ${PGPLOT_DIR}
cp -p ${PREFIX}/build/lib/lib* ${PGPLOT_DIR}
cp -p ${PREFIX}/build/bin/* ${PGPLOT_DIR}
cp -p ${PREFIX}/build/include/pgplot/cpgplot.h ${PGPLOT_DIR}
cp -p ${PREFIX}/build/libexec/pgplot/grfont.dat ${PGPLOT_DIR}
cp -p ${PREFIX}/build/libexec/pgplot/rgb.txt ${PGPLOT_DIR}
