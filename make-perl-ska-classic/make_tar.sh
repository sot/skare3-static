#!/bin/bash

# This should probably use a piped tar or rsync, but this works
tar -C /proj/sot/ska/lib/perl -cvpf libs.tar \
    Chex.pm \
    Decom.pm \
    RDB.pm \
    Read_egse_par.pm \
    Tlm.pm \
    TEvent.pm \
    Quat.pm \
    SysArch.pm \
    Ska/ACACoordConvert.pm \
    Ska/Archive.pm \
    Ska/RunAsp.pm \
    Ska/AcqStatsQuery.pm \
    Ska/DatabaseUtil.pm \
    Ska/CatQuery.pm \
    Ska/Convert.pm \
    Ska/Fetch.pm \
    Ska/HashTable.pm \
    Ska/IO.pm \
    Ska/Message.pm \
    Ska/Obsid.pm \
    Ska/Parse_CM_File.pm \
    Ska/Process.pm \
    Ska/RDB.pm \
    Ska/Report/TimeRange.pm \
    Ska/Run.pm \
    Ska/SQL/Select.pm \
    CXC/Envs/Flight.pm \
    CXC/Envs.pm \
    CXC/Archive.pm \
    Chandra/Tools/ECF.pm \
    Chandra/Tools/elliptical_ECF.fits \
    Chandra/Tools/circular_ECF.fits \
    Chandra/Tools/dmcoords.pm \
    Time/DayOfYear.pm \
    Data/ParseTable.pm \
    Data/Password/Entry.pm \
    CFITSIO/Simple.pm

mkdir -p skaclassic/libs
cd skaclassic/libs
tar -xvpf ../../libs.tar
cd ../..
tar -cvpf skaclassic-0.2.tar skaclassic
gzip skaclassic-0.2.tar


