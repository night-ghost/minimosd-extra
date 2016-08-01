#!/bin/sh


version(){
    cat version.h | grep 'RELEASE_NUM' | awk '{print $3}'
}

VERS=`version`

make_one(){
    PROTO=$1

    make PROTO="-DUSE_${PROTO}=1"

}


make_one 'UAVTALK'
#make_one 'MAVLINK'
#make_one 'MWII' &&
#make_one 'LTM' 
