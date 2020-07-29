#!/bin/bash

cd ${PREFIX}/lib
if [ ! -e libcpgplot.so.5 ];
then
    ln -s libcpgplot.so libcpgplot.so.5
fi
