#!/bin/bash
# Copyright (C) 2013 - 2014  Anders Gidenstam  (anders(at)gidenstam.org)
# This file is licensed under the GPL license version 2 or later.
#
# Usage: create_experiment.sh <base dir> <name base>

# Setup paths for gerris.
. /opt/Gerris/setpaths.sh

BASEDIR=$1
BASE=$2

# Hydrodynamic reference point [m].
HRPX=11.62
HRPZ=2.0

ROLLRANGE="-10 -5 0 5 10"
PITCHRANGE="-8 -4 -2 0 2 4 8"

# HRP above water level [m].
HAGL=0.9144 # 3ft
#HAGL=1.2192 # 4ft
#HAGL=1.524  # 5ft
#HAGL=1.8288 # 6ft
##HAGL=2.1336 # 7ft

# Compute actual model offsets.
XOFFSET=`echo -$HRPX | bc`
ZOFFSET=`echo -$HRPZ | bc`

#echo $ZOFFSET
#exit

if [ ! -d ${BASEDIR} ]
then
  mkdir ${BASEDIR}
fi
cd ${BASEDIR}

for roll in ${ROLLRANGE}; do
  for pitch in ${PITCHRANGE}; do
    dir=${BASE}_r${roll}_p${pitch}
    mkdir ${dir}
    transform --tx=$XOFFSET --tz=$ZOFFSET < ../Gokstad.gts.base | transform --rx ${roll} | transform --ry ${pitch} | transform --tz=$HAGL -v > ${dir}/Gokstad.gts

    (cd ${dir}; ln -s ../../buoyancy3D.gfs . )
  done;
done;
