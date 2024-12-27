#!/bin/bash

# Make sure this goes in site
perl Makefile.PL INSTALLDIRS=site X11INC=${PREFIX}/include X11LIB=${PREFIX}/lib
make
make test
make install


# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
