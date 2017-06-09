// -*- Mode: C++; c-basic-offset: 8; indent-tabs-mode: nil -*-
//
//      Copyright (c) 2010 Michael Smith. All rights reserved.
//
// This is free software; you can redistribute it and/or modify it under
// the terms of the GNU Lesser General Public License as published by the
// Free Software Foundation; either version 2.1 of the License, or (at
// your option) any later version.
//

#ifndef __BETTERSTREAM_H
#define __BETTERSTREAM_H

#include <MyStream.h>
#include <avr/pgmspace.h>

typedef struct {
    char c;
} prog_char_t;
typedef char prog_char;


class BetterStream : public MyStream {
public:
        BetterStream(void) {
        }

        // Stream extensions
        void            print_P(const prog_char_t *);
        void            println_P(const prog_char_t *);
        void            print_P(const prog_char *);
        void            println_P(const prog_char *);

        void            printf(const char *, ...)
                __attribute__ ((format(__printf__, 2, 3)));
        void            _printf_P(const prog_char *, ...);
                __attribute__ ((format(__printf__, 2, 3)));

        virtual uint8_t     txspace(void);

#define printf_P(fmt, ...) _printf_P((const prog_char *)fmt, ## __VA_ARGS__)

private:
        void            _vprintf(unsigned char, const char *, va_list)
                __attribute__ ((format(__printf__, 3, 0)));
};

#endif // __BETTERSTREAM_H

