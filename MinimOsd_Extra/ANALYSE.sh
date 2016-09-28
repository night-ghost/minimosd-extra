#!/bin/sh

# a try to use static analyser

scan-build --use-cc /usr/local/pkg-i686-pc-linux-gnu/bin/avr-gcc --use-c++ /usr/local/pkg-i686-pc-linux-gnu/bin/avr-g++ \
make PROTO="-DUSE_MAVLINK=1 -I/usr/share/arduino/hardware/tools/avr/avr/include"
