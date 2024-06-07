#!/bin/bash

export PERL_CPANM_HOME=${PREFIX}/tmp/cpanm
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

CPANM="cpanm --from ${SRC_DIR} --mirror-index ${SRC_DIR}/modules/02packages.details.txt --self-contained "

${CPANM} Astro::FITS::CFITSIO::Simple

# Remove cpan work dirs
rm -rf $PERL_CPANM_HOME












