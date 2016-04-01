# Arduino Make file. Refer to https://github.com/sudar/Arduino-Makefile

# if you have placed the alternate core in your sketchbook directory, then you can just mention the core name alone.
#ALTERNATE_CORE = atmega
# If not, you might have to include the full path.
#ALTERNATE_CORE_PATH = /home/sudar/Dropbox/code/arduino-sketches/hardware/attiny/

BOARD_TAG    = atmega328
VARIANT    = standard
F_CPU = 16000000


#nothing
#OPT = -faggressive-loop-optimizations -fassociative-math -fauto-inc-dec  -fbranch-probabilities -fbranch-target-load-optimize -fbranch-target-load-optimize2 -fdelayed-branch 
# -floop-strip-mine -foptimize-strlen -fpack-struct -freciprocal-math -freorder-blocks-and-partition -freorder-blocks-and-partition -fno-partial-inlining -fno-inline-small-functions

OPT = -floop-nest-optimize   -finline-functions-called-once -fearly-inlining -finline-small-functions -fmerge-all-constants -fmodulo-sched -fmodulo-sched-allow-regmoves -fgcse -fgcse-sm -fgcse-las -fgcse-after-reload -fdeclone-ctor-dtor -fconserve-stack -ftree-pre -ftree-partial-pre -fipa-pta -ftree-tail-merge -fivopts -fpredictive-commoning -ffast-math -fno-signed-zeros -frename-registers -fbranch-target-load-optimize -fbranch-target-load-optimize2 -fomit-frame-pointer -fno-optimize-sibling-calls 
#bad:  -ffloat-store  -maccumulate-args -fno-early-inlining 	


ARDUINO_HEADER = dummy_header.h
USER_LIB_PATH =  ../libraries
CXXFLAGS_STD = -Wno-deprecated-declarations -std=gnu++11  -fno-exceptions -Wl,--gc-sections -fno-threadsafe-statics $(OPT)
CFLAGS_STD = -std=gnu11  -fno-exceptions  -Wl,--gc-sections -fno-threadsafe-statics $(OPT)
#LDFLAGS = -lstdc++
MCU=atmega328p

ARDUINO_LIBS = SingleSerial
ARDUINO_LIBS += GCS_MAVLink
ARDUINO_LIBS += TimerSerial

include /usr/share/arduino/Arduino.mk

# !!! Important. You have to use make ispload to upload when using ISP programmer
