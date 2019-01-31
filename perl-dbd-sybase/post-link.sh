#!/bin/bash

# use patchelf to set rpath to the SYBASE lib dir so it won't need LD_LIBRARY_PATH
if [ -e /soft/SYBASE15.7/OCS-15_0/lib ]
then
    patchelf --set-rpath /soft/SYBASE15.7/OCS-15_0/lib ${PREFIX}/lib/site_perl/5.26.2/x86_64-linux/auto/DBD/Sybase/Sybase.so
else
    echo "Not patching rpath for perl-dbd-sybase. /soft/SYBASE15.7 not on this system"
fi
