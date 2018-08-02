#!/bin/bash

chmod +x ${RECIPE_DIR}/cpanm
cp -a ${RECIPE_DIR}/cpanm ${PREFIX}/bin
sed -i.bak "s|PREFIXPERL|${PREFIX}/bin/perl|" ${PREFIX}/bin/cpanm



