#!/bin/bash

#rm -f PWD.factory
#echo DB=aca_tstdb > PWD.factory
#echo SRV=sybase >> PWD.factory
#echo UID=aca_test >> PWD.factory
#echo PWD=`cat /proj/sot/ska/data/aspect_authorization/sybase-aca_tstdb-aca_test` >> PWD.factory
#chmod og-rwx PWD.factory

export SYBASE='/soft/SYBASE16.0'
export SYBASE_OCS='OCS-16_0'
export SYB_LIB_DIR=/soft/SYBASE16.0/OCS-16_0/lib
perl -i -pe 's/$lddlflags = "-L/$lddlflags = "-Wl,-rpath,$ENV{SYB_LIB_DIR} -L/' Makefile.PL

perl Makefile.PL INSTALLDIRS=site --accept_test_defaults --chained Y --threaded_libs N
make
#make test
make install

