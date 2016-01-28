# Arduino Make file. Refer to https://github.com/sudar/Arduino-Makefile

# if you have placed the alternate core in your sketchbook directory, then you can just mention the core name alone.
#ALTERNATE_CORE = atmega
# If not, you might have to include the full path.
#ALTERNATE_CORE_PATH = /home/sudar/Dropbox/code/arduino-sketches/hardware/attiny/

BOARD_TAG    = atmega328

ARDUINO_HEADER = dummy_header.h
USER_LIB_PATH =  ../libraries
CXXFLAGS_STD = -Wno-deprecated-declarations -std=gnu++11
CFLAGS_STD = -std=gnu11

include /usr/share/arduino/Arduino.mk

# !!! Important. You have to use make ispload to upload when using ISP programmer
