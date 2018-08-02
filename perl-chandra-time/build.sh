#!/bin/sh

perl Makefile.PL INSTALLDIRS=site
make
make test
make install
