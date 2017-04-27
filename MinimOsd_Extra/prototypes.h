#pragma once

typedef void (*cb_putc)(byte c);

bool read_mavlink();

void On100ms();
void On20ms();

void delay_150();


void NOINLINE eeprom_read_len(byte *p, uint16_t e, uint16_t l);
NOINLINE void eeprom_write_len(byte *p, uint16_t e, uint16_t l);

void print_eeprom_string(byte n, cb_putc cb);