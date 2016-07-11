#ifndef COMPAT_H
#define COMPAT_H

typedef char prog_char;

#define NOINLINE __attribute__ ((noinline))
#define INLINE __attribute__ ((always_inline)) inline
#define WEAK __attribute__((weak))


#define BYTE_OF(v,n) (((byte *)&(v))[n])

#define TO_STRING2(x) #x

#define TO_STRING(x) TO_STRING2(x)

__extension__ typedef int __guard __attribute__((mode (__DI__)));

//extern "C" int __cxa_guard_acquire(__guard *);
//extern "C" void __cxa_guard_release (__guard *);
//extern "C" void __cxa_guard_abort (__guard *);
//extern "C" void __cxa_pure_virtual(void);


/*int WEAK __cxa_guard_acquire(__guard *g) {return !*(char *)(g);};
void WEAK  __cxa_guard_release (__guard *g) {*(char *)g = 1;};
void WEAK __cxa_guard_abort (__guard *) {};
void WEAK __cxa_pure_virtual(void) {};
*/

#endif
