#!/bin/bash

./Configure -des \
    -Dprefix="${PREFIX}" \
    -Duserelocatableinc \
    -Dusesitecustomize \
    -Dinc_version_list=none \
    -Dman1dir="${PREFIX}/share/man/man1" \
    -Dman3dir="${PREFIX}/share/man/man3" \
    -Dinstallsiteman1dir="${PREFIX}/share/man/man1" \
    -Dinstallsiteman3dir="${PREFIX}/share/man/man3" \
    -Dsiteman1dir="${PREFIX}/share/man/man1" \
    -Dsiteman3dir="${PREFIX}/share/man/man3" \
    -A prepend:ccflags="-I${PREFIX}/include " \
    -A prepend:ldflags="-L${PREFIX}/lib -L/usr/lib64 "


sed -i -e 's|-L/usr/local/lib||g' config.sh
sed -i -e 's|-L/opt/local/lib||g' config.sh
sed -i -e 's|-I/usr/local/include||g' config.sh
sed -i -e 's|-I/opt/local/include||g' config.sh
sed -i -e 's|/usr/local/lib||g' config.sh
sed -i -e 's|/opt/local/lib||g' config.sh
sed -i -e 's|/usr/local/include||g' config.sh
sed -i -e 's|/opt/local/include||g' config.sh
make
#make test
make install



