#pragma once

typedef void (*cb_putc)(byte c);

bool read_mavlink();

void On100ms();
void On20ms();

void delay_150();


void NOINLINE eeprom_read_len(byte *p, uint16_t e, uint16_t l);
NOINLINE void eeprom_write_len(byte *p, uint16_t e, uint16_t l);

void print_eeprom_string(byte n, cb_putc cb);

void NOINLINE set_data_got();

void NOINLINE delay_telem();
void serial_hex_dump(byte *p, uint16_t len);
byte get_alt_num(point p);
byte get_alt_filter(point p);
point NOINLINE readPanel(byte n);
void NOINLINE long_plus(uint32_t *dst, uint16_t inc);
int NOINLINE long_diff(uint32_t *l1, uint32_t *l2);
float NOINLINE get_converth();
float NOINLINE get_converts();
float NOINLINE f_div1000(float f);
void NOINLINE mav_message_start(byte len, byte time);
int NOINLINE normalize_angle(int a);
uint16_t NOINLINE time_since(uint32_t *t);
byte get_switch_time(byte n);
void doScreenSwitch();
int NOINLINE grad_to_sect(int grad);
void NOINLINE calc_max(float &dst, float src);
void NOINLINE filter( float &dst, float val, const byte k);
void filter( float &dst, float val);
void NOINLINE float_add(float &dst, float val);
void setFdataVars();
void NOINLINE gps_norm(float &dst, long f);
bool NOINLINE timeToScreen();
NOINLINE void logo();
void parse_osd_packet(byte *p);
void NOINLINE millis_plus(uint32_t *dst, uint16_t inc);
void request_mavlink_rates();
void heartBeat();
byte NOINLINE radar_char();
void renew();
void setup_horiz();
uint16_t uidiff(uint16_t, uint16_t);
void writePanels(unsigned long pt);

void unplugSlaves();
void delay_15();
void MAX_mode(byte mode);
