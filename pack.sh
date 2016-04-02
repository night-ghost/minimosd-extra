#!/bin/sh


rm -f osd_latest.zip
zip -r osd_latest.zip Released

git add . -A
git commit
git push
