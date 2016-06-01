#!/bin/sh

BUILD='MinimOsd_Extra/build-atmega328'
SRC='MinimOsd_Extra'
RELEASE='Released/FW_+_Char'

version(){
    cat MinimOsd_Extra/version.h | grep 'RELEASE_NUM' | awk '{print $3}'
}

VERS=`version`

make -C $SRC PROTO='-DUSE_UAVTALK=1'
[ -f $BUILD/MinimOsd_Extra.hex ] && mv $BUILD/MinimOsd_Extra.hex $RELEASE/MinimOsd_Extra_Uni.${VERS}DV-UAVTALK-release.hex
rm -rf $BUILD


make -C $SRC PROTO='-DUSE_MAVLINK=1'
[ -f $BUILD/MinimOsd_Extra.hex ] && mv $BUILD/MinimOsd_Extra.hex $RELEASE/MinimOsd_Extra_Uni.${VERS}DV-MAVLINK-release.hex
rm -rf $BUILD


make -C $SRC PROTO='-DUSE_MWII=1'
[ -f $BUILD/MinimOsd_Extra.hex ] && mv $BUILD/MinimOsd_Extra.hex $RELEASE/MinimOsd_Extra_Uni.${VERS}DV-MWII-release.hex
rm -rf $BUILD

make -C $SRC PROTO='-DUSE_LTM=1'
[ -f $BUILD/MinimOsd_Extra.hex ] && mv $BUILD/MinimOsd_Extra.hex $RELEASE/MinimOsd_Extra_Uni.${VERS}DV-LTM-release.hex
rm -rf $BUILD

