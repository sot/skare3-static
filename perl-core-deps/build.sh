#!/bin/bash

export PERL_CPANM_HOME=${PREFIX}/tmp/cpanm
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PYTHONHOME=${PREFIX}
export EXPATLIBPATH=${PREFIX}/lib
export EXPATINCPATH=${PREFIX}/include
export LD=$CC


if [[ `uname` == Darwin  ]]; then
    export CFLAGS="${CFLAGS} -i sysroot ${CONDA_BUILD_SYSROOT}"
fi


CPANM="cpanm --from ${SRC_DIR} --mirror-index ${SRC_DIR}/modules/02packages.details.txt --self-contained "

${CPANM} Module::Build --notest
${CPANM} Date::Tie
${CPANM} Date::Parse --notest
${CPANM} Mail::Filter
${CPANM} YAML::Tiny
${CPANM} YAML
${CPANM} Pegex --installdeps
${CPANM} Pegex --notest
${CPANM} IO::All
${CPANM} IO::File
${CPANM} JSON::PP
${CPANM} JSON
${CPANM} Expect
${CPANM} Expect::Simple
${CPANM} Config::General
${CPANM} File::Spec

# Remove cpan work dirs
rm -rf $PERL_CPANM_HOME

