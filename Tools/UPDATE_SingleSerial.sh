#!/bin/sh
set -e
set -x

pushd ../libraries/SingleSerial/
git checkout -f master
git fetch origin
git reset --hard origin/master
popd
# git diff # this should show a change to git hash of SingleSerial
git add ../libraries/SingleSerial
git commit -m 'updated SingleSerial submodule'
