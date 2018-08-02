#!/usr/bin/env python

import os
import subprocess

pkgs = ['cfitsio',
	'pgplot',
	'xtime',
	'perl',
        'perl-extutils-f77',
        'perl-app-cpanminus',
        'perl-core-deps',
        'perl-pgplot',
        'perl-chandra-time',
        'perl-ska-convert',
        'perl-cxc-sysarch',
        'perl-app-env-ascds',
        'perl-ska-agasc']
	
if os.uname().sysname == 'Darwin':
   # Not sure if this is really being used by the compiler, but ...
   os.environ["MACOSX_DEPLOYMENT_TARGET"] = "10.9"
   # Remove PGPLOT on OSX
   pkgs.remove('pgplot')
   pkgs.remove('perl-pgplot')

for pkg in pkgs:
   subprocess.check_call(["conda", "build", "--old-build-string", "--skip-existing", "--perl", "5.18.2", pkg])
