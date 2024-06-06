#!/usr/bin/env python -E

import os
import subprocess
import argparse
import platform

parser = argparse.ArgumentParser(description="Build skare3 Perl packages.")

parser.add_argument("package", type=str, nargs="?",
                    help="Package to build. With no argument, only required packages "
                    "are built.  With 'all' argument, required and bonus packages build "
                    "on linux.")
parser.add_argument("--build-root", default=".", type=str,
                    help="Path to root directory for output conda build packages."
                         "Default: '.' (makes 'builds' dir)")
args = parser.parse_args()

req_pkgs = []

system_name = platform.uname().system
machine = platform.uname().machine

# Linux seems to need a built cpanminus for perl-extended-deps to work
if system_name == 'Linux':
    req_pkgs.append('perl-app-cpanminus')

# perl-io-tty won't build on mac x86_64 but we want to build it on the other two
# platforms
if (system_name == 'Linux') or ((system_name == 'Darwin') and (machine == 'arm64')):
    req_pkgs.append('perl-io-tty')

# For all platforms, these two are needed
req_pkgs += ['perl-core-deps',
             'perl-ska-classic']

bonus_pkgs = [
    'xtime',
    'perl-extended-deps',
    'perl-pdl',
    'perl-astro-fits-cfitsio-simple',
    'perl-chandra-time',
    'perl-cxc-sysarch',
    'perl-app-env-ascds',
    'perl-ska-convert',
    'perl-ska-agasc',
    'perl-ska-web',
    'perl-dbd-sybase',
    'perl-tk']


build_dir = os.path.join(args.build_root, "builds")


# If a package is requested, do that, else everything.
if args.package is None:
    pkgs = req_pkgs
elif args.package == 'all':
    if system_name == 'Darwin':
        print("Building all packages only supported on Linux")
        exit(1)
    pkgs = req_pkgs + bonus_pkgs
else:
    pkgs = [args.package]


for pkg in pkgs:
    cmd = ["conda", "build", "-c", "conda-forge",
           "--use-local",
           "--perl", "5.32.1", "--python", "3.11", "--numpy", "1.26.4", "--croot", build_dir, pkg]

    # Need conda-forge perl on Linux.  Would need to set up a local repo
    # to enforce just that package.  Adding conda-forge after defaults seems
    # to be working on Linux without taking that step (strict-channel-priority
    # does not seem to be an option in conda-build).
    subprocess.check_call(cmd)

