#!/bin/bash

export PGPLOT_DIR=${PREFIX}/lib
perl Makefile.PL INSTALLDIRS=site
make
make install
