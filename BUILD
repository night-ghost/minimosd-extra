Basic build instructions by Marc MERLIN

1) install arduino-mk
saruman:~/RC/OSD/minimosd-extra-1$ ./build.sh 
make: Entering directory '/home/merlin/RC/OSD/minimosd-extra-1/MinimOsd_Extra'
Makefile:109: /usr/share/arduino/Arduino.mk: No such file or directory
=> apt-get install arduino-mk (1.5.2-1)



2) Get up to date gcc-avr:
/usr/bin/avr-g++ -MMD -c -mmcu=atmega328p -DF_CPU=16000000 -DARDUINO=101  -D__PROG_TYPES_COMPAT__ -I/usr/share/arduino/hardware/arduino//cores/arduino -I/usr/share/arduino/hardware/arduino//variants/standard     -I../libraries/GCS_MAVLink   -I../libraries/SingleSerial   -I../libraries/TimerSerial -Wall -ffunction-sections -fdata-sections -Os -fpermissive -fno-exceptions -Wno-deprecated-declarations -std=gnu++11  -fno-exceptions -Wl,--gc-sections -fno-threadsafe-statics -ffast-math  -finline-functions-called-once  -finline-small-functions -fno-data-sections -fmerge-all-constants -fmerge-constants -fomit-frame-pointer  -fno-optimize-sibling-calls  -fno-early-inlining  -fno-aggressive-loop-optimizations -fassociative-math -freciprocal-math -fno-signed-zeros -fno-trapping-math -fsingle-precision-constant -fno-caller-saves -funsigned-bitfields -fipa-pta  -fwrapv -fverbose-asm -DUSE_UAVTALK=1 -mcall-prologues  -Wl,--relax  -felide-constructors -std=c++0x -fconserve-space -fno-enforce-eh-specs -fno-rtti -fvisibility-inlines-hidden OSD_Max7456.cpp -o build-atmega328/OSD_Max7456.cpp.o
cc1plus: error: unrecognized command line option "-std=gnu++11"
cc1plus: error: unrecognized command line option "-fno-aggressive-loop-optimizations"
=> apt-get install gcc-avr
Get:1 http://ftp.us.debian.org/debian testing/main amd64 avr-libc all 1:1.8.0+Atmel3.5.0-1 [4,368 kB]
Get:2 http://ftp.us.debian.org/debian testing/main amd64 binutils-avr amd64 2.26.20160125+Atmel3.5.3-1 [1,316 kB]
Get:3 http://ftp.us.debian.org/debian testing/main amd64 gcc-avr amd64 1:4.9.2+Atmel3.5.3-1 [12.4 MB]


3) Get SingleSerial
OSD_Max7456.cpp:3:26: fatal error: SingleSerial.h: No such file or directory
 #include <SingleSerial.h>
                          ^
compilation terminated.
/usr/share/arduino/Arduino.mk:1233: recipe for target 'build-atmega328/OSD_Max7456.cpp.o' failed

=> saruman:~/RC/OSD/minimosd-extra-1$ git submodule init
Submodule 'libraries/SingleSerial' (https://github.com/night-ghost/SingleSerial.git) registered for path 'libraries/SingleSerial'
saruman:~/RC/OSD/minimosd-extra-1$ git submodule update
Cloning into '/home/merlin/RC/OSD/minimosd-extra-1/libraries/SingleSerial'...
Submodule path 'libraries/SingleSerial': checked out '11023f27c9d130c8d46a0c8a15d491fe10c3a273'


4) Try build, note that only mavlink will build, UAVTALK will not build out of the box since 
necessary libraries/code are not included with this source.
