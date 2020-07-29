#!/bin/sh

export LD=$CC
alias g++=$CXX

perl Makefile.PL INSTALLDIRS=site
make
make test
make install
