#!/bin/sh

version(){
    cat MinimOsd_Extra/version.h | grep 'RELEASE_NUM' | awk '{print $3}'
}

RELEASE='Released/FW_+_Char'
BUILD='MinimOsd_Extra/build-atmega328'

#[ -f $BUILD/MinimOsd_Extra.hex ] && mv $BUILD/MinimOsd_Extra.hex $RELEASE/MinimOsd_Extra_Uni.`version`DV-release.hex

rm -rf $BUILD
rm -f osd_latest.zip
zip -r osd_latest.zip Released

git add . -A
git commit
git push
