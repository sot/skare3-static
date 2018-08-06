#!/bin/bash
./Configure -des -Dprefix=${PREFIX} \
            -Duserelocatableinc \
            -Dusesitecustomize \
            -Dman1dir="${PREFIX}/share/man/man1" \
            -Dman3dir="${PREFIX}/share/man/man3" \
            -Dinstallsiteman1dir="${PREFIX}/share/man/man1" \
            -Dinstallsiteman3dir="${PREFIX}/share/man/man3" \
            -Dsiteman1dir="${PREFIX}/share/man/man1" \
            -Dsiteman3dir="${PREFIX}/share/man/man3" \
            -A prepend:ldflags=" -headerpad_max_install_names -L${PREFIX}/lib " \
	    -A prepend:lddlflags=" -headerpad_max_install_names -L${PREFIX}/lib " \
            -A prepend:cflags=" -I${PREFIX}/include " \

make
#make test
make install

