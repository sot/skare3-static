#!/usr/bin/env python -E

import os
import subprocess
import argparse

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
    'perl-core-deps']

bonus_pkgs = [
    'xtime',
    'perl-extended-deps',
    'perl-ska-classic',
    'perl-chandra-time',
    'perl-cxc-sysarch',
    'perl-app-env-ascds',
    'perl-ska-convert',
    'perl-ska-agasc',
    'perl-ska-web']


build_dir = os.path.join(args.build_root, "builds")

# If a package is requested, do that, else everything.
if args.package is None:
    pkgs = req_pkgs
elif args.package == 'all':
    pkgs = req_pkgs + bonus_pkgs
else:
    pkgs = [args.package]

for pkg in pkgs:
    subprocess.check_call(["conda", "build", "--use-local",
                           "--perl", "5.26.2", "--croot", build_dir, pkg])
