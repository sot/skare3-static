#!/usr/bin/env python -E

import os
import subprocess
import argparse
import platform

parser = argparse.ArgumentParser(description="Build skare3 Perl packages.")

parser.add_argument("package", type=str, nargs="?",
                    help="Package to build.  All updated packages will be"
                         " built if no package supplied")
parser.add_argument("--build-root", default=".", type=str,
                    help="Path to root directory for output conda build packages."
                         "Default: '.'")
args = parser.parse_args()

req_pkgs = [
    'perl-app-cpanminus',
    'perl-core-deps',
    'perl-ska-classic']

bonus_pkgs = [
    'xtime',
    'perl-extended-deps',
    'perl-chandra-time',
    'perl-cxc-sysarch',
    'perl-app-env-ascds',
    'perl-ska-convert',
    'perl-ska-agasc',
    'perl-ska-web',
    'perl-dbd-sybase',
    'perl-tk']


build_dir = os.path.join(args.build_root, "builds")

system_name = platform.uname().system

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
    cmd = ["conda", "build", "-c", "defaults",
           "--use-local",
           "--perl", "5.26.2", "--croot", build_dir, pkg]

    # Need conda-forge perl on Linux.  Would need to set up a local repo
    # to enforce just that package.  Adding conda-forge after defaults seems
    # to be working on Linux without taking that step (strict-channel-priority
    # does not seem to be an option in conda-build).
    if system_name == 'Linux':
        cmd.extend(["-c", "conda-forge"])
    subprocess.check_call(cmd)
