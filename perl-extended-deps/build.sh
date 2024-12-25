#!/bin/bash

export PERL_CPANM_HOME=${PREFIX}/tmp/cpanm
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PGPLOT_DIR=${PREFIX}/lib
export PYTHON_HOME=${PREFIX}
export OPENSSL_PREFIX=${PREFIX}
export EXPATLIBPATH=${PREFIX}/lib
export EXPATINCPATH=${PREFIX}/include
export LD=$CC

CPANM="cpanm --from ${SRC_DIR} --mirror-index ${SRC_DIR}/modules/02packages.details.txt --self-contained "

${CPANM} ExtUtils::MakeMaker::CPANfile
${CPANM} Time::Out
${CPANM} Schedule::Cron --installdeps
${CPANM} Schedule::Cron --notest
${CPANM} YAML
${CPANM} HTML::TableExtract

${CPANM} File::Map
${CPANM} Module::Install
${CPANM} ExtUtils::PkgConfig
${CPANM} ExtUtils::MakeMaker
${CPANM} File::Spec
${CPANM} ExtUtils::Installed
${CPANM} ExtUtils::Helpers --installdeps
${CPANM} ExtUtils::Helpers --notest
${CPANM} IO::Tty --configure-timeout 120
${CPANM} Parse::RecDescent
${CPANM} Term::ReadLine::Perl --notest

${CPANM} Inline --notest
${CPANM} Inline::C --installdeps
${CPANM} Inline::C --notest
${CPANM} Test::Simple
${CPANM} Convert::UU
${CPANM} File::Map
${CPANM} List::MoreUtils::XS
${CPANM} List::MoreUtils
${CPANM} Module::Compile
${CPANM} Test::Deep
${CPANM} Test::Exception

${CPANM} URI
${CPANM} Net::SSLeay --notest
${CPANM} IO::Socket::SSL
${CPANM} Time::Zone --installdeps
${CPANM} Time::Zone --notest
${CPANM} HTTP::Request
${CPANM} LWP::UserAgent
${CPANM} XML::Parser
${CPANM} XML::Simple
${CPANM} LWP::Protocol::https --notest
${CPANM} Data::DumpXML
${CPANM} CGI

${CPANM} Term::ReadKey

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
${CPANM} Test::Simple
${CPANM} File::Slurp
${CPANM} IO::String
${CPANM} IO::All
${CPANM} Compress::Raw::Zlib
${CPANM} IO::Compress::Base
${CPANM} IO::Compress::Zlib::Constants
${CPANM} Compress::Zlib
${CPANM} Archive::Zip --installdeps
${CPANM} Archive::Zip --notest
${CPANM} Clone
${CPANM} Class::MakeMethods --installdeps
${CPANM} Class::MakeMethods --notest

${CPANM} Class::Accessor
${CPANM} Hash::Merge
${CPANM} Params::Validate
${CPANM} Env::Path
${CPANM} Time::JulianDay
${CPANM} Time::Local
${CPANM} File::MMagic
${CPANM} version

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
${CPANM} Pod::Usage
${CPANM} Pod::Help


${CPANM} Shell::GetEnv --notest
${CPANM} Module::Find
${CPANM} IPC::System::Simple
${CPANM} Capture::Tiny
${CPANM} Config::PFiles::Path

${CPANM} App::Env
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
${CPANM} Class::MethodMaker
${CPANM} Term::ProgressBar
${CPANM} Alien::CFITSIO --installdeps
${CPANM} PDL --installdeps

# Remove cpan work dirs
rm -rf $PERL_CPANM_HOME











