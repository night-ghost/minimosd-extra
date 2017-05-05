#ifndef COMPAT_H
#define COMPAT_H

#include <inttypes.h>

typedef char prog_char;

#define NOINLINE __attribute__ ((noinline))
#define INLINE __attribute__ ((always_inline)) inline
#define WEAK __attribute__((weak))

typedef uint8_t byte;
typedef byte byte_32;
typedef byte byte_16;


#if 0
#undef PSTR
// black magick begins
#define PSTR(str) PSTR_INTERNAL_1(str, __COUNTER__)
#define PSTR_INTERNAL_1(str, num) PSTR_INTERNAL_2(str, num)
#define PSTR_INTERNAL_2(str, num) \
  (__extension__({ \
    PGM_P ptr;  \
    asm volatile \
    ( \
      ".pushsection .progmem.data, \"MS\", @progbits, 1" "\n\t" \
      "PSTR_" #num ": .string " #str                     "\n\t" \
      ".popsection"                                      "\n\t" \
    ); \
    asm volatile \
    ( \
      "ldi %A0, lo8(PSTR_" #num ")"                      "\n\t" \
      "ldi %B0, hi8(PSTR_" #num ")"                      "\n\t" \
      : "=d" (ptr) \
    ); \
    ptr; \
  }))
#endif


#define BYTE_OF(v,n) (((byte *)&(v))[n])

#define TO_STRING2(x) #x
#define TO_STRING(x) TO_STRING2(x)

//__extension__ typedef int __guard __attribute__((mode (__DI__)));

//extern "C" int __cxa_guard_acquire(__guard *);
//extern "C" void __cxa_guard_release (__guard *);
//extern "C" void __cxa_guard_abort (__guard *);
//extern "C" void __cxa_pure_virtual(void);


/*int WEAK __cxa_guard_acquire(__guard *g) {return !*(char *)(g);};
void WEAK  __cxa_guard_release (__guard *g) {*(char *)g = 1;};
void WEAK __cxa_guard_abort (__guard *) {};
void WEAK __cxa_pure_virtual(void) {};
*/

template<typename T> void ZeroIt(T& value)
{
    memset(&value,0,sizeof(value));
}

#endif
