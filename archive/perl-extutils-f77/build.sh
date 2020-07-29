#!/bin/bash

perl Makefile.PL INSTALLDIRS=site
# PREFIX=${PREFIX}/lib/perl LIB=${PREFIX}/lib/perl
make
make install
