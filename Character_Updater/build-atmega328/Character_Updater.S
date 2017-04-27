
Character_Updater.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 76 00 	jmp	0xec	; 0xec <__ctors_end>
   4:	0c 94 ad 04 	jmp	0x95a	; 0x95a <__vector_1>
   8:	0c 94 d4 04 	jmp	0x9a8	; 0x9a8 <__vector_2>
   c:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  10:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  14:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  18:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  1c:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  20:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  24:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  28:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  2c:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  30:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  34:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  38:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  3c:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  40:	0c 94 b3 03 	jmp	0x766	; 0x766 <__vector_16>
  44:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  48:	0c 94 77 02 	jmp	0x4ee	; 0x4ee <__vector_18>
  4c:	0c 94 9d 02 	jmp	0x53a	; 0x53a <__vector_19>
  50:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  54:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  58:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  5c:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  60:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>
  64:	0c 94 9e 00 	jmp	0x13c	; 0x13c <__bad_interrupt>

00000068 <__trampolines_end>:
  68:	03 02       	muls	r16, r19
  6a:	01 00       	.word	0x0001	; ????

0000006c <_ZZL9print_rffvE3__c>:
  6c:	52 46 46 00                                         RFF.

00000070 <_ZZL10font_statevE3__c>:
  70:	66 6f 6e 74 20 75 70 6c 6f 61 64 69 6e 67 20 00     font uploading .

00000080 <_ZZL10uploadFontvE3__c_0>:
  80:	46 44 00                                            FD.

00000083 <_ZZL10uploadFontvE3__c>:
  83:	43 44 00                                            CD.

00000086 <_ZZ5setupE3__c>:
  86:	4d 69 6e 69 6d 4f 53 44 2d 45 78 74 72 61 20 32     MinimOSD-Extra 2
  96:	2e 34 7c 43 68 61 72 61 63 74 65 72 20 75 70 64     .4|Character upd
  a6:	61 74 65 72 20 00                                   ater .

000000ac <digital_pin_to_bit_mask_PGM>:
  ac:	01 02 04 08 10 20 40 80 01 02 04 08 10 20 01 02     ..... @...... ..
  bc:	04 08 10 20                                         ... 

000000c0 <digital_pin_to_port_PGM>:
  c0:	04 04 04 04 04 04 04 04 02 02 02 02 02 02 03 03     ................
  d0:	03 03 03 03                                         ....

