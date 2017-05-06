#!/bin/sh

BUILD='MinimOsd_Extra/build-atmega328'
SRC='MinimOsd_Extra'
RELEASE='Released/FW_+_Char'

version(){
    cat MinimOsd_Extra/version.h | grep 'RELEASE_NUM' | awk '{print $3}'
}

VERS=`version`

make_one(){
    PROTO=$1

    make -C $SRC PROTO="-DUSE_${PROTO}=1"
    [ -f $BUILD/MinimOsd_Extra.hex ] && mv $BUILD/MinimOsd_Extra.hex $RELEASE/MinimOsd_Extra_Uni.${VERS}DV-${PROTO}-release.hex && rm -rf $BUILD

}


# build mavlink first since uavtalk requires extra libraries not included in this source.
make_one 'MAVLINK'
exit
make_one 'UAVTALK'
make_one 'MWII'
make_one 'NMEA'
make_one 'LTM' 


#make_one 'MAVLINK' '-DWALKERA_TELEM=RssiPin' &&
