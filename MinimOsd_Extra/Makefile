# Arduino Make file. Refer to https://github.com/sudar/Arduino-Makefile

# if you have placed the alternate core in your sketchbook directory, then you can just mention the core name alone.
#ALTERNATE_CORE = atmega
# If not, you might have to include the full path.
#ALTERNATE_CORE_PATH = /home/sudar/Dropbox/code/arduino-sketches/hardware/attiny/

BOARD_TAG    = atmega328
VARIANT    = standard
F_CPU = 16000000



OPT  = -ffast-math 
OPT += -floop-strip-mine
OPT += -finline-functions-called-once 
OPT += -finline-small-functions
OPT += -fmerge-all-constants
OPT += -fomit-frame-pointer 
OPT += -fno-optimize-sibling-calls 
OPT += -fno-early-inlining 
#OPT += -fmodulo-sched 
#OPT += -fmodulo-sched-allow-regmoves 
#OPT += -fassociative-math
#OPT += -fconserve-stack
#OPT += -freorder-blocks-and-partition
#OPT += -fno-signed-zeros
#OPT += -fearly-inlining 
#OPT += -floop-nest-optimize 
#OPT += -fgcse 
#OPT += -fgcse-sm 
#OPT += -fgcse-las 
#OPT += -fgcse-after-reload 
#OPT += -fdeclone-ctor-dtor 
#OPT += -ftree-pre 
#OPT += -ftree-partial-pre 
#OPT += -fipa-pta +100b
#OPT += -ftree-tail-merge 
#OPT += -fivopts 
#OPT += -fpredictive-commoning
#OPT += -foptimize-strlen
#OPT +=  -fdelayed-branch  not supported
#OPT += -frename-registers  size more
#OPT += -fbranch-target-load-optimize 
#OPT += -fbranch-target-load-optimize2 

# OPT += -ffloat-store   much more
#OPT += -maccumulate-args more size

#nothing
#OPT += -faggressive-loop-optimizations 
#OPT += -fauto-inc-dec  
#OPT += -fbranch-probabilities 
#OPT +=  -floop-strip-mine 
#OPT +=  -fpack-struct 

#OPT += -freciprocal-math 
#OPT += -fno-partial-inlining 
#OPT += -fno-inline-small-functions

#OPT += -v -save-temps # for GCC bugreport

OPT +=  -fno-caller-saves

OPT += $(PROTO)

ARDUINO_HEADER = dummy_header.h
USER_LIB_PATH =  ../libraries
CXXFLAGS_STD = -Wno-deprecated-declarations -std=gnu++11  -fno-exceptions -Wl,--gc-sections -fno-threadsafe-statics $(OPT) -Wl,--relax -felide-constructors -std=c++0x
CFLAGS_STD =  -fno-exceptions  -Wl,--gc-sections  $(OPT) -Wl,--relax 
LDFLAGS = -Wl,--relax
MCU=atmega328p


ARDUINO_LIBS = SingleSerial
ARDUINO_LIBS += GCS_MAVLink
ARDUINO_LIBS += TimerSerial

include /usr/share/arduino/Arduino.mk

# !!! Important. You have to use make ispload to upload when using ISP programmer
