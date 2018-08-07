#!/usr/bin/env python -E

import os
import subprocess
import argparse

parser = argparse.ArgumentParser(description="Build skare3 Perl packages.")

parser.add_argument("package", type=str, nargs="?",
                    help="Package to build.  All updated packages will be built if no package supplied")
parser.add_argument("--build-root", default=".", type=str,
                    help="Path to root directory for output conda build packages."
                         "Default: '.'")
args = parser.parse_args()

all_pkgs = ['cfitsio',
            'pgplot',
            'xtime',
            'perl_5.26',
            'perl-extutils-f77',
            'perl-app-cpanminus',
            'perl-core-deps',
            'perl-pgplot',
            'perl-chandra-time',
            'perl-ska-convert',
            'perl-cxc-sysarch',
            'perl-app-env-ascds',
            'perl-ska-agasc',
            'perl-ska-classic',
            'ska3-perl']


if os.uname().sysname == 'Darwin':
   # Not sure if this is really being used by the compiler, but ...
   os.environ["MACOSX_DEPLOYMENT_TARGET"] = "10.9"
   all_pkgs.remove('pgplot')
   all_pkgs.remove('perl-pgplot')


build_dir = os.path.join(args.build_root, "builds")

# If a package is requested, do that, else everything.
if args.package is None:
   pkgs = all_pkgs
else:
   pkgs = [args.package]

for pkg in pkgs:
   subprocess.check_call(["conda", "build", "--old-build-string", "--skip-existing",
                          "--perl", "5.26.2", "--croot", build_dir, pkg])
