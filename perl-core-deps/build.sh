#!/bin/bash

export PERL_CPANM_HOME=${PREFIX}/tmp/cpanm
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PGPLOT_DIR=${PREFIX}/lib
export PYTHON_HOME=${PREFIX}
export OPENSSL_PREFIX=${PREFIX}

CPANM="cpanm --from ${SRC_DIR} --mirror-index ${SRC_DIR}/modules/02packages.details.txt --self-contained "
#CPANM="cpanm --mirror-index /tmp/mconda3/cpan/modules/02packages.details.txt --self-contained --save-dists /tmp/mconda3/cpan  "
${CPANM} Module::Install
${CPANM} ExtUtils::PkgConfig
${CPANM} ExtUtils::MakeMaker
${CPANM} File::Spec
${CPANM} ExtUtils::Installed
${CPANM} --installdeps ExtUtils::Helpers
${CPANM} ExtUtils::Helpers --notest
${CPANM} IO::Tty --configure-timeout 120
${CPANM} Parse::RecDescent
${CPANM} Term::ReadLine::Perl --notest
${CPANM} Term::ReadLine --notest

${CPANM} JSON::PP
${CPANM} Inline
${CPANM} Inline::C --installdeps
${CPANM} Inline::C --notest
${CPANM} Inline::Python
${CPANM} Test::Simple
${CPANM} Convert::UU
${CPANM} File::Map
${CPANM} List::MoreUtils::XS
${CPANM} List::MoreUtils
${CPANM} Module::Compile
${CPANM} Test::Deep
${CPANM} Test::Exception
${CPANM} Test::Warn
${CPANM} Tk --installdeps
${CPANM} Tk --notest

${CPANM} URI
${CPANM} Net::SSLeay
${CPANM} IO::Socket::SSL
${CPANM} LWP::UserAgent
${CPANM} HTTP::Request
${CPANM} XML::Parser
${CPANM} XML::Simple
${CPANM} LWP::Protocol::https --notest
${CPANM} Data::DumpXML
${CPANM} CGI

${CPANM} Term::ReadKey
${CPANM} JSON
${CPANM} Carp::Clan
${CPANM} Bit::Vector
${CPANM} Tree::DAG_Node
${CPANM} Test::Warn
${CPANM} Digest::MD5
${CPANM} Time::Zone
${CPANM} Mail::Filter
${CPANM} IO::File
${CPANM} Cwd
${CPANM} Readonly
${CPANM} File::chdir
${CPANM} YAML::Tiny
${CPANM} Test::Simple
${CPANM} File::Slurp
${CPANM} IO::String
${CPANM} IO::All
${CPANM} Compress::Raw::Zlib
${CPANM} IO::Compress::Base
${CPANM} IO::Compress::Zlib::Constants
${CPANM} Compress::Zlib
${CPANM} Archive::Zip
${CPANM} Tie::IxHash
${CPANM} Clone
${CPANM} Class::MakeMethods --installdeps
${CPANM} Class::MakeMethods --notest

${CPANM} Class::Accessor
${CPANM} Config::General
${CPANM} Hash::Merge
${CPANM} YAML
${CPANM} Expect
${CPANM} Expect::Simple --notest
${CPANM} Params::Validate
${CPANM} Env::Path
${CPANM} Time::JulianDay
${CPANM} Time::Local
${CPANM} File::MMagic
${CPANM} Module::Build
${CPANM} version
${CPANM} Sub::Uplevel
${CPANM} Test::Exception
${CPANM} Text::TabularDisplay
${CPANM} Text::Glob
${CPANM} HTML::Tagset
${CPANM} HTML::Parser

${CPANM} HTML::TableExtract
${CPANM} HTML::Table
${CPANM} IO::Stringy
${CPANM} Decision::Depends
${CPANM} Regexp::Common
${CPANM} Date::Tie
${CPANM} Pod::Usage
${CPANM} Pod::Help
${CPANM} Time::Out
${CPANM} Shell::GetEnv --installdeps
${CPANM} Shell::GetEnv --notest
${CPANM} Module::Find
${CPANM} IPC::System::Simple --installdeps
${CPANM} IPC::System::Simple --notest
${CPANM} Capture::Tiny
${CPANM} Config::PFiles::Path
${CPANM} App::Env
${CPANM} Schedule::Cron --notest
${CPANM} HTML::TreeBuilder
${CPANM} Text::RecordParser
${CPANM} POSIX::strptime
${CPANM} Array::RefElem
${CPANM} SQL::Abstract
${CPANM} Text::FixedLength
${CPANM} Date::Parse
${CPANM} Font::AFM
${CPANM} HTML::FormatText
${CPANM} Module::Install
${CPANM} DBI
${CPANM} DBD::SQLite
${CPANM} Astro::FITS::CFITSIO
${CPANM} Astro::FITS::Header
${CPANM} PDL --notest
${CPANM} Astro::FITS::CFITSIO::CheckStatus
${CPANM} Astro::FITS::CFITSIO::Simple

# Remove cpan work dirs
rm -rf $PERL_CPANM_HOME












