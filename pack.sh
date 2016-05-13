#!/bin/sh

version(){
    cat MinimOsd_Extra/version.h | grep 'RELEASE_NUM' | awk '{print $3}'
}

[ -f MinimOsd_Extra/build-atmega328/MinimOsd_Extra.hex ] && mv MinimOsd_Extra/build-atmega328/MinimOsd_Extra.hex Released/FW\ &\ Char\MinimOsd_Extra_Uni.`version`DV-release.hex

rm -rf MinimOsd_Extra/build-atmega328
rm -f osd_latest.zip
zip -r osd_latest.zip Released

git add . -A
git commit
git push
