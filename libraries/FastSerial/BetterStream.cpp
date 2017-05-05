// -*- Mode: C++; c-basic-offset: 8; indent-tabs-mode: nil -*-
//
//      Copyright (c) 2010 Michael Smith. All rights reserved.
//
// This is free software; you can redistribute it and/or modify it under
// the terms of the GNU Lesser General Public License as published by the
// Free Software Foundation; either version 2.1 of the License, or (at
// your option) any later version.
//

//
// Enhancements to the Arduino Stream class.
//

//#include "SingleSerial.h"
#define HardwareSerial_h
#include <limits.h>
#include "BetterStream.h"


// prog_char_t is used as a wrapper type for prog_char, which is
// a character stored in flash. By using this wrapper type we can
// auto-detect at compile time if a call to a string function is using
// a flash-stored string or not

// Stream extensions////////////////////////////////////////////////////////////

void
BetterStream::print_P(const prog_char_t *s)
{
        char    c;

        while ('\0' != (c = pgm_read_byte((const prog_char *)s++)))
                _write(c);
}

void
BetterStream::print_P(const prog_char *s)
{
        char    c;

        while ('\0' != (c = pgm_read_byte((const prog_char *)s++)))
                _write(c);
}

void
BetterStream::println_P(const prog_char_t *s)
{
        print_P(s);
        println();
}

void
BetterStream::println_P(const prog_char *s)
{
        print_P(s);
        println();
}

void
BetterStream::printf(const char *fmt, ...)
{
        va_list ap;

        va_start(ap, fmt);
        _vprintf(0, fmt, ap);
        va_end(ap);
}

void
BetterStream::_printf_P(const prog_char *fmt, ...)
{
        va_list ap;

        va_start(ap, fmt);
        _vprintf(1, fmt, ap);
        va_end(ap);
}

/*
uint8_t
BetterStream::txspace(void)
{
        // by default claim that there is always space in transmit buffer
        return(255);
}

*/