000000d4 <port_to_output_PGM>:
  d4:	00 00 00 00 25 00 28 00 2b 00                       ....%.(.+.

000000de <port_to_mode_PGM>:
  de:	00 00 00 00 24 00 27 00 2a 00                       ....$.'.*.

000000e8 <__ctors_start>:
  e8:	41 02       	muls	r20, r17
  ea:	c9 02       	muls	r28, r25

000000ec <__ctors_end>:
  ec:	11 24       	eor	r1, r1
  ee:	1f be       	out	0x3f, r1	; 63
  f0:	cf ef       	ldi	r28, 0xFF	; 255
  f2:	d8 e0       	ldi	r29, 0x08	; 8
  f4:	de bf       	out	0x3e, r29	; 62
  f6:	cd bf       	out	0x3d, r28	; 61

000000f8 <__do_copy_data>:
  f8:	11 e0       	ldi	r17, 0x01	; 1
  fa:	a0 e0       	ldi	r26, 0x00	; 0
  fc:	b1 e0       	ldi	r27, 0x01	; 1
  fe:	e6 e5       	ldi	r30, 0x56	; 86
 100:	fd e0       	ldi	r31, 0x0D	; 13
 102:	02 c0       	rjmp	.+4      	; 0x108 <__do_copy_data+0x10>
 104:	05 90       	lpm	r0, Z+
 106:	0d 92       	st	X+, r0
 108:	a4 33       	cpi	r26, 0x34	; 52
 10a:	b1 07       	cpc	r27, r17
 10c:	d9 f7       	brne	.-10     	; 0x104 <__do_copy_data+0xc>

0000010e <__do_clear_bss>:
 10e:	25 e0       	ldi	r18, 0x05	; 5
 110:	a4 e3       	ldi	r26, 0x34	; 52
 112:	b1 e0       	ldi	r27, 0x01	; 1
 114:	01 c0       	rjmp	.+2      	; 0x118 <.do_clear_bss_start>

00000116 <.do_clear_bss_loop>:
 116:	1d 92       	st	X+, r1

00000118 <.do_clear_bss_start>:
 118:	a3 31       	cpi	r26, 0x13	; 19
 11a:	b2 07       	cpc	r27, r18
 11c:	e1 f7       	brne	.-8      	; 0x116 <.do_clear_bss_loop>

0000011e <__do_global_ctors>:
 11e:	10 e0       	ldi	r17, 0x00	; 0
 120:	c6 e7       	ldi	r28, 0x76	; 118
 122:	d0 e0       	ldi	r29, 0x00	; 0
 124:	04 c0       	rjmp	.+8      	; 0x12e <__do_global_ctors+0x10>
 126:	21 97       	sbiw	r28, 0x01	; 1
 128:	fe 01       	movw	r30, r28
 12a:	0e 94 a3 06 	call	0xd46	; 0xd46 <__tablejump2__>
 12e:	c4 37       	cpi	r28, 0x74	; 116
 130:	d1 07       	cpc	r29, r17
 132:	c9 f7       	brne	.-14     	; 0x126 <__do_global_ctors+0x8>
 134:	0e 94 9d 05 	call	0xb3a	; 0xb3a <main>
 138:	0c 94 7e 06 	jmp	0xcfc	; 0xcfc <exit>

0000013c <__bad_interrupt>:
 13c:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

00000140 <_ZN3OSD9availableEv>:
 140:	80 e0       	ldi	r24, 0x00	; 0
 142:	08 95       	ret

00000144 <_ZN3OSD4readEv>:
 144:	80 e0       	ldi	r24, 0x00	; 0
 146:	08 95       	ret

00000148 <_ZN3OSD4peekEv>:
 148:	80 e0       	ldi	r24, 0x00	; 0
 14a:	08 95       	ret

0000014c <_ZN3OSD5flushEv>:
 14c:	08 95       	ret

0000014e <_ZN3OSDC1Ev>:
 14e:	fc 01       	movw	r30, r24
 150:	13 82       	std	Z+3, r1	; 0x03
 152:	12 82       	std	Z+2, r1	; 0x02
 154:	28 e0       	ldi	r18, 0x08	; 8
 156:	31 e0       	ldi	r19, 0x01	; 1
 158:	31 83       	std	Z+1, r19	; 0x01
 15a:	20 83       	st	Z, r18
 15c:	08 95       	ret

0000015e <_Z8delay_15v>:
 15e:	6f e0       	ldi	r22, 0x0F	; 15
 160:	70 e0       	ldi	r23, 0x00	; 0
 162:	80 e0       	ldi	r24, 0x00	; 0
 164:	90 e0       	ldi	r25, 0x00	; 0
 166:	0c 94 22 04 	jmp	0x844	; 0x844 <delay>

0000016a <_Z8MAX_modeh>:
 16a:	68 2f       	mov	r22, r24
 16c:	80 e0       	ldi	r24, 0x00	; 0
 16e:	0c 94 51 02 	jmp	0x4a2	; 0x4a2 <_Z9MAX_writehh>

00000172 <_ZN3OSD7setModeEh>:
 172:	88 23       	and	r24, r24
 174:	11 f0       	breq	.+4      	; 0x17a <_ZN3OSD7setModeEh+0x8>
 176:	80 e4       	ldi	r24, 0x40	; 64
 178:	01 c0       	rjmp	.+2      	; 0x17c <_ZN3OSD7setModeEh+0xa>
 17a:	80 e0       	ldi	r24, 0x00	; 0
 17c:	90 91 16 03 	lds	r25, 0x0316	; 0x800316 <_ZN3OSD10video_modeE>
 180:	98 17       	cp	r25, r24
 182:	49 f0       	breq	.+18     	; 0x196 <_ZN3OSD7setModeEh+0x24>
 184:	80 93 16 03 	sts	0x0316, r24	; 0x800316 <_ZN3OSD10video_modeE>
 188:	5e 98       	cbi	0x0b, 6	; 11
 18a:	80 91 16 03 	lds	r24, 0x0316	; 0x800316 <_ZN3OSD10video_modeE>
 18e:	8c 61       	ori	r24, 0x1C	; 28
 190:	0e 94 b5 00 	call	0x16a	; 0x16a <_Z8MAX_modeh>
 194:	5e 9a       	sbi	0x0b, 6	; 11
 196:	08 95       	ret

00000198 <_ZN3OSD10detectModeEv>:
 198:	5e 98       	cbi	0x0b, 6	; 11
 19a:	80 91 22 03 	lds	r24, 0x0322	; 0x800322 <sets+0x1>
 19e:	81 fd       	sbrc	r24, 1
 1a0:	06 c0       	rjmp	.+12     	; 0x1ae <_ZN3OSD10detectModeEv+0x16>
 1a2:	80 91 21 03 	lds	r24, 0x0321	; 0x800321 <sets>
 1a6:	83 ff       	sbrs	r24, 3
 1a8:	1c c0       	rjmp	.+56     	; 0x1e2 <_ZN3OSD10detectModeEv+0x4a>
 1aa:	81 e0       	ldi	r24, 0x01	; 1
 1ac:	1b c0       	rjmp	.+54     	; 0x1e4 <_ZN3OSD10detectModeEv+0x4c>
 1ae:	80 ea       	ldi	r24, 0xA0	; 160
 1b0:	0e 94 5c 02 	call	0x4b8	; 0x4b8 <_Z8MAX_readh>
 1b4:	80 ff       	sbrs	r24, 0
 1b6:	07 c0       	rjmp	.+14     	; 0x1c6 <_ZN3OSD10detectModeEv+0x2e>
 1b8:	81 e0       	ldi	r24, 0x01	; 1
 1ba:	0e 94 b9 00 	call	0x172	; 0x172 <_ZN3OSD7setModeEh>
 1be:	80 91 21 03 	lds	r24, 0x0321	; 0x800321 <sets>
 1c2:	88 60       	ori	r24, 0x08	; 8
 1c4:	08 c0       	rjmp	.+16     	; 0x1d6 <_ZN3OSD10detectModeEv+0x3e>
 1c6:	81 ff       	sbrs	r24, 1
 1c8:	09 c0       	rjmp	.+18     	; 0x1dc <_ZN3OSD10detectModeEv+0x44>
 1ca:	80 e0       	ldi	r24, 0x00	; 0
 1cc:	0e 94 b9 00 	call	0x172	; 0x172 <_ZN3OSD7setModeEh>
 1d0:	80 91 21 03 	lds	r24, 0x0321	; 0x800321 <sets>
 1d4:	87 7f       	andi	r24, 0xF7	; 247
 1d6:	80 93 21 03 	sts	0x0321, r24	; 0x800321 <sets>
 1da:	06 c0       	rjmp	.+12     	; 0x1e8 <_ZN3OSD10detectModeEv+0x50>
 1dc:	82 fd       	sbrc	r24, 2
 1de:	e1 cf       	rjmp	.-62     	; 0x1a2 <_ZN3OSD10detectModeEv+0xa>
 1e0:	03 c0       	rjmp	.+6      	; 0x1e8 <_ZN3OSD10detectModeEv+0x50>
 1e2:	80 e0       	ldi	r24, 0x00	; 0
 1e4:	0e 94 b9 00 	call	0x172	; 0x172 <_ZN3OSD7setModeEh>
 1e8:	5e 9a       	sbi	0x0b, 6	; 11
 1ea:	08 95       	ret

000001ec <_ZN3OSD13setBrightnessEv>:
 1ec:	cf 93       	push	r28
 1ee:	df 93       	push	r29
 1f0:	e0 91 27 03 	lds	r30, 0x0327	; 0x800327 <sets+0x6>
 1f4:	e4 30       	cpi	r30, 0x04	; 4
 1f6:	08 f0       	brcs	.+2      	; 0x1fa <_ZN3OSD13setBrightnessEv+0xe>
 1f8:	e0 e0       	ldi	r30, 0x00	; 0
 1fa:	f0 e0       	ldi	r31, 0x00	; 0
 1fc:	e8 59       	subi	r30, 0x98	; 152
 1fe:	ff 4f       	sbci	r31, 0xFF	; 255
 200:	c4 91       	lpm	r28, Z
 202:	80 e1       	ldi	r24, 0x10	; 16
 204:	d1 e0       	ldi	r29, 0x01	; 1
 206:	d8 0f       	add	r29, r24
 208:	6c 2f       	mov	r22, r28
 20a:	0e 94 51 02 	call	0x4a2	; 0x4a2 <_Z9MAX_writehh>
 20e:	8d 2f       	mov	r24, r29
 210:	d0 32       	cpi	r29, 0x20	; 32
 212:	c1 f7       	brne	.-16     	; 0x204 <_ZN3OSD13setBrightnessEv+0x18>
 214:	df 91       	pop	r29
 216:	cf 91       	pop	r28
 218:	08 95       	ret

0000021a <_ZN3OSD6adjustEv>:
 21a:	5e 98       	cbi	0x0b, 6	; 11
 21c:	0e 94 f6 00 	call	0x1ec	; 0x1ec <_ZN3OSD13setBrightnessEv>
 220:	60 91 65 03 	lds	r22, 0x0365	; 0x800365 <sets+0x44>
 224:	82 e0       	ldi	r24, 0x02	; 2
 226:	0e 94 51 02 	call	0x4a2	; 0x4a2 <_Z9MAX_writehh>
 22a:	60 91 64 03 	lds	r22, 0x0364	; 0x800364 <sets+0x43>
 22e:	83 e0       	ldi	r24, 0x03	; 3
 230:	0e 94 51 02 	call	0x4a2	; 0x4a2 <_Z9MAX_writehh>
 234:	5e 9a       	sbi	0x0b, 6	; 11
 236:	08 95       	ret

00000238 <_ZN3OSD7hw_initEv>:
 238:	5e 98       	cbi	0x0b, 6	; 11
 23a:	8c ee       	ldi	r24, 0xEC	; 236
 23c:	0e 94 5c 02 	call	0x4b8	; 0x4b8 <_Z8MAX_readh>
 240:	68 2f       	mov	r22, r24
 242:	6f 7e       	andi	r22, 0xEF	; 239
 244:	8c e6       	ldi	r24, 0x6C	; 108
 246:	0e 94 51 02 	call	0x4a2	; 0x4a2 <_Z9MAX_writehh>
 24a:	62 e1       	ldi	r22, 0x12	; 18
 24c:	8c e0       	ldi	r24, 0x0C	; 12
 24e:	0e 94 51 02 	call	0x4a2	; 0x4a2 <_Z9MAX_writehh>
 252:	80 91 16 03 	lds	r24, 0x0316	; 0x800316 <_ZN3OSD10video_modeE>
 256:	8c 63       	ori	r24, 0x3C	; 60
 258:	0e 94 b5 00 	call	0x16a	; 0x16a <_Z8MAX_modeh>
 25c:	0e 94 71 02 	call	0x4e2	; 0x4e2 <_Z9delay_150v>
 260:	80 91 16 03 	lds	r24, 0x0316	; 0x800316 <_ZN3OSD10video_modeE>
 264:	8c 61       	ori	r24, 0x1C	; 28
 266:	0e 94 b5 00 	call	0x16a	; 0x16a <_Z8MAX_modeh>
 26a:	0c 94 0d 01 	jmp	0x21a	; 0x21a <_ZN3OSD6adjustEv>

0000026e <_ZN3OSD5resetEv>:
 26e:	cf 93       	push	r28
 270:	df 93       	push	r29
 272:	5e 98       	cbi	0x0b, 6	; 11
 274:	cf e0       	ldi	r28, 0x0F	; 15
 276:	df ef       	ldi	r29, 0xFF	; 255
 278:	80 ea       	ldi	r24, 0xA0	; 160
 27a:	0e 94 5c 02 	call	0x4b8	; 0x4b8 <_Z8MAX_readh>
 27e:	87 70       	andi	r24, 0x07	; 7
 280:	61 f4       	brne	.+24     	; 0x29a <_ZN3OSD5resetEv+0x2c>
 282:	c1 50       	subi	r28, 0x01	; 1
 284:	c1 50       	subi	r28, 0x01	; 1
 286:	30 f0       	brcs	.+12     	; 0x294 <_ZN3OSD5resetEv+0x26>
 288:	de bd       	out	0x2e, r29	; 46
 28a:	0d b4       	in	r0, 0x2d	; 45
 28c:	07 fe       	sbrs	r0, 7
 28e:	fd cf       	rjmp	.-6      	; 0x28a <_ZN3OSD5resetEv+0x1c>
 290:	8e b5       	in	r24, 0x2e	; 46
 292:	f8 cf       	rjmp	.-16     	; 0x284 <_ZN3OSD5resetEv+0x16>
 294:	0e 94 af 00 	call	0x15e	; 0x15e <_Z8delay_15v>
 298:	ef cf       	rjmp	.-34     	; 0x278 <_ZN3OSD5resetEv+0xa>
 29a:	80 91 16 03 	lds	r24, 0x0316	; 0x800316 <_ZN3OSD10video_modeE>
 29e:	82 60       	ori	r24, 0x02	; 2
 2a0:	0e 94 b5 00 	call	0x16a	; 0x16a <_Z8MAX_modeh>
 2a4:	0e 94 af 00 	call	0x15e	; 0x15e <_Z8delay_15v>
 2a8:	df 91       	pop	r29
 2aa:	cf 91       	pop	r28
 2ac:	0c 94 1c 01 	jmp	0x238	; 0x238 <_ZN3OSD7hw_initEv>

000002b0 <_ZN3OSD4initEv>:
 2b0:	61 e0       	ldi	r22, 0x01	; 1
 2b2:	86 e0       	ldi	r24, 0x06	; 6
 2b4:	0e 94 fb 04 	call	0x9f6	; 0x9f6 <pinMode>
 2b8:	62 e0       	ldi	r22, 0x02	; 2
 2ba:	82 e0       	ldi	r24, 0x02	; 2
 2bc:	0e 94 fb 04 	call	0x9f6	; 0x9f6 <pinMode>
 2c0:	61 e0       	ldi	r22, 0x01	; 1
 2c2:	8a e0       	ldi	r24, 0x0A	; 10
 2c4:	0e 94 fb 04 	call	0x9f6	; 0x9f6 <pinMode>
 2c8:	61 e0       	ldi	r22, 0x01	; 1
 2ca:	8a e0       	ldi	r24, 0x0A	; 10
 2cc:	0e 94 37 05 	call	0xa6e	; 0xa6e <digitalWrite>
 2d0:	0e 94 37 01 	call	0x26e	; 0x26e <_ZN3OSD5resetEv>
 2d4:	0e 94 cc 00 	call	0x198	; 0x198 <_ZN3OSD10detectModeEv>
 2d8:	0c 94 1c 01 	jmp	0x238	; 0x238 <_ZN3OSD7hw_initEv>

000002dc <_ZN3OSD8calc_posEv>:
 2dc:	20 91 17 03 	lds	r18, 0x0317	; 0x800317 <_ZN3OSD3rowE>
 2e0:	80 91 18 03 	lds	r24, 0x0318	; 0x800318 <_ZN3OSD3colE>
 2e4:	90 e0       	ldi	r25, 0x00	; 0
 2e6:	3e e1       	ldi	r19, 0x1E	; 30
 2e8:	23 9f       	mul	r18, r19
 2ea:	80 0d       	add	r24, r0
 2ec:	91 1d       	adc	r25, r1
 2ee:	11 24       	eor	r1, r1
 2f0:	90 93 35 01 	sts	0x0135, r25	; 0x800135 <__data_end+0x1>
 2f4:	80 93 34 01 	sts	0x0134, r24	; 0x800134 <__data_end>
 2f8:	08 95       	ret

000002fa <_ZN3OSD8setPanelEhh>:
 2fa:	8f 71       	andi	r24, 0x1F	; 31
 2fc:	80 93 18 03 	sts	0x0318, r24	; 0x800318 <_ZN3OSD3colE>
 300:	6f 70       	andi	r22, 0x0F	; 15
 302:	60 93 17 03 	sts	0x0317, r22	; 0x800317 <_ZN3OSD3rowE>
 306:	80 91 16 03 	lds	r24, 0x0316	; 0x800316 <_ZN3OSD10video_modeE>
 30a:	80 34       	cpi	r24, 0x40	; 64
 30c:	11 f0       	breq	.+4      	; 0x312 <_ZN3OSD8setPanelEhh+0x18>
 30e:	67 30       	cpi	r22, 0x07	; 7
 310:	10 f4       	brcc	.+4      	; 0x316 <_ZN3OSD8setPanelEhh+0x1c>
 312:	0c 94 6e 01 	jmp	0x2dc	; 0x2dc <_ZN3OSD8calc_posEv>
 316:	63 50       	subi	r22, 0x03	; 3
 318:	60 93 17 03 	sts	0x0317, r22	; 0x800317 <_ZN3OSD3rowE>
 31c:	fa cf       	rjmp	.-12     	; 0x312 <_ZN3OSD8setPanelEhh+0x18>

0000031e <_ZN3OSD9write_rawEh>:
 31e:	20 91 34 01 	lds	r18, 0x0134	; 0x800134 <__data_end>
 322:	30 91 35 01 	lds	r19, 0x0135	; 0x800135 <__data_end+0x1>
 326:	20 3e       	cpi	r18, 0xE0	; 224
 328:	91 e0       	ldi	r25, 0x01	; 1
 32a:	39 07       	cpc	r19, r25
 32c:	58 f4       	brcc	.+22     	; 0x344 <_ZN3OSD9write_rawEh+0x26>
 32e:	a9 01       	movw	r20, r18
 330:	4f 5f       	subi	r20, 0xFF	; 255
 332:	5f 4f       	sbci	r21, 0xFF	; 255
 334:	50 93 35 01 	sts	0x0135, r21	; 0x800135 <__data_end+0x1>
 338:	40 93 34 01 	sts	0x0134, r20	; 0x800134 <__data_end>
 33c:	f9 01       	movw	r30, r18
 33e:	ea 5c       	subi	r30, 0xCA	; 202
 340:	fe 4f       	sbci	r31, 0xFE	; 254
 342:	80 83       	st	Z, r24
 344:	08 95       	ret

00000346 <_ZN3OSD7write_SEh>:
 346:	8f 3f       	cpi	r24, 0xFF	; 255
 348:	39 f4       	brne	.+14     	; 0x358 <_ZN3OSD7write_SEh+0x12>
 34a:	80 91 17 03 	lds	r24, 0x0317	; 0x800317 <_ZN3OSD3rowE>
 34e:	8f 5f       	subi	r24, 0xFF	; 255
 350:	80 93 17 03 	sts	0x0317, r24	; 0x800317 <_ZN3OSD3rowE>
 354:	0c 94 6e 01 	jmp	0x2dc	; 0x2dc <_ZN3OSD8calc_posEv>
 358:	0c 94 8f 01 	jmp	0x31e	; 0x31e <_ZN3OSD9write_rawEh>

0000035c <_ZN3OSD5writeEh>:
 35c:	86 2f       	mov	r24, r22
 35e:	0e 94 a3 01 	call	0x346	; 0x346 <_ZN3OSD7write_SEh>
 362:	81 e0       	ldi	r24, 0x01	; 1
 364:	90 e0       	ldi	r25, 0x00	; 0
 366:	08 95       	ret

00000368 <_ZN3OSD6updateEv>:
 368:	5e 98       	cbi	0x0b, 6	; 11
 36a:	60 e0       	ldi	r22, 0x00	; 0
 36c:	85 e0       	ldi	r24, 0x05	; 5
 36e:	0e 94 51 02 	call	0x4a2	; 0x4a2 <_Z9MAX_writehh>
 372:	60 e0       	ldi	r22, 0x00	; 0
 374:	86 e0       	ldi	r24, 0x06	; 6
 376:	0e 94 51 02 	call	0x4a2	; 0x4a2 <_Z9MAX_writehh>
 37a:	61 e0       	ldi	r22, 0x01	; 1
 37c:	84 e0       	ldi	r24, 0x04	; 4
 37e:	0e 94 51 02 	call	0x4a2	; 0x4a2 <_Z9MAX_writehh>
 382:	5e 9a       	sbi	0x0b, 6	; 11
 384:	e6 e3       	ldi	r30, 0x36	; 54
 386:	f1 e0       	ldi	r31, 0x01	; 1
 388:	80 e2       	ldi	r24, 0x20	; 32
 38a:	5e 98       	cbi	0x0b, 6	; 11
 38c:	90 81       	ld	r25, Z
 38e:	9e bd       	out	0x2e, r25	; 46
 390:	0d b4       	in	r0, 0x2d	; 45
 392:	07 fe       	sbrs	r0, 7
 394:	fd cf       	rjmp	.-6      	; 0x390 <_ZN3OSD6updateEv+0x28>
 396:	9e b5       	in	r25, 0x2e	; 46
 398:	81 93       	st	Z+, r24
 39a:	5e 9a       	sbi	0x0b, 6	; 11
 39c:	93 e0       	ldi	r25, 0x03	; 3
 39e:	e6 31       	cpi	r30, 0x16	; 22
 3a0:	f9 07       	cpc	r31, r25
 3a2:	98 f3       	brcs	.-26     	; 0x38a <_ZN3OSD6updateEv+0x22>
 3a4:	5e 98       	cbi	0x0b, 6	; 11
 3a6:	8f ef       	ldi	r24, 0xFF	; 255
 3a8:	8e bd       	out	0x2e, r24	; 46
 3aa:	0d b4       	in	r0, 0x2d	; 45
 3ac:	07 fe       	sbrs	r0, 7
 3ae:	fd cf       	rjmp	.-6      	; 0x3aa <_ZN3OSD6updateEv+0x42>
 3b0:	8e b5       	in	r24, 0x2e	; 46
 3b2:	5e 9a       	sbi	0x0b, 6	; 11
 3b4:	08 95       	ret

000003b6 <_ZN3OSD9write_NVMEjPh>:
 3b6:	ef 92       	push	r14
 3b8:	ff 92       	push	r15
 3ba:	0f 93       	push	r16
 3bc:	1f 93       	push	r17
 3be:	cf 93       	push	r28
 3c0:	df 93       	push	r29
 3c2:	1f 92       	push	r1
 3c4:	cd b7       	in	r28, 0x3d	; 61
 3c6:	de b7       	in	r29, 0x3e	; 62
 3c8:	18 2f       	mov	r17, r24
 3ca:	f6 2e       	mov	r15, r22
 3cc:	5e 98       	cbi	0x0b, 6	; 11
 3ce:	80 e0       	ldi	r24, 0x00	; 0
 3d0:	79 83       	std	Y+1, r23	; 0x01
 3d2:	0e 94 b5 00 	call	0x16a	; 0x16a <_Z8MAX_modeh>
 3d6:	61 2f       	mov	r22, r17
 3d8:	89 e0       	ldi	r24, 0x09	; 9
 3da:	0e 94 51 02 	call	0x4a2	; 0x4a2 <_Z9MAX_writehh>
 3de:	0f 2d       	mov	r16, r15
 3e0:	79 81       	ldd	r23, Y+1	; 0x01
 3e2:	17 2f       	mov	r17, r23
 3e4:	e1 2c       	mov	r14, r1
 3e6:	f8 01       	movw	r30, r16
 3e8:	f1 90       	ld	r15, Z+
 3ea:	8f 01       	movw	r16, r30
 3ec:	6e 2d       	mov	r22, r14
 3ee:	8a e0       	ldi	r24, 0x0A	; 10
 3f0:	0e 94 51 02 	call	0x4a2	; 0x4a2 <_Z9MAX_writehh>
 3f4:	6f 2d       	mov	r22, r15
 3f6:	8b e0       	ldi	r24, 0x0B	; 11
 3f8:	0e 94 51 02 	call	0x4a2	; 0x4a2 <_Z9MAX_writehh>
 3fc:	e3 94       	inc	r14
 3fe:	f6 e3       	ldi	r31, 0x36	; 54
 400:	ef 12       	cpse	r14, r31
 402:	f1 cf       	rjmp	.-30     	; 0x3e6 <_ZN3OSD9write_NVMEjPh+0x30>
 404:	60 ea       	ldi	r22, 0xA0	; 160
 406:	88 e0       	ldi	r24, 0x08	; 8
 408:	0e 94 51 02 	call	0x4a2	; 0x4a2 <_Z9MAX_writehh>
 40c:	80 ea       	ldi	r24, 0xA0	; 160
 40e:	0e 94 5c 02 	call	0x4b8	; 0x4b8 <_Z8MAX_readh>
 412:	85 ff       	sbrs	r24, 5
 414:	03 c0       	rjmp	.+6      	; 0x41c <_ZN3OSD9write_NVMEjPh+0x66>
 416:	0e 94 6d 02 	call	0x4da	; 0x4da <_Z11delay_telemv>
 41a:	f8 cf       	rjmp	.-16     	; 0x40c <_ZN3OSD9write_NVMEjPh+0x56>
 41c:	8c e0       	ldi	r24, 0x0C	; 12
 41e:	0e 94 b5 00 	call	0x16a	; 0x16a <_Z8MAX_modeh>
 422:	5e 9a       	sbi	0x0b, 6	; 11
 424:	0f 90       	pop	r0
 426:	df 91       	pop	r29
 428:	cf 91       	pop	r28
 42a:	1f 91       	pop	r17
 42c:	0f 91       	pop	r16
 42e:	ff 90       	pop	r15
 430:	ef 90       	pop	r14
 432:	08 95       	ret

00000434 <_ZN3SPI4modeEh>:
 434:	cf 93       	push	r28
 436:	df 93       	push	r29
 438:	1f 92       	push	r1
 43a:	cd b7       	in	r28, 0x3d	; 61
 43c:	de b7       	in	r29, 0x3e	; 62
 43e:	1c bc       	out	0x2c, r1	; 44
 440:	8f 72       	andi	r24, 0x2F	; 47
 442:	80 65       	ori	r24, 0x50	; 80
 444:	8c bd       	out	0x2c, r24	; 44
 446:	8d b5       	in	r24, 0x2d	; 45
 448:	81 60       	ori	r24, 0x01	; 1
 44a:	8d bd       	out	0x2d, r24	; 45
 44c:	8d b5       	in	r24, 0x2d	; 45
 44e:	89 83       	std	Y+1, r24	; 0x01
 450:	8e b5       	in	r24, 0x2e	; 46
 452:	89 83       	std	Y+1, r24	; 0x01
 454:	0f 90       	pop	r0
 456:	df 91       	pop	r29
 458:	cf 91       	pop	r28
 45a:	08 95       	ret

0000045c <_ZN3SPIC1Ev>:
 45c:	61 e0       	ldi	r22, 0x01	; 1
 45e:	8d e0       	ldi	r24, 0x0D	; 13
 460:	0e 94 fb 04 	call	0x9f6	; 0x9f6 <pinMode>
 464:	61 e0       	ldi	r22, 0x01	; 1
 466:	8b e0       	ldi	r24, 0x0B	; 11
 468:	0e 94 fb 04 	call	0x9f6	; 0x9f6 <pinMode>
 46c:	60 e0       	ldi	r22, 0x00	; 0
 46e:	8c e0       	ldi	r24, 0x0C	; 12
 470:	0e 94 fb 04 	call	0x9f6	; 0x9f6 <pinMode>
 474:	61 e0       	ldi	r22, 0x01	; 1
 476:	8a e0       	ldi	r24, 0x0A	; 10
 478:	0e 94 fb 04 	call	0x9f6	; 0x9f6 <pinMode>
 47c:	80 e0       	ldi	r24, 0x00	; 0
 47e:	0c 94 1a 02 	jmp	0x434	; 0x434 <_ZN3SPI4modeEh>

00000482 <_GLOBAL__sub_I__ZN3SPIC2Ev>:
 482:	89 e1       	ldi	r24, 0x19	; 25
 484:	93 e0       	ldi	r25, 0x03	; 3
 486:	0c 94 2e 02 	jmp	0x45c	; 0x45c <_ZN3SPIC1Ev>

0000048a <_Z9isr_VSYNCv>:
 48a:	10 92 20 03 	sts	0x0320, r1	; 0x800320 <vsync_wait>
 48e:	08 95       	ret

00000490 <_ZL14serial_print_SPKc>:
 490:	bc 01       	movw	r22, r24
 492:	8c e1       	ldi	r24, 0x1C	; 28
 494:	93 e0       	ldi	r25, 0x03	; 3
 496:	0c 94 74 06 	jmp	0xce8	; 0xce8 <_ZN12BetterStream9println_PEPKc>

0000049a <_ZL9print_rffv>:
 49a:	8c e6       	ldi	r24, 0x6C	; 108
 49c:	90 e0       	ldi	r25, 0x00	; 0
 49e:	0c 94 48 02 	jmp	0x490	; 0x490 <_ZL14serial_print_SPKc>

000004a2 <_Z9MAX_writehh>:
 4a2:	8e bd       	out	0x2e, r24	; 46
 4a4:	0d b4       	in	r0, 0x2d	; 45
 4a6:	07 fe       	sbrs	r0, 7
 4a8:	fd cf       	rjmp	.-6      	; 0x4a4 <_Z9MAX_writehh+0x2>
 4aa:	8e b5       	in	r24, 0x2e	; 46
 4ac:	6e bd       	out	0x2e, r22	; 46
 4ae:	0d b4       	in	r0, 0x2d	; 45
 4b0:	07 fe       	sbrs	r0, 7
 4b2:	fd cf       	rjmp	.-6      	; 0x4ae <_Z9MAX_writehh+0xc>
 4b4:	8e b5       	in	r24, 0x2e	; 46
 4b6:	08 95       	ret

000004b8 <_Z8MAX_readh>:
 4b8:	8e bd       	out	0x2e, r24	; 46
 4ba:	0d b4       	in	r0, 0x2d	; 45
 4bc:	07 fe       	sbrs	r0, 7
 4be:	fd cf       	rjmp	.-6      	; 0x4ba <_Z8MAX_readh+0x2>
 4c0:	8e b5       	in	r24, 0x2e	; 46
 4c2:	8f ef       	ldi	r24, 0xFF	; 255
 4c4:	8e bd       	out	0x2e, r24	; 46
 4c6:	0d b4       	in	r0, 0x2d	; 45
 4c8:	07 fe       	sbrs	r0, 7
 4ca:	fd cf       	rjmp	.-6      	; 0x4c6 <_Z8MAX_readh+0xe>
 4cc:	8e b5       	in	r24, 0x2e	; 46
 4ce:	08 95       	ret

000004d0 <_Z11osd_print_SPKc>:
 4d0:	bc 01       	movw	r22, r24
 4d2:	8e e6       	ldi	r24, 0x6E	; 110
 4d4:	93 e0       	ldi	r25, 0x03	; 3
 4d6:	0c 94 5f 06 	jmp	0xcbe	; 0xcbe <_ZN12BetterStream7print_PEPKc>

000004da <_Z11delay_telemv>:
 4da:	8a ea       	ldi	r24, 0xAA	; 170
 4dc:	90 e0       	ldi	r25, 0x00	; 0
 4de:	0c 94 5e 04 	jmp	0x8bc	; 0x8bc <delayMicroseconds>

000004e2 <_Z9delay_150v>:
 4e2:	66 e9       	ldi	r22, 0x96	; 150
 4e4:	70 e0       	ldi	r23, 0x00	; 0
 4e6:	80 e0       	ldi	r24, 0x00	; 0
 4e8:	90 e0       	ldi	r25, 0x00	; 0
 4ea:	0c 94 22 04 	jmp	0x844	; 0x844 <delay>

000004ee <__vector_18>:
 4ee:	1f 92       	push	r1
 4f0:	0f 92       	push	r0
 4f2:	0f b6       	in	r0, 0x3f	; 63
 4f4:	0f 92       	push	r0
 4f6:	11 24       	eor	r1, r1
 4f8:	2f 93       	push	r18
 4fa:	8f 93       	push	r24
 4fc:	9f 93       	push	r25
 4fe:	ef 93       	push	r30
 500:	ff 93       	push	r31
 502:	90 91 c6 00 	lds	r25, 0x00C6	; 0x8000c6 <__data_load_end+0x7ff33c>
 506:	80 91 11 05 	lds	r24, 0x0511	; 0x800511 <_ZN12SingleSerial9_rxBufferE>
 50a:	8f 5f       	subi	r24, 0xFF	; 255
 50c:	8f 77       	andi	r24, 0x7F	; 127
 50e:	20 91 12 05 	lds	r18, 0x0512	; 0x800512 <_ZN12SingleSerial9_rxBufferE+0x1>
 512:	82 17       	cp	r24, r18
 514:	41 f0       	breq	.+16     	; 0x526 <__vector_18+0x38>
 516:	e0 91 11 05 	lds	r30, 0x0511	; 0x800511 <_ZN12SingleSerial9_rxBufferE>
 51a:	f0 e0       	ldi	r31, 0x00	; 0
 51c:	e1 57       	subi	r30, 0x71	; 113
 51e:	fb 4f       	sbci	r31, 0xFB	; 251
 520:	90 83       	st	Z, r25
 522:	80 93 11 05 	sts	0x0511, r24	; 0x800511 <_ZN12SingleSerial9_rxBufferE>
 526:	ff 91       	pop	r31
 528:	ef 91       	pop	r30
 52a:	9f 91       	pop	r25
 52c:	8f 91       	pop	r24
 52e:	2f 91       	pop	r18
 530:	0f 90       	pop	r0
 532:	0f be       	out	0x3f, r0	; 63
 534:	0f 90       	pop	r0
 536:	1f 90       	pop	r1
 538:	18 95       	reti

0000053a <__vector_19>:
 53a:	1f 92       	push	r1
 53c:	0f 92       	push	r0
 53e:	0f b6       	in	r0, 0x3f	; 63
 540:	0f 92       	push	r0
 542:	11 24       	eor	r1, r1
 544:	8f 93       	push	r24
 546:	9f 93       	push	r25
 548:	ef 93       	push	r30
 54a:	ff 93       	push	r31
 54c:	90 91 10 05 	lds	r25, 0x0510	; 0x800510 <_ZN12SingleSerial9_txBufferE+0x1>
 550:	80 91 0f 05 	lds	r24, 0x050F	; 0x80050f <_ZN12SingleSerial9_txBufferE>
 554:	98 17       	cp	r25, r24
 556:	79 f0       	breq	.+30     	; 0x576 <__vector_19+0x3c>
 558:	e0 91 10 05 	lds	r30, 0x0510	; 0x800510 <_ZN12SingleSerial9_txBufferE+0x1>
 55c:	f0 e0       	ldi	r31, 0x00	; 0
 55e:	e5 57       	subi	r30, 0x75	; 117
 560:	fb 4f       	sbci	r31, 0xFB	; 251
 562:	80 81       	ld	r24, Z
 564:	80 93 c6 00 	sts	0x00C6, r24	; 0x8000c6 <__data_load_end+0x7ff33c>
 568:	80 91 10 05 	lds	r24, 0x0510	; 0x800510 <_ZN12SingleSerial9_txBufferE+0x1>
 56c:	8f 5f       	subi	r24, 0xFF	; 255
 56e:	83 70       	andi	r24, 0x03	; 3
 570:	80 93 10 05 	sts	0x0510, r24	; 0x800510 <_ZN12SingleSerial9_txBufferE+0x1>
 574:	05 c0       	rjmp	.+10     	; 0x580 <__vector_19+0x46>
 576:	80 91 c1 00 	lds	r24, 0x00C1	; 0x8000c1 <__data_load_end+0x7ff337>
 57a:	8f 7d       	andi	r24, 0xDF	; 223
 57c:	80 93 c1 00 	sts	0x00C1, r24	; 0x8000c1 <__data_load_end+0x7ff337>
 580:	ff 91       	pop	r31
 582:	ef 91       	pop	r30
 584:	9f 91       	pop	r25
 586:	8f 91       	pop	r24
 588:	0f 90       	pop	r0
 58a:	0f be       	out	0x3f, r0	; 63
 58c:	0f 90       	pop	r0
 58e:	1f 90       	pop	r1
 590:	18 95       	reti

00000592 <_GLOBAL__sub_I__Z15eeprom_read_lenPhjj>:
 592:	8e e6       	ldi	r24, 0x6E	; 110
 594:	93 e0       	ldi	r25, 0x03	; 3
 596:	0e 94 a7 00 	call	0x14e	; 0x14e <_ZN3OSDC1Ev>
 59a:	8c e1       	ldi	r24, 0x1C	; 28
 59c:	93 e0       	ldi	r25, 0x03	; 3
 59e:	0c 94 c4 05 	jmp	0xb88	; 0xb88 <_ZN12SingleSerialC1Ev>

000005a2 <setup>:
 5a2:	1f 93       	push	r17
 5a4:	cf 93       	push	r28
 5a6:	df 93       	push	r29
 5a8:	61 e0       	ldi	r22, 0x01	; 1
 5aa:	86 e0       	ldi	r24, 0x06	; 6
 5ac:	0e 94 fb 04 	call	0x9f6	; 0x9f6 <pinMode>
 5b0:	60 e0       	ldi	r22, 0x00	; 0
 5b2:	71 ee       	ldi	r23, 0xE1	; 225
 5b4:	80 e0       	ldi	r24, 0x00	; 0
 5b6:	90 e0       	ldi	r25, 0x00	; 0
 5b8:	0e 94 cc 05 	call	0xb98	; 0xb98 <_ZN12SingleSerial5beginEm>
 5bc:	8c e1       	ldi	r24, 0x1C	; 28
 5be:	93 e0       	ldi	r25, 0x03	; 3
 5c0:	90 93 1b 03 	sts	0x031B, r25	; 0x80031b <mavlink_comm_0_port+0x1>
 5c4:	80 93 1a 03 	sts	0x031A, r24	; 0x80031a <mavlink_comm_0_port>
 5c8:	42 e0       	ldi	r20, 0x02	; 2
 5ca:	65 e4       	ldi	r22, 0x45	; 69
 5cc:	72 e0       	ldi	r23, 0x02	; 2
 5ce:	80 e0       	ldi	r24, 0x00	; 0
 5d0:	0e 94 8d 04 	call	0x91a	; 0x91a <attachInterrupt>
 5d4:	5e 9a       	sbi	0x0b, 6	; 11
 5d6:	0e 94 58 01 	call	0x2b0	; 0x2b0 <_ZN3OSD4initEv>
 5da:	81 e0       	ldi	r24, 0x01	; 1
 5dc:	0e 94 b9 00 	call	0x172	; 0x172 <_ZN3OSD7setModeEh>
 5e0:	65 e0       	ldi	r22, 0x05	; 5
 5e2:	85 e0       	ldi	r24, 0x05	; 5
 5e4:	0e 94 7d 01 	call	0x2fa	; 0x2fa <_ZN3OSD8setPanelEhh>
 5e8:	66 e8       	ldi	r22, 0x86	; 134
 5ea:	70 e0       	ldi	r23, 0x00	; 0
 5ec:	8e e6       	ldi	r24, 0x6E	; 110
 5ee:	93 e0       	ldi	r25, 0x03	; 3
 5f0:	0e 94 5f 06 	call	0xcbe	; 0xcbe <_ZN12BetterStream7print_PEPKc>
 5f4:	0e 94 71 02 	call	0x4e2	; 0x4e2 <_Z9delay_150v>
 5f8:	0e 94 b4 01 	call	0x368	; 0x368 <_ZN3OSD6updateEv>
 5fc:	60 ed       	ldi	r22, 0xD0	; 208
 5fe:	77 e0       	ldi	r23, 0x07	; 7
 600:	80 e0       	ldi	r24, 0x00	; 0
 602:	90 e0       	ldi	r25, 0x00	; 0
 604:	0e 94 22 04 	call	0x844	; 0x844 <delay>
 608:	60 e0       	ldi	r22, 0x00	; 0
 60a:	80 e0       	ldi	r24, 0x00	; 0
 60c:	0e 94 7d 01 	call	0x2fa	; 0x2fa <_ZN3OSD8setPanelEhh>
 610:	d0 e1       	ldi	r29, 0x10	; 16
 612:	c0 e0       	ldi	r28, 0x00	; 0
 614:	10 e1       	ldi	r17, 0x10	; 16
 616:	1c 0f       	add	r17, r28
 618:	cc 37       	cpi	r28, 0x7C	; 124
 61a:	11 f0       	breq	.+4      	; 0x620 <setup+0x7e>
 61c:	6c 2f       	mov	r22, r28
 61e:	01 c0       	rjmp	.+2      	; 0x622 <setup+0x80>
 620:	60 e2       	ldi	r22, 0x20	; 32
 622:	8e e6       	ldi	r24, 0x6E	; 110
 624:	93 e0       	ldi	r25, 0x03	; 3
 626:	0e 94 ae 01 	call	0x35c	; 0x35c <_ZN3OSD5writeEh>
 62a:	cf 5f       	subi	r28, 0xFF	; 255
 62c:	c1 13       	cpse	r28, r17
 62e:	f4 cf       	rjmp	.-24     	; 0x618 <setup+0x76>
 630:	6c e7       	ldi	r22, 0x7C	; 124
 632:	8e e6       	ldi	r24, 0x6E	; 110
 634:	93 e0       	ldi	r25, 0x03	; 3
 636:	0e 94 ae 01 	call	0x35c	; 0x35c <_ZN3OSD5writeEh>
 63a:	d1 50       	subi	r29, 0x01	; 1
 63c:	59 f7       	brne	.-42     	; 0x614 <setup+0x72>
 63e:	df 91       	pop	r29
 640:	cf 91       	pop	r28
 642:	1f 91       	pop	r17
 644:	0c 94 b4 01 	jmp	0x368	; 0x368 <_ZN3OSD6updateEv>

00000648 <loop>:
 648:	af 92       	push	r10
 64a:	bf 92       	push	r11
 64c:	cf 92       	push	r12
 64e:	df 92       	push	r13
 650:	ef 92       	push	r14
 652:	ff 92       	push	r15
 654:	0f 93       	push	r16
 656:	1f 93       	push	r17
 658:	cf 93       	push	r28
 65a:	df 93       	push	r29
 65c:	c1 2c       	mov	r12, r1
 65e:	d1 2c       	mov	r13, r1
 660:	8c e1       	ldi	r24, 0x1C	; 28
 662:	93 e0       	ldi	r25, 0x03	; 3
 664:	0e 94 19 06 	call	0xc32	; 0xc32 <_ZN12SingleSerial9availableEv>
 668:	88 23       	and	r24, r24
 66a:	09 f4       	brne	.+2      	; 0x66e <loop+0x26>
 66c:	71 c0       	rjmp	.+226    	; 0x750 <loop+0x108>
 66e:	8c e1       	ldi	r24, 0x1C	; 28
 670:	93 e0       	ldi	r25, 0x03	; 3
 672:	0e 94 36 06 	call	0xc6c	; 0xc6c <_ZN12SingleSerial4readEv>
 676:	8a 30       	cpi	r24, 0x0A	; 10
 678:	11 f0       	breq	.+4      	; 0x67e <loop+0x36>
 67a:	8d 30       	cpi	r24, 0x0D	; 13
 67c:	79 f7       	brne	.-34     	; 0x65c <loop+0x14>
 67e:	8f ef       	ldi	r24, 0xFF	; 255
 680:	c8 1a       	sub	r12, r24
 682:	d8 0a       	sbc	r13, r24
 684:	83 e0       	ldi	r24, 0x03	; 3
 686:	c8 16       	cp	r12, r24
 688:	d1 04       	cpc	r13, r1
 68a:	51 f7       	brne	.-44     	; 0x660 <loop+0x18>
 68c:	8c b5       	in	r24, 0x2c	; 44
 68e:	83 60       	ori	r24, 0x03	; 3
 690:	8c bd       	out	0x2c, r24	; 44
 692:	0e 94 4d 02 	call	0x49a	; 0x49a <_ZL9print_rffv>
 696:	65 e0       	ldi	r22, 0x05	; 5
 698:	85 e0       	ldi	r24, 0x05	; 5
 69a:	0e 94 7d 01 	call	0x2fa	; 0x2fa <_ZN3OSD8setPanelEhh>
 69e:	80 e7       	ldi	r24, 0x70	; 112
 6a0:	90 e0       	ldi	r25, 0x00	; 0
 6a2:	0e 94 68 02 	call	0x4d0	; 0x4d0 <_Z11osd_print_SPKc>
 6a6:	0e 94 b4 01 	call	0x368	; 0x368 <_ZN3OSD6updateEv>
 6aa:	d0 e0       	ldi	r29, 0x00	; 0
 6ac:	a1 2c       	mov	r10, r1
 6ae:	b1 2c       	mov	r11, r1
 6b0:	00 e0       	ldi	r16, 0x00	; 0
 6b2:	10 e0       	ldi	r17, 0x00	; 0
 6b4:	e1 2c       	mov	r14, r1
 6b6:	f1 2c       	mov	r15, r1
 6b8:	0f 3f       	cpi	r16, 0xFF	; 255
 6ba:	11 05       	cpc	r17, r1
 6bc:	11 f0       	breq	.+4      	; 0x6c2 <loop+0x7a>
 6be:	0c f0       	brlt	.+2      	; 0x6c2 <loop+0x7a>
 6c0:	42 c0       	rjmp	.+132    	; 0x746 <loop+0xfe>
 6c2:	0e 94 0c 06 	call	0xc18	; 0xc18 <_ZN12SingleSerial11available_SEv>
 6c6:	88 23       	and	r24, r24
 6c8:	b9 f3       	breq	.-18     	; 0x6b8 <loop+0x70>
 6ca:	0e 94 1b 06 	call	0xc36	; 0xc36 <_ZN12SingleSerial6read_SEv>
 6ce:	c8 2f       	mov	r28, r24
 6d0:	82 33       	cpi	r24, 0x32	; 50
 6d2:	38 f4       	brcc	.+14     	; 0x6e2 <loop+0x9a>
 6d4:	80 33       	cpi	r24, 0x30	; 48
 6d6:	e8 f4       	brcc	.+58     	; 0x712 <loop+0xca>
 6d8:	8a 30       	cpi	r24, 0x0A	; 10
 6da:	41 f0       	breq	.+16     	; 0x6ec <loop+0xa4>
 6dc:	8d 30       	cpi	r24, 0x0D	; 13
 6de:	49 f0       	breq	.+18     	; 0x6f2 <loop+0xaa>
 6e0:	21 c0       	rjmp	.+66     	; 0x724 <loop+0xdc>
 6e2:	82 37       	cpi	r24, 0x72	; 114
 6e4:	f9 f4       	brne	.+62     	; 0x724 <loop+0xdc>
 6e6:	01 50       	subi	r16, 0x01	; 1
 6e8:	11 09       	sbc	r17, r1
 6ea:	1c c0       	rjmp	.+56     	; 0x724 <loop+0xdc>
 6ec:	8d e0       	ldi	r24, 0x0D	; 13
 6ee:	a8 16       	cp	r10, r24
 6f0:	41 f1       	breq	.+80     	; 0x742 <loop+0xfa>
 6f2:	b1 10       	cpse	r11, r1
 6f4:	03 c0       	rjmp	.+6      	; 0x6fc <loop+0xb4>
 6f6:	0e 94 4d 02 	call	0x49a	; 0x49a <_ZL9print_rffv>
 6fa:	23 c0       	rjmp	.+70     	; 0x742 <loop+0xfa>
 6fc:	88 e0       	ldi	r24, 0x08	; 8
 6fe:	e8 12       	cpse	r14, r24
 700:	10 c0       	rjmp	.+32     	; 0x722 <loop+0xda>
 702:	ef 2d       	mov	r30, r15
 704:	f0 e0       	ldi	r31, 0x00	; 0
 706:	ee 58       	subi	r30, 0x8E	; 142
 708:	fc 4f       	sbci	r31, 0xFC	; 252
 70a:	d0 83       	st	Z, r29
 70c:	f3 94       	inc	r15
 70e:	d0 e0       	ldi	r29, 0x00	; 0
 710:	08 c0       	rjmp	.+16     	; 0x722 <loop+0xda>
 712:	dd 0f       	add	r29, r29
 714:	81 33       	cpi	r24, 0x31	; 49
 716:	09 f4       	brne	.+2      	; 0x71a <loop+0xd2>
 718:	df 5f       	subi	r29, 0xFF	; 255
 71a:	e3 94       	inc	r14
 71c:	bb 24       	eor	r11, r11
 71e:	b3 94       	inc	r11
 720:	01 c0       	rjmp	.+2      	; 0x724 <loop+0xdc>
 722:	e1 2c       	mov	r14, r1
 724:	80 e4       	ldi	r24, 0x40	; 64
 726:	f8 12       	cpse	r15, r24
 728:	0c c0       	rjmp	.+24     	; 0x742 <loop+0xfa>
 72a:	62 e7       	ldi	r22, 0x72	; 114
 72c:	73 e0       	ldi	r23, 0x03	; 3
 72e:	c8 01       	movw	r24, r16
 730:	0e 94 db 01 	call	0x3b6	; 0x3b6 <_ZN3OSD9write_NVMEjPh>
 734:	0f 5f       	subi	r16, 0xFF	; 255
 736:	1f 4f       	sbci	r17, 0xFF	; 255
 738:	83 e8       	ldi	r24, 0x83	; 131
 73a:	90 e0       	ldi	r25, 0x00	; 0
 73c:	0e 94 48 02 	call	0x490	; 0x490 <_ZL14serial_print_SPKc>
 740:	f1 2c       	mov	r15, r1
 742:	ac 2e       	mov	r10, r28
 744:	b9 cf       	rjmp	.-142    	; 0x6b8 <loop+0x70>
 746:	80 e8       	ldi	r24, 0x80	; 128
 748:	90 e0       	ldi	r25, 0x00	; 0
 74a:	0e 94 48 02 	call	0x490	; 0x490 <_ZL14serial_print_SPKc>
 74e:	88 cf       	rjmp	.-240    	; 0x660 <loop+0x18>
 750:	df 91       	pop	r29
 752:	cf 91       	pop	r28
 754:	1f 91       	pop	r17
 756:	0f 91       	pop	r16
 758:	ff 90       	pop	r15
 75a:	ef 90       	pop	r14
 75c:	df 90       	pop	r13
 75e:	cf 90       	pop	r12
 760:	bf 90       	pop	r11
 762:	af 90       	pop	r10
 764:	08 95       	ret

00000766 <__vector_16>:
 766:	1f 92       	push	r1
 768:	0f 92       	push	r0
 76a:	0f b6       	in	r0, 0x3f	; 63
 76c:	0f 92       	push	r0
 76e:	11 24       	eor	r1, r1
 770:	2f 93       	push	r18
 772:	3f 93       	push	r19
 774:	8f 93       	push	r24
 776:	9f 93       	push	r25
 778:	af 93       	push	r26
 77a:	bf 93       	push	r27
 77c:	80 91 83 04 	lds	r24, 0x0483	; 0x800483 <timer0_millis>
 780:	90 91 84 04 	lds	r25, 0x0484	; 0x800484 <timer0_millis+0x1>
 784:	a0 91 85 04 	lds	r26, 0x0485	; 0x800485 <timer0_millis+0x2>
 788:	b0 91 86 04 	lds	r27, 0x0486	; 0x800486 <timer0_millis+0x3>
 78c:	30 91 82 04 	lds	r19, 0x0482	; 0x800482 <timer0_fract>
 790:	23 e0       	ldi	r18, 0x03	; 3
 792:	23 0f       	add	r18, r19
 794:	2d 37       	cpi	r18, 0x7D	; 125
 796:	20 f4       	brcc	.+8      	; 0x7a0 <__vector_16+0x3a>
 798:	01 96       	adiw	r24, 0x01	; 1
 79a:	a1 1d       	adc	r26, r1
 79c:	b1 1d       	adc	r27, r1
 79e:	05 c0       	rjmp	.+10     	; 0x7aa <__vector_16+0x44>
 7a0:	26 e8       	ldi	r18, 0x86	; 134
 7a2:	23 0f       	add	r18, r19
 7a4:	02 96       	adiw	r24, 0x02	; 2
 7a6:	a1 1d       	adc	r26, r1
 7a8:	b1 1d       	adc	r27, r1
 7aa:	20 93 82 04 	sts	0x0482, r18	; 0x800482 <timer0_fract>
 7ae:	80 93 83 04 	sts	0x0483, r24	; 0x800483 <timer0_millis>
 7b2:	90 93 84 04 	sts	0x0484, r25	; 0x800484 <timer0_millis+0x1>
 7b6:	a0 93 85 04 	sts	0x0485, r26	; 0x800485 <timer0_millis+0x2>
 7ba:	b0 93 86 04 	sts	0x0486, r27	; 0x800486 <timer0_millis+0x3>
 7be:	80 91 87 04 	lds	r24, 0x0487	; 0x800487 <timer0_overflow_count>
 7c2:	90 91 88 04 	lds	r25, 0x0488	; 0x800488 <timer0_overflow_count+0x1>
 7c6:	a0 91 89 04 	lds	r26, 0x0489	; 0x800489 <timer0_overflow_count+0x2>
 7ca:	b0 91 8a 04 	lds	r27, 0x048A	; 0x80048a <timer0_overflow_count+0x3>
 7ce:	01 96       	adiw	r24, 0x01	; 1
 7d0:	a1 1d       	adc	r26, r1
 7d2:	b1 1d       	adc	r27, r1
 7d4:	80 93 87 04 	sts	0x0487, r24	; 0x800487 <timer0_overflow_count>
 7d8:	90 93 88 04 	sts	0x0488, r25	; 0x800488 <timer0_overflow_count+0x1>
 7dc:	a0 93 89 04 	sts	0x0489, r26	; 0x800489 <timer0_overflow_count+0x2>
 7e0:	b0 93 8a 04 	sts	0x048A, r27	; 0x80048a <timer0_overflow_count+0x3>
 7e4:	bf 91       	pop	r27
 7e6:	af 91       	pop	r26
 7e8:	9f 91       	pop	r25
 7ea:	8f 91       	pop	r24
 7ec:	3f 91       	pop	r19
 7ee:	2f 91       	pop	r18
 7f0:	0f 90       	pop	r0
 7f2:	0f be       	out	0x3f, r0	; 63
 7f4:	0f 90       	pop	r0
 7f6:	1f 90       	pop	r1
 7f8:	18 95       	reti

000007fa <micros>:
 7fa:	3f b7       	in	r19, 0x3f	; 63
 7fc:	f8 94       	cli
 7fe:	80 91 87 04 	lds	r24, 0x0487	; 0x800487 <timer0_overflow_count>
 802:	90 91 88 04 	lds	r25, 0x0488	; 0x800488 <timer0_overflow_count+0x1>
 806:	a0 91 89 04 	lds	r26, 0x0489	; 0x800489 <timer0_overflow_count+0x2>
 80a:	b0 91 8a 04 	lds	r27, 0x048A	; 0x80048a <timer0_overflow_count+0x3>
 80e:	26 b5       	in	r18, 0x26	; 38
 810:	a8 9b       	sbis	0x15, 0	; 21
 812:	05 c0       	rjmp	.+10     	; 0x81e <micros+0x24>
 814:	2f 3f       	cpi	r18, 0xFF	; 255
 816:	19 f0       	breq	.+6      	; 0x81e <micros+0x24>
 818:	01 96       	adiw	r24, 0x01	; 1
 81a:	a1 1d       	adc	r26, r1
 81c:	b1 1d       	adc	r27, r1
 81e:	3f bf       	out	0x3f, r19	; 63
 820:	ba 2f       	mov	r27, r26
 822:	a9 2f       	mov	r26, r25
 824:	98 2f       	mov	r25, r24
 826:	88 27       	eor	r24, r24
 828:	82 0f       	add	r24, r18
 82a:	91 1d       	adc	r25, r1
 82c:	a1 1d       	adc	r26, r1
 82e:	b1 1d       	adc	r27, r1
 830:	bc 01       	movw	r22, r24
 832:	cd 01       	movw	r24, r26
 834:	42 e0       	ldi	r20, 0x02	; 2
 836:	66 0f       	add	r22, r22
 838:	77 1f       	adc	r23, r23
 83a:	88 1f       	adc	r24, r24
 83c:	99 1f       	adc	r25, r25
 83e:	4a 95       	dec	r20
 840:	d1 f7       	brne	.-12     	; 0x836 <micros+0x3c>
 842:	08 95       	ret

00000844 <delay>:
 844:	8f 92       	push	r8
 846:	9f 92       	push	r9
 848:	af 92       	push	r10
 84a:	bf 92       	push	r11
 84c:	cf 92       	push	r12
 84e:	df 92       	push	r13
 850:	ef 92       	push	r14
 852:	ff 92       	push	r15
 854:	6b 01       	movw	r12, r22
 856:	7c 01       	movw	r14, r24
 858:	0e 94 fd 03 	call	0x7fa	; 0x7fa <micros>
 85c:	4b 01       	movw	r8, r22
 85e:	5c 01       	movw	r10, r24
 860:	c1 14       	cp	r12, r1
 862:	d1 04       	cpc	r13, r1
 864:	e1 04       	cpc	r14, r1
 866:	f1 04       	cpc	r15, r1
 868:	01 f1       	breq	.+64     	; 0x8aa <delay+0x66>
 86a:	0e 94 57 05 	call	0xaae	; 0xaae <yield>
 86e:	0e 94 fd 03 	call	0x7fa	; 0x7fa <micros>
 872:	dc 01       	movw	r26, r24
 874:	cb 01       	movw	r24, r22
 876:	88 19       	sub	r24, r8
 878:	99 09       	sbc	r25, r9
 87a:	aa 09       	sbc	r26, r10
 87c:	bb 09       	sbc	r27, r11
 87e:	88 3e       	cpi	r24, 0xE8	; 232
 880:	93 40       	sbci	r25, 0x03	; 3
 882:	a1 05       	cpc	r26, r1
 884:	b1 05       	cpc	r27, r1
 886:	60 f3       	brcs	.-40     	; 0x860 <delay+0x1c>
 888:	21 e0       	ldi	r18, 0x01	; 1
 88a:	c2 1a       	sub	r12, r18
 88c:	d1 08       	sbc	r13, r1
 88e:	e1 08       	sbc	r14, r1
 890:	f1 08       	sbc	r15, r1
 892:	88 ee       	ldi	r24, 0xE8	; 232
 894:	88 0e       	add	r8, r24
 896:	83 e0       	ldi	r24, 0x03	; 3
 898:	98 1e       	adc	r9, r24
 89a:	a1 1c       	adc	r10, r1
 89c:	b1 1c       	adc	r11, r1
 89e:	c1 14       	cp	r12, r1
 8a0:	d1 04       	cpc	r13, r1
 8a2:	e1 04       	cpc	r14, r1
 8a4:	f1 04       	cpc	r15, r1
 8a6:	19 f7       	brne	.-58     	; 0x86e <delay+0x2a>
 8a8:	db cf       	rjmp	.-74     	; 0x860 <delay+0x1c>
 8aa:	ff 90       	pop	r15
 8ac:	ef 90       	pop	r14
 8ae:	df 90       	pop	r13
 8b0:	cf 90       	pop	r12
 8b2:	bf 90       	pop	r11
 8b4:	af 90       	pop	r10
 8b6:	9f 90       	pop	r9
 8b8:	8f 90       	pop	r8
 8ba:	08 95       	ret

000008bc <delayMicroseconds>:
 8bc:	82 30       	cpi	r24, 0x02	; 2
 8be:	91 05       	cpc	r25, r1
 8c0:	38 f0       	brcs	.+14     	; 0x8d0 <delayMicroseconds+0x14>
 8c2:	88 0f       	add	r24, r24
 8c4:	99 1f       	adc	r25, r25
 8c6:	88 0f       	add	r24, r24
 8c8:	99 1f       	adc	r25, r25
 8ca:	05 97       	sbiw	r24, 0x05	; 5
 8cc:	01 97       	sbiw	r24, 0x01	; 1
 8ce:	f1 f7       	brne	.-4      	; 0x8cc <delayMicroseconds+0x10>
 8d0:	08 95       	ret

000008d2 <init>:
 8d2:	78 94       	sei
 8d4:	84 b5       	in	r24, 0x24	; 36
 8d6:	82 60       	ori	r24, 0x02	; 2
 8d8:	84 bd       	out	0x24, r24	; 36
 8da:	84 b5       	in	r24, 0x24	; 36
 8dc:	81 60       	ori	r24, 0x01	; 1
 8de:	84 bd       	out	0x24, r24	; 36
 8e0:	85 b5       	in	r24, 0x25	; 37
 8e2:	82 60       	ori	r24, 0x02	; 2
 8e4:	85 bd       	out	0x25, r24	; 37
 8e6:	85 b5       	in	r24, 0x25	; 37
 8e8:	81 60       	ori	r24, 0x01	; 1
 8ea:	85 bd       	out	0x25, r24	; 37
 8ec:	ee e6       	ldi	r30, 0x6E	; 110
 8ee:	f0 e0       	ldi	r31, 0x00	; 0
 8f0:	80 81       	ld	r24, Z
 8f2:	81 60       	ori	r24, 0x01	; 1
 8f4:	80 83       	st	Z, r24
 8f6:	ea e7       	ldi	r30, 0x7A	; 122
 8f8:	f0 e0       	ldi	r31, 0x00	; 0
 8fa:	80 81       	ld	r24, Z
 8fc:	84 60       	ori	r24, 0x04	; 4
 8fe:	80 83       	st	Z, r24
 900:	80 81       	ld	r24, Z
 902:	82 60       	ori	r24, 0x02	; 2
 904:	80 83       	st	Z, r24
 906:	80 81       	ld	r24, Z
 908:	81 60       	ori	r24, 0x01	; 1
 90a:	80 83       	st	Z, r24
 90c:	80 81       	ld	r24, Z
 90e:	80 68       	ori	r24, 0x80	; 128
 910:	80 83       	st	Z, r24
 912:	10 92 c1 00 	sts	0x00C1, r1	; 0x8000c1 <__data_load_end+0x7ff337>
 916:	08 95       	ret

00000918 <nothing>:
 918:	08 95       	ret

0000091a <attachInterrupt>:
 91a:	82 30       	cpi	r24, 0x02	; 2
 91c:	e8 f4       	brcc	.+58     	; 0x958 <attachInterrupt+0x3e>
 91e:	e8 2f       	mov	r30, r24
 920:	f0 e0       	ldi	r31, 0x00	; 0
 922:	ee 0f       	add	r30, r30
 924:	ff 1f       	adc	r31, r31
 926:	e0 50       	subi	r30, 0x00	; 0
 928:	ff 4f       	sbci	r31, 0xFF	; 255
 92a:	71 83       	std	Z+1, r23	; 0x01
 92c:	60 83       	st	Z, r22
 92e:	81 30       	cpi	r24, 0x01	; 1
 930:	41 f0       	breq	.+16     	; 0x942 <attachInterrupt+0x28>
 932:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <__data_load_end+0x7ff2df>
 936:	8c 7f       	andi	r24, 0xFC	; 252
 938:	48 2b       	or	r20, r24
 93a:	40 93 69 00 	sts	0x0069, r20	; 0x800069 <__data_load_end+0x7ff2df>
 93e:	e8 9a       	sbi	0x1d, 0	; 29
 940:	08 95       	ret
 942:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <__data_load_end+0x7ff2df>
 946:	94 e0       	ldi	r25, 0x04	; 4
 948:	49 9f       	mul	r20, r25
 94a:	a0 01       	movw	r20, r0
 94c:	11 24       	eor	r1, r1
 94e:	83 7f       	andi	r24, 0xF3	; 243
 950:	48 2b       	or	r20, r24
 952:	40 93 69 00 	sts	0x0069, r20	; 0x800069 <__data_load_end+0x7ff2df>
 956:	e9 9a       	sbi	0x1d, 1	; 29
 958:	08 95       	ret

0000095a <__vector_1>:
 95a:	1f 92       	push	r1
 95c:	0f 92       	push	r0
 95e:	0f b6       	in	r0, 0x3f	; 63
 960:	0f 92       	push	r0
 962:	11 24       	eor	r1, r1
 964:	2f 93       	push	r18
 966:	3f 93       	push	r19
 968:	4f 93       	push	r20
 96a:	5f 93       	push	r21
 96c:	6f 93       	push	r22
 96e:	7f 93       	push	r23
 970:	8f 93       	push	r24
 972:	9f 93       	push	r25
 974:	af 93       	push	r26
 976:	bf 93       	push	r27
 978:	ef 93       	push	r30
 97a:	ff 93       	push	r31
 97c:	e0 91 00 01 	lds	r30, 0x0100	; 0x800100 <__data_start>
 980:	f0 91 01 01 	lds	r31, 0x0101	; 0x800101 <__data_start+0x1>
 984:	09 95       	icall
 986:	ff 91       	pop	r31
 988:	ef 91       	pop	r30
 98a:	bf 91       	pop	r27
 98c:	af 91       	pop	r26
 98e:	9f 91       	pop	r25
 990:	8f 91       	pop	r24
 992:	7f 91       	pop	r23
 994:	6f 91       	pop	r22
 996:	5f 91       	pop	r21
 998:	4f 91       	pop	r20
 99a:	3f 91       	pop	r19
 99c:	2f 91       	pop	r18
 99e:	0f 90       	pop	r0
 9a0:	0f be       	out	0x3f, r0	; 63
 9a2:	0f 90       	pop	r0
 9a4:	1f 90       	pop	r1
 9a6:	18 95       	reti

000009a8 <__vector_2>:
 9a8:	1f 92       	push	r1
 9aa:	0f 92       	push	r0
 9ac:	0f b6       	in	r0, 0x3f	; 63
 9ae:	0f 92       	push	r0
 9b0:	11 24       	eor	r1, r1
 9b2:	2f 93       	push	r18
 9b4:	3f 93       	push	r19
 9b6:	4f 93       	push	r20
 9b8:	5f 93       	push	r21
 9ba:	6f 93       	push	r22
 9bc:	7f 93       	push	r23
 9be:	8f 93       	push	r24
 9c0:	9f 93       	push	r25
 9c2:	af 93       	push	r26
 9c4:	bf 93       	push	r27
 9c6:	ef 93       	push	r30
 9c8:	ff 93       	push	r31
 9ca:	e0 91 02 01 	lds	r30, 0x0102	; 0x800102 <__data_start+0x2>
 9ce:	f0 91 03 01 	lds	r31, 0x0103	; 0x800103 <__data_start+0x3>
 9d2:	09 95       	icall
 9d4:	ff 91       	pop	r31
 9d6:	ef 91       	pop	r30
 9d8:	bf 91       	pop	r27
 9da:	af 91       	pop	r26
 9dc:	9f 91       	pop	r25
 9de:	8f 91       	pop	r24
 9e0:	7f 91       	pop	r23
 9e2:	6f 91       	pop	r22
 9e4:	5f 91       	pop	r21
 9e6:	4f 91       	pop	r20
 9e8:	3f 91       	pop	r19
 9ea:	2f 91       	pop	r18
 9ec:	0f 90       	pop	r0
 9ee:	0f be       	out	0x3f, r0	; 63
 9f0:	0f 90       	pop	r0
 9f2:	1f 90       	pop	r1
 9f4:	18 95       	reti

000009f6 <pinMode>:
 9f6:	cf 93       	push	r28
 9f8:	df 93       	push	r29
 9fa:	90 e0       	ldi	r25, 0x00	; 0
 9fc:	fc 01       	movw	r30, r24
 9fe:	e4 55       	subi	r30, 0x54	; 84
 a00:	ff 4f       	sbci	r31, 0xFF	; 255
 a02:	24 91       	lpm	r18, Z
 a04:	fc 01       	movw	r30, r24
 a06:	e0 54       	subi	r30, 0x40	; 64
 a08:	ff 4f       	sbci	r31, 0xFF	; 255
 a0a:	84 91       	lpm	r24, Z
 a0c:	88 23       	and	r24, r24
 a0e:	61 f1       	breq	.+88     	; 0xa68 <pinMode+0x72>
 a10:	90 e0       	ldi	r25, 0x00	; 0
 a12:	88 0f       	add	r24, r24
 a14:	99 1f       	adc	r25, r25
 a16:	fc 01       	movw	r30, r24
 a18:	e2 52       	subi	r30, 0x22	; 34
 a1a:	ff 4f       	sbci	r31, 0xFF	; 255
 a1c:	c5 91       	lpm	r28, Z+
 a1e:	d4 91       	lpm	r29, Z
 a20:	fc 01       	movw	r30, r24
 a22:	ec 52       	subi	r30, 0x2C	; 44
 a24:	ff 4f       	sbci	r31, 0xFF	; 255
 a26:	a5 91       	lpm	r26, Z+
 a28:	b4 91       	lpm	r27, Z
 a2a:	61 11       	cpse	r22, r1
 a2c:	09 c0       	rjmp	.+18     	; 0xa40 <pinMode+0x4a>
 a2e:	9f b7       	in	r25, 0x3f	; 63
 a30:	f8 94       	cli
 a32:	88 81       	ld	r24, Y
 a34:	20 95       	com	r18
 a36:	82 23       	and	r24, r18
 a38:	88 83       	st	Y, r24
 a3a:	ec 91       	ld	r30, X
 a3c:	2e 23       	and	r18, r30
 a3e:	0b c0       	rjmp	.+22     	; 0xa56 <pinMode+0x60>
 a40:	62 30       	cpi	r22, 0x02	; 2
 a42:	61 f4       	brne	.+24     	; 0xa5c <pinMode+0x66>
 a44:	9f b7       	in	r25, 0x3f	; 63
 a46:	f8 94       	cli
 a48:	38 81       	ld	r19, Y
 a4a:	82 2f       	mov	r24, r18
 a4c:	80 95       	com	r24
 a4e:	83 23       	and	r24, r19
 a50:	88 83       	st	Y, r24
 a52:	ec 91       	ld	r30, X
 a54:	2e 2b       	or	r18, r30
 a56:	2c 93       	st	X, r18
 a58:	9f bf       	out	0x3f, r25	; 63
 a5a:	06 c0       	rjmp	.+12     	; 0xa68 <pinMode+0x72>
 a5c:	8f b7       	in	r24, 0x3f	; 63
 a5e:	f8 94       	cli
 a60:	e8 81       	ld	r30, Y
 a62:	2e 2b       	or	r18, r30
 a64:	28 83       	st	Y, r18
 a66:	8f bf       	out	0x3f, r24	; 63
 a68:	df 91       	pop	r29
 a6a:	cf 91       	pop	r28
 a6c:	08 95       	ret

00000a6e <digitalWrite>:
 a6e:	90 e0       	ldi	r25, 0x00	; 0
 a70:	fc 01       	movw	r30, r24
 a72:	e4 55       	subi	r30, 0x54	; 84
 a74:	ff 4f       	sbci	r31, 0xFF	; 255
 a76:	24 91       	lpm	r18, Z
 a78:	fc 01       	movw	r30, r24
 a7a:	e0 54       	subi	r30, 0x40	; 64
 a7c:	ff 4f       	sbci	r31, 0xFF	; 255
 a7e:	e4 91       	lpm	r30, Z
 a80:	ee 23       	and	r30, r30
 a82:	a1 f0       	breq	.+40     	; 0xaac <digitalWrite+0x3e>
 a84:	f0 e0       	ldi	r31, 0x00	; 0
 a86:	ee 0f       	add	r30, r30
 a88:	ff 1f       	adc	r31, r31
 a8a:	ec 52       	subi	r30, 0x2C	; 44
 a8c:	ff 4f       	sbci	r31, 0xFF	; 255
 a8e:	a5 91       	lpm	r26, Z+
 a90:	b4 91       	lpm	r27, Z
 a92:	8f b7       	in	r24, 0x3f	; 63
 a94:	f8 94       	cli
 a96:	61 11       	cpse	r22, r1
 a98:	05 c0       	rjmp	.+10     	; 0xaa4 <digitalWrite+0x36>
 a9a:	9c 91       	ld	r25, X
 a9c:	e2 2f       	mov	r30, r18
 a9e:	e0 95       	com	r30
 aa0:	e9 23       	and	r30, r25
 aa2:	02 c0       	rjmp	.+4      	; 0xaa8 <digitalWrite+0x3a>
 aa4:	ec 91       	ld	r30, X
 aa6:	e2 2b       	or	r30, r18
 aa8:	ec 93       	st	X, r30
 aaa:	8f bf       	out	0x3f, r24	; 63
 aac:	08 95       	ret

00000aae <yield>:
 aae:	08 95       	ret

00000ab0 <_ZN5Print5writeEPKhj>:
 ab0:	cf 92       	push	r12
 ab2:	df 92       	push	r13
 ab4:	ef 92       	push	r14
 ab6:	ff 92       	push	r15
 ab8:	0f 93       	push	r16
 aba:	1f 93       	push	r17
 abc:	cf 93       	push	r28
 abe:	df 93       	push	r29
 ac0:	6c 01       	movw	r12, r24
 ac2:	7a 01       	movw	r14, r20
 ac4:	8b 01       	movw	r16, r22
 ac6:	c0 e0       	ldi	r28, 0x00	; 0
 ac8:	d0 e0       	ldi	r29, 0x00	; 0
 aca:	ce 15       	cp	r28, r14
 acc:	df 05       	cpc	r29, r15
 ace:	89 f0       	breq	.+34     	; 0xaf2 <_ZN5Print5writeEPKhj+0x42>
 ad0:	d8 01       	movw	r26, r16
 ad2:	6d 91       	ld	r22, X+
 ad4:	8d 01       	movw	r16, r26
 ad6:	d6 01       	movw	r26, r12
 ad8:	ed 91       	ld	r30, X+
 ada:	fc 91       	ld	r31, X
 adc:	01 90       	ld	r0, Z+
 ade:	f0 81       	ld	r31, Z
 ae0:	e0 2d       	mov	r30, r0
 ae2:	c6 01       	movw	r24, r12
 ae4:	09 95       	icall
 ae6:	89 2b       	or	r24, r25
 ae8:	11 f4       	brne	.+4      	; 0xaee <_ZN5Print5writeEPKhj+0x3e>
 aea:	7e 01       	movw	r14, r28
 aec:	02 c0       	rjmp	.+4      	; 0xaf2 <_ZN5Print5writeEPKhj+0x42>
 aee:	21 96       	adiw	r28, 0x01	; 1
 af0:	ec cf       	rjmp	.-40     	; 0xaca <_ZN5Print5writeEPKhj+0x1a>
 af2:	c7 01       	movw	r24, r14
 af4:	df 91       	pop	r29
 af6:	cf 91       	pop	r28
 af8:	1f 91       	pop	r17
 afa:	0f 91       	pop	r16
 afc:	ff 90       	pop	r15
 afe:	ef 90       	pop	r14
 b00:	df 90       	pop	r13
 b02:	cf 90       	pop	r12
 b04:	08 95       	ret

00000b06 <_ZN5Print5writeEPKc>:
 b06:	61 15       	cp	r22, r1
 b08:	71 05       	cpc	r23, r1
 b0a:	79 f0       	breq	.+30     	; 0xb2a <_ZN5Print5writeEPKc+0x24>
 b0c:	fb 01       	movw	r30, r22
 b0e:	01 90       	ld	r0, Z+
 b10:	00 20       	and	r0, r0
 b12:	e9 f7       	brne	.-6      	; 0xb0e <_ZN5Print5writeEPKc+0x8>
 b14:	31 97       	sbiw	r30, 0x01	; 1
 b16:	af 01       	movw	r20, r30
 b18:	46 1b       	sub	r20, r22
 b1a:	57 0b       	sbc	r21, r23
 b1c:	dc 01       	movw	r26, r24
 b1e:	ed 91       	ld	r30, X+
 b20:	fc 91       	ld	r31, X
 b22:	02 80       	ldd	r0, Z+2	; 0x02
 b24:	f3 81       	ldd	r31, Z+3	; 0x03
 b26:	e0 2d       	mov	r30, r0
 b28:	09 94       	ijmp
 b2a:	80 e0       	ldi	r24, 0x00	; 0
 b2c:	90 e0       	ldi	r25, 0x00	; 0
 b2e:	08 95       	ret

00000b30 <_ZN5Print7printlnEv>:
 b30:	64 e1       	ldi	r22, 0x14	; 20
 b32:	71 e0       	ldi	r23, 0x01	; 1
 b34:	0c 94 83 05 	jmp	0xb06	; 0xb06 <_ZN5Print5writeEPKc>

00000b38 <initVariant>:
 b38:	08 95       	ret

00000b3a <main>:
 b3a:	0e 94 69 04 	call	0x8d2	; 0x8d2 <init>
 b3e:	0e 94 9c 05 	call	0xb38	; 0xb38 <initVariant>
 b42:	0e 94 d1 02 	call	0x5a2	; 0x5a2 <setup>
 b46:	0e 94 24 03 	call	0x648	; 0x648 <loop>
 b4a:	fd cf       	rjmp	.-6      	; 0xb46 <main+0xc>

00000b4c <_ZN12SingleSerial4peekEv>:
 b4c:	90 91 c1 00 	lds	r25, 0x00C1	; 0x8000c1 <__data_load_end+0x7ff337>
 b50:	89 2f       	mov	r24, r25
 b52:	80 71       	andi	r24, 0x10	; 16
 b54:	94 ff       	sbrs	r25, 4
 b56:	0e c0       	rjmp	.+28     	; 0xb74 <_ZN12SingleSerial4peekEv+0x28>
 b58:	90 91 11 05 	lds	r25, 0x0511	; 0x800511 <_ZN12SingleSerial9_rxBufferE>
 b5c:	80 91 12 05 	lds	r24, 0x0512	; 0x800512 <_ZN12SingleSerial9_rxBufferE+0x1>
 b60:	98 13       	cpse	r25, r24
 b62:	02 c0       	rjmp	.+4      	; 0xb68 <_ZN12SingleSerial4peekEv+0x1c>
 b64:	80 e0       	ldi	r24, 0x00	; 0
 b66:	08 95       	ret
 b68:	e0 91 12 05 	lds	r30, 0x0512	; 0x800512 <_ZN12SingleSerial9_rxBufferE+0x1>
 b6c:	f0 e0       	ldi	r31, 0x00	; 0
 b6e:	e1 57       	subi	r30, 0x71	; 113
 b70:	fb 4f       	sbci	r31, 0xFB	; 251
 b72:	80 81       	ld	r24, Z
 b74:	08 95       	ret

00000b76 <_ZN12SingleSerial5flushEv>:
 b76:	e1 e1       	ldi	r30, 0x11	; 17
 b78:	f5 e0       	ldi	r31, 0x05	; 5
 b7a:	81 81       	ldd	r24, Z+1	; 0x01
 b7c:	80 83       	st	Z, r24
 b7e:	ef e0       	ldi	r30, 0x0F	; 15
 b80:	f5 e0       	ldi	r31, 0x05	; 5
 b82:	80 81       	ld	r24, Z
 b84:	81 83       	std	Z+1, r24	; 0x01
 b86:	08 95       	ret

00000b88 <_ZN12SingleSerialC1Ev>:
 b88:	fc 01       	movw	r30, r24
 b8a:	13 82       	std	Z+3, r1	; 0x03
 b8c:	12 82       	std	Z+2, r1	; 0x02
 b8e:	27 e2       	ldi	r18, 0x27	; 39
 b90:	31 e0       	ldi	r19, 0x01	; 1
 b92:	31 83       	std	Z+1, r19	; 0x01
 b94:	20 83       	st	Z, r18
 b96:	08 95       	ret

00000b98 <_ZN12SingleSerial5beginEm>:
 b98:	9b 01       	movw	r18, r22
 b9a:	ac 01       	movw	r20, r24
 b9c:	80 91 c1 00 	lds	r24, 0x00C1	; 0x8000c1 <__data_load_end+0x7ff337>
 ba0:	84 fd       	sbrc	r24, 4
 ba2:	10 92 c1 00 	sts	0x00C1, r1	; 0x8000c1 <__data_load_end+0x7ff337>
 ba6:	10 92 10 05 	sts	0x0510, r1	; 0x800510 <_ZN12SingleSerial9_txBufferE+0x1>
 baa:	10 92 0f 05 	sts	0x050F, r1	; 0x80050f <_ZN12SingleSerial9_txBufferE>
 bae:	10 92 12 05 	sts	0x0512, r1	; 0x800512 <_ZN12SingleSerial9_rxBufferE+0x1>
 bb2:	10 92 11 05 	sts	0x0511, r1	; 0x800511 <_ZN12SingleSerial9_rxBufferE>
 bb6:	21 15       	cp	r18, r1
 bb8:	31 05       	cpc	r19, r1
 bba:	41 05       	cpc	r20, r1
 bbc:	51 05       	cpc	r21, r1
 bbe:	01 f1       	breq	.+64     	; 0xc00 <_ZN12SingleSerial5beginEm+0x68>
 bc0:	21 15       	cp	r18, r1
 bc2:	81 ee       	ldi	r24, 0xE1	; 225
 bc4:	38 07       	cpc	r19, r24
 bc6:	41 05       	cpc	r20, r1
 bc8:	51 05       	cpc	r21, r1
 bca:	09 f1       	breq	.+66     	; 0xc0e <_ZN12SingleSerial5beginEm+0x76>
 bcc:	82 e0       	ldi	r24, 0x02	; 2
 bce:	80 93 c0 00 	sts	0x00C0, r24	; 0x8000c0 <__data_load_end+0x7ff336>
 bd2:	60 e0       	ldi	r22, 0x00	; 0
 bd4:	79 e0       	ldi	r23, 0x09	; 9
 bd6:	8d e3       	ldi	r24, 0x3D	; 61
 bd8:	90 e0       	ldi	r25, 0x00	; 0
 bda:	0e 94 81 06 	call	0xd02	; 0xd02 <__udivmodsi4>
 bde:	da 01       	movw	r26, r20
 be0:	c9 01       	movw	r24, r18
 be2:	01 97       	sbiw	r24, 0x01	; 1
 be4:	a1 09       	sbc	r26, r1
 be6:	b1 09       	sbc	r27, r1
 be8:	ac 01       	movw	r20, r24
 bea:	bd 01       	movw	r22, r26
 bec:	76 95       	lsr	r23
 bee:	67 95       	ror	r22
 bf0:	57 95       	ror	r21
 bf2:	47 95       	ror	r20
 bf4:	94 2f       	mov	r25, r20
 bf6:	85 2f       	mov	r24, r21
 bf8:	80 93 c5 00 	sts	0x00C5, r24	; 0x8000c5 <__data_load_end+0x7ff33b>
 bfc:	90 93 c4 00 	sts	0x00C4, r25	; 0x8000c4 <__data_load_end+0x7ff33a>
 c00:	88 e9       	ldi	r24, 0x98	; 152
 c02:	80 93 c1 00 	sts	0x00C1, r24	; 0x8000c1 <__data_load_end+0x7ff337>
 c06:	86 e0       	ldi	r24, 0x06	; 6
 c08:	80 93 c2 00 	sts	0x00C2, r24	; 0x8000c2 <__data_load_end+0x7ff338>
 c0c:	08 95       	ret
 c0e:	10 92 c0 00 	sts	0x00C0, r1	; 0x8000c0 <__data_load_end+0x7ff336>
 c12:	90 e1       	ldi	r25, 0x10	; 16
 c14:	80 e0       	ldi	r24, 0x00	; 0
 c16:	f0 cf       	rjmp	.-32     	; 0xbf8 <_ZN12SingleSerial5beginEm+0x60>

00000c18 <_ZN12SingleSerial11available_SEv>:
 c18:	90 91 c1 00 	lds	r25, 0x00C1	; 0x8000c1 <__data_load_end+0x7ff337>
 c1c:	89 2f       	mov	r24, r25
 c1e:	80 71       	andi	r24, 0x10	; 16
 c20:	94 ff       	sbrs	r25, 4
 c22:	06 c0       	rjmp	.+12     	; 0xc30 <_ZN12SingleSerial11available_SEv+0x18>
 c24:	80 91 11 05 	lds	r24, 0x0511	; 0x800511 <_ZN12SingleSerial9_rxBufferE>
 c28:	90 91 12 05 	lds	r25, 0x0512	; 0x800512 <_ZN12SingleSerial9_rxBufferE+0x1>
 c2c:	89 1b       	sub	r24, r25
 c2e:	8f 77       	andi	r24, 0x7F	; 127
 c30:	08 95       	ret

00000c32 <_ZN12SingleSerial9availableEv>:
 c32:	0c 94 0c 06 	jmp	0xc18	; 0xc18 <_ZN12SingleSerial11available_SEv>

00000c36 <_ZN12SingleSerial6read_SEv>:
 c36:	90 91 c1 00 	lds	r25, 0x00C1	; 0x8000c1 <__data_load_end+0x7ff337>
 c3a:	89 2f       	mov	r24, r25
 c3c:	80 71       	andi	r24, 0x10	; 16
 c3e:	94 ff       	sbrs	r25, 4
 c40:	14 c0       	rjmp	.+40     	; 0xc6a <_ZN12SingleSerial6read_SEv+0x34>
 c42:	90 91 11 05 	lds	r25, 0x0511	; 0x800511 <_ZN12SingleSerial9_rxBufferE>
 c46:	80 91 12 05 	lds	r24, 0x0512	; 0x800512 <_ZN12SingleSerial9_rxBufferE+0x1>
 c4a:	98 13       	cpse	r25, r24
 c4c:	02 c0       	rjmp	.+4      	; 0xc52 <_ZN12SingleSerial6read_SEv+0x1c>
 c4e:	80 e0       	ldi	r24, 0x00	; 0
 c50:	08 95       	ret
 c52:	e0 91 12 05 	lds	r30, 0x0512	; 0x800512 <_ZN12SingleSerial9_rxBufferE+0x1>
 c56:	f0 e0       	ldi	r31, 0x00	; 0
 c58:	e1 57       	subi	r30, 0x71	; 113
 c5a:	fb 4f       	sbci	r31, 0xFB	; 251
 c5c:	80 81       	ld	r24, Z
 c5e:	90 91 12 05 	lds	r25, 0x0512	; 0x800512 <_ZN12SingleSerial9_rxBufferE+0x1>
 c62:	9f 5f       	subi	r25, 0xFF	; 255
 c64:	9f 77       	andi	r25, 0x7F	; 127
 c66:	90 93 12 05 	sts	0x0512, r25	; 0x800512 <_ZN12SingleSerial9_rxBufferE+0x1>
 c6a:	08 95       	ret

00000c6c <_ZN12SingleSerial4readEv>:
 c6c:	0c 94 1b 06 	jmp	0xc36	; 0xc36 <_ZN12SingleSerial6read_SEv>

00000c70 <_ZN12SingleSerial7write_SEh>:
 c70:	90 91 c1 00 	lds	r25, 0x00C1	; 0x8000c1 <__data_load_end+0x7ff337>
 c74:	94 ff       	sbrs	r25, 4
 c76:	15 c0       	rjmp	.+42     	; 0xca2 <_ZN12SingleSerial7write_SEh+0x32>
 c78:	90 91 0f 05 	lds	r25, 0x050F	; 0x80050f <_ZN12SingleSerial9_txBufferE>
 c7c:	9f 5f       	subi	r25, 0xFF	; 255
 c7e:	93 70       	andi	r25, 0x03	; 3
 c80:	20 91 10 05 	lds	r18, 0x0510	; 0x800510 <_ZN12SingleSerial9_txBufferE+0x1>
 c84:	92 17       	cp	r25, r18
 c86:	e1 f3       	breq	.-8      	; 0xc80 <_ZN12SingleSerial7write_SEh+0x10>
 c88:	e0 91 0f 05 	lds	r30, 0x050F	; 0x80050f <_ZN12SingleSerial9_txBufferE>
 c8c:	f0 e0       	ldi	r31, 0x00	; 0
 c8e:	e5 57       	subi	r30, 0x75	; 117
 c90:	fb 4f       	sbci	r31, 0xFB	; 251
 c92:	80 83       	st	Z, r24
 c94:	90 93 0f 05 	sts	0x050F, r25	; 0x80050f <_ZN12SingleSerial9_txBufferE>
 c98:	80 91 c1 00 	lds	r24, 0x00C1	; 0x8000c1 <__data_load_end+0x7ff337>
 c9c:	80 62       	ori	r24, 0x20	; 32
 c9e:	80 93 c1 00 	sts	0x00C1, r24	; 0x8000c1 <__data_load_end+0x7ff337>
 ca2:	08 95       	ret

00000ca4 <_ZN12SingleSerial5writeEh>:
 ca4:	86 2f       	mov	r24, r22
 ca6:	0e 94 38 06 	call	0xc70	; 0xc70 <_ZN12SingleSerial7write_SEh>
 caa:	81 e0       	ldi	r24, 0x01	; 1
 cac:	90 e0       	ldi	r25, 0x00	; 0
 cae:	08 95       	ret

00000cb0 <_ZN8MyStream6_writeEh>:
 cb0:	dc 01       	movw	r26, r24
 cb2:	ed 91       	ld	r30, X+
 cb4:	fc 91       	ld	r31, X
 cb6:	01 90       	ld	r0, Z+
 cb8:	f0 81       	ld	r31, Z
 cba:	e0 2d       	mov	r30, r0
 cbc:	09 94       	ijmp

00000cbe <_ZN12BetterStream7print_PEPKc>:
 cbe:	0f 93       	push	r16
 cc0:	1f 93       	push	r17
 cc2:	cf 93       	push	r28
 cc4:	df 93       	push	r29
 cc6:	8c 01       	movw	r16, r24
 cc8:	fb 01       	movw	r30, r22
 cca:	64 91       	lpm	r22, Z
 ccc:	ef 01       	movw	r28, r30
 cce:	21 96       	adiw	r28, 0x01	; 1
 cd0:	66 23       	and	r22, r22
 cd2:	29 f0       	breq	.+10     	; 0xcde <_ZN12BetterStream7print_PEPKc+0x20>
 cd4:	c8 01       	movw	r24, r16
 cd6:	0e 94 58 06 	call	0xcb0	; 0xcb0 <_ZN8MyStream6_writeEh>
 cda:	fe 01       	movw	r30, r28
 cdc:	f6 cf       	rjmp	.-20     	; 0xcca <_ZN12BetterStream7print_PEPKc+0xc>
 cde:	df 91       	pop	r29
 ce0:	cf 91       	pop	r28
 ce2:	1f 91       	pop	r17
 ce4:	0f 91       	pop	r16
 ce6:	08 95       	ret

00000ce8 <_ZN12BetterStream9println_PEPKc>:
 ce8:	cf 93       	push	r28
 cea:	df 93       	push	r29
 cec:	ec 01       	movw	r28, r24
 cee:	0e 94 5f 06 	call	0xcbe	; 0xcbe <_ZN12BetterStream7print_PEPKc>
 cf2:	ce 01       	movw	r24, r28
 cf4:	df 91       	pop	r29
 cf6:	cf 91       	pop	r28
 cf8:	0c 94 98 05 	jmp	0xb30	; 0xb30 <_ZN5Print7printlnEv>

00000cfc <exit>:
 cfc:	f8 94       	cli
 cfe:	0c 94 a9 06 	jmp	0xd52	; 0xd52 <_exit>

00000d02 <__udivmodsi4>:
 d02:	a1 e2       	ldi	r26, 0x21	; 33
 d04:	1a 2e       	mov	r1, r26
 d06:	aa 1b       	sub	r26, r26
 d08:	bb 1b       	sub	r27, r27
 d0a:	fd 01       	movw	r30, r26
 d0c:	0d c0       	rjmp	.+26     	; 0xd28 <__udivmodsi4_ep>

00000d0e <__udivmodsi4_loop>:
 d0e:	aa 1f       	adc	r26, r26
 d10:	bb 1f       	adc	r27, r27
 d12:	ee 1f       	adc	r30, r30
 d14:	ff 1f       	adc	r31, r31
 d16:	a2 17       	cp	r26, r18
 d18:	b3 07       	cpc	r27, r19
 d1a:	e4 07       	cpc	r30, r20
 d1c:	f5 07       	cpc	r31, r21
 d1e:	20 f0       	brcs	.+8      	; 0xd28 <__udivmodsi4_ep>
 d20:	a2 1b       	sub	r26, r18
 d22:	b3 0b       	sbc	r27, r19
 d24:	e4 0b       	sbc	r30, r20
 d26:	f5 0b       	sbc	r31, r21

00000d28 <__udivmodsi4_ep>:
 d28:	66 1f       	adc	r22, r22
 d2a:	77 1f       	adc	r23, r23
 d2c:	88 1f       	adc	r24, r24
 d2e:	99 1f       	adc	r25, r25
 d30:	1a 94       	dec	r1
 d32:	69 f7       	brne	.-38     	; 0xd0e <__udivmodsi4_loop>
 d34:	60 95       	com	r22
 d36:	70 95       	com	r23
 d38:	80 95       	com	r24
 d3a:	90 95       	com	r25
 d3c:	9b 01       	movw	r18, r22
 d3e:	ac 01       	movw	r20, r24
 d40:	bd 01       	movw	r22, r26
 d42:	cf 01       	movw	r24, r30
 d44:	08 95       	ret

00000d46 <__tablejump2__>:
 d46:	ee 0f       	add	r30, r30
 d48:	ff 1f       	adc	r31, r31
 d4a:	05 90       	lpm	r0, Z+
 d4c:	f4 91       	lpm	r31, Z
 d4e:	e0 2d       	mov	r30, r0
 d50:	09 94       	ijmp

00000d52 <_exit>:
 d52:	f8 94       	cli

00000d54 <__stop_program>:
 d54:	ff cf       	rjmp	.-2      	; 0xd54 <__stop_program>
