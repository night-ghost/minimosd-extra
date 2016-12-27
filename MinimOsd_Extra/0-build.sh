#!/bin/sh


version(){
    cat version.h | grep 'RELEASE_NUM' | awk '{print $3}'
}

VERS=`version`

make_one(){
    PROTO=$1

    make PROTO="-DUSE_${PROTO}=1 $2 $3"

}


#make_one 'UAVTALK'
#make_one 'MAVLINK' -DDEBUG
make_one 'MAVLINK'
#make_one 'MWII'
#make_one 'LTM' 
#make_one 'NMEA'


#make_one 'MAVLINK' -DWALKERA_TELEM=RssiPin


#make_one 'MAVLINK' -DRADIOLINK_TELEM_SDA=RssiPin -DRADIOLINK_TELEM_SCL=AmperagePin

