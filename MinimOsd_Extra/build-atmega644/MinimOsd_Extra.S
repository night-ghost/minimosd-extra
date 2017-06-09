
MinimOsd_Extra.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
       0:	0c 94 02 06 	jmp	0xc04	; 0xc04 <__ctors_end>
       4:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
       8:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
       c:	0c 94 88 24 	jmp	0x4910	; 0x4910 <__vector_3>
      10:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      14:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      18:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      1c:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      20:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      24:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      28:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      2c:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      30:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      34:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      38:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      3c:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      40:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      44:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      48:	0c 94 c4 35 	jmp	0x6b88	; 0x6b88 <__vector_18>
      4c:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      50:	0c 94 43 10 	jmp	0x2086	; 0x2086 <__vector_20>
      54:	0c 94 7e 10 	jmp	0x20fc	; 0x20fc <__vector_21>
      58:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      5c:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      60:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      64:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      68:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      6c:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      70:	0c 94 cc 10 	jmp	0x2198	; 0x2198 <__vector_28>
      74:	0c 94 07 11 	jmp	0x220e	; 0x220e <__vector_29>
      78:	0c 94 2a 06 	jmp	0xc54	; 0xc54 <__bad_interrupt>
      7c:	a2 2a       	or	r10, r18
      7e:	a6 2a       	or	r10, r22
      80:	ba 2a       	or	r11, r26
      82:	d4 2a       	or	r13, r20
      84:	ca 2a       	or	r12, r26
      86:	de 2a       	or	r13, r30
      88:	e8 2a       	or	r14, r24
      8a:	f9 2a       	or	r15, r25
      8c:	0f 2b       	or	r16, r31
      8e:	35 2b       	or	r19, r21
      90:	35 2b       	or	r19, r21
      92:	08 4a       	sbci	r16, 0xA8	; 168
      94:	d7 3b       	cpi	r29, 0xB7	; 183
      96:	3b ce       	rjmp	.-906    	; 0xfffffd0e <__eeprom_end+0xff7efd0e>
      98:	01 6e       	ori	r16, 0xE1	; 225
      9a:	84 bc       	out	0x24, r8	; 36
      9c:	bf fd       	.word	0xfdbf	; ????
      9e:	c1 2f       	mov	r28, r17
      a0:	3d 6c       	ori	r19, 0xCD	; 205
      a2:	74 31       	cpi	r23, 0x14	; 20
      a4:	9a bd       	out	0x2a, r25	; 42
      a6:	56 83       	std	Z+6, r21	; 0x06
      a8:	3d da       	rcall	.-2950   	; 0xfffff524 <__eeprom_end+0xff7ef524>
      aa:	3d 00       	.word	0x003d	; ????
      ac:	c7 7f       	andi	r28, 0xF7	; 247
      ae:	11 be       	out	0x31, r1	; 49
      b0:	d9 e4       	ldi	r29, 0x49	; 73
      b2:	bb 4c       	sbci	r27, 0xCB	; 203
      b4:	3e 91       	ld	r19, -X
      b6:	6b aa       	std	Y+51, r6	; 0x33
      b8:	aa be       	out	0x3a, r10	; 58
      ba:	00 00       	nop
      bc:	00 80       	ld	r0, Z
      be:	3f 05       	cpc	r19, r15
      c0:	a8 4c       	sbci	r26, 0xC8	; 200
      c2:	cd b2       	in	r12, 0x1d	; 29
      c4:	d4 4e       	sbci	r29, 0xE4	; 228
      c6:	b9 38       	cpi	r27, 0x89	; 137
      c8:	36 a9       	ldd	r19, Z+54	; 0x36
      ca:	02 0c       	add	r0, r2
      cc:	50 b9       	out	0x00, r21	; 0
      ce:	91 86       	std	Z+9, r9	; 0x09
      d0:	88 08       	sbc	r8, r8
      d2:	3c a6       	std	Y+44, r3	; 0x2c
      d4:	aa aa       	std	Y+50, r10	; 0x32
      d6:	2a be       	out	0x3a, r2	; 58
      d8:	00 00       	nop
      da:	00 80       	ld	r0, Z
      dc:	3f 06       	cpc	r3, r31
      de:	64 ec       	ldi	r22, 0xC4	; 196
      e0:	1b 3c       	cpi	r17, 0xCB	; 203
      e2:	04 bc       	out	0x24, r0	; 36
      e4:	16 3e       	cpi	r17, 0xE6	; 230
      e6:	3b e5       	ldi	r19, 0x5B	; 91
      e8:	b9 3c       	cpi	r27, 0xC9	; 201
      ea:	c9 3c       	cpi	r28, 0xC9	; 201
      ec:	37 c2       	rjmp	.+1134   	; 0x55c <_ZZ18mavlink_parse_charE20mavlink_message_crcs+0xf7>
      ee:	9e 5a       	subi	r25, 0xAE	; 174
      f0:	3d 66       	ori	r19, 0x6D	; 109
      f2:	04 98       	cbi	0x00, 4	; 0
      f4:	08 3e       	cpi	r16, 0xE8	; 232
      f6:	ea 69       	ori	r30, 0x9A	; 154
      f8:	aa aa       	std	Y+50, r10	; 0x32
      fa:	3e 00       	.word	0x003e	; ????
      fc:	00 00       	nop
      fe:	80 3f       	cpi	r24, 0xF0	; 240

00000100 <__trampolines_end>:
     100:	74 69       	ori	r23, 0x94	; 148
     102:	6d 65       	ori	r22, 0x5D	; 93
     104:	3d 25       	eor	r19, r13
     106:	6c 64       	ori	r22, 0x4C	; 76
     108:	0a 00       	.word	0x000a	; ????

0000010a <_ZZN3OSD6updateEvE3__c_0>:
     10a:	3a 20 00                                            : .

0000010d <_ZZN3OSD6updateEvE3__c>:
     10d:	63 6e 74 00                                         cnt.

00000111 <_ZZN3OSD13setBrightnessEvE6levels>:
     111:	03 02 01 00                                         ....

00000115 <_ZZL10pan_togglevE4msgs>:
     115:	53 63 72 65 65 6e 20 30 00                          Screen 0.

0000011e <_ZZL7getDatavE3__c>:
     11e:	70 75 6c 73 65 3d 25 64 20 73 70 3d 25 64 20 73     pulse=%d sp=%d s
     12e:	70 65 65 64 3d 25 6c 64 00                          peed=%ld.

00000137 <_ZZL9print_rffvE3__c>:
     137:	52 46 46 00                                         RFF.

0000013b <_ZZL10font_statevE3__c>:
     13b:	66 6f 6e 74 20 75 70 6c 6f 61 64 69 6e 67 20 00     font uploading .

0000014b <_ZZL10uploadFontvE3__c_0>:
     14b:	46 44 00                                            FD.

0000014e <_ZZL10uploadFontvE3__c>:
     14e:	43 44 00                                            CD.

00000151 <_ZZ4loopE3__c_1>:
     151:	73 74 61 63 6b 20 62 6f 74 74 6f 6d 20 3d 20 25     stack bottom = %
     161:	78 0a 00                                            x..

00000164 <_ZZ4loopE3__c_0>:
     164:	6c 6f 6f 70 20 74 69 6d 65 20 3d 20 25 64 6d 73     loop time = %dms
     174:	20 6c 6f 73 74 20 62 79 74 65 73 3d 25 64 0a 00      lost bytes=%d..

00000184 <_ZZ4loopE3__c>:
     184:	72 65 73 74 61 72 74 20 4d 41 58 21 20 76 73 79     restart MAX! vsy
     194:	6e 63 5f 63 6f 75 6e 74 3d 25 64 0a 00              nc_count=%d..

000001a1 <_ZZ5setupE3__c_8>:
     1a1:	23 73 65 74 75 70 20 64 6f 6e 65 00                 #setup done.

000001ad <_ZZ5setupE8alt_pins>:
     1ad:	10 0e 0f 11                                         ....

000001b1 <_ZZ5setupE3__c_7>:
     1b1:	74 69 6d 65 3d 25 6c 64 0a 00                       time=%ld..

000001bb <_ZZ5setupE3__c_6>:
     1bb:	23 20 73 65 69 00                                   # sei.

000001c1 <_ZZ5setupE3__c_5>:
     1c1:	74 69 6d 65 3d 25 6c 64 0a 00                       time=%ld..

000001cb <_ZZ5setupE3__c_4>:
     1cb:	23 20 75 70 64 61 74 65 00                          # update.

000001d4 <_ZZ5setupE3__c_3>:
     1d4:	74 69 6d 65 3d 25 6c 64 0a 00                       time=%ld..

000001de <_ZZ5setupE3__c_2>:
     1de:	23 20 75 6e 70 6c 75 67 53 6c 61 76 65 73 00        # unplugSlaves.

000001ed <_ZZ5setupE3__c_1>:
     1ed:	74 69 6d 65 3d 25 6c 64 0a 00                       time=%ld..

000001f7 <_ZZ5setupE3__c_0>:
     1f7:	23 31 7a 7a 7a 7a 7a 0a 00                          #1zzzzz..

00000200 <_ZZ5setupE3__c>:
     200:	23 62 6f 6f 74 00                                   #boot.

00000206 <_ZZL8panSetupvE4incs>:
     206:	01 00 0a 00 64 00 e8 03                             ....d...

0000020e <_ZZL8panSetupvE3__c_0>:
     20e:	20 28 4e 54 53 43 29 00                              (NTSC).

00000216 <_ZZL8panSetupvE3__c>:
     216:	20 28 50 41 4c 29 00                                 (PAL).

0000021d <_ZZL16print_all_panelsPK11Panels_listE3__c_0>:
     21d:	ff 70 67 3d 25 75 20 70 73 3d 25 75 00              .pg=%u ps=%u.

0000022a <_ZZL16print_all_panelsPK11Panels_listE3__c>:
     22a:	63 72 63 3d 25 75 20 62 3d 25 6c 64 20 62 6c 3d     crc=%u b=%ld bl=
     23a:	25 75 00                                            %u.

0000023d <_ZZL8panFdata5PointE4fmt0>:
     23d:	25 37 2e 32 66 00                                   %7.2f.

00000243 <_ZZL8panFdata5PointE4fmt1>:
     243:	25 36 2e 31 66 00                                   %6.1f.

00000249 <_ZZL8panFdata5PointE4fmt6>:
     249:	91 25 37 2e 32 66 00                                .%7.2f.

00000250 <_ZZL8panFdata5PointE4fmt7>:
     250:	a1 25 37 2e 32 66 00                                .%7.2f.

00000257 <_ZZL8panFdata5PointE2fd>:
     257:	3d 02 0b 68 3d 06 00 43 02 8f 68 f2 06 00 43 02     =..h=..C..h...C.
     267:	14 73 35 06 00 43 02 1d 73 2d 06 00 43 02 12 68     .s5..C..s-..C..h
     277:	31 06 00 49 02 90 76 25 06 00 50 02 a0 76 21 06     1..I..v%..P..v!.
     287:	00 43 02 bd 61 29 06 00 43 02 57 77 1d 06 00 43     .C..a)..C.Ww...C
     297:	02 01 66 ee 06 00                                   ..f...

0000029d <_ZZL15panWaitMAVBeatsvE3__c_2>:
     29d:	ff 73 74 61 63 6b 20 62 6f 74 74 6f 6d 20 3d 20     .stack bottom = 
     2ad:	25 78 00                                            %x.

000002b0 <_ZZL15panWaitMAVBeatsvE3__c_1>:
     2b0:	ff 70 61 63 6b 65 74 73 20 67 6f 74 3d 25 75 20     .packets got=%u 
     2c0:	73 6b 69 70 3d 25 75 00                             skip=%u.

000002c8 <_ZZL15panWaitMAVBeatsvE3__c_0>:
     2c8:	6c 6f 6f 70 20 74 69 6d 65 3d 25 64 6d 73 20 63     loop time=%dms c
     2d8:	72 63 20 64 72 6f 70 73 3d 25 75 ff 20 62 79 74     rc drops=%u. byt
     2e8:	65 73 3d 25 6c 64 20 6c 6f 73 74 3d 25 75 00        es=%ld lost=%u.

000002f7 <_ZZL15panWaitMAVBeatsvE3__c>:
     2f7:	4e 6f 20 69 6e 70 75 74 20 64 61 74 61 21 20 25     No input data! %
     307:	75 ff 00                                            u..

0000030a <_ZZL10panHorizon5PointE3__c>:
     30a:	b8 b9 00                                            ...

0000030d <_ZZL8panPitch5PointE3__c>:
     30d:	25 34 69 05 07 00                                   %4i...

00000313 <_ZZL7panRoll5PointE3__c>:
     313:	25 34 69 05 06 00                                   %4i...

00000319 <_ZZL6panGPS5PointE3__c_1>:
     319:	6f 76 65 72 6c 6f 61 64 00                          overload.

00000322 <_ZZL6panGPS5PointE3__c_0>:
     322:	66 72 6f 7a 65 6e 00                                frozen.

00000329 <_ZZL6panGPS5PointE3__c>:
     329:	53 74 72 65 61 6d 00                                Stream.

00000330 <_ZZL6panCOG5PointE3__c>:
     330:	25 34 69 05 00                                      %4i..

00000335 <_ZZL7panRose5PointE3__c_2>:
     335:	ff 20 ce ce ce ce 60 ce ce ce ce 00                 . ....`.....

00000341 <_ZZL7panRose5PointE3__c_1>:
     341:	ff 20 20 20 24 cb 7c 40 cb 24 00                    .   $.|@.$.

0000034c <_ZZL7panRose5PointE8buf_Rule>:
     34c:	82 80 81 80 81 80 84 80 81 80 81 80 83 80 81 80     ................
     35c:	81 80 85 80 81 80 81 80                             ........

00000364 <_ZZL7panRose5PointE3__c_0>:
     364:	20 c8 c8 c8 c8 7e c8 c8 c8 c8 20 ff 00               ....~.... ..

00000371 <_ZZL7panRose5PointE3__c>:
     371:	20 20 20 24 cb b8 b9 cb 24 20 20 20 ff 00              $....$   ..

0000037f <_ZZL8panWPDis5PointE3__c>:
     37f:	20 58 65 00                                          Xe.

00000383 <_ZZL12panWindSpeed5PointE3__c>:
     383:	25 32 2e 30 66 00                                   %2.0f.

00000389 <_ZZL8panClimb5PointE6f_4_0f>:
     389:	25 20 34 2e 30 66 00                                % 4.0f.

00000390 <_ZZL8panClimb5PointE3__c_0>:
     390:	25 20 34 2e 31 66 00                                % 4.1f.

00000397 <_ZZL8panClimb5PointE3__c>:
     397:	25 20 34 2e 32 66 00                                % 4.2f.

0000039e <_ZZL7panTune5PointE4fmt0>:
     39e:	52 25 33 2e 30 66 05 00                             R%3.0f..

000003a6 <_ZZL7panTune5PointE4fmt1>:
     3a6:	50 25 33 2e 30 66 05 00                             P%3.0f..

000003ae <_ZZL7panTune5PointE4fmt2>:
     3ae:	48 25 33 2e 30 66 05 00                             H%3.0f..

000003b6 <_ZZL7panTune5PointE4fmt3>:
     3b6:	42 25 35 2e 31 66 05 00                             B%5.1f..

000003be <_ZZL7panTune5PointE4fmt4>:
     3be:	45 25 35 2e 31 66 00                                E%5.1f.

000003c5 <_ZZL7panTune5PointE4fmt5>:
     3c5:	45 25 34 2e 30 66 6d 00                             E%4.0fm.

000003cd <_ZZL7panTune5PointE4fmt6>:
     3cd:	73 45 25 35 2e 31 66 00                             sE%5.1f.

000003d5 <_ZZL7panTune5PointE2fd>:
     3d5:	9e 03 6e 69 ec 06 00 a6 03 6e 69 ea 06 00 ae 03     ..ni.....ni.....
     3e5:	6e 69 e8 06 00 b6 03 54 69 e6 06 00 be 03 41 68     ni.....Ti.....Ah
     3f5:	df 06 00 c5 03 58 69 d1 06 00 cd 03 41 73 db 06     .....Xi.....As..
	...

00000406 <_ZZL6panEff5PointE3__c>:
     406:	20 90 91 00                                          ...

0000040a <_ZZL7panTemp5PointE3__c>:
     40a:	25 35 2e 31 66 00                                   %5.1f.

00000410 <_ZZL5panCh5PointE3__c>:
     410:	43 25 64 25 35 69 ff 00                             C%d%5i..

00000418 <_ZZL8panScale5PointE3__c>:
     418:	25 69 00                                            %i.

0000041b <_ZZL7panDate5PointE3__c>:
     41b:	2e 25 34 64 00                                      .%4d.

00000420 <_ZZL7panDate5PointE11daysInMonth>:
     420:	1f 1c 1f 1e 1f 1e 1f 1f 1e 1f 1e 1f                 ............

0000042c <_ZZL9printTimejhhE6f_02in>:
     42c:	25 30 32 69 ff 00                                   %02i..

00000432 <_ZZL9printTimejhhE3__c>:
     432:	3a 25 30 32 69 3a 00                                :%02i:.

00000439 <_ZZL7panVibe5PointE3__c>:
     439:	20 20 78 20 20 79 20 20 7a ff 00                      x  y  z..

00000444 <_ZZL8panVario5PointE3__c_0>:
     444:	20 b3 ff 20 b3 ff 20 c5 ff 20 b3 ff 20 b3 00         .. .. .. .. ..

00000453 <_ZZL8panVario5PointE3__c>:
     453:	b2 ff b2 ff c6 ff b2 ff b2 00                       ..........

0000045d <_ZZ10radar_charvE3arr>:
     45d:	b0 b1 b4 b5 b6 b7 7b 7d                             ......{}

00000465 <_ZZ18mavlink_parse_charE20mavlink_message_crcs>:
     465:	32 7c 89 00 ed d9 68 77 00 00 00 59 00 00 00 00     2|....hw...Y....
     475:	00 00 00 00 d6 9f dc a8 18 17 aa 90 43 73 27 f6     ............Cs'.
     485:	b9 68 ed f4 de d4 09 fe e6 1c 1c 84 dd e8 0b 99     .h..............
     495:	29 27 d6 df 8d 21 0f 03 64 18 ef ee 1e 99 b7 82     )'...!..d.......
     4a5:	52 76 94 15 00 34 7c 00 00 26 14 9e 98 8f 00 00     Rv...4|..&......
     4b5:	00 6a 31 16 8f 8c 05 96 00 e7 b7 3f 36 00 00 00     .j1........?6...
     4c5:	00 00 00 00 af 66 9e d0 38 5d 8a 6c 20 b9 54 22     .....f..8].l .T"
     4d5:	00 7c ed 04 4c 80 38 74 86 ed cb fa 57 cb dc 19     .|..L.8t....W...
     4e5:	e2 00 1d df 55 06 e5 cb 01 c3 00 00 00 00 00 00     ....U...........
     4f5:	00 00 00 9a b2 00 86 db d0 bc 54 16 13 15 86 00     ..........T.....
     505:	4e 44 bd 7f 6f 15 15 90 01 00 00 b5 00 00 00 00     ND..o...........
     515:	00 00 2f 00 00 ae e5 00 00 00 00 00 00 00 00 00     ../.............
     525:	00 47 00 00 00 00 00 00 00 00 00 00 00 00 00 00     .G..............
	...
     555:	00 5a 00 00 00 00 00 00 08 cc 31 aa 2c 53 2e 00     .Z........1.,S..

00000565 <_ZZ16mavlink_one_bytecE6delays>:
     565:	02 06 0a 0f 14 1e 2d 3c                             ......-<

0000056d <_ZZ21request_mavlink_ratesvE10MAVStreams>:
     56d:	06 01 02 02 03 05 0a 0a 0b 02 0c 01                 ............

00000579 <_ZZ4logovE3__c_0>:
     579:	42 61 64 20 43 6f 6e 66 69 67 3a 20 25 64 20 6d     Bad Config: %d m
     589:	79 20 37 39 00                                      y 79.

0000058e <_ZZ4logovE3__c>:
     58e:	4d 69 6e 69 6d 4f 53 44 2d 45 78 74 72 61 20 4d     MinimOSD-Extra M
     59e:	41 56 4c 69 6e 6b 20 32 2e 34 ff 75 6e 69 20 72     AVLink 2.4.uni r
     5ae:	39 33 36 20 44 56 ff 00                             936 DV..

000005b6 <_ZL11panels_list>:
     5b6:	15 a8 1e 00 01 b5 0b 00 02 ac 0b 00 03 b7 19 bc     ................
     5c6:	84 7f 19 26 05 74 0b 00 07 25 13 00 34 0d 10 03     ...&.t...%..4...
     5d6:	35 07 10 04 18 be 0b 00 06 ed 18 00 08 ca 12 00     5...............
     5e6:	09 96 1e 00 25 4e 16 00 8b 30 15 0b 0a 5f 0b 00     ....%N...0..._..
     5f6:	19 9c 0f 00 0d 7c 18 5c 11 e9 17 11 16 48 15 12     .....|.\.....H..
     606:	12 b7 15 14 17 a7 15 13 13 24 0c 02 14 1e 0b 7f     .........$......
     616:	0f e0 19 bd 2e 12 0d 57 1b 15 1a 1d 9c 36 14 15     .......W.....6..
     626:	1d 48 16 00 0e 61 1a 09 1e cc 1a 00 21 ab 0c 00     .H...a......!...
     636:	20 2a 10 00 22 65 15 8f 24 91 17 1f 2b fd 0c 1f      *.."e..$...+...
     646:	2c fc 13 00 2d d3 13 00 2f b3 13 00 a7 d9 11 00     ,...-.../.......
     656:	a8 d4 11 00 a9 cf 11 00 aa ca 11 00 1f 35 0f 00     .............5..
     666:	26 b9 0e 00 30 8d 0a 00 31 65 0c 00 33 50 0a 00     &...0...1e..3P..
     676:	23 a3 12 00 32 37 12 00 9a 83 16 00 00 00 00 00     #...27..........

00000686 <_ZL7screens>:
     686:	b8 06 0c 00 00 9a 06 05 b2 0e 70 0a 09 de 11 00     ..........p.....
     696:	00 00 00 00                                         ....

0000069a <_ZL7params2>:
     69a:	b0 07 68 00 00 00 96 07 66 8b 04 25 a3 07 66 8f     ..h.....f..%..f.
     6aa:	04 25 7a 07 66 93 04 25 88 07 66 97 04 25           .%z.f..%..f..%

000006b8 <_ZL7params1>:
     6b8:	63 08 00 00 00 00 53 08 42 62 04 00 44 08 42 9b     c.....S.Bb..D.B.
     6c8:	04 00 36 08 62 61 04 10 24 08 62 60 04 10 13 08     ..6.ba..$.b`....
     6d8:	62 68 04 10 06 08 62 69 04 10 f6 07 00 00 00 00     bh....bi........
     6e8:	e8 07 62 a0 04 11 df 07 62 5f 04 12 cf 07 5a 9d     ..b.....b_....Z.
     6f8:	04 13 c1 07 7a 9c 04 14                             ....z...

00000700 <_ZL6s_fmts>:
     700:	30 07 2b 07 26 07                                   0.+.&.

00000706 <_ZL7min_max>:
     706:	00 00 ff 00 01 00 04 00 00 00 03 00 e1 ff 1f 00     ................
     716:	f1 ff 0f 00 fc ff 04 00 c0 e0 40 1f 9c ff 64 00     ..........@...d.

00000726 <_ZL7f_float>:
     726:	25 2e 33 66 00                                      %.3f.

0000072b <_ZL5f_int>:
     72b:	25 2e 30 66 00                                      %.0f.

00000730 <_ZL6f_batt>:
     730:	25 33 2e 31 66 76 00                                %3.1fv.

00000737 <_ZL11n_k_sensor4>:
     737:	34 20 28 52 53 53 49 29 20 4b 00                    4 (RSSI) K.

00000742 <_ZL11n_k_sensor3>:
     742:	33 20 28 43 75 72 72 65 6e 74 29 20 4b 00           3 (Current) K.

00000750 <_ZL11n_k_sensor2>:
     750:	32 20 28 56 32 29 20 4b 00                          2 (V2) K.

00000759 <_ZL11n_a_sensor1>:
     759:	20 20 20 20 20 20 20 41 00                                 A.

00000762 <_ZL11n_k_sensor1>:
     762:	31 20 28 56 31 29 20 4b 00                          1 (V1) K.

0000076b <_ZL9n_sensors>:
     76b:	20 20 20 50 69 6e 20 53 65 6e 73 6f 72 73 00           Pin Sensors.

0000077a <_ZL12n_k_RollNTSC>:
     77a:	52 6f 6c 6c 20 20 69 6e 20 4e 54 53 43 00           Roll  in NTSC.

00000788 <_ZL13n_k_PitchNTSC>:
     788:	50 69 74 63 68 20 69 6e 20 4e 54 53 43 00           Pitch in NTSC.

00000796 <_ZL11n_k_RollPAL>:
     796:	52 6f 6c 6c 20 20 69 6e 20 50 41 4c 00              Roll  in PAL.

000007a3 <_ZL12n_k_PitchPAL>:
     7a3:	50 69 74 63 68 20 69 6e 20 50 41 4c 00              Pitch in PAL.

000007b0 <_ZL9n_horizon>:
     7b0:	20 20 48 6f 72 69 7a 6f 6e 20 61 6e 67 6c 65 73       Horizon angles
	...

000007c1 <_ZL6n_vert>:
     7c1:	56 65 72 74 69 63 61 6c 20 6f 66 66 73 00           Vertical offs.

000007cf <_ZL7n_horiz>:
     7cf:	48 6f 72 69 7a 6f 6e 74 61 6c 20 6f 66 66 73 00     Horizontal offs.

000007df <_ZL7n_contr>:
     7df:	43 6f 6e 74 72 61 73 74 00                          Contrast.

000007e8 <_ZL5n_scr>:
     7e8:	53 63 72 65 65 6e 73 20 43 6f 75 6e 74 00           Screens Count.

000007f6 <_ZL8n_screen>:
     7f6:	20 20 53 63 72 65 65 6e 20 70 61 72 61 6d 73 00       Screen params.

00000806 <_ZL6n_rssi>:
     806:	52 53 53 49 20 77 61 72 6e 69 6e 67 00              RSSI warning.

00000813 <_ZL8n_charge>:
     813:	42 61 74 74 20 63 68 61 72 67 65 20 77 61 72 6e     Batt charge warn
	...

00000824 <_ZL8n_oversp>:
     824:	4f 76 65 72 73 70 65 65 64 20 77 61 72 6e 69 6e     Overspeed warnin
     834:	67 00                                               g.

00000836 <_ZL7n_stall>:
     836:	53 74 61 6c 6c 20 77 61 72 6e 69 6e 67 00           Stall warning.

00000844 <_ZL7n_battB>:
     844:	42 61 74 74 20 32 20 77 61 72 6e 69 6e 67 00        Batt 2 warning.

00000853 <_ZL6n_batt>:
     853:	42 61 74 74 65 72 79 20 77 61 72 6e 69 6e 67 00     Battery warning.

00000863 <_ZL6n_sets>:
     863:	20 20 20 4f 53 44 20 73 65 74 75 70 00                 OSD setup.

00000870 <_ZL5f_02i>:
     870:	2e 25 30 32 64 00                                   .%02d.

00000876 <_ZL3fci>:
     876:	43 25 69 20 00                                      C%i .

0000087b <_ZL15mode_aq_strings>:
     87b:	97 08 f0 08 69 09 4c 09 38 09 92 08 38 09 38 09     ....i.L.8...8.8.
     88b:	8d 08                                               ..

0000088d <_ZL8aq_mode8>:
     88d:	69 6e 69 74 00                                      init.

00000892 <_ZL8aq_mode5>:
     892:	6d 69 73 73 00                                      miss.

00000897 <_ZL8aq_mode0>:
     897:	61 72 6d 00                                         arm.

0000089b <_ZL14mode_p_strings>:
     89b:	f0 08 51 09 73 09 eb 08 6e 09 e6 08 e1 08 dc 08     ..Q.s...n.......
     8ab:	d7 08 38 09 64 09 56 09 5a 09 38 09 38 09 5f 09     ..8.d.V.Z.8.8._.
     8bb:	d2 08 cd 08 c8 08 c3 08                             ........

000008c3 <_ZL8p_mode19>:
     8c3:	71 6c 6f 69 00                                      qloi.

000008c8 <_ZL8p_mode18>:
     8c8:	71 68 6f 76 00                                      qhov.

000008cd <_ZL8p_mode17>:
     8cd:	71 73 74 62 00                                      qstb.

000008d2 <_ZL8p_mode16>:
     8d2:	69 6e 69 74 00                                      init.

000008d7 <_ZL8p_mode08>:
     8d7:	61 74 75 6e 00                                      atun.

000008dc <_ZL8p_mode07>:
     8dc:	63 72 75 7a 00                                      cruz.

000008e1 <_ZL8p_mode06>:
     8e1:	66 62 77 62 00                                      fbwb.

000008e6 <_ZL8p_mode05>:
     8e6:	66 62 77 61 00                                      fbwa.

000008eb <_ZL8p_mode03>:
     8eb:	74 72 61 69 00                                      trai.

000008f0 <_ZL8p_mode00>:
     8f0:	6d 61 6e 75 00                                      manu.

000008f5 <_ZL14mode_c_strings>:
     8f5:	73 09 6e 09 69 09 64 09 5f 09 5a 09 56 09 51 09     s.n.i.d._.Z.V.Q.
     905:	4c 09 47 09 42 09 3d 09 38 09 33 09 2e 09 29 09     L.G.B.=.8.3...).
     915:	24 09 20 09 1b 09                                   $. ...

0000091b <_ZL8s_mode18>:
     91b:	74 68 72 77 00                                      thrw.

00000920 <_ZL8s_mode17>:
     920:	62 72 6b 00                                         brk.

00000924 <_ZL8s_mode16>:
     924:	68 6f 6c 64 00                                      hold.

00000929 <_ZL8s_mode15>:
     929:	74 75 6e 65 00                                      tune.

0000092e <_ZL8s_mode14>:
     92e:	66 6c 69 70 00                                      flip.

00000933 <_ZL8s_mode13>:
     933:	73 70 72 74 00                                      sprt.

00000938 <_ZL8s_mode_n>:
     938:	6d 5f 25 64 00                                      m_%d.

0000093d <_ZL8s_mode11>:
     93d:	64 72 69 66 00                                      drif.

00000942 <_ZL8s_mode10>:
     942:	6f 66 6c 6f 00                                      oflo.

00000947 <_ZL8s_mode09>:
     947:	6c 61 6e 64 00                                      land.

0000094c <_ZL8s_mode08>:
     94c:	70 6f 73 68 00                                      posh.

00000951 <_ZL8s_mode07>:
     951:	63 69 72 63 00                                      circ.

00000956 <_ZL8s_mode06>:
     956:	72 74 6c 00                                         rtl.

0000095a <_ZL8s_mode05>:
     95a:	6c 6f 69 74 00                                      loit.

0000095f <_ZL8s_mode04>:
     95f:	67 75 69 64 00                                      guid.

00000964 <_ZL8s_mode03>:
     964:	61 75 74 6f 00                                      auto.

00000969 <_ZL8s_mode02>:
     969:	61 6c 74 68 00                                      alth.

0000096e <_ZL8s_mode01>:
     96e:	61 63 72 6f 00                                      acro.

00000973 <_ZL8s_mode00>:
     973:	73 74 61 62 00                                      stab.

00000978 <_ZL8gps_fmtF>:
     978:	86 09 80 09                                         ....

0000097c <_ZL7gps_fmt>:
     97c:	93 09 8d 09                                         ....

00000980 <_ZL6gps_f5>:
     980:	25 39 2e 35 66 00                                   %9.5f.

00000986 <_ZL6gps_f4>:
     986:	25 31 30 2e 36 66 00                                %10.6f.

0000098d <_ZL6gps_f1>:
     98d:	25 30 35 6c 64 00                                   %05ld.

00000993 <_ZL6gps_f0>:
     993:	25 30 36 6c 64 00                                   %06ld.

00000999 <_ZL8warn_str>:
     999:	14 0a 0b 0a 00 0a f3 09 e8 09 db 09 cf 09 c4 09     ................
     9a9:	b8 09 ad 09                                         ....

000009ad <_ZL3w10>:
     9ad:	46 65 6e 63 65 20 46 61 72 21 00                    Fence Far!.

000009b8 <_ZL2w9>:
     9b8:	46 65 6e 63 65 20 48 69 67 68 21 00                 Fence High!.

000009c4 <_ZL2w8>:
     9c4:	46 65 6e 63 65 20 4c 6f 77 21 00                    Fence Low!.

000009cf <_ZL2w7>:
     9cf:	42 61 74 74 20 42 20 6c 6f 77 21 00                 Batt B low!.

000009db <_ZL2w6>:
     9db:	48 69 67 68 20 56 53 70 65 65 64 21 00              High VSpeed!.

000009e8 <_ZL2w5>:
     9e8:	20 4c 6f 77 20 52 73 73 69 21 00                     Low Rssi!.

000009f3 <_ZL2w4>:
     9f3:	42 61 74 74 65 72 79 20 4c 6f 77 21 00              Battery Low!.

00000a00 <_ZL2w3>:
     a00:	4f 76 65 72 53 70 65 65 64 21 00                    OverSpeed!.

00000a0b <_ZL2w2>:
     a0b:	20 20 53 74 61 6c 6c 21 00                            Stall!.

00000a14 <_ZL2w1>:
     a14:	4e 6f 20 47 50 53 20 66 69 78 21 00                 No GPS fix!.

00000a20 <_ZL5f4_0f>:
     a20:	25 34 2e 30 66 00                                   %4.0f.

00000a26 <_ZL5f4_1f>:
     a26:	25 34 2e 31 66 00                                   %4.1f.

00000a2c <_ZL5f4_2f>:
     a2c:	25 34 2e 32 66 00                                   %4.2f.

00000a32 <_ZL5f5_2f>:
     a32:	25 35 2e 32 66 00                                   %5.2f.

00000a38 <_ZL3f2i>:
     a38:	25 32 69 00                                         %2i.

00000a3c <_ZL3f3i>:
     a3c:	25 33 69 00                                         %3i.

00000a40 <_ZL3f4i>:
     a40:	25 34 69 00                                         %4i.

00000a44 <_ZL5f3_0f>:
     a44:	25 33 2e 30 66 00                                   %3.0f.

00000a4a <_ZL5imper>:
     a4a:	52 b8 0e 40 85 eb 51 40 19 66 bb 00 12 80 0c 1c     R..@..Q@.f......
     a5a:	a0 14 1e                                            ...

00000a5d <_ZL4metr>:
     a5d:	66 66 66 40 00 00 80 3f 10 0c ba 00 0a 00 00 1b     fff@...?........
     a6d:	e8 03 1a                                            ...

00000a70 <_ZL7params3>:
     a70:	6b 07 00 00 00 00 62 07 73 80 02 25 59 07 73 84     k.....b.s..%Y.s.
     a80:	02 27 50 07 73 00 00 25 59 07 73 00 00 27 42 07     .'P.s..%Y.s..'B.
     a90:	73 00 00 26 59 07 73 00 00 27 37 07 73 00 00 26     s..&Y.s..'7.s..&
     aa0:	59 07 73 00 00 27                                   Y.s..'

00000aa6 <digital_pin_to_timer_PGM>:
     aa6:	00 00 00 08 00 02 01 00 00 03 04 07 00 00 00 00     ................
     ab6:	00 00 00 00                                         ....

00000aba <digital_pin_to_bit_mask_PGM>:
     aba:	01 02 04 08 10 20 40 80 01 02 04 08 10 20 01 02     ..... @...... ..
     aca:	04 08 10 20                                         ... 

00000ace <digital_pin_to_port_PGM>:
     ace:	04 04 04 04 04 04 04 04 02 02 02 02 02 02 03 03     ................
     ade:	03 03 03 03                                         ....

00000ae2 <port_to_input_PGM>:
     ae2:	00 00 00 00 23 00 26 00 29 00                       ....#.&.).

00000aec <port_to_output_PGM>:
     aec:	00 00 00 00 25 00 28 00 2b 00                       ....%.(.+.

00000af6 <port_to_mode_PGM>:
     af6:	00 00 00 00 24 00 27 00 2a 00                       ....$.'.*.

00000b00 <_ZZN12BetterStream8_vprintfEhPKcPvE3__c_0>:
     b00:	6e 61 6e 00                                         nan.

00000b04 <_ZZN12BetterStream8_vprintfEhPKcPvE3__c>:
     b04:	69 6e 66 00 00 40 7a 10 f3 5a 00 a0 72 4e 18 09     inf..@z..Z..rN..
     b14:	00 10 a5 d4 e8 00 00 e8 76 48 17 00 00 e4 0b 54     ........vH.....T
     b24:	02 00 00 ca 9a 3b 00 00 00 e1 f5 05 00 00 80 96     .....;..........
     b34:	98 00 00 00 40 42 0f 00 00 00 a0 86 01 00 00 00     ....@B..........
     b44:	10 27 00 00 00 00 e8 03 00 00 00 00 64 00 00 00     .'..........d...
     b54:	00 00 0a 00 00 00 00 00 01 00 00 00 00 00 2c 76     ..............,v
     b64:	d8 88 dc 67 4f 08 23 df c1 df ae 59 e1 b1 b7 96     ...gO.#....Y....
     b74:	e5 e3 e4 53 c6 3a e6 51 99 76 96 e8 e6 c2 84 26     ...S.:.Q.v.....&
     b84:	eb 89 8c 9b 62 ed 40 7c 6f fc ef bc 9c 9f 40 f2     ....b.@|o.....@.
     b94:	ba a5 6f a5 f4 90 05 5a 2a f7 5c 93 6b 6c f9 67     ..o....Z*.\.kl.g
     ba4:	6d c1 1b fc e0 e4 0d 47 fe f5 20 e6 b5 00 d0 ed     m......G.. .....
     bb4:	90 2e 03 00 94 35 77 05 00 80 84 1e 08 00 00 20     .....5w........ 
     bc4:	4e 0a 00 00 00 c8 0c 33 33 33 33 0f 98 6e 12 83     N......3333..n..
     bd4:	11 41 ef 8d 21 14 89 3b e6 55 16 cf fe e6 db 18     .A..!..;.U......
     be4:	d1 84 4b 38 1b f7 7c 1d 90 1d a4 bb e4 24 20 32     ..K8..|......$ 2
     bf4:	84 72 5e 22 81 00 c9 f1 24 ec a1 e5 3d 27           .r^"....$...='

00000c02 <__ctors_start>:
     c02:	69 27       	eor	r22, r25

00000c04 <__ctors_end>:
     c04:	11 24       	eor	r1, r1
     c06:	1f be       	out	0x3f, r1	; 63
     c08:	cf ef       	ldi	r28, 0xFF	; 255
     c0a:	d0 e1       	ldi	r29, 0x10	; 16
     c0c:	de bf       	out	0x3e, r29	; 62
     c0e:	cd bf       	out	0x3d, r28	; 61

00000c10 <__do_copy_data>:
     c10:	11 e0       	ldi	r17, 0x01	; 1
     c12:	a0 e0       	ldi	r26, 0x00	; 0
     c14:	b1 e0       	ldi	r27, 0x01	; 1
     c16:	e0 e7       	ldi	r30, 0x70	; 112
     c18:	f9 e8       	ldi	r31, 0x89	; 137
     c1a:	02 c0       	rjmp	.+4      	; 0xc20 <__do_copy_data+0x10>
     c1c:	05 90       	lpm	r0, Z+
     c1e:	0d 92       	st	X+, r0
     c20:	a4 35       	cpi	r26, 0x54	; 84
     c22:	b1 07       	cpc	r27, r17
     c24:	d9 f7       	brne	.-10     	; 0xc1c <__do_copy_data+0xc>

00000c26 <__do_clear_bss>:
     c26:	27 e0       	ldi	r18, 0x07	; 7
     c28:	a4 e5       	ldi	r26, 0x54	; 84
     c2a:	b1 e0       	ldi	r27, 0x01	; 1
     c2c:	01 c0       	rjmp	.+2      	; 0xc30 <.do_clear_bss_start>

00000c2e <.do_clear_bss_loop>:
     c2e:	1d 92       	st	X+, r1

00000c30 <.do_clear_bss_start>:
     c30:	af 32       	cpi	r26, 0x2F	; 47
     c32:	b2 07       	cpc	r27, r18
     c34:	e1 f7       	brne	.-8      	; 0xc2e <.do_clear_bss_loop>

00000c36 <__do_global_ctors>:
     c36:	16 e0       	ldi	r17, 0x06	; 6
     c38:	c2 e0       	ldi	r28, 0x02	; 2
     c3a:	d6 e0       	ldi	r29, 0x06	; 6
     c3c:	04 c0       	rjmp	.+8      	; 0xc46 <__do_global_ctors+0x10>
     c3e:	21 97       	sbiw	r28, 0x01	; 1
     c40:	fe 01       	movw	r30, r28
     c42:	0e 94 f5 43 	call	0x87ea	; 0x87ea <__tablejump2__>
     c46:	c1 30       	cpi	r28, 0x01	; 1
     c48:	d1 07       	cpc	r29, r17
     c4a:	c9 f7       	brne	.-14     	; 0xc3e <__do_global_ctors+0x8>
     c4c:	0e 94 6c 38 	call	0x70d8	; 0x70d8 <main>
     c50:	0c 94 9e 3f 	jmp	0x7f3c	; 0x7f3c <exit>

00000c54 <__bad_interrupt>:
     c54:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

00000c58 <countPulseASM>:
     c58:	cf 92       	push	r12
     c5a:	df 92       	push	r13
     c5c:	ef 92       	push	r14
     c5e:	ff 92       	push	r15
     c60:	0f 93       	push	r16
     c62:	1f 93       	push	r17
     c64:	e8 2f       	mov	r30, r24
     c66:	f9 2f       	mov	r31, r25
     c68:	05 c0       	rjmp	.+10     	; 0xc74 <countPulseASM+0x1c>
     c6a:	01 50       	subi	r16, 0x01	; 1
     c6c:	11 09       	sbc	r17, r1
     c6e:	21 09       	sbc	r18, r1
     c70:	31 09       	sbc	r19, r1
     c72:	61 f1       	breq	.+88     	; 0xccc <countPulseASM+0x74>
     c74:	90 81       	ld	r25, Z
     c76:	96 23       	and	r25, r22
     c78:	94 17       	cp	r25, r20
     c7a:	b9 f3       	breq	.-18     	; 0xc6a <countPulseASM+0x12>
     c7c:	05 c0       	rjmp	.+10     	; 0xc88 <countPulseASM+0x30>
     c7e:	01 50       	subi	r16, 0x01	; 1
     c80:	11 09       	sbc	r17, r1
     c82:	21 09       	sbc	r18, r1
     c84:	31 09       	sbc	r19, r1
     c86:	11 f1       	breq	.+68     	; 0xccc <countPulseASM+0x74>
     c88:	90 81       	ld	r25, Z
     c8a:	96 23       	and	r25, r22
     c8c:	94 13       	cpse	r25, r20
     c8e:	f7 cf       	rjmp	.-18     	; 0xc7e <countPulseASM+0x26>
     c90:	c1 2c       	mov	r12, r1
     c92:	d1 2c       	mov	r13, r1
     c94:	e1 2c       	mov	r14, r1
     c96:	f1 2c       	mov	r15, r1
     c98:	0a c0       	rjmp	.+20     	; 0xcae <countPulseASM+0x56>
     c9a:	8f ef       	ldi	r24, 0xFF	; 255
     c9c:	c8 1a       	sub	r12, r24
     c9e:	d8 0a       	sbc	r13, r24
     ca0:	e8 0a       	sbc	r14, r24
     ca2:	f8 0a       	sbc	r15, r24
     ca4:	0c 15       	cp	r16, r12
     ca6:	1d 05       	cpc	r17, r13
     ca8:	2e 05       	cpc	r18, r14
     caa:	3f 05       	cpc	r19, r15
     cac:	79 f0       	breq	.+30     	; 0xccc <countPulseASM+0x74>
     cae:	80 81       	ld	r24, Z
     cb0:	86 23       	and	r24, r22
     cb2:	84 17       	cp	r24, r20
     cb4:	91 f3       	breq	.-28     	; 0xc9a <countPulseASM+0x42>
     cb6:	6c 2d       	mov	r22, r12
     cb8:	7d 2d       	mov	r23, r13
     cba:	8e 2d       	mov	r24, r14
     cbc:	9f 2d       	mov	r25, r15
     cbe:	1f 91       	pop	r17
     cc0:	0f 91       	pop	r16
     cc2:	ff 90       	pop	r15
     cc4:	ef 90       	pop	r14
     cc6:	df 90       	pop	r13
     cc8:	cf 90       	pop	r12
     cca:	08 95       	ret
     ccc:	60 e0       	ldi	r22, 0x00	; 0
     cce:	70 e0       	ldi	r23, 0x00	; 0
     cd0:	80 e0       	ldi	r24, 0x00	; 0
     cd2:	90 e0       	ldi	r25, 0x00	; 0
     cd4:	1f 91       	pop	r17
     cd6:	0f 91       	pop	r16
     cd8:	ff 90       	pop	r15
     cda:	ef 90       	pop	r14
     cdc:	df 90       	pop	r13
     cde:	cf 90       	pop	r12
     ce0:	08 95       	ret

00000ce2 <__ultoa_invert>:
     ce2:	fa 01       	movw	r30, r20
     ce4:	aa 27       	eor	r26, r26
     ce6:	28 30       	cpi	r18, 0x08	; 8
     ce8:	51 f1       	breq	.+84     	; 0xd3e <__ultoa_invert+0x5c>
     cea:	20 31       	cpi	r18, 0x10	; 16
     cec:	81 f1       	breq	.+96     	; 0xd4e <__ultoa_invert+0x6c>
     cee:	e8 94       	clt
     cf0:	6f 93       	push	r22
     cf2:	6e 7f       	andi	r22, 0xFE	; 254
     cf4:	6e 5f       	subi	r22, 0xFE	; 254
     cf6:	7f 4f       	sbci	r23, 0xFF	; 255
     cf8:	8f 4f       	sbci	r24, 0xFF	; 255
     cfa:	9f 4f       	sbci	r25, 0xFF	; 255
     cfc:	af 4f       	sbci	r26, 0xFF	; 255
     cfe:	b1 e0       	ldi	r27, 0x01	; 1
     d00:	3e d0       	rcall	.+124    	; 0xd7e <__ultoa_invert+0x9c>
     d02:	b4 e0       	ldi	r27, 0x04	; 4
     d04:	3c d0       	rcall	.+120    	; 0xd7e <__ultoa_invert+0x9c>
     d06:	67 0f       	add	r22, r23
     d08:	78 1f       	adc	r23, r24
     d0a:	89 1f       	adc	r24, r25
     d0c:	9a 1f       	adc	r25, r26
     d0e:	a1 1d       	adc	r26, r1
     d10:	68 0f       	add	r22, r24
     d12:	79 1f       	adc	r23, r25
     d14:	8a 1f       	adc	r24, r26
     d16:	91 1d       	adc	r25, r1
     d18:	a1 1d       	adc	r26, r1
     d1a:	6a 0f       	add	r22, r26
     d1c:	71 1d       	adc	r23, r1
     d1e:	81 1d       	adc	r24, r1
     d20:	91 1d       	adc	r25, r1
     d22:	a1 1d       	adc	r26, r1
     d24:	20 d0       	rcall	.+64     	; 0xd66 <__ultoa_invert+0x84>
     d26:	09 f4       	brne	.+2      	; 0xd2a <__ultoa_invert+0x48>
     d28:	68 94       	set
     d2a:	3f 91       	pop	r19
     d2c:	2a e0       	ldi	r18, 0x0A	; 10
     d2e:	26 9f       	mul	r18, r22
     d30:	11 24       	eor	r1, r1
     d32:	30 19       	sub	r19, r0
     d34:	30 5d       	subi	r19, 0xD0	; 208
     d36:	31 93       	st	Z+, r19
     d38:	de f6       	brtc	.-74     	; 0xcf0 <__ultoa_invert+0xe>
     d3a:	cf 01       	movw	r24, r30
     d3c:	08 95       	ret
     d3e:	46 2f       	mov	r20, r22
     d40:	47 70       	andi	r20, 0x07	; 7
     d42:	40 5d       	subi	r20, 0xD0	; 208
     d44:	41 93       	st	Z+, r20
     d46:	b3 e0       	ldi	r27, 0x03	; 3
     d48:	0f d0       	rcall	.+30     	; 0xd68 <__ultoa_invert+0x86>
     d4a:	c9 f7       	brne	.-14     	; 0xd3e <__ultoa_invert+0x5c>
     d4c:	f6 cf       	rjmp	.-20     	; 0xd3a <__ultoa_invert+0x58>
     d4e:	46 2f       	mov	r20, r22
     d50:	4f 70       	andi	r20, 0x0F	; 15
     d52:	40 5d       	subi	r20, 0xD0	; 208
     d54:	4a 33       	cpi	r20, 0x3A	; 58
     d56:	18 f0       	brcs	.+6      	; 0xd5e <__ultoa_invert+0x7c>
     d58:	49 5d       	subi	r20, 0xD9	; 217
     d5a:	31 fd       	sbrc	r19, 1
     d5c:	40 52       	subi	r20, 0x20	; 32
     d5e:	41 93       	st	Z+, r20
     d60:	02 d0       	rcall	.+4      	; 0xd66 <__ultoa_invert+0x84>
     d62:	a9 f7       	brne	.-22     	; 0xd4e <__ultoa_invert+0x6c>
     d64:	ea cf       	rjmp	.-44     	; 0xd3a <__ultoa_invert+0x58>
     d66:	b4 e0       	ldi	r27, 0x04	; 4
     d68:	a6 95       	lsr	r26
     d6a:	97 95       	ror	r25
     d6c:	87 95       	ror	r24
     d6e:	77 95       	ror	r23
     d70:	67 95       	ror	r22
     d72:	ba 95       	dec	r27
     d74:	c9 f7       	brne	.-14     	; 0xd68 <__ultoa_invert+0x86>
     d76:	00 97       	sbiw	r24, 0x00	; 0
     d78:	61 05       	cpc	r22, r1
     d7a:	71 05       	cpc	r23, r1
     d7c:	08 95       	ret
     d7e:	9b 01       	movw	r18, r22
     d80:	ac 01       	movw	r20, r24
     d82:	0a 2e       	mov	r0, r26
     d84:	06 94       	lsr	r0
     d86:	57 95       	ror	r21
     d88:	47 95       	ror	r20
     d8a:	37 95       	ror	r19
     d8c:	27 95       	ror	r18
     d8e:	ba 95       	dec	r27
     d90:	c9 f7       	brne	.-14     	; 0xd84 <__ultoa_invert+0xa2>
     d92:	62 0f       	add	r22, r18
     d94:	73 1f       	adc	r23, r19
     d96:	84 1f       	adc	r24, r20
     d98:	95 1f       	adc	r25, r21
     d9a:	a0 1d       	adc	r26, r0
     d9c:	08 95       	ret

00000d9e <__ftoa_engine>:
     d9e:	28 30       	cpi	r18, 0x08	; 8
     da0:	08 f0       	brcs	.+2      	; 0xda4 <__ftoa_engine+0x6>
     da2:	27 e0       	ldi	r18, 0x07	; 7
     da4:	33 27       	eor	r19, r19
     da6:	da 01       	movw	r26, r20
     da8:	99 0f       	add	r25, r25
     daa:	31 1d       	adc	r19, r1
     dac:	87 fd       	sbrc	r24, 7
     dae:	91 60       	ori	r25, 0x01	; 1
     db0:	00 96       	adiw	r24, 0x00	; 0
     db2:	61 05       	cpc	r22, r1
     db4:	71 05       	cpc	r23, r1
     db6:	39 f4       	brne	.+14     	; 0xdc6 <__ftoa_engine+0x28>
     db8:	32 60       	ori	r19, 0x02	; 2
     dba:	2e 5f       	subi	r18, 0xFE	; 254
     dbc:	3d 93       	st	X+, r19
     dbe:	30 e3       	ldi	r19, 0x30	; 48
     dc0:	2a 95       	dec	r18
     dc2:	e1 f7       	brne	.-8      	; 0xdbc <__ftoa_engine+0x1e>
     dc4:	08 95       	ret
     dc6:	9f 3f       	cpi	r25, 0xFF	; 255
     dc8:	30 f0       	brcs	.+12     	; 0xdd6 <__ftoa_engine+0x38>
     dca:	80 38       	cpi	r24, 0x80	; 128
     dcc:	71 05       	cpc	r23, r1
     dce:	61 05       	cpc	r22, r1
     dd0:	09 f0       	breq	.+2      	; 0xdd4 <__ftoa_engine+0x36>
     dd2:	3c 5f       	subi	r19, 0xFC	; 252
     dd4:	3c 5f       	subi	r19, 0xFC	; 252
     dd6:	3d 93       	st	X+, r19
     dd8:	91 30       	cpi	r25, 0x01	; 1
     dda:	08 f0       	brcs	.+2      	; 0xdde <__ftoa_engine+0x40>
     ddc:	80 68       	ori	r24, 0x80	; 128
     dde:	91 1d       	adc	r25, r1
     de0:	df 93       	push	r29
     de2:	cf 93       	push	r28
     de4:	1f 93       	push	r17
     de6:	0f 93       	push	r16
     de8:	ff 92       	push	r15
     dea:	ef 92       	push	r14
     dec:	19 2f       	mov	r17, r25
     dee:	98 7f       	andi	r25, 0xF8	; 248
     df0:	96 95       	lsr	r25
     df2:	e9 2f       	mov	r30, r25
     df4:	96 95       	lsr	r25
     df6:	96 95       	lsr	r25
     df8:	e9 0f       	add	r30, r25
     dfa:	ff 27       	eor	r31, r31
     dfc:	ee 59       	subi	r30, 0x9E	; 158
     dfe:	f4 4f       	sbci	r31, 0xF4	; 244
     e00:	99 27       	eor	r25, r25
     e02:	33 27       	eor	r19, r19
     e04:	ee 24       	eor	r14, r14
     e06:	ff 24       	eor	r15, r15
     e08:	a7 01       	movw	r20, r14
     e0a:	e7 01       	movw	r28, r14
     e0c:	05 90       	lpm	r0, Z+
     e0e:	08 94       	sec
     e10:	07 94       	ror	r0
     e12:	28 f4       	brcc	.+10     	; 0xe1e <__ftoa_engine+0x80>
     e14:	36 0f       	add	r19, r22
     e16:	e7 1e       	adc	r14, r23
     e18:	f8 1e       	adc	r15, r24
     e1a:	49 1f       	adc	r20, r25
     e1c:	51 1d       	adc	r21, r1
     e1e:	66 0f       	add	r22, r22
     e20:	77 1f       	adc	r23, r23
     e22:	88 1f       	adc	r24, r24
     e24:	99 1f       	adc	r25, r25
     e26:	06 94       	lsr	r0
     e28:	a1 f7       	brne	.-24     	; 0xe12 <__ftoa_engine+0x74>
     e2a:	05 90       	lpm	r0, Z+
     e2c:	07 94       	ror	r0
     e2e:	28 f4       	brcc	.+10     	; 0xe3a <__ftoa_engine+0x9c>
     e30:	e7 0e       	add	r14, r23
     e32:	f8 1e       	adc	r15, r24
     e34:	49 1f       	adc	r20, r25
     e36:	56 1f       	adc	r21, r22
     e38:	c1 1d       	adc	r28, r1
     e3a:	77 0f       	add	r23, r23
     e3c:	88 1f       	adc	r24, r24
     e3e:	99 1f       	adc	r25, r25
     e40:	66 1f       	adc	r22, r22
     e42:	06 94       	lsr	r0
     e44:	a1 f7       	brne	.-24     	; 0xe2e <__ftoa_engine+0x90>
     e46:	05 90       	lpm	r0, Z+
     e48:	07 94       	ror	r0
     e4a:	28 f4       	brcc	.+10     	; 0xe56 <__ftoa_engine+0xb8>
     e4c:	f8 0e       	add	r15, r24
     e4e:	49 1f       	adc	r20, r25
     e50:	56 1f       	adc	r21, r22
     e52:	c7 1f       	adc	r28, r23
     e54:	d1 1d       	adc	r29, r1
     e56:	88 0f       	add	r24, r24
     e58:	99 1f       	adc	r25, r25
     e5a:	66 1f       	adc	r22, r22
     e5c:	77 1f       	adc	r23, r23
     e5e:	06 94       	lsr	r0
     e60:	a1 f7       	brne	.-24     	; 0xe4a <__ftoa_engine+0xac>
     e62:	05 90       	lpm	r0, Z+
     e64:	07 94       	ror	r0
     e66:	20 f4       	brcc	.+8      	; 0xe70 <__ftoa_engine+0xd2>
     e68:	49 0f       	add	r20, r25
     e6a:	56 1f       	adc	r21, r22
     e6c:	c7 1f       	adc	r28, r23
     e6e:	d8 1f       	adc	r29, r24
     e70:	99 0f       	add	r25, r25
     e72:	66 1f       	adc	r22, r22
     e74:	77 1f       	adc	r23, r23
     e76:	88 1f       	adc	r24, r24
     e78:	06 94       	lsr	r0
     e7a:	a9 f7       	brne	.-22     	; 0xe66 <__ftoa_engine+0xc8>
     e7c:	84 91       	lpm	r24, Z
     e7e:	10 95       	com	r17
     e80:	17 70       	andi	r17, 0x07	; 7
     e82:	41 f0       	breq	.+16     	; 0xe94 <__ftoa_engine+0xf6>
     e84:	d6 95       	lsr	r29
     e86:	c7 95       	ror	r28
     e88:	57 95       	ror	r21
     e8a:	47 95       	ror	r20
     e8c:	f7 94       	ror	r15
     e8e:	e7 94       	ror	r14
     e90:	1a 95       	dec	r17
     e92:	c1 f7       	brne	.-16     	; 0xe84 <__ftoa_engine+0xe6>
     e94:	e8 e0       	ldi	r30, 0x08	; 8
     e96:	fb e0       	ldi	r31, 0x0B	; 11
     e98:	68 94       	set
     e9a:	15 90       	lpm	r1, Z+
     e9c:	15 91       	lpm	r17, Z+
     e9e:	35 91       	lpm	r19, Z+
     ea0:	65 91       	lpm	r22, Z+
     ea2:	95 91       	lpm	r25, Z+
     ea4:	05 90       	lpm	r0, Z+
     ea6:	7f e2       	ldi	r23, 0x2F	; 47
     ea8:	73 95       	inc	r23
     eaa:	e1 18       	sub	r14, r1
     eac:	f1 0a       	sbc	r15, r17
     eae:	43 0b       	sbc	r20, r19
     eb0:	56 0b       	sbc	r21, r22
     eb2:	c9 0b       	sbc	r28, r25
     eb4:	d0 09       	sbc	r29, r0
     eb6:	c0 f7       	brcc	.-16     	; 0xea8 <__ftoa_engine+0x10a>
     eb8:	e1 0c       	add	r14, r1
     eba:	f1 1e       	adc	r15, r17
     ebc:	43 1f       	adc	r20, r19
     ebe:	56 1f       	adc	r21, r22
     ec0:	c9 1f       	adc	r28, r25
     ec2:	d0 1d       	adc	r29, r0
     ec4:	7e f4       	brtc	.+30     	; 0xee4 <__ftoa_engine+0x146>
     ec6:	70 33       	cpi	r23, 0x30	; 48
     ec8:	11 f4       	brne	.+4      	; 0xece <__ftoa_engine+0x130>
     eca:	8a 95       	dec	r24
     ecc:	e6 cf       	rjmp	.-52     	; 0xe9a <__ftoa_engine+0xfc>
     ece:	e8 94       	clt
     ed0:	01 50       	subi	r16, 0x01	; 1
     ed2:	30 f0       	brcs	.+12     	; 0xee0 <__ftoa_engine+0x142>
     ed4:	08 0f       	add	r16, r24
     ed6:	0a f4       	brpl	.+2      	; 0xeda <__ftoa_engine+0x13c>
     ed8:	00 27       	eor	r16, r16
     eda:	02 17       	cp	r16, r18
     edc:	08 f4       	brcc	.+2      	; 0xee0 <__ftoa_engine+0x142>
     ede:	20 2f       	mov	r18, r16
     ee0:	23 95       	inc	r18
     ee2:	02 2f       	mov	r16, r18
     ee4:	7a 33       	cpi	r23, 0x3A	; 58
     ee6:	28 f0       	brcs	.+10     	; 0xef2 <__ftoa_engine+0x154>
     ee8:	79 e3       	ldi	r23, 0x39	; 57
     eea:	7d 93       	st	X+, r23
     eec:	2a 95       	dec	r18
     eee:	e9 f7       	brne	.-6      	; 0xeea <__ftoa_engine+0x14c>
     ef0:	10 c0       	rjmp	.+32     	; 0xf12 <__ftoa_engine+0x174>
     ef2:	7d 93       	st	X+, r23
     ef4:	2a 95       	dec	r18
     ef6:	89 f6       	brne	.-94     	; 0xe9a <__ftoa_engine+0xfc>
     ef8:	06 94       	lsr	r0
     efa:	97 95       	ror	r25
     efc:	67 95       	ror	r22
     efe:	37 95       	ror	r19
     f00:	17 95       	ror	r17
     f02:	17 94       	ror	r1
     f04:	e1 18       	sub	r14, r1
     f06:	f1 0a       	sbc	r15, r17
     f08:	43 0b       	sbc	r20, r19
     f0a:	56 0b       	sbc	r21, r22
     f0c:	c9 0b       	sbc	r28, r25
     f0e:	d0 09       	sbc	r29, r0
     f10:	98 f0       	brcs	.+38     	; 0xf38 <__ftoa_engine+0x19a>
     f12:	23 95       	inc	r18
     f14:	7e 91       	ld	r23, -X
     f16:	73 95       	inc	r23
     f18:	7a 33       	cpi	r23, 0x3A	; 58
     f1a:	08 f0       	brcs	.+2      	; 0xf1e <__ftoa_engine+0x180>
     f1c:	70 e3       	ldi	r23, 0x30	; 48
     f1e:	7c 93       	st	X, r23
     f20:	20 13       	cpse	r18, r16
     f22:	b8 f7       	brcc	.-18     	; 0xf12 <__ftoa_engine+0x174>
     f24:	7e 91       	ld	r23, -X
     f26:	70 61       	ori	r23, 0x10	; 16
     f28:	7d 93       	st	X+, r23
     f2a:	30 f0       	brcs	.+12     	; 0xf38 <__ftoa_engine+0x19a>
     f2c:	83 95       	inc	r24
     f2e:	71 e3       	ldi	r23, 0x31	; 49
     f30:	7d 93       	st	X+, r23
     f32:	70 e3       	ldi	r23, 0x30	; 48
     f34:	2a 95       	dec	r18
     f36:	e1 f7       	brne	.-8      	; 0xf30 <__ftoa_engine+0x192>
     f38:	11 24       	eor	r1, r1
     f3a:	ef 90       	pop	r14
     f3c:	ff 90       	pop	r15
     f3e:	0f 91       	pop	r16
     f40:	1f 91       	pop	r17
     f42:	cf 91       	pop	r28
     f44:	df 91       	pop	r29
     f46:	99 27       	eor	r25, r25
     f48:	87 fd       	sbrc	r24, 7
     f4a:	90 95       	com	r25
     f4c:	08 95       	ret

00000f4e <_ZN3OSD9availableEv>:
     f4e:	80 e0       	ldi	r24, 0x00	; 0
     f50:	08 95       	ret

00000f52 <_ZN3OSD4readEv>:
     f52:	80 e0       	ldi	r24, 0x00	; 0
     f54:	08 95       	ret

00000f56 <_ZN3OSD4peekEv>:
     f56:	80 e0       	ldi	r24, 0x00	; 0
     f58:	08 95       	ret

00000f5a <_ZN3OSD5flushEv>:
     f5a:	08 95       	ret

00000f5c <_Z12unplugSlavesv>:
     f5c:	5e 9a       	sbi	0x0b, 6	; 11
     f5e:	08 95       	ret

00000f60 <_Z8delay_15v>:
     f60:	6f e0       	ldi	r22, 0x0F	; 15
     f62:	70 e0       	ldi	r23, 0x00	; 0
     f64:	80 e0       	ldi	r24, 0x00	; 0
     f66:	90 e0       	ldi	r25, 0x00	; 0
     f68:	0e 94 3f 36 	call	0x6c7e	; 0x6c7e <delay>
     f6c:	08 95       	ret

00000f6e <_Z8MAX_modeh>:
     f6e:	68 2f       	mov	r22, r24
     f70:	80 e0       	ldi	r24, 0x00	; 0
     f72:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
     f76:	08 95       	ret

00000f78 <_ZN3OSD7setModeEh>:
     f78:	88 23       	and	r24, r24
     f7a:	11 f0       	breq	.+4      	; 0xf80 <_ZN3OSD7setModeEh+0x8>
     f7c:	80 e4       	ldi	r24, 0x40	; 64
     f7e:	01 c0       	rjmp	.+2      	; 0xf82 <_ZN3OSD7setModeEh+0xa>
     f80:	80 e0       	ldi	r24, 0x00	; 0
     f82:	90 91 37 03 	lds	r25, 0x0337	; 0x800337 <_ZN3OSD10video_modeE>
     f86:	98 17       	cp	r25, r24
     f88:	49 f0       	breq	.+18     	; 0xf9c <_ZN3OSD7setModeEh+0x24>
     f8a:	80 93 37 03 	sts	0x0337, r24	; 0x800337 <_ZN3OSD10video_modeE>
     f8e:	5e 98       	cbi	0x0b, 6	; 11
     f90:	80 91 37 03 	lds	r24, 0x0337	; 0x800337 <_ZN3OSD10video_modeE>
     f94:	8c 61       	ori	r24, 0x1C	; 28
     f96:	0e 94 b7 07 	call	0xf6e	; 0xf6e <_Z8MAX_modeh>
     f9a:	5e 9a       	sbi	0x0b, 6	; 11
     f9c:	08 95       	ret

00000f9e <_ZN3OSD10detectModeEv>:
     f9e:	5e 98       	cbi	0x0b, 6	; 11
     fa0:	80 91 5a 04 	lds	r24, 0x045A	; 0x80045a <sets+0x1>
     fa4:	81 fd       	sbrc	r24, 1
     fa6:	06 c0       	rjmp	.+12     	; 0xfb4 <_ZN3OSD10detectModeEv+0x16>
     fa8:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
     fac:	83 ff       	sbrs	r24, 3
     fae:	1c c0       	rjmp	.+56     	; 0xfe8 <_ZN3OSD10detectModeEv+0x4a>
     fb0:	81 e0       	ldi	r24, 0x01	; 1
     fb2:	1b c0       	rjmp	.+54     	; 0xfea <_ZN3OSD10detectModeEv+0x4c>
     fb4:	80 ea       	ldi	r24, 0xA0	; 160
     fb6:	0e 94 92 13 	call	0x2724	; 0x2724 <_Z8MAX_readh>
     fba:	80 ff       	sbrs	r24, 0
     fbc:	07 c0       	rjmp	.+14     	; 0xfcc <_ZN3OSD10detectModeEv+0x2e>
     fbe:	81 e0       	ldi	r24, 0x01	; 1
     fc0:	0e 94 bc 07 	call	0xf78	; 0xf78 <_ZN3OSD7setModeEh>
     fc4:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
     fc8:	88 60       	ori	r24, 0x08	; 8
     fca:	08 c0       	rjmp	.+16     	; 0xfdc <_ZN3OSD10detectModeEv+0x3e>
     fcc:	81 ff       	sbrs	r24, 1
     fce:	09 c0       	rjmp	.+18     	; 0xfe2 <_ZN3OSD10detectModeEv+0x44>
     fd0:	80 e0       	ldi	r24, 0x00	; 0
     fd2:	0e 94 bc 07 	call	0xf78	; 0xf78 <_ZN3OSD7setModeEh>
     fd6:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
     fda:	87 7f       	andi	r24, 0xF7	; 247
     fdc:	80 93 59 04 	sts	0x0459, r24	; 0x800459 <sets>
     fe0:	06 c0       	rjmp	.+12     	; 0xfee <_ZN3OSD10detectModeEv+0x50>
     fe2:	82 fd       	sbrc	r24, 2
     fe4:	e1 cf       	rjmp	.-62     	; 0xfa8 <_ZN3OSD10detectModeEv+0xa>
     fe6:	03 c0       	rjmp	.+6      	; 0xfee <_ZN3OSD10detectModeEv+0x50>
     fe8:	80 e0       	ldi	r24, 0x00	; 0
     fea:	0e 94 bc 07 	call	0xf78	; 0xf78 <_ZN3OSD7setModeEh>
     fee:	5e 9a       	sbi	0x0b, 6	; 11
     ff0:	08 95       	ret

00000ff2 <_ZN3OSD13setBrightnessEv>:
     ff2:	cf 93       	push	r28
     ff4:	df 93       	push	r29
     ff6:	e0 91 5f 04 	lds	r30, 0x045F	; 0x80045f <sets+0x6>
     ffa:	e4 30       	cpi	r30, 0x04	; 4
     ffc:	08 f0       	brcs	.+2      	; 0x1000 <_ZN3OSD13setBrightnessEv+0xe>
     ffe:	e0 e0       	ldi	r30, 0x00	; 0
    1000:	f0 e0       	ldi	r31, 0x00	; 0
    1002:	ef 5e       	subi	r30, 0xEF	; 239
    1004:	fe 4f       	sbci	r31, 0xFE	; 254
    1006:	c4 91       	lpm	r28, Z
    1008:	80 e1       	ldi	r24, 0x10	; 16
    100a:	d1 e0       	ldi	r29, 0x01	; 1
    100c:	d8 0f       	add	r29, r24
    100e:	6c 2f       	mov	r22, r28
    1010:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
    1014:	8d 2f       	mov	r24, r29
    1016:	d0 32       	cpi	r29, 0x20	; 32
    1018:	c1 f7       	brne	.-16     	; 0x100a <_ZN3OSD13setBrightnessEv+0x18>
    101a:	df 91       	pop	r29
    101c:	cf 91       	pop	r28
    101e:	08 95       	ret

00001020 <_ZN3OSD6adjustEv>:
    1020:	5e 98       	cbi	0x0b, 6	; 11
    1022:	0e 94 f9 07 	call	0xff2	; 0xff2 <_ZN3OSD13setBrightnessEv>
    1026:	60 91 9d 04 	lds	r22, 0x049D	; 0x80049d <sets+0x44>
    102a:	82 e0       	ldi	r24, 0x02	; 2
    102c:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
    1030:	60 91 9c 04 	lds	r22, 0x049C	; 0x80049c <sets+0x43>
    1034:	83 e0       	ldi	r24, 0x03	; 3
    1036:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
    103a:	5e 9a       	sbi	0x0b, 6	; 11
    103c:	08 95       	ret

0000103e <_ZN3OSD7hw_initEv>:
    103e:	5e 98       	cbi	0x0b, 6	; 11
    1040:	8c ee       	ldi	r24, 0xEC	; 236
    1042:	0e 94 92 13 	call	0x2724	; 0x2724 <_Z8MAX_readh>
    1046:	68 2f       	mov	r22, r24
    1048:	6f 7e       	andi	r22, 0xEF	; 239
    104a:	8c e6       	ldi	r24, 0x6C	; 108
    104c:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
    1050:	62 e1       	ldi	r22, 0x12	; 18
    1052:	8c e0       	ldi	r24, 0x0C	; 12
    1054:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
    1058:	80 91 37 03 	lds	r24, 0x0337	; 0x800337 <_ZN3OSD10video_modeE>
    105c:	8c 63       	ori	r24, 0x3C	; 60
    105e:	0e 94 b7 07 	call	0xf6e	; 0xf6e <_Z8MAX_modeh>
    1062:	0e 94 47 1e 	call	0x3c8e	; 0x3c8e <_Z9delay_150v>
    1066:	80 91 37 03 	lds	r24, 0x0337	; 0x800337 <_ZN3OSD10video_modeE>
    106a:	8c 61       	ori	r24, 0x1C	; 28
    106c:	0e 94 b7 07 	call	0xf6e	; 0xf6e <_Z8MAX_modeh>
    1070:	0e 94 10 08 	call	0x1020	; 0x1020 <_ZN3OSD6adjustEv>
    1074:	08 95       	ret

00001076 <_ZN3OSD5resetEv>:
    1076:	cf 93       	push	r28
    1078:	df 93       	push	r29
    107a:	5e 98       	cbi	0x0b, 6	; 11
    107c:	c0 e1       	ldi	r28, 0x10	; 16
    107e:	df ef       	ldi	r29, 0xFF	; 255
    1080:	c1 50       	subi	r28, 0x01	; 1
    1082:	61 f4       	brne	.+24     	; 0x109c <_ZN3OSD5resetEv+0x26>
    1084:	80 91 37 03 	lds	r24, 0x0337	; 0x800337 <_ZN3OSD10video_modeE>
    1088:	82 60       	ori	r24, 0x02	; 2
    108a:	0e 94 b7 07 	call	0xf6e	; 0xf6e <_Z8MAX_modeh>
    108e:	0e 94 b0 07 	call	0xf60	; 0xf60 <_Z8delay_15v>
    1092:	0e 94 1f 08 	call	0x103e	; 0x103e <_ZN3OSD7hw_initEv>
    1096:	df 91       	pop	r29
    1098:	cf 91       	pop	r28
    109a:	08 95       	ret
    109c:	80 ea       	ldi	r24, 0xA0	; 160
    109e:	0e 94 92 13 	call	0x2724	; 0x2724 <_Z8MAX_readh>
    10a2:	87 70       	andi	r24, 0x07	; 7
    10a4:	79 f7       	brne	.-34     	; 0x1084 <_ZN3OSD5resetEv+0xe>
    10a6:	84 e0       	ldi	r24, 0x04	; 4
    10a8:	81 50       	subi	r24, 0x01	; 1
    10aa:	31 f0       	breq	.+12     	; 0x10b8 <_ZN3OSD5resetEv+0x42>
    10ac:	de bd       	out	0x2e, r29	; 46
    10ae:	0d b4       	in	r0, 0x2d	; 45
    10b0:	07 fe       	sbrs	r0, 7
    10b2:	fd cf       	rjmp	.-6      	; 0x10ae <_ZN3OSD5resetEv+0x38>
    10b4:	9e b5       	in	r25, 0x2e	; 46
    10b6:	f8 cf       	rjmp	.-16     	; 0x10a8 <_ZN3OSD5resetEv+0x32>
    10b8:	0e 94 b0 07 	call	0xf60	; 0xf60 <_Z8delay_15v>
    10bc:	e1 cf       	rjmp	.-62     	; 0x1080 <_ZN3OSD5resetEv+0xa>

000010be <_ZN3OSD4initEv>:
    10be:	61 e0       	ldi	r22, 0x01	; 1
    10c0:	8e e0       	ldi	r24, 0x0E	; 14
    10c2:	0e 94 a9 36 	call	0x6d52	; 0x6d52 <pinMode>
    10c6:	62 e0       	ldi	r22, 0x02	; 2
    10c8:	82 e0       	ldi	r24, 0x02	; 2
    10ca:	0e 94 a9 36 	call	0x6d52	; 0x6d52 <pinMode>
    10ce:	61 e0       	ldi	r22, 0x01	; 1
    10d0:	83 e0       	ldi	r24, 0x03	; 3
    10d2:	0e 94 a9 36 	call	0x6d52	; 0x6d52 <pinMode>
    10d6:	61 e0       	ldi	r22, 0x01	; 1
    10d8:	83 e0       	ldi	r24, 0x03	; 3
    10da:	0e 94 e5 36 	call	0x6dca	; 0x6dca <digitalWrite>
    10de:	0e 94 3b 08 	call	0x1076	; 0x1076 <_ZN3OSD5resetEv>
    10e2:	0e 94 cf 07 	call	0xf9e	; 0xf9e <_ZN3OSD10detectModeEv>
    10e6:	0e 94 1f 08 	call	0x103e	; 0x103e <_ZN3OSD7hw_initEv>
    10ea:	08 95       	ret

000010ec <_ZN3OSD8calc_posEv>:
    10ec:	20 91 38 03 	lds	r18, 0x0338	; 0x800338 <_ZN3OSD3rowE>
    10f0:	80 91 39 03 	lds	r24, 0x0339	; 0x800339 <_ZN3OSD3colE>
    10f4:	90 e0       	ldi	r25, 0x00	; 0
    10f6:	3e e1       	ldi	r19, 0x1E	; 30
    10f8:	23 9f       	mul	r18, r19
    10fa:	80 0d       	add	r24, r0
    10fc:	91 1d       	adc	r25, r1
    10fe:	11 24       	eor	r1, r1
    1100:	90 93 55 01 	sts	0x0155, r25	; 0x800155 <__data_end+0x1>
    1104:	80 93 54 01 	sts	0x0154, r24	; 0x800154 <__data_end>
    1108:	08 95       	ret

0000110a <_ZN3OSD8setPanelEhh>:
    110a:	8f 71       	andi	r24, 0x1F	; 31
    110c:	80 93 39 03 	sts	0x0339, r24	; 0x800339 <_ZN3OSD3colE>
    1110:	6f 70       	andi	r22, 0x0F	; 15
    1112:	60 93 38 03 	sts	0x0338, r22	; 0x800338 <_ZN3OSD3rowE>
    1116:	80 91 37 03 	lds	r24, 0x0337	; 0x800337 <_ZN3OSD10video_modeE>
    111a:	80 34       	cpi	r24, 0x40	; 64
    111c:	11 f0       	breq	.+4      	; 0x1122 <_ZN3OSD8setPanelEhh+0x18>
    111e:	67 30       	cpi	r22, 0x07	; 7
    1120:	18 f4       	brcc	.+6      	; 0x1128 <_ZN3OSD8setPanelEhh+0x1e>
    1122:	0e 94 76 08 	call	0x10ec	; 0x10ec <_ZN3OSD8calc_posEv>
    1126:	08 95       	ret
    1128:	63 50       	subi	r22, 0x03	; 3
    112a:	60 93 38 03 	sts	0x0338, r22	; 0x800338 <_ZN3OSD3rowE>
    112e:	f9 cf       	rjmp	.-14     	; 0x1122 <_ZN3OSD8setPanelEhh+0x18>

00001130 <_ZN3OSD8relPanelEhh>:
    1130:	90 91 38 03 	lds	r25, 0x0338	; 0x800338 <_ZN3OSD3rowE>
    1134:	69 0f       	add	r22, r25
    1136:	90 91 39 03 	lds	r25, 0x0339	; 0x800339 <_ZN3OSD3colE>
    113a:	89 0f       	add	r24, r25
    113c:	9e e1       	ldi	r25, 0x1E	; 30
    113e:	69 9f       	mul	r22, r25
    1140:	b0 01       	movw	r22, r0
    1142:	11 24       	eor	r1, r1
    1144:	68 0f       	add	r22, r24
    1146:	71 1d       	adc	r23, r1
    1148:	70 93 55 01 	sts	0x0155, r23	; 0x800155 <__data_end+0x1>
    114c:	60 93 54 01 	sts	0x0154, r22	; 0x800154 <__data_end>
    1150:	08 95       	ret

00001152 <_ZN3OSD9write_rawEh>:
    1152:	20 91 54 01 	lds	r18, 0x0154	; 0x800154 <__data_end>
    1156:	30 91 55 01 	lds	r19, 0x0155	; 0x800155 <__data_end+0x1>
    115a:	21 3e       	cpi	r18, 0xE1	; 225
    115c:	91 e0       	ldi	r25, 0x01	; 1
    115e:	39 07       	cpc	r19, r25
    1160:	58 f4       	brcc	.+22     	; 0x1178 <_ZN3OSD9write_rawEh+0x26>
    1162:	a9 01       	movw	r20, r18
    1164:	4f 5f       	subi	r20, 0xFF	; 255
    1166:	5f 4f       	sbci	r21, 0xFF	; 255
    1168:	50 93 55 01 	sts	0x0155, r21	; 0x800155 <__data_end+0x1>
    116c:	40 93 54 01 	sts	0x0154, r20	; 0x800154 <__data_end>
    1170:	f9 01       	movw	r30, r18
    1172:	ea 5a       	subi	r30, 0xAA	; 170
    1174:	fe 4f       	sbci	r31, 0xFE	; 254
    1176:	80 83       	st	Z, r24
    1178:	08 95       	ret

0000117a <_ZN3OSD7write_SEh>:
    117a:	8f 3f       	cpi	r24, 0xFF	; 255
    117c:	41 f4       	brne	.+16     	; 0x118e <_ZN3OSD7write_SEh+0x14>
    117e:	80 91 38 03 	lds	r24, 0x0338	; 0x800338 <_ZN3OSD3rowE>
    1182:	8f 5f       	subi	r24, 0xFF	; 255
    1184:	80 93 38 03 	sts	0x0338, r24	; 0x800338 <_ZN3OSD3rowE>
    1188:	0e 94 76 08 	call	0x10ec	; 0x10ec <_ZN3OSD8calc_posEv>
    118c:	08 95       	ret
    118e:	0e 94 a9 08 	call	0x1152	; 0x1152 <_ZN3OSD9write_rawEh>
    1192:	08 95       	ret

00001194 <_ZN3OSD5writeEh>:
    1194:	86 2f       	mov	r24, r22
    1196:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    119a:	81 e0       	ldi	r24, 0x01	; 1
    119c:	90 e0       	ldi	r25, 0x00	; 0
    119e:	08 95       	ret

000011a0 <_ZN3OSD8write_xyEhhh>:
    11a0:	cf 93       	push	r28
    11a2:	c4 2f       	mov	r28, r20
    11a4:	0e 94 98 08 	call	0x1130	; 0x1130 <_ZN3OSD8relPanelEhh>
    11a8:	8c 2f       	mov	r24, r28
    11aa:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    11ae:	cf 91       	pop	r28
    11b0:	08 95       	ret

000011b2 <_ZN3OSD6updateEv>:
    11b2:	8f ef       	ldi	r24, 0xFF	; 255
    11b4:	80 93 36 03 	sts	0x0336, r24	; 0x800336 <_ZN3OSD6osdbufE+0x1e0>
    11b8:	5e 98       	cbi	0x0b, 6	; 11
    11ba:	60 e0       	ldi	r22, 0x00	; 0
    11bc:	85 e0       	ldi	r24, 0x05	; 5
    11be:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
    11c2:	60 e0       	ldi	r22, 0x00	; 0
    11c4:	86 e0       	ldi	r24, 0x06	; 6
    11c6:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
    11ca:	61 e0       	ldi	r22, 0x01	; 1
    11cc:	84 e0       	ldi	r24, 0x04	; 4
    11ce:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
    11d2:	5e 9a       	sbi	0x0b, 6	; 11
    11d4:	e6 e5       	ldi	r30, 0x56	; 86
    11d6:	f1 e0       	ldi	r31, 0x01	; 1
    11d8:	80 e2       	ldi	r24, 0x20	; 32
    11da:	5e 98       	cbi	0x0b, 6	; 11
    11dc:	90 81       	ld	r25, Z
    11de:	9e bd       	out	0x2e, r25	; 46
    11e0:	0d b4       	in	r0, 0x2d	; 45
    11e2:	07 fe       	sbrs	r0, 7
    11e4:	fd cf       	rjmp	.-6      	; 0x11e0 <_ZN3OSD6updateEv+0x2e>
    11e6:	9e b5       	in	r25, 0x2e	; 46
    11e8:	81 93       	st	Z+, r24
    11ea:	5e 9a       	sbi	0x0b, 6	; 11
    11ec:	93 e0       	ldi	r25, 0x03	; 3
    11ee:	e7 33       	cpi	r30, 0x37	; 55
    11f0:	f9 07       	cpc	r31, r25
    11f2:	98 f3       	brcs	.-26     	; 0x11da <_ZN3OSD6updateEv+0x28>
    11f4:	6d e0       	ldi	r22, 0x0D	; 13
    11f6:	71 e0       	ldi	r23, 0x01	; 1
    11f8:	83 e5       	ldi	r24, 0x53	; 83
    11fa:	93 e0       	ldi	r25, 0x03	; 3
    11fc:	0e 94 ab 3a 	call	0x7556	; 0x7556 <_ZN12BetterStream7print_PEPKc>
    1200:	6a e0       	ldi	r22, 0x0A	; 10
    1202:	71 e0       	ldi	r23, 0x01	; 1
    1204:	83 e5       	ldi	r24, 0x53	; 83
    1206:	93 e0       	ldi	r25, 0x03	; 3
    1208:	0e 94 ab 3a 	call	0x7556	; 0x7556 <_ZN12BetterStream7print_PEPKc>
    120c:	2a e0       	ldi	r18, 0x0A	; 10
    120e:	30 e0       	ldi	r19, 0x00	; 0
    1210:	41 ee       	ldi	r20, 0xE1	; 225
    1212:	51 e0       	ldi	r21, 0x01	; 1
    1214:	60 e0       	ldi	r22, 0x00	; 0
    1216:	70 e0       	ldi	r23, 0x00	; 0
    1218:	83 e5       	ldi	r24, 0x53	; 83
    121a:	93 e0       	ldi	r25, 0x03	; 3
    121c:	0e 94 13 38 	call	0x7026	; 0x7026 <_ZN5Print7printlnEmi>
    1220:	83 e5       	ldi	r24, 0x53	; 83
    1222:	93 e0       	ldi	r25, 0x03	; 3
    1224:	0e 94 84 39 	call	0x7308	; 0x7308 <_ZN10FastSerial4waitEv>
    1228:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    122c:	9f 93       	push	r25
    122e:	8f 93       	push	r24
    1230:	7f 93       	push	r23
    1232:	6f 93       	push	r22
    1234:	80 e0       	ldi	r24, 0x00	; 0
    1236:	91 e0       	ldi	r25, 0x01	; 1
    1238:	9f 93       	push	r25
    123a:	8f 93       	push	r24
    123c:	83 e5       	ldi	r24, 0x53	; 83
    123e:	93 e0       	ldi	r25, 0x03	; 3
    1240:	9f 93       	push	r25
    1242:	8f 93       	push	r24
    1244:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    1248:	83 e5       	ldi	r24, 0x53	; 83
    124a:	93 e0       	ldi	r25, 0x03	; 3
    124c:	0e 94 84 39 	call	0x7308	; 0x7308 <_ZN10FastSerial4waitEv>
    1250:	8d b7       	in	r24, 0x3d	; 61
    1252:	9e b7       	in	r25, 0x3e	; 62
    1254:	08 96       	adiw	r24, 0x08	; 8
    1256:	0f b6       	in	r0, 0x3f	; 63
    1258:	f8 94       	cli
    125a:	9e bf       	out	0x3e, r25	; 62
    125c:	0f be       	out	0x3f, r0	; 63
    125e:	8d bf       	out	0x3d, r24	; 61
    1260:	08 95       	ret

00001262 <_ZN3OSD9write_NVMEjPh>:
    1262:	0f 93       	push	r16
    1264:	1f 93       	push	r17
    1266:	cf 93       	push	r28
    1268:	df 93       	push	r29
    126a:	18 2f       	mov	r17, r24
    126c:	d6 2f       	mov	r29, r22
    126e:	c7 2f       	mov	r28, r23
    1270:	5e 98       	cbi	0x0b, 6	; 11
    1272:	80 e0       	ldi	r24, 0x00	; 0
    1274:	0e 94 b7 07 	call	0xf6e	; 0xf6e <_Z8MAX_modeh>
    1278:	61 2f       	mov	r22, r17
    127a:	89 e0       	ldi	r24, 0x09	; 9
    127c:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
    1280:	0d 2f       	mov	r16, r29
    1282:	1c 2f       	mov	r17, r28
    1284:	c0 e0       	ldi	r28, 0x00	; 0
    1286:	f8 01       	movw	r30, r16
    1288:	d1 91       	ld	r29, Z+
    128a:	8f 01       	movw	r16, r30
    128c:	6c 2f       	mov	r22, r28
    128e:	8a e0       	ldi	r24, 0x0A	; 10
    1290:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
    1294:	6d 2f       	mov	r22, r29
    1296:	8b e0       	ldi	r24, 0x0B	; 11
    1298:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
    129c:	cf 5f       	subi	r28, 0xFF	; 255
    129e:	c6 33       	cpi	r28, 0x36	; 54
    12a0:	91 f7       	brne	.-28     	; 0x1286 <_ZN3OSD9write_NVMEjPh+0x24>
    12a2:	60 ea       	ldi	r22, 0xA0	; 160
    12a4:	88 e0       	ldi	r24, 0x08	; 8
    12a6:	0e 94 87 13 	call	0x270e	; 0x270e <_Z9MAX_writehh>
    12aa:	80 ea       	ldi	r24, 0xA0	; 160
    12ac:	0e 94 92 13 	call	0x2724	; 0x2724 <_Z8MAX_readh>
    12b0:	85 ff       	sbrs	r24, 5
    12b2:	03 c0       	rjmp	.+6      	; 0x12ba <_ZN3OSD9write_NVMEjPh+0x58>
    12b4:	0e 94 9e 13 	call	0x273c	; 0x273c <_Z11delay_telemv>
    12b8:	f8 cf       	rjmp	.-16     	; 0x12aa <_ZN3OSD9write_NVMEjPh+0x48>
    12ba:	8c e0       	ldi	r24, 0x0C	; 12
    12bc:	0e 94 b7 07 	call	0xf6e	; 0xf6e <_Z8MAX_modeh>
    12c0:	5e 9a       	sbi	0x0b, 6	; 11
    12c2:	df 91       	pop	r29
    12c4:	cf 91       	pop	r28
    12c6:	1f 91       	pop	r17
    12c8:	0f 91       	pop	r16
    12ca:	08 95       	ret

000012cc <crc_accumulate>:
    12cc:	fb 01       	movw	r30, r22
    12ce:	20 81       	ld	r18, Z
    12d0:	82 27       	eor	r24, r18
    12d2:	90 e1       	ldi	r25, 0x10	; 16
    12d4:	89 9f       	mul	r24, r25
    12d6:	90 01       	movw	r18, r0
    12d8:	11 24       	eor	r1, r1
    12da:	28 27       	eor	r18, r24
    12dc:	82 2f       	mov	r24, r18
    12de:	90 e0       	ldi	r25, 0x00	; 0
    12e0:	58 2f       	mov	r21, r24
    12e2:	44 27       	eor	r20, r20
    12e4:	9c 01       	movw	r18, r24
    12e6:	63 e0       	ldi	r22, 0x03	; 3
    12e8:	22 0f       	add	r18, r18
    12ea:	33 1f       	adc	r19, r19
    12ec:	6a 95       	dec	r22
    12ee:	e1 f7       	brne	.-8      	; 0x12e8 <crc_accumulate+0x1c>
    12f0:	42 27       	eor	r20, r18
    12f2:	53 27       	eor	r21, r19
    12f4:	21 81       	ldd	r18, Z+1	; 0x01
    12f6:	30 e0       	ldi	r19, 0x00	; 0
    12f8:	24 27       	eor	r18, r20
    12fa:	35 27       	eor	r19, r21
    12fc:	74 e0       	ldi	r23, 0x04	; 4
    12fe:	95 95       	asr	r25
    1300:	87 95       	ror	r24
    1302:	7a 95       	dec	r23
    1304:	e1 f7       	brne	.-8      	; 0x12fe <crc_accumulate+0x32>
    1306:	82 27       	eor	r24, r18
    1308:	93 27       	eor	r25, r19
    130a:	91 83       	std	Z+1, r25	; 0x01
    130c:	80 83       	st	Z, r24
    130e:	08 95       	ret

00001310 <mavlink_update_checksum>:
    1310:	9c 01       	movw	r18, r24
    1312:	86 2f       	mov	r24, r22
    1314:	b9 01       	movw	r22, r18
    1316:	0e 94 66 09 	call	0x12cc	; 0x12cc <crc_accumulate>
    131a:	08 95       	ret

0000131c <_ZL12get_chan_poshh>:
    131c:	e8 2f       	mov	r30, r24
    131e:	f0 e0       	ldi	r31, 0x00	; 0
    1320:	ee 0f       	add	r30, r30
    1322:	ff 1f       	adc	r31, r31
    1324:	e1 54       	subi	r30, 0x41	; 65
    1326:	f9 4f       	sbci	r31, 0xF9	; 249
    1328:	20 81       	ld	r18, Z
    132a:	31 81       	ldd	r19, Z+1	; 0x01
    132c:	66 23       	and	r22, r22
    132e:	29 f0       	breq	.+10     	; 0x133a <_ZL12get_chan_poshh+0x1e>
    1330:	40 e2       	ldi	r20, 0x20	; 32
    1332:	53 e0       	ldi	r21, 0x03	; 3
    1334:	88 e9       	ldi	r24, 0x98	; 152
    1336:	98 e0       	ldi	r25, 0x08	; 8
    1338:	04 c0       	rjmp	.+8      	; 0x1342 <_ZL12get_chan_poshh+0x26>
    133a:	48 ee       	ldi	r20, 0xE8	; 232
    133c:	53 e0       	ldi	r21, 0x03	; 3
    133e:	80 ed       	ldi	r24, 0xD0	; 208
    1340:	97 e0       	ldi	r25, 0x07	; 7
    1342:	24 17       	cp	r18, r20
    1344:	35 07       	cpc	r19, r21
    1346:	80 f0       	brcs	.+32     	; 0x1368 <_ZL12get_chan_poshh+0x4c>
    1348:	24 1b       	sub	r18, r20
    134a:	35 0b       	sbc	r19, r21
    134c:	84 1b       	sub	r24, r20
    134e:	95 0b       	sbc	r25, r21
    1350:	65 e0       	ldi	r22, 0x05	; 5
    1352:	70 e0       	ldi	r23, 0x00	; 0
    1354:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    1358:	c9 01       	movw	r24, r18
    135a:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    135e:	86 2f       	mov	r24, r22
    1360:	65 30       	cpi	r22, 0x05	; 5
    1362:	18 f0       	brcs	.+6      	; 0x136a <_ZL12get_chan_poshh+0x4e>
    1364:	84 e0       	ldi	r24, 0x04	; 4
    1366:	08 95       	ret
    1368:	80 e0       	ldi	r24, 0x00	; 0
    136a:	08 95       	ret

0000136c <_ZL13storeChannelsv>:
    136c:	af eb       	ldi	r26, 0xBF	; 191
    136e:	b6 e0       	ldi	r27, 0x06	; 6
    1370:	e6 e4       	ldi	r30, 0x46	; 70
    1372:	f6 e0       	ldi	r31, 0x06	; 6
    1374:	80 81       	ld	r24, Z
    1376:	91 81       	ldd	r25, Z+1	; 0x01
    1378:	88 3e       	cpi	r24, 0xE8	; 232
    137a:	93 40       	sbci	r25, 0x03	; 3
    137c:	28 f4       	brcc	.+10     	; 0x1388 <_ZL13storeChannelsv+0x1c>
    137e:	8d 91       	ld	r24, X+
    1380:	9c 91       	ld	r25, X
    1382:	11 97       	sbiw	r26, 0x01	; 1
    1384:	91 83       	std	Z+1, r25	; 0x01
    1386:	80 83       	st	Z, r24
    1388:	32 96       	adiw	r30, 0x02	; 2
    138a:	12 96       	adiw	r26, 0x02	; 2
    138c:	86 e0       	ldi	r24, 0x06	; 6
    138e:	ee 34       	cpi	r30, 0x4E	; 78
    1390:	f8 07       	cpc	r31, r24
    1392:	81 f7       	brne	.-32     	; 0x1374 <_ZL13storeChannelsv+0x8>
    1394:	08 95       	ret

00001396 <_ZL11channelDiffh>:
    1396:	90 e0       	ldi	r25, 0x00	; 0
    1398:	88 0f       	add	r24, r24
    139a:	99 1f       	adc	r25, r25
    139c:	dc 01       	movw	r26, r24
    139e:	a1 54       	subi	r26, 0x41	; 65
    13a0:	b9 4f       	sbci	r27, 0xF9	; 249
    13a2:	fc 01       	movw	r30, r24
    13a4:	ea 5b       	subi	r30, 0xBA	; 186
    13a6:	f9 4f       	sbci	r31, 0xF9	; 249
    13a8:	8d 91       	ld	r24, X+
    13aa:	9c 91       	ld	r25, X
    13ac:	20 81       	ld	r18, Z
    13ae:	31 81       	ldd	r19, Z+1	; 0x01
    13b0:	82 1b       	sub	r24, r18
    13b2:	93 0b       	sbc	r25, r19
    13b4:	08 95       	ret

000013b6 <_ZL9move_menuc>:
    13b6:	e0 91 45 06 	lds	r30, 0x0645	; 0x800645 <_ZL12setup_screen>
    13ba:	35 e0       	ldi	r19, 0x05	; 5
    13bc:	e3 9f       	mul	r30, r19
    13be:	f0 01       	movw	r30, r0
    13c0:	11 24       	eor	r1, r1
    13c2:	e8 57       	subi	r30, 0x78	; 120
    13c4:	f9 4f       	sbci	r31, 0xF9	; 249
    13c6:	94 91       	lpm	r25, Z
    13c8:	91 50       	subi	r25, 0x01	; 1
    13ca:	20 91 10 01 	lds	r18, 0x0110	; 0x800110 <_ZL10setup_menu>
    13ce:	60 91 92 03 	lds	r22, 0x0392	; 0x800392 <params>
    13d2:	70 91 93 03 	lds	r23, 0x0393	; 0x800393 <params+0x1>
    13d6:	87 ff       	sbrs	r24, 7
    13d8:	03 c0       	rjmp	.+6      	; 0x13e0 <_ZL9move_menuc+0x2a>
    13da:	22 23       	and	r18, r18
    13dc:	39 f0       	breq	.+14     	; 0x13ec <_ZL9move_menuc+0x36>
    13de:	04 c0       	rjmp	.+8      	; 0x13e8 <_ZL9move_menuc+0x32>
    13e0:	88 23       	and	r24, r24
    13e2:	11 f0       	breq	.+4      	; 0x13e8 <_ZL9move_menuc+0x32>
    13e4:	29 17       	cp	r18, r25
    13e6:	21 f0       	breq	.+8      	; 0x13f0 <_ZL9move_menuc+0x3a>
    13e8:	28 0f       	add	r18, r24
    13ea:	03 c0       	rjmp	.+6      	; 0x13f2 <_ZL9move_menuc+0x3c>
    13ec:	29 2f       	mov	r18, r25
    13ee:	01 c0       	rjmp	.+2      	; 0x13f2 <_ZL9move_menuc+0x3c>
    13f0:	20 e0       	ldi	r18, 0x00	; 0
    13f2:	fb 01       	movw	r30, r22
    13f4:	36 e0       	ldi	r19, 0x06	; 6
    13f6:	23 9f       	mul	r18, r19
    13f8:	e0 0d       	add	r30, r0
    13fa:	f1 1d       	adc	r31, r1
    13fc:	11 24       	eor	r1, r1
    13fe:	33 96       	adiw	r30, 0x03	; 3
    1400:	45 91       	lpm	r20, Z+
    1402:	54 91       	lpm	r21, Z
    1404:	45 2b       	or	r20, r21
    1406:	39 f3       	breq	.-50     	; 0x13d6 <_ZL9move_menuc+0x20>
    1408:	20 93 10 01 	sts	0x0110, r18	; 0x800110 <_ZL10setup_menu>
    140c:	08 95       	ret

0000140e <_ZL13osd_print_batv>:
    140e:	cf 93       	push	r28
    1410:	df 93       	push	r29
    1412:	88 e8       	ldi	r24, 0x88	; 136
    1414:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1418:	c4 e1       	ldi	r28, 0x14	; 20
    141a:	d1 e0       	ldi	r29, 0x01	; 1
    141c:	88 81       	ld	r24, Y
    141e:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1422:	89 81       	ldd	r24, Y+1	; 0x01
    1424:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1428:	8e e8       	ldi	r24, 0x8E	; 142
    142a:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    142e:	df 91       	pop	r29
    1430:	cf 91       	pop	r28
    1432:	08 95       	ret

00001434 <_ZL9showArrowh>:
    1434:	cf 93       	push	r28
    1436:	81 31       	cpi	r24, 0x11	; 17
    1438:	10 f0       	brcs	.+4      	; 0x143e <_ZL9showArrowh+0xa>
    143a:	80 51       	subi	r24, 0x10	; 16
    143c:	fc cf       	rjmp	.-8      	; 0x1436 <_ZL9showArrowh+0x2>
    143e:	81 11       	cpse	r24, r1
    1440:	01 c0       	rjmp	.+2      	; 0x1444 <_ZL9showArrowh+0x10>
    1442:	80 e1       	ldi	r24, 0x10	; 16
    1444:	88 0f       	add	r24, r24
    1446:	ce ef       	ldi	r28, 0xFE	; 254
    1448:	c8 0f       	add	r28, r24
    144a:	80 e9       	ldi	r24, 0x90	; 144
    144c:	8c 0f       	add	r24, r28
    144e:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1452:	81 e9       	ldi	r24, 0x91	; 145
    1454:	8c 0f       	add	r24, r28
    1456:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    145a:	cf 91       	pop	r28
    145c:	08 95       	ret

0000145e <_ZL11osd_percentv>:
    145e:	85 e2       	ldi	r24, 0x25	; 37
    1460:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1464:	08 95       	ret

00001466 <_ZL9osd_blankv>:
    1466:	80 e2       	ldi	r24, 0x20	; 32
    1468:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    146c:	08 95       	ret

0000146e <_ZL6osd_nlv>:
    146e:	8f ef       	ldi	r24, 0xFF	; 255
    1470:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1474:	08 95       	ret

00001476 <_ZL12osd_setPanel5Point>:
    1476:	69 2f       	mov	r22, r25
    1478:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    147c:	08 95       	ret

0000147e <_ZL12osd_printi_1PKci>:
    147e:	7f 93       	push	r23
    1480:	6f 93       	push	r22
    1482:	9f 93       	push	r25
    1484:	8f 93       	push	r24
    1486:	88 e6       	ldi	r24, 0x68	; 104
    1488:	93 e0       	ldi	r25, 0x03	; 3
    148a:	9f 93       	push	r25
    148c:	8f 93       	push	r24
    148e:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    1492:	0f 90       	pop	r0
    1494:	0f 90       	pop	r0
    1496:	0f 90       	pop	r0
    1498:	0f 90       	pop	r0
    149a:	0f 90       	pop	r0
    149c:	0f 90       	pop	r0
    149e:	08 95       	ret

000014a0 <_ZL8panMotor5Point>:
    14a0:	ef 92       	push	r14
    14a2:	ff 92       	push	r15
    14a4:	0f 93       	push	r16
    14a6:	1f 93       	push	r17
    14a8:	cf 93       	push	r28
    14aa:	0c e6       	ldi	r16, 0x6C	; 108
    14ac:	13 e0       	ldi	r17, 0x03	; 3
    14ae:	c0 e0       	ldi	r28, 0x00	; 0
    14b0:	96 fd       	sbrc	r25, 6
    14b2:	20 c0       	rjmp	.+64     	; 0x14f4 <_ZL8panMotor5Point+0x54>
    14b4:	89 e0       	ldi	r24, 0x09	; 9
    14b6:	e8 2e       	mov	r14, r24
    14b8:	f1 2c       	mov	r15, r1
    14ba:	f8 01       	movw	r30, r16
    14bc:	81 91       	ld	r24, Z+
    14be:	91 91       	ld	r25, Z+
    14c0:	8f 01       	movw	r16, r30
    14c2:	8c 54       	subi	r24, 0x4C	; 76
    14c4:	94 40       	sbci	r25, 0x04	; 4
    14c6:	b7 01       	movw	r22, r14
    14c8:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    14cc:	81 e7       	ldi	r24, 0x71	; 113
    14ce:	98 e0       	ldi	r25, 0x08	; 8
    14d0:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    14d4:	c1 30       	cpi	r28, 0x01	; 1
    14d6:	19 f4       	brne	.+6      	; 0x14de <_ZL8panMotor5Point+0x3e>
    14d8:	0e 94 37 0a 	call	0x146e	; 0x146e <_ZL6osd_nlv>
    14dc:	02 c0       	rjmp	.+4      	; 0x14e2 <_ZL8panMotor5Point+0x42>
    14de:	0e 94 33 0a 	call	0x1466	; 0x1466 <_ZL9osd_blankv>
    14e2:	cf 5f       	subi	r28, 0xFF	; 255
    14e4:	c4 30       	cpi	r28, 0x04	; 4
    14e6:	49 f7       	brne	.-46     	; 0x14ba <_ZL8panMotor5Point+0x1a>
    14e8:	12 c0       	rjmp	.+36     	; 0x150e <_ZL8panMotor5Point+0x6e>
    14ea:	0e 94 33 0a 	call	0x1466	; 0x1466 <_ZL9osd_blankv>
    14ee:	cf 5f       	subi	r28, 0xFF	; 255
    14f0:	c4 30       	cpi	r28, 0x04	; 4
    14f2:	69 f0       	breq	.+26     	; 0x150e <_ZL8panMotor5Point+0x6e>
    14f4:	f8 01       	movw	r30, r16
    14f6:	61 91       	ld	r22, Z+
    14f8:	71 91       	ld	r23, Z+
    14fa:	8f 01       	movw	r16, r30
    14fc:	80 e4       	ldi	r24, 0x40	; 64
    14fe:	9a e0       	ldi	r25, 0x0A	; 10
    1500:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    1504:	c1 30       	cpi	r28, 0x01	; 1
    1506:	89 f7       	brne	.-30     	; 0x14ea <_ZL8panMotor5Point+0x4a>
    1508:	0e 94 37 0a 	call	0x146e	; 0x146e <_ZL6osd_nlv>
    150c:	f0 cf       	rjmp	.-32     	; 0x14ee <_ZL8panMotor5Point+0x4e>
    150e:	cf 91       	pop	r28
    1510:	1f 91       	pop	r17
    1512:	0f 91       	pop	r16
    1514:	ff 90       	pop	r15
    1516:	ef 90       	pop	r14
    1518:	08 95       	ret

0000151a <_ZL7panDate5Point>:
    151a:	a0 e0       	ldi	r26, 0x00	; 0
    151c:	b0 e0       	ldi	r27, 0x00	; 0
    151e:	e3 e9       	ldi	r30, 0x93	; 147
    1520:	fa e0       	ldi	r31, 0x0A	; 10
    1522:	0c 94 73 44 	jmp	0x88e6	; 0x88e6 <__prologue_saves__+0x14>
    1526:	d9 2f       	mov	r29, r25
    1528:	00 91 8a 03 	lds	r16, 0x038A	; 0x80038a <sys_days>
    152c:	10 91 8b 03 	lds	r17, 0x038B	; 0x80038b <sys_days+0x1>
    1530:	20 91 8c 03 	lds	r18, 0x038C	; 0x80038c <sys_days+0x2>
    1534:	30 91 8d 03 	lds	r19, 0x038D	; 0x80038d <sys_days+0x3>
    1538:	80 91 cf 03 	lds	r24, 0x03CF	; 0x8003cf <lflags+0x1b>
    153c:	88 23       	and	r24, r24
    153e:	09 f4       	brne	.+2      	; 0x1542 <_ZL7panDate5Point+0x28>
    1540:	78 c0       	rjmp	.+240    	; 0x1632 <_ZL7panDate5Point+0x118>
    1542:	82 eb       	ldi	r24, 0xB2	; 178
    1544:	e8 2e       	mov	r14, r24
    1546:	87 e0       	ldi	r24, 0x07	; 7
    1548:	f8 2e       	mov	r15, r24
    154a:	e4 e6       	ldi	r30, 0x64	; 100
    154c:	f0 e0       	ldi	r31, 0x00	; 0
    154e:	90 e9       	ldi	r25, 0x90	; 144
    1550:	c9 2e       	mov	r12, r25
    1552:	dd 24       	eor	r13, r13
    1554:	d3 94       	inc	r13
    1556:	c7 01       	movw	r24, r14
    1558:	83 70       	andi	r24, 0x03	; 3
    155a:	99 27       	eor	r25, r25
    155c:	89 2b       	or	r24, r25
    155e:	81 f4       	brne	.+32     	; 0x1580 <_ZL7panDate5Point+0x66>
    1560:	c7 01       	movw	r24, r14
    1562:	bf 01       	movw	r22, r30
    1564:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    1568:	89 2b       	or	r24, r25
    156a:	31 f4       	brne	.+12     	; 0x1578 <_ZL7panDate5Point+0x5e>
    156c:	c7 01       	movw	r24, r14
    156e:	b6 01       	movw	r22, r12
    1570:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    1574:	89 2b       	or	r24, r25
    1576:	21 f4       	brne	.+8      	; 0x1580 <_ZL7panDate5Point+0x66>
    1578:	61 e0       	ldi	r22, 0x01	; 1
    157a:	8e e6       	ldi	r24, 0x6E	; 110
    157c:	91 e0       	ldi	r25, 0x01	; 1
    157e:	03 c0       	rjmp	.+6      	; 0x1586 <_ZL7panDate5Point+0x6c>
    1580:	60 e0       	ldi	r22, 0x00	; 0
    1582:	8d e6       	ldi	r24, 0x6D	; 109
    1584:	91 e0       	ldi	r25, 0x01	; 1
    1586:	a0 e0       	ldi	r26, 0x00	; 0
    1588:	b0 e0       	ldi	r27, 0x00	; 0
    158a:	08 17       	cp	r16, r24
    158c:	19 07       	cpc	r17, r25
    158e:	2a 07       	cpc	r18, r26
    1590:	3b 07       	cpc	r19, r27
    1592:	18 f4       	brcc	.+6      	; 0x159a <_ZL7panDate5Point+0x80>
    1594:	40 e0       	ldi	r20, 0x00	; 0
    1596:	50 e0       	ldi	r21, 0x00	; 0
    1598:	08 c0       	rjmp	.+16     	; 0x15aa <_ZL7panDate5Point+0x90>
    159a:	08 1b       	sub	r16, r24
    159c:	19 0b       	sbc	r17, r25
    159e:	2a 0b       	sbc	r18, r26
    15a0:	3b 0b       	sbc	r19, r27
    15a2:	8f ef       	ldi	r24, 0xFF	; 255
    15a4:	e8 1a       	sub	r14, r24
    15a6:	f8 0a       	sbc	r15, r24
    15a8:	d6 cf       	rjmp	.-84     	; 0x1556 <_ZL7panDate5Point+0x3c>
    15aa:	c4 2f       	mov	r28, r20
    15ac:	fa 01       	movw	r30, r20
    15ae:	e0 5e       	subi	r30, 0xE0	; 224
    15b0:	fb 4f       	sbci	r31, 0xFB	; 251
    15b2:	e4 91       	lpm	r30, Z
    15b4:	41 30       	cpi	r20, 0x01	; 1
    15b6:	51 05       	cpc	r21, r1
    15b8:	11 f4       	brne	.+4      	; 0x15be <_ZL7panDate5Point+0xa4>
    15ba:	61 11       	cpse	r22, r1
    15bc:	ef 5f       	subi	r30, 0xFF	; 255
    15be:	8e 2f       	mov	r24, r30
    15c0:	90 e0       	ldi	r25, 0x00	; 0
    15c2:	a0 e0       	ldi	r26, 0x00	; 0
    15c4:	b0 e0       	ldi	r27, 0x00	; 0
    15c6:	08 17       	cp	r16, r24
    15c8:	19 07       	cpc	r17, r25
    15ca:	2a 07       	cpc	r18, r26
    15cc:	3b 07       	cpc	r19, r27
    15ce:	50 f0       	brcs	.+20     	; 0x15e4 <_ZL7panDate5Point+0xca>
    15d0:	08 1b       	sub	r16, r24
    15d2:	19 0b       	sbc	r17, r25
    15d4:	2a 0b       	sbc	r18, r26
    15d6:	3b 0b       	sbc	r19, r27
    15d8:	4f 5f       	subi	r20, 0xFF	; 255
    15da:	5f 4f       	sbci	r21, 0xFF	; 255
    15dc:	4c 30       	cpi	r20, 0x0C	; 12
    15de:	51 05       	cpc	r21, r1
    15e0:	21 f7       	brne	.-56     	; 0x15aa <_ZL7panDate5Point+0x90>
    15e2:	cc e0       	ldi	r28, 0x0C	; 12
    15e4:	8d 2f       	mov	r24, r29
    15e6:	0f 5f       	subi	r16, 0xFF	; 255
    15e8:	1f 4f       	sbci	r17, 0xFF	; 255
    15ea:	d0 e0       	ldi	r29, 0x00	; 0
    15ec:	86 ff       	sbrs	r24, 6
    15ee:	10 c0       	rjmp	.+32     	; 0x1610 <_ZL7panDate5Point+0xf6>
    15f0:	b8 01       	movw	r22, r16
    15f2:	81 e7       	ldi	r24, 0x71	; 113
    15f4:	98 e0       	ldi	r25, 0x08	; 8
    15f6:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    15fa:	be 01       	movw	r22, r28
    15fc:	6f 5f       	subi	r22, 0xFF	; 255
    15fe:	7f 4f       	sbci	r23, 0xFF	; 255
    1600:	80 e7       	ldi	r24, 0x70	; 112
    1602:	98 e0       	ldi	r25, 0x08	; 8
    1604:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    1608:	b7 01       	movw	r22, r14
    160a:	8b e1       	ldi	r24, 0x1B	; 27
    160c:	94 e0       	ldi	r25, 0x04	; 4
    160e:	0f c0       	rjmp	.+30     	; 0x162e <_ZL7panDate5Point+0x114>
    1610:	b7 01       	movw	r22, r14
    1612:	80 e4       	ldi	r24, 0x40	; 64
    1614:	9a e0       	ldi	r25, 0x0A	; 10
    1616:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    161a:	be 01       	movw	r22, r28
    161c:	6f 5f       	subi	r22, 0xFF	; 255
    161e:	7f 4f       	sbci	r23, 0xFF	; 255
    1620:	80 e7       	ldi	r24, 0x70	; 112
    1622:	98 e0       	ldi	r25, 0x08	; 8
    1624:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    1628:	b8 01       	movw	r22, r16
    162a:	80 e7       	ldi	r24, 0x70	; 112
    162c:	98 e0       	ldi	r25, 0x08	; 8
    162e:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    1632:	cd b7       	in	r28, 0x3d	; 61
    1634:	de b7       	in	r29, 0x3e	; 62
    1636:	e8 e0       	ldi	r30, 0x08	; 8
    1638:	0c 94 8f 44 	jmp	0x891e	; 0x891e <__epilogue_restores__+0x14>

0000163c <_ZL13panFlightMode5Point>:
    163c:	80 91 5b 06 	lds	r24, 0x065B	; 0x80065b <_ZL13osd_autopilot>
    1640:	8e 30       	cpi	r24, 0x0E	; 14
    1642:	c1 f4       	brne	.+48     	; 0x1674 <_ZL13panFlightMode5Point+0x38>
    1644:	20 91 ae 06 	lds	r18, 0x06AE	; 0x8006ae <_ZL8osd_mode>
    1648:	30 e0       	ldi	r19, 0x00	; 0
    164a:	87 e0       	ldi	r24, 0x07	; 7
    164c:	90 e0       	ldi	r25, 0x00	; 0
    164e:	48 2f       	mov	r20, r24
    1650:	b9 01       	movw	r22, r18
    1652:	08 2e       	mov	r0, r24
    1654:	02 c0       	rjmp	.+4      	; 0x165a <_ZL13panFlightMode5Point+0x1e>
    1656:	75 95       	asr	r23
    1658:	67 95       	ror	r22
    165a:	0a 94       	dec	r0
    165c:	e2 f7       	brpl	.-8      	; 0x1656 <_ZL13panFlightMode5Point+0x1a>
    165e:	60 fd       	sbrc	r22, 0
    1660:	03 c0       	rjmp	.+6      	; 0x1668 <_ZL13panFlightMode5Point+0x2c>
    1662:	01 97       	sbiw	r24, 0x01	; 1
    1664:	a0 f7       	brcc	.-24     	; 0x164e <_ZL13panFlightMode5Point+0x12>
    1666:	48 e0       	ldi	r20, 0x08	; 8
    1668:	40 93 ae 06 	sts	0x06AE, r20	; 0x8006ae <_ZL8osd_mode>
    166c:	89 e0       	ldi	r24, 0x09	; 9
    166e:	eb e7       	ldi	r30, 0x7B	; 123
    1670:	f8 e0       	ldi	r31, 0x08	; 8
    1672:	0b c0       	rjmp	.+22     	; 0x168a <_ZL13panFlightMode5Point+0x4e>
    1674:	80 91 5d 04 	lds	r24, 0x045D	; 0x80045d <sets+0x4>
    1678:	88 23       	and	r24, r24
    167a:	21 f0       	breq	.+8      	; 0x1684 <_ZL13panFlightMode5Point+0x48>
    167c:	83 e1       	ldi	r24, 0x13	; 19
    167e:	e5 ef       	ldi	r30, 0xF5	; 245
    1680:	f8 e0       	ldi	r31, 0x08	; 8
    1682:	03 c0       	rjmp	.+6      	; 0x168a <_ZL13panFlightMode5Point+0x4e>
    1684:	84 e1       	ldi	r24, 0x14	; 20
    1686:	eb e9       	ldi	r30, 0x9B	; 155
    1688:	f8 e0       	ldi	r31, 0x08	; 8
    168a:	90 91 ae 06 	lds	r25, 0x06AE	; 0x8006ae <_ZL8osd_mode>
    168e:	69 2f       	mov	r22, r25
    1690:	70 e0       	ldi	r23, 0x00	; 0
    1692:	98 17       	cp	r25, r24
    1694:	40 f4       	brcc	.+16     	; 0x16a6 <_ZL13panFlightMode5Point+0x6a>
    1696:	cb 01       	movw	r24, r22
    1698:	88 0f       	add	r24, r24
    169a:	99 1f       	adc	r25, r25
    169c:	e8 0f       	add	r30, r24
    169e:	f9 1f       	adc	r31, r25
    16a0:	85 91       	lpm	r24, Z+
    16a2:	94 91       	lpm	r25, Z
    16a4:	02 c0       	rjmp	.+4      	; 0x16aa <_ZL13panFlightMode5Point+0x6e>
    16a6:	88 e3       	ldi	r24, 0x38	; 56
    16a8:	99 e0       	ldi	r25, 0x09	; 9
    16aa:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    16ae:	80 91 bb 03 	lds	r24, 0x03BB	; 0x8003bb <lflags+0x7>
    16b2:	88 23       	and	r24, r24
    16b4:	19 f0       	breq	.+6      	; 0x16bc <_ZL13panFlightMode5Point+0x80>
    16b6:	86 e8       	ldi	r24, 0x86	; 134
    16b8:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    16bc:	08 95       	ret

000016be <_ZL10panHomeDir5Point>:
    16be:	cf 93       	push	r28
    16c0:	80 91 c2 03 	lds	r24, 0x03C2	; 0x8003c2 <lflags+0xe>
    16c4:	88 23       	and	r24, r24
    16c6:	71 f0       	breq	.+28     	; 0x16e4 <_ZL10panHomeDir5Point+0x26>
    16c8:	c9 2f       	mov	r28, r25
    16ca:	80 91 86 06 	lds	r24, 0x0686	; 0x800686 <_ZL18osd_home_direction>
    16ce:	0e 94 1a 0a 	call	0x1434	; 0x1434 <_ZL9showArrowh>
    16d2:	c6 ff       	sbrs	r28, 6
    16d4:	07 c0       	rjmp	.+14     	; 0x16e4 <_ZL10panHomeDir5Point+0x26>
    16d6:	60 91 86 06 	lds	r22, 0x0686	; 0x800686 <_ZL18osd_home_direction>
    16da:	70 e0       	ldi	r23, 0x00	; 0
    16dc:	8c e3       	ldi	r24, 0x3C	; 60
    16de:	9a e0       	ldi	r25, 0x0A	; 10
    16e0:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    16e4:	cf 91       	pop	r28
    16e6:	08 95       	ret

000016e8 <_ZL9panGPSats5Point>:
    16e8:	1f 93       	push	r17
    16ea:	cf 93       	push	r28
    16ec:	df 93       	push	r29
    16ee:	c8 2f       	mov	r28, r24
    16f0:	19 2f       	mov	r17, r25
    16f2:	80 91 8f 06 	lds	r24, 0x068F	; 0x80068f <_ZL12osd_fix_type>
    16f6:	82 30       	cpi	r24, 0x02	; 2
    16f8:	19 f0       	breq	.+6      	; 0x1700 <_ZL9panGPSats5Point+0x18>
    16fa:	20 f0       	brcs	.+8      	; 0x1704 <_ZL9panGPSats5Point+0x1c>
    16fc:	df e0       	ldi	r29, 0x0F	; 15
    16fe:	03 c0       	rjmp	.+6      	; 0x1706 <_ZL9panGPSats5Point+0x1e>
    1700:	df e1       	ldi	r29, 0x1F	; 31
    1702:	01 c0       	rjmp	.+2      	; 0x1706 <_ZL9panGPSats5Point+0x1e>
    1704:	da e2       	ldi	r29, 0x2A	; 42
    1706:	80 91 cf 06 	lds	r24, 0x06CF	; 0x8006cf <_ZL3eph>
    170a:	90 91 d0 06 	lds	r25, 0x06D0	; 0x8006d0 <_ZL3eph+0x1>
    170e:	88 3c       	cpi	r24, 0xC8	; 200
    1710:	91 05       	cpc	r25, r1
    1712:	20 f0       	brcs	.+8      	; 0x171c <_ZL9panGPSats5Point+0x34>
    1714:	80 91 c0 03 	lds	r24, 0x03C0	; 0x8003c0 <lflags+0xc>
    1718:	81 11       	cpse	r24, r1
    171a:	d0 e2       	ldi	r29, 0x20	; 32
    171c:	c0 95       	com	r28
    171e:	cc 1f       	adc	r28, r28
    1720:	cc 27       	eor	r28, r28
    1722:	cc 1f       	adc	r28, r28
    1724:	11 f0       	breq	.+4      	; 0x172a <_ZL9panGPSats5Point+0x42>
    1726:	16 ff       	sbrs	r17, 6
    1728:	0f c0       	rjmp	.+30     	; 0x1748 <_ZL9panGPSats5Point+0x60>
    172a:	60 91 90 06 	lds	r22, 0x0690	; 0x800690 <_ZL22osd_satellites_visible>
    172e:	70 e0       	ldi	r23, 0x00	; 0
    1730:	88 e3       	ldi	r24, 0x38	; 56
    1732:	9a e0       	ldi	r25, 0x0A	; 10
    1734:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    1738:	cc 23       	and	r28, r28
    173a:	51 f0       	breq	.+20     	; 0x1750 <_ZL9panGPSats5Point+0x68>
    173c:	16 ff       	sbrs	r17, 6
    173e:	08 c0       	rjmp	.+16     	; 0x1750 <_ZL9panGPSats5Point+0x68>
    1740:	8d 2f       	mov	r24, r29
    1742:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1746:	04 c0       	rjmp	.+8      	; 0x1750 <_ZL9panGPSats5Point+0x68>
    1748:	8d 2f       	mov	r24, r29
    174a:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    174e:	ed cf       	rjmp	.-38     	; 0x172a <_ZL9panGPSats5Point+0x42>
    1750:	df 91       	pop	r29
    1752:	cf 91       	pop	r28
    1754:	1f 91       	pop	r17
    1756:	08 95       	ret

00001758 <_ZL7panRoll5Point>:
    1758:	60 91 35 04 	lds	r22, 0x0435	; 0x800435 <osd_att+0x2>
    175c:	70 91 36 04 	lds	r23, 0x0436	; 0x800436 <osd_att+0x3>
    1760:	83 e1       	ldi	r24, 0x13	; 19
    1762:	93 e0       	ldi	r25, 0x03	; 3
    1764:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    1768:	08 95       	ret

0000176a <_ZL8panPitch5Point>:
    176a:	60 91 33 04 	lds	r22, 0x0433	; 0x800433 <osd_att>
    176e:	70 91 34 04 	lds	r23, 0x0434	; 0x800434 <osd_att+0x1>
    1772:	8d e0       	ldi	r24, 0x0D	; 13
    1774:	93 e0       	ldi	r25, 0x03	; 3
    1776:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    177a:	08 95       	ret

0000177c <_ZL17panBatteryPercent5Point>:
    177c:	1f 93       	push	r17
    177e:	cf 93       	push	r28
    1780:	df 93       	push	r29
    1782:	38 2f       	mov	r19, r24
    1784:	19 2f       	mov	r17, r25
    1786:	20 91 b4 06 	lds	r18, 0x06B4	; 0x8006b4 <_ZL19max_battery_reading>
    178a:	2f 55       	subi	r18, 0x5F	; 95
    178c:	c0 91 b6 06 	lds	r28, 0x06B6	; 0x8006b6 <_ZL23osd_battery_remaining_A>
    1790:	26 30       	cpi	r18, 0x06	; 6
    1792:	08 f0       	brcs	.+2      	; 0x1796 <_ZL17panBatteryPercent5Point+0x1a>
    1794:	4b c0       	rjmp	.+150    	; 0x182c <_ZL17panBatteryPercent5Point+0xb0>
    1796:	d0 e0       	ldi	r29, 0x00	; 0
    1798:	80 e0       	ldi	r24, 0x00	; 0
    179a:	9c 2f       	mov	r25, r28
    179c:	64 e6       	ldi	r22, 0x64	; 100
    179e:	70 e0       	ldi	r23, 0x00	; 0
    17a0:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    17a4:	cb 01       	movw	r24, r22
    17a6:	61 38       	cpi	r22, 0x81	; 129
    17a8:	71 05       	cpc	r23, r1
    17aa:	40 f0       	brcs	.+16     	; 0x17bc <_ZL17panBatteryPercent5Point+0x40>
    17ac:	29 e8       	ldi	r18, 0x89	; 137
    17ae:	20 93 14 01 	sts	0x0114, r18	; 0x800114 <_ZL17osd_battery_pic_A>
    17b2:	80 58       	subi	r24, 0x80	; 128
    17b4:	91 09       	sbc	r25, r1
    17b6:	e5 e1       	ldi	r30, 0x15	; 21
    17b8:	f1 e0       	ldi	r31, 0x01	; 1
    17ba:	12 c0       	rjmp	.+36     	; 0x17e0 <_ZL17panBatteryPercent5Point+0x64>
    17bc:	2d e8       	ldi	r18, 0x8D	; 141
    17be:	20 93 15 01 	sts	0x0115, r18	; 0x800115 <_ZL17osd_battery_pic_A+0x1>
    17c2:	62 31       	cpi	r22, 0x12	; 18
    17c4:	71 05       	cpc	r23, r1
    17c6:	50 f4       	brcc	.+20     	; 0x17dc <_ZL17panBatteryPercent5Point+0x60>
    17c8:	20 91 c0 03 	lds	r18, 0x03C0	; 0x8003c0 <lflags+0xc>
    17cc:	22 23       	and	r18, r18
    17ce:	31 f0       	breq	.+12     	; 0x17dc <_ZL17panBatteryPercent5Point+0x60>
    17d0:	20 e2       	ldi	r18, 0x20	; 32
    17d2:	20 93 14 01 	sts	0x0114, r18	; 0x800114 <_ZL17osd_battery_pic_A>
    17d6:	20 93 15 01 	sts	0x0115, r18	; 0x800115 <_ZL17osd_battery_pic_A+0x1>
    17da:	09 c0       	rjmp	.+18     	; 0x17ee <_ZL17panBatteryPercent5Point+0x72>
    17dc:	e4 e1       	ldi	r30, 0x14	; 20
    17de:	f1 e0       	ldi	r31, 0x01	; 1
    17e0:	6a e1       	ldi	r22, 0x1A	; 26
    17e2:	70 e0       	ldi	r23, 0x00	; 0
    17e4:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    17e8:	2d e8       	ldi	r18, 0x8D	; 141
    17ea:	26 1b       	sub	r18, r22
    17ec:	20 83       	st	Z, r18
    17ee:	37 ff       	sbrs	r19, 7
    17f0:	0e 94 07 0a 	call	0x140e	; 0x140e <_ZL13osd_print_batv>
    17f4:	16 ff       	sbrs	r17, 6
    17f6:	08 c0       	rjmp	.+16     	; 0x1808 <_ZL17panBatteryPercent5Point+0x8c>
    17f8:	be 01       	movw	r22, r28
    17fa:	88 e3       	ldi	r24, 0x38	; 56
    17fc:	9a e0       	ldi	r25, 0x0A	; 10
    17fe:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    1802:	0e 94 2f 0a 	call	0x145e	; 0x145e <_ZL11osd_percentv>
    1806:	1c c0       	rjmp	.+56     	; 0x1840 <_ZL17panBatteryPercent5Point+0xc4>
    1808:	60 91 ee 06 	lds	r22, 0x06EE	; 0x8006ee <_ZL8mah_used>
    180c:	70 91 ef 06 	lds	r23, 0x06EF	; 0x8006ef <_ZL8mah_used+0x1>
    1810:	80 91 f0 06 	lds	r24, 0x06F0	; 0x8006f0 <_ZL8mah_used+0x2>
    1814:	90 91 f1 06 	lds	r25, 0x06F1	; 0x8006f1 <_ZL8mah_used+0x3>
    1818:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    181c:	80 e4       	ldi	r24, 0x40	; 64
    181e:	9a e0       	ldi	r25, 0x0A	; 10
    1820:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    1824:	81 e0       	ldi	r24, 0x01	; 1
    1826:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    182a:	0a c0       	rjmp	.+20     	; 0x1840 <_ZL17panBatteryPercent5Point+0xc4>
    182c:	24 e6       	ldi	r18, 0x64	; 100
    182e:	c2 9f       	mul	r28, r18
    1830:	c0 01       	movw	r24, r0
    1832:	11 24       	eor	r1, r1
    1834:	6f ef       	ldi	r22, 0xFF	; 255
    1836:	70 e0       	ldi	r23, 0x00	; 0
    1838:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    183c:	eb 01       	movw	r28, r22
    183e:	ac cf       	rjmp	.-168    	; 0x1798 <_ZL17panBatteryPercent5Point+0x1c>
    1840:	df 91       	pop	r29
    1842:	cf 91       	pop	r28
    1844:	1f 91       	pop	r17
    1846:	08 95       	ret

00001848 <_ZL6panThr5Point>:
    1848:	60 91 65 06 	lds	r22, 0x0665	; 0x800665 <_ZL12osd_throttle>
    184c:	70 e0       	ldi	r23, 0x00	; 0
    184e:	8c e3       	ldi	r24, 0x3C	; 60
    1850:	9a e0       	ldi	r25, 0x0A	; 10
    1852:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    1856:	0e 94 2f 0a 	call	0x145e	; 0x145e <_ZL11osd_percentv>
    185a:	08 95       	ret

0000185c <_ZL9printTimejhh>:
    185c:	ef 92       	push	r14
    185e:	ff 92       	push	r15
    1860:	0f 93       	push	r16
    1862:	1f 93       	push	r17
    1864:	cf 93       	push	r28
    1866:	df 93       	push	r29
    1868:	8c 01       	movw	r16, r24
    186a:	d6 2f       	mov	r29, r22
    186c:	c4 2f       	mov	r28, r20
    186e:	6c e3       	ldi	r22, 0x3C	; 60
    1870:	70 e0       	ldi	r23, 0x00	; 0
    1872:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    1876:	7c 01       	movw	r14, r24
    1878:	8c e3       	ldi	r24, 0x3C	; 60
    187a:	9a e0       	ldi	r25, 0x0A	; 10
    187c:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    1880:	cc 23       	and	r28, r28
    1882:	49 f0       	breq	.+18     	; 0x1896 <_ZL9printTimejhh+0x3a>
    1884:	b7 01       	movw	r22, r14
    1886:	82 e3       	ldi	r24, 0x32	; 50
    1888:	94 e0       	ldi	r25, 0x04	; 4
    188a:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    188e:	cf 77       	andi	r28, 0x7F	; 127
    1890:	6c 2f       	mov	r22, r28
    1892:	70 e0       	ldi	r23, 0x00	; 0
    1894:	11 c0       	rjmp	.+34     	; 0x18b8 <_ZL9printTimejhh+0x5c>
    1896:	dd 23       	and	r29, r29
    1898:	31 f0       	breq	.+12     	; 0x18a6 <_ZL9printTimejhh+0x4a>
    189a:	80 91 c0 03 	lds	r24, 0x03C0	; 0x8003c0 <lflags+0xc>
    189e:	88 23       	and	r24, r24
    18a0:	11 f0       	breq	.+4      	; 0x18a6 <_ZL9printTimejhh+0x4a>
    18a2:	80 e2       	ldi	r24, 0x20	; 32
    18a4:	01 c0       	rjmp	.+2      	; 0x18a8 <_ZL9printTimejhh+0x4c>
    18a6:	8a e3       	ldi	r24, 0x3A	; 58
    18a8:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    18ac:	c8 01       	movw	r24, r16
    18ae:	6c e3       	ldi	r22, 0x3C	; 60
    18b0:	70 e0       	ldi	r23, 0x00	; 0
    18b2:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    18b6:	bc 01       	movw	r22, r24
    18b8:	8c e2       	ldi	r24, 0x2C	; 44
    18ba:	94 e0       	ldi	r25, 0x04	; 4
    18bc:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    18c0:	cd b7       	in	r28, 0x3d	; 61
    18c2:	de b7       	in	r29, 0x3e	; 62
    18c4:	e6 e0       	ldi	r30, 0x06	; 6
    18c6:	0c 94 91 44 	jmp	0x8922	; 0x8922 <__epilogue_restores__+0x18>

000018ca <_ZL10panDayTime5Point>:
    18ca:	cf 93       	push	r28
    18cc:	80 91 cf 03 	lds	r24, 0x03CF	; 0x8003cf <lflags+0x1b>
    18d0:	88 23       	and	r24, r24
    18d2:	e9 f0       	breq	.+58     	; 0x190e <_ZL10panDayTime5Point+0x44>
    18d4:	c9 2f       	mov	r28, r25
    18d6:	60 91 86 03 	lds	r22, 0x0386	; 0x800386 <day_seconds>
    18da:	70 91 87 03 	lds	r23, 0x0387	; 0x800387 <day_seconds+0x1>
    18de:	80 91 88 03 	lds	r24, 0x0388	; 0x800388 <day_seconds+0x2>
    18e2:	90 91 89 03 	lds	r25, 0x0389	; 0x800389 <day_seconds+0x3>
    18e6:	2c e3       	ldi	r18, 0x3C	; 60
    18e8:	30 e0       	ldi	r19, 0x00	; 0
    18ea:	40 e0       	ldi	r20, 0x00	; 0
    18ec:	50 e0       	ldi	r21, 0x00	; 0
    18ee:	0e 94 b4 43 	call	0x8768	; 0x8768 <__udivmodsi4>
    18f2:	da 01       	movw	r26, r20
    18f4:	c9 01       	movw	r24, r18
    18f6:	c5 ff       	sbrs	r28, 5
    18f8:	04 c0       	rjmp	.+8      	; 0x1902 <_ZL10panDayTime5Point+0x38>
    18fa:	46 2f       	mov	r20, r22
    18fc:	40 68       	ori	r20, 0x80	; 128
    18fe:	60 e0       	ldi	r22, 0x00	; 0
    1900:	04 c0       	rjmp	.+8      	; 0x190a <_ZL10panDayTime5Point+0x40>
    1902:	c6 fb       	bst	r28, 6
    1904:	66 27       	eor	r22, r22
    1906:	60 f9       	bld	r22, 0
    1908:	40 e0       	ldi	r20, 0x00	; 0
    190a:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZL9printTimejhh>
    190e:	cf 91       	pop	r28
    1910:	08 95       	ret

00001912 <_ZL9printTimei>:
    1912:	40 e0       	ldi	r20, 0x00	; 0
    1914:	60 e0       	ldi	r22, 0x00	; 0
    1916:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZL9printTimejhh>
    191a:	08 95       	ret

0000191c <_ZL12osd_printf_2PKcfh>:
    191c:	cf 93       	push	r28
    191e:	c2 2f       	mov	r28, r18
    1920:	7f 93       	push	r23
    1922:	6f 93       	push	r22
    1924:	5f 93       	push	r21
    1926:	4f 93       	push	r20
    1928:	9f 93       	push	r25
    192a:	8f 93       	push	r24
    192c:	88 e6       	ldi	r24, 0x68	; 104
    192e:	93 e0       	ldi	r25, 0x03	; 3
    1930:	9f 93       	push	r25
    1932:	8f 93       	push	r24
    1934:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    1938:	8d b7       	in	r24, 0x3d	; 61
    193a:	9e b7       	in	r25, 0x3e	; 62
    193c:	08 96       	adiw	r24, 0x08	; 8
    193e:	0f b6       	in	r0, 0x3f	; 63
    1940:	f8 94       	cli
    1942:	9e bf       	out	0x3e, r25	; 62
    1944:	0f be       	out	0x3f, r0	; 63
    1946:	8d bf       	out	0x3d, r24	; 61
    1948:	cc 23       	and	r28, r28
    194a:	19 f0       	breq	.+6      	; 0x1952 <_ZL12osd_printf_2PKcfh+0x36>
    194c:	8c 2f       	mov	r24, r28
    194e:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1952:	cf 91       	pop	r28
    1954:	08 95       	ret

00001956 <_ZL7panTemp5Point>:
    1956:	a0 e0       	ldi	r26, 0x00	; 0
    1958:	b0 e0       	ldi	r27, 0x00	; 0
    195a:	e1 eb       	ldi	r30, 0xB1	; 177
    195c:	fc e0       	ldi	r31, 0x0C	; 12
    195e:	0c 94 73 44 	jmp	0x88e6	; 0x88e6 <__prologue_saves__+0x14>
    1962:	80 91 bd 06 	lds	r24, 0x06BD	; 0x8006bd <_ZL7measure>
    1966:	90 91 be 06 	lds	r25, 0x06BE	; 0x8006be <_ZL7measure+0x1>
    196a:	fc 01       	movw	r30, r24
    196c:	3a 96       	adiw	r30, 0x0a	; 10
    196e:	d4 91       	lpm	r29, Z
    1970:	32 96       	adiw	r30, 0x02	; 2
    1972:	c4 91       	lpm	r28, Z
    1974:	0d 96       	adiw	r24, 0x0d	; 13
    1976:	fc 01       	movw	r30, r24
    1978:	05 91       	lpm	r16, Z+
    197a:	14 91       	lpm	r17, Z
    197c:	60 91 b1 06 	lds	r22, 0x06B1	; 0x8006b1 <_ZL11temperature>
    1980:	70 91 b2 06 	lds	r23, 0x06B2	; 0x8006b2 <_ZL11temperature+0x1>
    1984:	80 e0       	ldi	r24, 0x00	; 0
    1986:	90 e0       	ldi	r25, 0x00	; 0
    1988:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    198c:	2d ec       	ldi	r18, 0xCD	; 205
    198e:	3c ec       	ldi	r19, 0xCC	; 204
    1990:	4c ec       	ldi	r20, 0xCC	; 204
    1992:	5d e3       	ldi	r21, 0x3D	; 61
    1994:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    1998:	6b 01       	movw	r12, r22
    199a:	7c 01       	movw	r14, r24
    199c:	6c 2f       	mov	r22, r28
    199e:	70 e0       	ldi	r23, 0x00	; 0
    19a0:	80 e0       	ldi	r24, 0x00	; 0
    19a2:	90 e0       	ldi	r25, 0x00	; 0
    19a4:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    19a8:	9b 01       	movw	r18, r22
    19aa:	ac 01       	movw	r20, r24
    19ac:	c7 01       	movw	r24, r14
    19ae:	b6 01       	movw	r22, r12
    19b0:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    19b4:	6b 01       	movw	r12, r22
    19b6:	7c 01       	movw	r14, r24
    19b8:	b8 01       	movw	r22, r16
    19ba:	80 e0       	ldi	r24, 0x00	; 0
    19bc:	90 e0       	ldi	r25, 0x00	; 0
    19be:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    19c2:	9b 01       	movw	r18, r22
    19c4:	ac 01       	movw	r20, r24
    19c6:	c7 01       	movw	r24, r14
    19c8:	b6 01       	movw	r22, r12
    19ca:	0e 94 b8 3f 	call	0x7f70	; 0x7f70 <__addsf3>
    19ce:	2a e0       	ldi	r18, 0x0A	; 10
    19d0:	37 ed       	ldi	r19, 0xD7	; 215
    19d2:	43 e2       	ldi	r20, 0x23	; 35
    19d4:	5c e3       	ldi	r21, 0x3C	; 60
    19d6:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    19da:	ab 01       	movw	r20, r22
    19dc:	bc 01       	movw	r22, r24
    19de:	2d 2f       	mov	r18, r29
    19e0:	8a e0       	ldi	r24, 0x0A	; 10
    19e2:	94 e0       	ldi	r25, 0x04	; 4
    19e4:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    19e8:	cd b7       	in	r28, 0x3d	; 61
    19ea:	de b7       	in	r29, 0x3e	; 62
    19ec:	e8 e0       	ldi	r30, 0x08	; 8
    19ee:	0c 94 8f 44 	jmp	0x891e	; 0x891e <__epilogue_restores__+0x14>

000019f2 <_ZL12osd_printf_1PKcf>:
    19f2:	20 e0       	ldi	r18, 0x00	; 0
    19f4:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    19f8:	08 95       	ret

000019fa <_ZL7panHdop5Point>:
    19fa:	60 91 cf 06 	lds	r22, 0x06CF	; 0x8006cf <_ZL3eph>
    19fe:	70 91 d0 06 	lds	r23, 0x06D0	; 0x8006d0 <_ZL3eph+0x1>
    1a02:	80 e0       	ldi	r24, 0x00	; 0
    1a04:	90 e0       	ldi	r25, 0x00	; 0
    1a06:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    1a0a:	2a e0       	ldi	r18, 0x0A	; 10
    1a0c:	37 ed       	ldi	r19, 0xD7	; 215
    1a0e:	43 e2       	ldi	r20, 0x23	; 35
    1a10:	5c e3       	ldi	r21, 0x3C	; 60
    1a12:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    1a16:	ab 01       	movw	r20, r22
    1a18:	bc 01       	movw	r22, r24
    1a1a:	8c e2       	ldi	r24, 0x2C	; 44
    1a1c:	9a e0       	ldi	r25, 0x0A	; 10
    1a1e:	0e 94 f9 0c 	call	0x19f2	; 0x19f2 <_ZL12osd_printf_1PKcf>
    1a22:	08 95       	ret

00001a24 <_ZL8panPower5Point>:
    1a24:	40 91 55 04 	lds	r20, 0x0455	; 0x800455 <power>
    1a28:	50 91 56 04 	lds	r21, 0x0456	; 0x800456 <power+0x1>
    1a2c:	60 91 57 04 	lds	r22, 0x0457	; 0x800457 <power+0x2>
    1a30:	70 91 58 04 	lds	r23, 0x0458	; 0x800458 <power+0x3>
    1a34:	84 e4       	ldi	r24, 0x44	; 68
    1a36:	9a e0       	ldi	r25, 0x0A	; 10
    1a38:	0e 94 f9 0c 	call	0x19f2	; 0x19f2 <_ZL12osd_printf_1PKcf>
    1a3c:	08 95       	ret

00001a3e <_ZL11showHorizonv>:
    1a3e:	ab e0       	ldi	r26, 0x0B	; 11
    1a40:	b0 e0       	ldi	r27, 0x00	; 0
    1a42:	e5 e2       	ldi	r30, 0x25	; 37
    1a44:	fd e0       	ldi	r31, 0x0D	; 13
    1a46:	0c 94 69 44 	jmp	0x88d2	; 0x88d2 <__prologue_saves__>
    1a4a:	80 91 37 03 	lds	r24, 0x0337	; 0x800337 <_ZN3OSD10video_modeE>
    1a4e:	80 34       	cpi	r24, 0x40	; 64
    1a50:	89 f4       	brne	.+34     	; 0x1a74 <_ZL11showHorizonv+0x36>
    1a52:	80 90 8f 04 	lds	r8, 0x048F	; 0x80048f <sets+0x36>
    1a56:	90 90 90 04 	lds	r9, 0x0490	; 0x800490 <sets+0x37>
    1a5a:	a0 90 91 04 	lds	r10, 0x0491	; 0x800491 <sets+0x38>
    1a5e:	b0 90 92 04 	lds	r11, 0x0492	; 0x800492 <sets+0x39>
    1a62:	c0 90 8b 04 	lds	r12, 0x048B	; 0x80048b <sets+0x32>
    1a66:	d0 90 8c 04 	lds	r13, 0x048C	; 0x80048c <sets+0x33>
    1a6a:	e0 90 8d 04 	lds	r14, 0x048D	; 0x80048d <sets+0x34>
    1a6e:	f0 90 8e 04 	lds	r15, 0x048E	; 0x80048e <sets+0x35>
    1a72:	10 c0       	rjmp	.+32     	; 0x1a94 <_ZL11showHorizonv+0x56>
    1a74:	80 90 97 04 	lds	r8, 0x0497	; 0x800497 <sets+0x3e>
    1a78:	90 90 98 04 	lds	r9, 0x0498	; 0x800498 <sets+0x3f>
    1a7c:	a0 90 99 04 	lds	r10, 0x0499	; 0x800499 <sets+0x40>
    1a80:	b0 90 9a 04 	lds	r11, 0x049A	; 0x80049a <sets+0x41>
    1a84:	c0 90 93 04 	lds	r12, 0x0493	; 0x800493 <sets+0x3a>
    1a88:	d0 90 94 04 	lds	r13, 0x0494	; 0x800494 <sets+0x3b>
    1a8c:	e0 90 95 04 	lds	r14, 0x0495	; 0x800495 <sets+0x3c>
    1a90:	f0 90 96 04 	lds	r15, 0x0496	; 0x800496 <sets+0x3d>
    1a94:	80 91 35 04 	lds	r24, 0x0435	; 0x800435 <osd_att+0x2>
    1a98:	90 91 36 04 	lds	r25, 0x0436	; 0x800436 <osd_att+0x3>
    1a9c:	bc 01       	movw	r22, r24
    1a9e:	99 0f       	add	r25, r25
    1aa0:	88 0b       	sbc	r24, r24
    1aa2:	99 0b       	sbc	r25, r25
    1aa4:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    1aa8:	9b 01       	movw	r18, r22
    1aaa:	ac 01       	movw	r20, r24
    1aac:	c7 01       	movw	r24, r14
    1aae:	b6 01       	movw	r22, r12
    1ab0:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    1ab4:	6b 01       	movw	r12, r22
    1ab6:	7c 01       	movw	r14, r24
    1ab8:	80 91 ac 03 	lds	r24, 0x03AC	; 0x8003ac <screen_flags>
    1abc:	80 ff       	sbrs	r24, 0
    1abe:	04 c0       	rjmp	.+8      	; 0x1ac8 <_ZL11showHorizonv+0x8a>
    1ac0:	f7 fa       	bst	r15, 7
    1ac2:	f0 94       	com	r15
    1ac4:	f7 f8       	bld	r15, 7
    1ac6:	f0 94       	com	r15
    1ac8:	c7 01       	movw	r24, r14
    1aca:	b6 01       	movw	r22, r12
    1acc:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    1ad0:	ab 01       	movw	r20, r22
    1ad2:	6a 35       	cpi	r22, 0x5A	; 90
    1ad4:	71 05       	cpc	r23, r1
    1ad6:	40 f0       	brcs	.+16     	; 0x1ae8 <_ZL11showHorizonv+0xaa>
    1ad8:	9b 01       	movw	r18, r22
    1ada:	2d 54       	subi	r18, 0x4D	; 77
    1adc:	3f 4f       	sbci	r19, 0xFF	; 255
    1ade:	29 35       	cpi	r18, 0x59	; 89
    1ae0:	31 05       	cpc	r19, r1
    1ae2:	80 f4       	brcc	.+32     	; 0x1b04 <_ZL11showHorizonv+0xc6>
    1ae4:	77 fd       	sbrc	r23, 7
    1ae6:	a9 01       	movw	r20, r18
    1ae8:	47 34       	cpi	r20, 0x47	; 71
    1aea:	51 05       	cpc	r21, r1
    1aec:	2c f5       	brge	.+74     	; 0x1b38 <_ZL11showHorizonv+0xfa>
    1aee:	4a 31       	cpi	r20, 0x1A	; 26
    1af0:	51 05       	cpc	r21, r1
    1af2:	34 f5       	brge	.+76     	; 0x1b40 <_ZL11showHorizonv+0x102>
    1af4:	4a 30       	cpi	r20, 0x0A	; 10
    1af6:	51 05       	cpc	r21, r1
    1af8:	40 f1       	brcs	.+80     	; 0x1b4a <_ZL11showHorizonv+0x10c>
    1afa:	28 e0       	ldi	r18, 0x08	; 8
    1afc:	2a 87       	std	Y+10, r18	; 0x0a
    1afe:	13 ef       	ldi	r17, 0xF3	; 243
    1b00:	30 ed       	ldi	r19, 0xD0	; 208
    1b02:	27 c0       	rjmp	.+78     	; 0x1b52 <_ZL11showHorizonv+0x114>
    1b04:	6b 35       	cpi	r22, 0x5B	; 91
    1b06:	71 05       	cpc	r23, r1
    1b08:	1c f0       	brlt	.+6      	; 0x1b10 <_ZL11showHorizonv+0xd2>
    1b0a:	ab 01       	movw	r20, r22
    1b0c:	43 5b       	subi	r20, 0xB3	; 179
    1b0e:	51 09       	sbc	r21, r1
    1b10:	ca 01       	movw	r24, r20
    1b12:	57 ff       	sbrs	r21, 7
    1b14:	03 c0       	rjmp	.+6      	; 0x1b1c <_ZL11showHorizonv+0xde>
    1b16:	91 95       	neg	r25
    1b18:	81 95       	neg	r24
    1b1a:	91 09       	sbc	r25, r1
    1b1c:	87 34       	cpi	r24, 0x47	; 71
    1b1e:	91 05       	cpc	r25, r1
    1b20:	d0 f4       	brcc	.+52     	; 0x1b56 <_ZL11showHorizonv+0x118>
    1b22:	8a 31       	cpi	r24, 0x1A	; 26
    1b24:	91 05       	cpc	r25, r1
    1b26:	e0 f4       	brcc	.+56     	; 0x1b60 <_ZL11showHorizonv+0x122>
    1b28:	0a 97       	sbiw	r24, 0x0a	; 10
    1b2a:	00 f1       	brcs	.+64     	; 0x1b6c <_ZL11showHorizonv+0x12e>
    1b2c:	48 e0       	ldi	r20, 0x08	; 8
    1b2e:	4a 87       	std	Y+10, r20	; 0x0a
    1b30:	15 ef       	ldi	r17, 0xF5	; 245
    1b32:	82 ee       	ldi	r24, 0xE2	; 226
    1b34:	8b 87       	std	Y+11, r24	; 0x0b
    1b36:	1f c0       	rjmp	.+62     	; 0x1b76 <_ZL11showHorizonv+0x138>
    1b38:	1a 86       	std	Y+10, r1	; 0x0a
    1b3a:	1d ec       	ldi	r17, 0xCD	; 205
    1b3c:	91 ec       	ldi	r25, 0xC1	; 193
    1b3e:	14 c0       	rjmp	.+40     	; 0x1b68 <_ZL11showHorizonv+0x12a>
    1b40:	e7 e0       	ldi	r30, 0x07	; 7
    1b42:	ea 87       	std	Y+10, r30	; 0x0a
    1b44:	18 ef       	ldi	r17, 0xF8	; 248
    1b46:	f9 ed       	ldi	r31, 0xD9	; 217
    1b48:	15 c0       	rjmp	.+42     	; 0x1b74 <_ZL11showHorizonv+0x136>
    1b4a:	29 e0       	ldi	r18, 0x09	; 9
    1b4c:	2a 87       	std	Y+10, r18	; 0x0a
    1b4e:	1d ec       	ldi	r17, 0xCD	; 205
    1b50:	36 ec       	ldi	r19, 0xC6	; 198
    1b52:	3b 87       	std	Y+11, r19	; 0x0b
    1b54:	10 c0       	rjmp	.+32     	; 0x1b76 <_ZL11showHorizonv+0x138>
    1b56:	1a 86       	std	Y+10, r1	; 0x0a
    1b58:	1d ec       	ldi	r17, 0xCD	; 205
    1b5a:	41 ec       	ldi	r20, 0xC1	; 193
    1b5c:	4b 87       	std	Y+11, r20	; 0x0b
    1b5e:	0b c0       	rjmp	.+22     	; 0x1b76 <_ZL11showHorizonv+0x138>
    1b60:	87 e0       	ldi	r24, 0x07	; 7
    1b62:	8a 87       	std	Y+10, r24	; 0x0a
    1b64:	1b ef       	ldi	r17, 0xFB	; 251
    1b66:	9b ee       	ldi	r25, 0xEB	; 235
    1b68:	9b 87       	std	Y+11, r25	; 0x0b
    1b6a:	05 c0       	rjmp	.+10     	; 0x1b76 <_ZL11showHorizonv+0x138>
    1b6c:	e9 e0       	ldi	r30, 0x09	; 9
    1b6e:	ea 87       	std	Y+10, r30	; 0x0a
    1b70:	1d ec       	ldi	r17, 0xCD	; 205
    1b72:	f6 ec       	ldi	r31, 0xC6	; 198
    1b74:	fb 87       	std	Y+11, r31	; 0x0b
    1b76:	27 ea       	ldi	r18, 0xA7	; 167
    1b78:	32 e9       	ldi	r19, 0x92	; 146
    1b7a:	4b e2       	ldi	r20, 0x2B	; 43
    1b7c:	5c eb       	ldi	r21, 0xBC	; 188
    1b7e:	c5 01       	movw	r24, r10
    1b80:	b4 01       	movw	r22, r8
    1b82:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    1b86:	4b 01       	movw	r8, r22
    1b88:	5c 01       	movw	r10, r24
    1b8a:	25 e3       	ldi	r18, 0x35	; 53
    1b8c:	3a ef       	ldi	r19, 0xFA	; 250
    1b8e:	4e e8       	ldi	r20, 0x8E	; 142
    1b90:	5c e3       	ldi	r21, 0x3C	; 60
    1b92:	c7 01       	movw	r24, r14
    1b94:	b6 01       	movw	r22, r12
    1b96:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    1b9a:	6c 83       	std	Y+4, r22	; 0x04
    1b9c:	7d 83       	std	Y+5, r23	; 0x05
    1b9e:	8e 83       	std	Y+6, r24	; 0x06
    1ba0:	9f 83       	std	Y+7, r25	; 0x07
    1ba2:	9c e0       	ldi	r25, 0x0C	; 12
    1ba4:	29 2e       	mov	r2, r25
    1ba6:	31 2c       	mov	r3, r1
    1ba8:	19 82       	std	Y+1, r1	; 0x01
    1baa:	2a 85       	ldd	r18, Y+10	; 0x0a
    1bac:	02 2e       	mov	r0, r18
    1bae:	00 0c       	add	r0, r0
    1bb0:	33 0b       	sbc	r19, r19
    1bb2:	39 87       	std	Y+9, r19	; 0x09
    1bb4:	28 87       	std	Y+8, r18	; 0x08
    1bb6:	89 81       	ldd	r24, Y+1	; 0x01
    1bb8:	c8 2e       	mov	r12, r24
    1bba:	88 0f       	add	r24, r24
    1bbc:	dd 08       	sbc	r13, r13
    1bbe:	60 91 33 04 	lds	r22, 0x0433	; 0x800433 <osd_att>
    1bc2:	70 91 34 04 	lds	r23, 0x0434	; 0x800434 <osd_att+0x1>
    1bc6:	6c 0d       	add	r22, r12
    1bc8:	7d 1d       	adc	r23, r13
    1bca:	07 2e       	mov	r0, r23
    1bcc:	00 0c       	add	r0, r0
    1bce:	88 0b       	sbc	r24, r24
    1bd0:	99 0b       	sbc	r25, r25
    1bd2:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    1bd6:	a5 01       	movw	r20, r10
    1bd8:	94 01       	movw	r18, r8
    1bda:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    1bde:	0e 94 24 43 	call	0x8648	; 0x8648 <tan>
    1be2:	20 e0       	ldi	r18, 0x00	; 0
    1be4:	30 e0       	ldi	r19, 0x00	; 0
    1be6:	44 eb       	ldi	r20, 0xB4	; 180
    1be8:	52 e4       	ldi	r21, 0x42	; 66
    1bea:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    1bee:	2b 01       	movw	r4, r22
    1bf0:	3c 01       	movw	r6, r24
    1bf2:	20 e0       	ldi	r18, 0x00	; 0
    1bf4:	30 e0       	ldi	r19, 0x00	; 0
    1bf6:	a9 01       	movw	r20, r18
    1bf8:	0e 94 60 42 	call	0x84c0	; 0x84c0 <__gesf2>
    1bfc:	20 e0       	ldi	r18, 0x00	; 0
    1bfe:	30 e0       	ldi	r19, 0x00	; 0
    1c00:	40 e0       	ldi	r20, 0x00	; 0
    1c02:	5f e3       	ldi	r21, 0x3F	; 63
    1c04:	87 fd       	sbrc	r24, 7
    1c06:	0b c0       	rjmp	.+22     	; 0x1c1e <_ZL11showHorizonv+0x1e0>
    1c08:	c3 01       	movw	r24, r6
    1c0a:	b2 01       	movw	r22, r4
    1c0c:	0e 94 b8 3f 	call	0x7f70	; 0x7f70 <__addsf3>
    1c10:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    1c14:	7b 01       	movw	r14, r22
    1c16:	ed e2       	ldi	r30, 0x2D	; 45
    1c18:	ee 0e       	add	r14, r30
    1c1a:	f1 1c       	adc	r15, r1
    1c1c:	0a c0       	rjmp	.+20     	; 0x1c32 <_ZL11showHorizonv+0x1f4>
    1c1e:	c3 01       	movw	r24, r6
    1c20:	b2 01       	movw	r22, r4
    1c22:	0e 94 b7 3f 	call	0x7f6e	; 0x7f6e <__subsf3>
    1c26:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    1c2a:	7b 01       	movw	r14, r22
    1c2c:	fd e2       	ldi	r31, 0x2D	; 45
    1c2e:	ef 0e       	add	r14, r31
    1c30:	f1 1c       	adc	r15, r1
    1c32:	0d e0       	ldi	r16, 0x0D	; 13
    1c34:	02 19       	sub	r16, r2
    1c36:	22 27       	eor	r18, r18
    1c38:	33 27       	eor	r19, r19
    1c3a:	2c 19       	sub	r18, r12
    1c3c:	3d 09       	sbc	r19, r13
    1c3e:	3b 83       	std	Y+3, r19	; 0x03
    1c40:	2a 83       	std	Y+2, r18	; 0x02
    1c42:	80 2f       	mov	r24, r16
    1c44:	90 e0       	ldi	r25, 0x00	; 0
    1c46:	28 16       	cp	r2, r24
    1c48:	39 06       	cpc	r3, r25
    1c4a:	0c f4       	brge	.+2      	; 0x1c4e <_ZL11showHorizonv+0x210>
    1c4c:	72 c0       	rjmp	.+228    	; 0x1d32 <_ZL11showHorizonv+0x2f4>
    1c4e:	6c 81       	ldd	r22, Y+4	; 0x04
    1c50:	7d 81       	ldd	r23, Y+5	; 0x05
    1c52:	8e 81       	ldd	r24, Y+6	; 0x06
    1c54:	9f 81       	ldd	r25, Y+7	; 0x07
    1c56:	0e 94 24 43 	call	0x8648	; 0x8648 <tan>
    1c5a:	2b 01       	movw	r4, r22
    1c5c:	3c 01       	movw	r6, r24
    1c5e:	3c e0       	ldi	r19, 0x0C	; 12
    1c60:	03 9f       	mul	r16, r19
    1c62:	60 2d       	mov	r22, r0
    1c64:	11 24       	eor	r1, r1
    1c66:	6e 54       	subi	r22, 0x4E	; 78
    1c68:	06 2e       	mov	r0, r22
    1c6a:	00 0c       	add	r0, r0
    1c6c:	77 0b       	sbc	r23, r23
    1c6e:	88 0b       	sbc	r24, r24
    1c70:	99 0b       	sbc	r25, r25
    1c72:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    1c76:	9b 01       	movw	r18, r22
    1c78:	ac 01       	movw	r20, r24
    1c7a:	c3 01       	movw	r24, r6
    1c7c:	b2 01       	movw	r22, r4
    1c7e:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    1c82:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    1c86:	f7 01       	movw	r30, r14
    1c88:	e6 0f       	add	r30, r22
    1c8a:	f7 1f       	adc	r31, r23
    1c8c:	cf 01       	movw	r24, r30
    1c8e:	01 97       	sbiw	r24, 0x01	; 1
    1c90:	8a 35       	cpi	r24, 0x5A	; 90
    1c92:	91 05       	cpc	r25, r1
    1c94:	08 f0       	brcs	.+2      	; 0x1c98 <_ZL11showHorizonv+0x25a>
    1c96:	4b c0       	rjmp	.+150    	; 0x1d2e <_ZL11showHorizonv+0x2f0>
    1c98:	62 e1       	ldi	r22, 0x12	; 18
    1c9a:	70 e0       	ldi	r23, 0x00	; 0
    1c9c:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    1ca0:	3b 01       	movw	r6, r22
    1ca2:	4a 85       	ldd	r20, Y+10	; 0x0a
    1ca4:	44 23       	and	r20, r20
    1ca6:	79 f0       	breq	.+30     	; 0x1cc6 <_ZL11showHorizonv+0x288>
    1ca8:	31 96       	adiw	r30, 0x01	; 1
    1caa:	2e ee       	ldi	r18, 0xEE	; 238
    1cac:	26 03       	mulsu	r18, r22
    1cae:	c0 01       	movw	r24, r0
    1cb0:	27 9f       	mul	r18, r23
    1cb2:	90 0d       	add	r25, r0
    1cb4:	11 24       	eor	r1, r1
    1cb6:	e8 0f       	add	r30, r24
    1cb8:	f9 1f       	adc	r31, r25
    1cba:	f7 fd       	sbrc	r31, 7
    1cbc:	31 96       	adiw	r30, 0x01	; 1
    1cbe:	f5 95       	asr	r31
    1cc0:	e7 95       	ror	r30
    1cc2:	5e 2e       	mov	r5, r30
    1cc4:	01 c0       	rjmp	.+2      	; 0x1cc8 <_ZL11showHorizonv+0x28a>
    1cc6:	51 2c       	mov	r5, r1
    1cc8:	64 e0       	ldi	r22, 0x04	; 4
    1cca:	66 19       	sub	r22, r6
    1ccc:	8f ef       	ldi	r24, 0xFF	; 255
    1cce:	80 0f       	add	r24, r16
    1cd0:	0e 94 98 08 	call	0x1130	; 0x1130 <_ZN3OSD8relPanelEhh>
    1cd4:	39 81       	ldd	r19, Y+1	; 0x01
    1cd6:	33 23       	and	r19, r19
    1cd8:	79 f0       	breq	.+30     	; 0x1cf8 <_ZL11showHorizonv+0x2ba>
    1cda:	05 30       	cpi	r16, 0x05	; 5
    1cdc:	69 f4       	brne	.+26     	; 0x1cf8 <_ZL11showHorizonv+0x2ba>
    1cde:	b6 01       	movw	r22, r12
    1ce0:	d7 fe       	sbrs	r13, 7
    1ce2:	02 c0       	rjmp	.+4      	; 0x1ce8 <_ZL11showHorizonv+0x2aa>
    1ce4:	6a 81       	ldd	r22, Y+2	; 0x02
    1ce6:	7b 81       	ldd	r23, Y+3	; 0x03
    1ce8:	4a e0       	ldi	r20, 0x0A	; 10
    1cea:	50 e0       	ldi	r21, 0x00	; 0
    1cec:	88 e6       	ldi	r24, 0x68	; 104
    1cee:	93 e0       	ldi	r25, 0x03	; 3
    1cf0:	0e 94 63 38 	call	0x70c6	; 0x70c6 <_ZN5Print5printEii>
    1cf4:	06 e0       	ldi	r16, 0x06	; 6
    1cf6:	04 c0       	rjmp	.+8      	; 0x1d00 <_ZL11showHorizonv+0x2c2>
    1cf8:	8b 85       	ldd	r24, Y+11	; 0x0b
    1cfa:	85 0d       	add	r24, r5
    1cfc:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1d00:	55 20       	and	r5, r5
    1d02:	a9 f0       	breq	.+42     	; 0x1d2e <_ZL11showHorizonv+0x2f0>
    1d04:	25 2d       	mov	r18, r5
    1d06:	30 e0       	ldi	r19, 0x00	; 0
    1d08:	88 85       	ldd	r24, Y+8	; 0x08
    1d0a:	99 85       	ldd	r25, Y+9	; 0x09
    1d0c:	28 17       	cp	r18, r24
    1d0e:	39 07       	cpc	r19, r25
    1d10:	74 f0       	brlt	.+28     	; 0x1d2e <_ZL11showHorizonv+0x2f0>
    1d12:	94 e0       	ldi	r25, 0x04	; 4
    1d14:	69 16       	cp	r6, r25
    1d16:	71 04       	cpc	r7, r1
    1d18:	51 f0       	breq	.+20     	; 0x1d2e <_ZL11showHorizonv+0x2f0>
    1d1a:	e5 2d       	mov	r30, r5
    1d1c:	e1 0f       	add	r30, r17
    1d1e:	4a ef       	ldi	r20, 0xFA	; 250
    1d20:	4e 0f       	add	r20, r30
    1d22:	63 e0       	ldi	r22, 0x03	; 3
    1d24:	66 19       	sub	r22, r6
    1d26:	8f ef       	ldi	r24, 0xFF	; 255
    1d28:	80 0f       	add	r24, r16
    1d2a:	0e 94 d0 08 	call	0x11a0	; 0x11a0 <_ZN3OSD8write_xyEhhh>
    1d2e:	0f 5f       	subi	r16, 0xFF	; 255
    1d30:	88 cf       	rjmp	.-240    	; 0x1c42 <_ZL11showHorizonv+0x204>
    1d32:	f7 fe       	sbrs	r15, 7
    1d34:	0b c0       	rjmp	.+22     	; 0x1d4c <_ZL11showHorizonv+0x30e>
    1d36:	e9 81       	ldd	r30, Y+1	; 0x01
    1d38:	e2 5e       	subi	r30, 0xE2	; 226
    1d3a:	e9 83       	std	Y+1, r30	; 0x01
    1d3c:	34 e0       	ldi	r19, 0x04	; 4
    1d3e:	23 1a       	sub	r2, r19
    1d40:	31 08       	sbc	r3, r1
    1d42:	44 e0       	ldi	r20, 0x04	; 4
    1d44:	24 16       	cp	r2, r20
    1d46:	31 04       	cpc	r3, r1
    1d48:	49 f0       	breq	.+18     	; 0x1d5c <_ZL11showHorizonv+0x31e>
    1d4a:	35 cf       	rjmp	.-406    	; 0x1bb6 <_ZL11showHorizonv+0x178>
    1d4c:	fb e5       	ldi	r31, 0x5B	; 91
    1d4e:	ef 16       	cp	r14, r31
    1d50:	f1 04       	cpc	r15, r1
    1d52:	24 f0       	brlt	.+8      	; 0x1d5c <_ZL11showHorizonv+0x31e>
    1d54:	29 81       	ldd	r18, Y+1	; 0x01
    1d56:	2e 51       	subi	r18, 0x1E	; 30
    1d58:	29 83       	std	Y+1, r18	; 0x01
    1d5a:	f0 cf       	rjmp	.-32     	; 0x1d3c <_ZL11showHorizonv+0x2fe>
    1d5c:	2b 96       	adiw	r28, 0x0b	; 11
    1d5e:	e2 e1       	ldi	r30, 0x12	; 18
    1d60:	0c 94 85 44 	jmp	0x890a	; 0x890a <__epilogue_restores__>

00001d64 <_Z11setup_horizv>:
    1d64:	66 e0       	ldi	r22, 0x06	; 6
    1d66:	89 e0       	ldi	r24, 0x09	; 9
    1d68:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    1d6c:	0e 94 1f 0d 	call	0x1a3e	; 0x1a3e <_ZL11showHorizonv>
    1d70:	08 95       	ret

00001d72 <_ZL10panMessage5Point>:
    1d72:	0f 93       	push	r16
    1d74:	1f 93       	push	r17
    1d76:	cf 93       	push	r28
    1d78:	df 93       	push	r29
    1d7a:	20 91 f6 03 	lds	r18, 0x03F6	; 0x8003f6 <mav_message>
    1d7e:	22 23       	and	r18, r18
    1d80:	09 f4       	brne	.+2      	; 0x1d84 <_ZL10panMessage5Point+0x12>
    1d82:	63 c0       	rjmp	.+198    	; 0x1e4a <_ZL10panMessage5Point+0xd8>
    1d84:	40 91 f4 03 	lds	r20, 0x03F4	; 0x8003f4 <mav_msg_ttl>
    1d88:	50 91 f5 03 	lds	r21, 0x03F5	; 0x8003f5 <mav_msg_ttl+0x1>
    1d8c:	20 91 63 06 	lds	r18, 0x0663	; 0x800663 <_ZL7seconds>
    1d90:	30 91 64 06 	lds	r19, 0x0664	; 0x800664 <_ZL7seconds+0x1>
    1d94:	42 17       	cp	r20, r18
    1d96:	53 07       	cpc	r21, r19
    1d98:	09 f4       	brne	.+2      	; 0x1d9c <_ZL10panMessage5Point+0x2a>
    1d9a:	57 c0       	rjmp	.+174    	; 0x1e4a <_ZL10panMessage5Point+0xd8>
    1d9c:	20 91 f2 03 	lds	r18, 0x03F2	; 0x8003f2 <mav_msg_severity>
    1da0:	23 30       	cpi	r18, 0x03	; 3
    1da2:	10 f4       	brcc	.+4      	; 0x1da8 <_ZL10panMessage5Point+0x36>
    1da4:	d1 e2       	ldi	r29, 0x21	; 33
    1da6:	01 c0       	rjmp	.+2      	; 0x1daa <_ZL10panMessage5Point+0x38>
    1da8:	d0 e0       	ldi	r29, 0x00	; 0
    1daa:	09 2f       	mov	r16, r25
    1dac:	18 2f       	mov	r17, r24
    1dae:	80 91 f3 03 	lds	r24, 0x03F3	; 0x8003f3 <mav_msg_len>
    1db2:	ca e1       	ldi	r28, 0x1A	; 26
    1db4:	c8 1b       	sub	r28, r24
    1db6:	c7 fd       	sbrc	r28, 7
    1db8:	11 c0       	rjmp	.+34     	; 0x1ddc <_ZL10panMessage5Point+0x6a>
    1dba:	8c 2f       	mov	r24, r28
    1dbc:	86 95       	lsr	r24
    1dbe:	69 2f       	mov	r22, r25
    1dc0:	81 0f       	add	r24, r17
    1dc2:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    1dc6:	17 fd       	sbrc	r17, 7
    1dc8:	02 c0       	rjmp	.+4      	; 0x1dce <_ZL10panMessage5Point+0x5c>
    1dca:	d1 11       	cpse	r29, r1
    1dcc:	41 c0       	rjmp	.+130    	; 0x1e50 <_ZL10panMessage5Point+0xde>
    1dce:	66 ef       	ldi	r22, 0xF6	; 246
    1dd0:	73 e0       	ldi	r23, 0x03	; 3
    1dd2:	88 e6       	ldi	r24, 0x68	; 104
    1dd4:	93 e0       	ldi	r25, 0x03	; 3
    1dd6:	0e 94 ab 37 	call	0x6f56	; 0x6f56 <_ZN5Print5printEPKc>
    1dda:	42 c0       	rjmp	.+132    	; 0x1e60 <_ZL10panMessage5Point+0xee>
    1ddc:	17 fd       	sbrc	r17, 7
    1dde:	02 c0       	rjmp	.+4      	; 0x1de4 <_ZL10panMessage5Point+0x72>
    1de0:	d1 11       	cpse	r29, r1
    1de2:	3a c0       	rjmp	.+116    	; 0x1e58 <_ZL10panMessage5Point+0xe6>
    1de4:	06 fd       	sbrc	r16, 6
    1de6:	1d c0       	rjmp	.+58     	; 0x1e22 <_ZL10panMessage5Point+0xb0>
    1de8:	c1 95       	neg	r28
    1dea:	2c 2f       	mov	r18, r28
    1dec:	30 e0       	ldi	r19, 0x00	; 0
    1dee:	80 91 31 04 	lds	r24, 0x0431	; 0x800431 <count02s>
    1df2:	90 91 f1 03 	lds	r25, 0x03F1	; 0x8003f1 <mav_msg_shift>
    1df6:	89 1b       	sub	r24, r25
    1df8:	90 e0       	ldi	r25, 0x00	; 0
    1dfa:	b9 01       	movw	r22, r18
    1dfc:	66 0f       	add	r22, r22
    1dfe:	77 1f       	adc	r23, r23
    1e00:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    1e04:	40 91 d2 03 	lds	r20, 0x03D2	; 0x8003d2 <skip_inc>
    1e08:	41 11       	cpse	r20, r1
    1e0a:	0d c0       	rjmp	.+26     	; 0x1e26 <_ZL10panMessage5Point+0xb4>
    1e0c:	00 97       	sbiw	r24, 0x00	; 0
    1e0e:	29 f0       	breq	.+10     	; 0x1e1a <_ZL10panMessage5Point+0xa8>
    1e10:	21 50       	subi	r18, 0x01	; 1
    1e12:	31 09       	sbc	r19, r1
    1e14:	82 17       	cp	r24, r18
    1e16:	93 07       	cpc	r25, r19
    1e18:	31 f4       	brne	.+12     	; 0x1e26 <_ZL10panMessage5Point+0xb4>
    1e1a:	21 e0       	ldi	r18, 0x01	; 1
    1e1c:	20 93 d2 03 	sts	0x03D2, r18	; 0x8003d2 <skip_inc>
    1e20:	02 c0       	rjmp	.+4      	; 0x1e26 <_ZL10panMessage5Point+0xb4>
    1e22:	80 e0       	ldi	r24, 0x00	; 0
    1e24:	90 e0       	ldi	r25, 0x00	; 0
    1e26:	ec 01       	movw	r28, r24
    1e28:	ca 50       	subi	r28, 0x0A	; 10
    1e2a:	dc 4f       	sbci	r29, 0xFC	; 252
    1e2c:	8e 01       	movw	r16, r28
    1e2e:	06 5e       	subi	r16, 0xE6	; 230
    1e30:	1f 4f       	sbci	r17, 0xFF	; 255
    1e32:	89 91       	ld	r24, Y+
    1e34:	81 11       	cpse	r24, r1
    1e36:	03 c0       	rjmp	.+6      	; 0x1e3e <_ZL10panMessage5Point+0xcc>
    1e38:	0e 94 33 0a 	call	0x1466	; 0x1466 <_ZL9osd_blankv>
    1e3c:	11 c0       	rjmp	.+34     	; 0x1e60 <_ZL10panMessage5Point+0xee>
    1e3e:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1e42:	c0 17       	cp	r28, r16
    1e44:	d1 07       	cpc	r29, r17
    1e46:	a9 f7       	brne	.-22     	; 0x1e32 <_ZL10panMessage5Point+0xc0>
    1e48:	f7 cf       	rjmp	.-18     	; 0x1e38 <_ZL10panMessage5Point+0xc6>
    1e4a:	10 92 f6 03 	sts	0x03F6, r1	; 0x8003f6 <mav_message>
    1e4e:	08 c0       	rjmp	.+16     	; 0x1e60 <_ZL10panMessage5Point+0xee>
    1e50:	8d 2f       	mov	r24, r29
    1e52:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1e56:	bb cf       	rjmp	.-138    	; 0x1dce <_ZL10panMessage5Point+0x5c>
    1e58:	8d 2f       	mov	r24, r29
    1e5a:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1e5e:	c2 cf       	rjmp	.-124    	; 0x1de4 <_ZL10panMessage5Point+0x72>
    1e60:	df 91       	pop	r29
    1e62:	cf 91       	pop	r28
    1e64:	1f 91       	pop	r17
    1e66:	0f 91       	pop	r16
    1e68:	08 95       	ret

00001e6a <_ZL11panCALLSIGN5Point>:
    1e6a:	29 2f       	mov	r18, r25
    1e6c:	80 91 63 06 	lds	r24, 0x0663	; 0x800663 <_ZL7seconds>
    1e70:	90 91 64 06 	lds	r25, 0x0664	; 0x800664 <_ZL7seconds+0x1>
    1e74:	8f 73       	andi	r24, 0x3F	; 63
    1e76:	99 27       	eor	r25, r25
    1e78:	02 97       	sbiw	r24, 0x02	; 2
    1e7a:	10 f0       	brcs	.+4      	; 0x1e80 <_ZL11panCALLSIGN5Point+0x16>
    1e7c:	26 ff       	sbrs	r18, 6
    1e7e:	06 c0       	rjmp	.+12     	; 0x1e8c <_ZL11panCALLSIGN5Point+0x22>
    1e80:	6a e6       	ldi	r22, 0x6A	; 106
    1e82:	74 e0       	ldi	r23, 0x04	; 4
    1e84:	88 e6       	ldi	r24, 0x68	; 104
    1e86:	93 e0       	ldi	r25, 0x03	; 3
    1e88:	0e 94 ab 37 	call	0x6f56	; 0x6f56 <_ZN5Print5printEPKc>
    1e8c:	08 95       	ret

00001e8e <_ZL14serial_print_SPKc>:
    1e8e:	bc 01       	movw	r22, r24
    1e90:	83 e5       	ldi	r24, 0x53	; 83
    1e92:	93 e0       	ldi	r25, 0x03	; 3
    1e94:	0e 94 c5 3a 	call	0x758a	; 0x758a <_ZN12BetterStream9println_PEPKc>
    1e98:	08 95       	ret

00001e9a <_ZL9print_rffv>:
    1e9a:	87 e3       	ldi	r24, 0x37	; 55
    1e9c:	91 e0       	ldi	r25, 0x01	; 1
    1e9e:	0e 94 47 0f 	call	0x1e8e	; 0x1e8e <_ZL14serial_print_SPKc>
    1ea2:	08 95       	ret

00001ea4 <_ZL10diff_coordRfS_.isra.6>:
    1ea4:	0e 94 b7 3f 	call	0x7f6e	; 0x7f6e <__subsf3>
    1ea8:	20 ec       	ldi	r18, 0xC0	; 192
    1eaa:	3b e6       	ldi	r19, 0x6B	; 107
    1eac:	49 ed       	ldi	r20, 0xD9	; 217
    1eae:	57 e4       	ldi	r21, 0x47	; 71
    1eb0:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    1eb4:	08 95       	ret

00001eb6 <_ZL10coord_fracRfh.isra.7>:
    1eb6:	cf 92       	push	r12
    1eb8:	df 92       	push	r13
    1eba:	ef 92       	push	r14
    1ebc:	ff 92       	push	r15
    1ebe:	cf 93       	push	r28
    1ec0:	c4 2f       	mov	r28, r20
    1ec2:	6b 01       	movw	r12, r22
    1ec4:	7c 01       	movw	r14, r24
    1ec6:	e8 94       	clt
    1ec8:	f7 f8       	bld	r15, 7
    1eca:	c7 01       	movw	r24, r14
    1ecc:	b6 01       	movw	r22, r12
    1ece:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    1ed2:	07 2e       	mov	r0, r23
    1ed4:	00 0c       	add	r0, r0
    1ed6:	88 0b       	sbc	r24, r24
    1ed8:	99 0b       	sbc	r25, r25
    1eda:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    1ede:	9b 01       	movw	r18, r22
    1ee0:	ac 01       	movw	r20, r24
    1ee2:	c7 01       	movw	r24, r14
    1ee4:	b6 01       	movw	r22, r12
    1ee6:	0e 94 b7 3f 	call	0x7f6e	; 0x7f6e <__subsf3>
    1eea:	9b 01       	movw	r18, r22
    1eec:	ac 01       	movw	r20, r24
    1eee:	c1 11       	cpse	r28, r1
    1ef0:	05 c0       	rjmp	.+10     	; 0x1efc <_ZL10coord_fracRfh.isra.7+0x46>
    1ef2:	60 e0       	ldi	r22, 0x00	; 0
    1ef4:	74 e2       	ldi	r23, 0x24	; 36
    1ef6:	84 e7       	ldi	r24, 0x74	; 116
    1ef8:	99 e4       	ldi	r25, 0x49	; 73
    1efa:	04 c0       	rjmp	.+8      	; 0x1f04 <_ZL10coord_fracRfh.isra.7+0x4e>
    1efc:	60 e0       	ldi	r22, 0x00	; 0
    1efe:	70 e5       	ldi	r23, 0x50	; 80
    1f00:	83 ec       	ldi	r24, 0xC3	; 195
    1f02:	97 e4       	ldi	r25, 0x47	; 71
    1f04:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    1f08:	0e 94 19 41 	call	0x8232	; 0x8232 <__fixunssfsi>
    1f0c:	cf 91       	pop	r28
    1f0e:	ff 90       	pop	r15
    1f10:	ef 90       	pop	r14
    1f12:	df 90       	pop	r13
    1f14:	cf 90       	pop	r12
    1f16:	08 95       	ret

00001f18 <_ZL12printTimeCnvPmh.isra.9>:
    1f18:	cf 93       	push	r28
    1f1a:	c4 2f       	mov	r28, r20
    1f1c:	28 ee       	ldi	r18, 0xE8	; 232
    1f1e:	33 e0       	ldi	r19, 0x03	; 3
    1f20:	40 e0       	ldi	r20, 0x00	; 0
    1f22:	50 e0       	ldi	r21, 0x00	; 0
    1f24:	0e 94 b4 43 	call	0x8768	; 0x8768 <__udivmodsi4>
    1f28:	da 01       	movw	r26, r20
    1f2a:	c9 01       	movw	r24, r18
    1f2c:	40 e0       	ldi	r20, 0x00	; 0
    1f2e:	6c 2f       	mov	r22, r28
    1f30:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZL9printTimejhh>
    1f34:	cf 91       	pop	r28
    1f36:	08 95       	ret

00001f38 <_ZL7panTime5Point>:
    1f38:	96 fb       	bst	r25, 6
    1f3a:	44 27       	eor	r20, r20
    1f3c:	40 f9       	bld	r20, 0
    1f3e:	60 91 9e 06 	lds	r22, 0x069E	; 0x80069e <_ZL23total_flight_time_milis>
    1f42:	70 91 9f 06 	lds	r23, 0x069F	; 0x80069f <_ZL23total_flight_time_milis+0x1>
    1f46:	80 91 a0 06 	lds	r24, 0x06A0	; 0x8006a0 <_ZL23total_flight_time_milis+0x2>
    1f4a:	90 91 a1 06 	lds	r25, 0x06A1	; 0x8006a1 <_ZL23total_flight_time_milis+0x3>
    1f4e:	0e 94 8c 0f 	call	0x1f18	; 0x1f18 <_ZL12printTimeCnvPmh.isra.9>
    1f52:	08 95       	ret

00001f54 <_ZL12print_energy5Point.isra.12>:
    1f54:	cf 93       	push	r28
    1f56:	c8 2f       	mov	r28, r24
    1f58:	60 91 07 05 	lds	r22, 0x0507	; 0x800507 <_ZL3eff>
    1f5c:	70 91 08 05 	lds	r23, 0x0508	; 0x800508 <_ZL3eff+0x1>
    1f60:	80 91 09 05 	lds	r24, 0x0509	; 0x800509 <_ZL3eff+0x2>
    1f64:	90 91 0a 05 	lds	r25, 0x050A	; 0x80050a <_ZL3eff+0x3>
    1f68:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    1f6c:	61 50       	subi	r22, 0x01	; 1
    1f6e:	71 09       	sbc	r23, r1
    1f70:	6f 30       	cpi	r22, 0x0F	; 15
    1f72:	77 42       	sbci	r23, 0x27	; 39
    1f74:	90 f4       	brcc	.+36     	; 0x1f9a <_ZL12print_energy5Point.isra.12+0x46>
    1f76:	c7 fd       	sbrc	r28, 7
    1f78:	03 c0       	rjmp	.+6      	; 0x1f80 <_ZL12print_energy5Point.isra.12+0x2c>
    1f7a:	86 e1       	ldi	r24, 0x16	; 22
    1f7c:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    1f80:	40 91 07 05 	lds	r20, 0x0507	; 0x800507 <_ZL3eff>
    1f84:	50 91 08 05 	lds	r21, 0x0508	; 0x800508 <_ZL3eff+0x1>
    1f88:	60 91 09 05 	lds	r22, 0x0509	; 0x800509 <_ZL3eff+0x2>
    1f8c:	70 91 0a 05 	lds	r23, 0x050A	; 0x80050a <_ZL3eff+0x3>
    1f90:	21 e0       	ldi	r18, 0x01	; 1
    1f92:	80 e2       	ldi	r24, 0x20	; 32
    1f94:	9a e0       	ldi	r25, 0x0A	; 10
    1f96:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    1f9a:	cf 91       	pop	r28
    1f9c:	08 95       	ret

00001f9e <_ZL11print_coord5PointPf.isra.14>:
    1f9e:	cf 93       	push	r28
    1fa0:	df 93       	push	r29
    1fa2:	28 2f       	mov	r18, r24
    1fa4:	86 fb       	bst	r24, 6
    1fa6:	44 27       	eor	r20, r20
    1fa8:	40 f9       	bld	r20, 0
    1faa:	e4 2f       	mov	r30, r20
    1fac:	f0 e0       	ldi	r31, 0x00	; 0
    1fae:	db 01       	movw	r26, r22
    1fb0:	6d 91       	ld	r22, X+
    1fb2:	7d 91       	ld	r23, X+
    1fb4:	8d 91       	ld	r24, X+
    1fb6:	9c 91       	ld	r25, X
    1fb8:	ee 0f       	add	r30, r30
    1fba:	ff 1f       	adc	r31, r31
    1fbc:	25 ff       	sbrs	r18, 5
    1fbe:	1b c0       	rjmp	.+54     	; 0x1ff6 <_ZL11print_coord5PointPf.isra.14+0x58>
    1fc0:	e4 58       	subi	r30, 0x84	; 132
    1fc2:	f6 4f       	sbci	r31, 0xF6	; 246
    1fc4:	c5 91       	lpm	r28, Z+
    1fc6:	d4 91       	lpm	r29, Z
    1fc8:	0e 94 5b 0f 	call	0x1eb6	; 0x1eb6 <_ZL10coord_fracRfh.isra.7>
    1fcc:	9f 93       	push	r25
    1fce:	8f 93       	push	r24
    1fd0:	7f 93       	push	r23
    1fd2:	6f 93       	push	r22
    1fd4:	df 93       	push	r29
    1fd6:	cf 93       	push	r28
    1fd8:	88 e6       	ldi	r24, 0x68	; 104
    1fda:	93 e0       	ldi	r25, 0x03	; 3
    1fdc:	9f 93       	push	r25
    1fde:	8f 93       	push	r24
    1fe0:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    1fe4:	ad b7       	in	r26, 0x3d	; 61
    1fe6:	be b7       	in	r27, 0x3e	; 62
    1fe8:	18 96       	adiw	r26, 0x08	; 8
    1fea:	0f b6       	in	r0, 0x3f	; 63
    1fec:	f8 94       	cli
    1fee:	be bf       	out	0x3e, r27	; 62
    1ff0:	0f be       	out	0x3f, r0	; 63
    1ff2:	ad bf       	out	0x3d, r26	; 61
    1ff4:	09 c0       	rjmp	.+18     	; 0x2008 <_ZL11print_coord5PointPf.isra.14+0x6a>
    1ff6:	e8 58       	subi	r30, 0x88	; 136
    1ff8:	f6 4f       	sbci	r31, 0xF6	; 246
    1ffa:	25 91       	lpm	r18, Z+
    1ffc:	34 91       	lpm	r19, Z
    1ffe:	ab 01       	movw	r20, r22
    2000:	bc 01       	movw	r22, r24
    2002:	c9 01       	movw	r24, r18
    2004:	0e 94 f9 0c 	call	0x19f2	; 0x19f2 <_ZL12osd_printf_1PKcf>
    2008:	df 91       	pop	r29
    200a:	cf 91       	pop	r28
    200c:	08 95       	ret

0000200e <_ZL10panGPS_lon5Point>:
    200e:	69 e4       	ldi	r22, 0x49	; 73
    2010:	74 e0       	ldi	r23, 0x04	; 4
    2012:	89 2f       	mov	r24, r25
    2014:	0e 94 cf 0f 	call	0x1f9e	; 0x1f9e <_ZL11print_coord5PointPf.isra.14>
    2018:	08 95       	ret

0000201a <_ZL10panGPS_lat5Point>:
    201a:	65 e4       	ldi	r22, 0x45	; 69
    201c:	74 e0       	ldi	r23, 0x04	; 4
    201e:	89 2f       	mov	r24, r25
    2020:	0e 94 cf 0f 	call	0x1f9e	; 0x1f9e <_ZL11print_coord5PointPf.isra.14>
    2024:	08 95       	ret

00002026 <_ZL12osd_printi_2PKcjj.constprop.32>:
    2026:	7f 93       	push	r23
    2028:	6f 93       	push	r22
    202a:	9f 93       	push	r25
    202c:	8f 93       	push	r24
    202e:	80 e1       	ldi	r24, 0x10	; 16
    2030:	94 e0       	ldi	r25, 0x04	; 4
    2032:	9f 93       	push	r25
    2034:	8f 93       	push	r24
    2036:	88 e6       	ldi	r24, 0x68	; 104
    2038:	93 e0       	ldi	r25, 0x03	; 3
    203a:	9f 93       	push	r25
    203c:	8f 93       	push	r24
    203e:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    2042:	8d b7       	in	r24, 0x3d	; 61
    2044:	9e b7       	in	r25, 0x3e	; 62
    2046:	08 96       	adiw	r24, 0x08	; 8
    2048:	0f b6       	in	r0, 0x3f	; 63
    204a:	f8 94       	cli
    204c:	9e bf       	out	0x3e, r25	; 62
    204e:	0f be       	out	0x3f, r0	; 63
    2050:	8d bf       	out	0x3d, r24	; 61
    2052:	08 95       	ret

00002054 <_ZL5panCh5Point>:
    2054:	0f 93       	push	r16
    2056:	1f 93       	push	r17
    2058:	cf 93       	push	r28
    205a:	df 93       	push	r29
    205c:	0f eb       	ldi	r16, 0xBF	; 191
    205e:	16 e0       	ldi	r17, 0x06	; 6
    2060:	80 e0       	ldi	r24, 0x00	; 0
    2062:	90 e0       	ldi	r25, 0x00	; 0
    2064:	f8 01       	movw	r30, r16
    2066:	61 91       	ld	r22, Z+
    2068:	71 91       	ld	r23, Z+
    206a:	8f 01       	movw	r16, r30
    206c:	ec 01       	movw	r28, r24
    206e:	21 96       	adiw	r28, 0x01	; 1
    2070:	ce 01       	movw	r24, r28
    2072:	0e 94 13 10 	call	0x2026	; 0x2026 <_ZL12osd_printi_2PKcjj.constprop.32>
    2076:	ce 01       	movw	r24, r28
    2078:	28 97       	sbiw	r28, 0x08	; 8
    207a:	a1 f7       	brne	.-24     	; 0x2064 <_ZL5panCh5Point+0x10>
    207c:	df 91       	pop	r29
    207e:	cf 91       	pop	r28
    2080:	1f 91       	pop	r17
    2082:	0f 91       	pop	r16
    2084:	08 95       	ret

00002086 <__vector_20>:
    2086:	1f 92       	push	r1
    2088:	0f 92       	push	r0
    208a:	0f b6       	in	r0, 0x3f	; 63
    208c:	0f 92       	push	r0
    208e:	11 24       	eor	r1, r1
    2090:	2f 93       	push	r18
    2092:	3f 93       	push	r19
    2094:	4f 93       	push	r20
    2096:	8f 93       	push	r24
    2098:	9f 93       	push	r25
    209a:	ef 93       	push	r30
    209c:	ff 93       	push	r31
    209e:	40 91 c6 00 	lds	r20, 0x00C6	; 0x8000c6 <__data_load_end+0x7f7702>
    20a2:	80 91 1b 07 	lds	r24, 0x071B	; 0x80071b <__FastSerial__rxBuffer>
    20a6:	90 91 1c 07 	lds	r25, 0x071C	; 0x80071c <__FastSerial__rxBuffer+0x1>
    20aa:	01 96       	adiw	r24, 0x01	; 1
    20ac:	20 91 1f 07 	lds	r18, 0x071F	; 0x80071f <__FastSerial__rxBuffer+0x4>
    20b0:	30 91 20 07 	lds	r19, 0x0720	; 0x800720 <__FastSerial__rxBuffer+0x5>
    20b4:	82 23       	and	r24, r18
    20b6:	93 23       	and	r25, r19
    20b8:	20 91 1d 07 	lds	r18, 0x071D	; 0x80071d <__FastSerial__rxBuffer+0x2>
    20bc:	30 91 1e 07 	lds	r19, 0x071E	; 0x80071e <__FastSerial__rxBuffer+0x3>
    20c0:	82 17       	cp	r24, r18
    20c2:	93 07       	cpc	r25, r19
    20c4:	79 f0       	breq	.+30     	; 0x20e4 <__vector_20+0x5e>
    20c6:	20 91 1b 07 	lds	r18, 0x071B	; 0x80071b <__FastSerial__rxBuffer>
    20ca:	30 91 1c 07 	lds	r19, 0x071C	; 0x80071c <__FastSerial__rxBuffer+0x1>
    20ce:	e0 91 21 07 	lds	r30, 0x0721	; 0x800721 <__FastSerial__rxBuffer+0x6>
    20d2:	f0 91 22 07 	lds	r31, 0x0722	; 0x800722 <__FastSerial__rxBuffer+0x7>
    20d6:	e2 0f       	add	r30, r18
    20d8:	f3 1f       	adc	r31, r19
    20da:	40 83       	st	Z, r20
    20dc:	90 93 1c 07 	sts	0x071C, r25	; 0x80071c <__FastSerial__rxBuffer+0x1>
    20e0:	80 93 1b 07 	sts	0x071B, r24	; 0x80071b <__FastSerial__rxBuffer>
    20e4:	ff 91       	pop	r31
    20e6:	ef 91       	pop	r30
    20e8:	9f 91       	pop	r25
    20ea:	8f 91       	pop	r24
    20ec:	4f 91       	pop	r20
    20ee:	3f 91       	pop	r19
    20f0:	2f 91       	pop	r18
    20f2:	0f 90       	pop	r0
    20f4:	0f be       	out	0x3f, r0	; 63
    20f6:	0f 90       	pop	r0
    20f8:	1f 90       	pop	r1
    20fa:	18 95       	reti

000020fc <__vector_21>:
    20fc:	1f 92       	push	r1
    20fe:	0f 92       	push	r0
    2100:	0f b6       	in	r0, 0x3f	; 63
    2102:	0f 92       	push	r0
    2104:	11 24       	eor	r1, r1
    2106:	2f 93       	push	r18
    2108:	3f 93       	push	r19
    210a:	8f 93       	push	r24
    210c:	9f 93       	push	r25
    210e:	ef 93       	push	r30
    2110:	ff 93       	push	r31
    2112:	20 91 0d 07 	lds	r18, 0x070D	; 0x80070d <__FastSerial__txBuffer+0x2>
    2116:	30 91 0e 07 	lds	r19, 0x070E	; 0x80070e <__FastSerial__txBuffer+0x3>
    211a:	80 91 0b 07 	lds	r24, 0x070B	; 0x80070b <__FastSerial__txBuffer>
    211e:	90 91 0c 07 	lds	r25, 0x070C	; 0x80070c <__FastSerial__txBuffer+0x1>
    2122:	28 17       	cp	r18, r24
    2124:	39 07       	cpc	r19, r25
    2126:	e9 f0       	breq	.+58     	; 0x2162 <__vector_21+0x66>
    2128:	80 91 0d 07 	lds	r24, 0x070D	; 0x80070d <__FastSerial__txBuffer+0x2>
    212c:	90 91 0e 07 	lds	r25, 0x070E	; 0x80070e <__FastSerial__txBuffer+0x3>
    2130:	e0 91 11 07 	lds	r30, 0x0711	; 0x800711 <__FastSerial__txBuffer+0x6>
    2134:	f0 91 12 07 	lds	r31, 0x0712	; 0x800712 <__FastSerial__txBuffer+0x7>
    2138:	e8 0f       	add	r30, r24
    213a:	f9 1f       	adc	r31, r25
    213c:	80 81       	ld	r24, Z
    213e:	80 93 c6 00 	sts	0x00C6, r24	; 0x8000c6 <__data_load_end+0x7f7702>
    2142:	80 91 0d 07 	lds	r24, 0x070D	; 0x80070d <__FastSerial__txBuffer+0x2>
    2146:	90 91 0e 07 	lds	r25, 0x070E	; 0x80070e <__FastSerial__txBuffer+0x3>
    214a:	01 96       	adiw	r24, 0x01	; 1
    214c:	20 91 0f 07 	lds	r18, 0x070F	; 0x80070f <__FastSerial__txBuffer+0x4>
    2150:	30 91 10 07 	lds	r19, 0x0710	; 0x800710 <__FastSerial__txBuffer+0x5>
    2154:	82 23       	and	r24, r18
    2156:	93 23       	and	r25, r19
    2158:	90 93 0e 07 	sts	0x070E, r25	; 0x80070e <__FastSerial__txBuffer+0x3>
    215c:	80 93 0d 07 	sts	0x070D, r24	; 0x80070d <__FastSerial__txBuffer+0x2>
    2160:	10 c0       	rjmp	.+32     	; 0x2182 <__vector_21+0x86>
    2162:	20 91 0b 07 	lds	r18, 0x070B	; 0x80070b <__FastSerial__txBuffer>
    2166:	30 91 0c 07 	lds	r19, 0x070C	; 0x80070c <__FastSerial__txBuffer+0x1>
    216a:	80 91 0d 07 	lds	r24, 0x070D	; 0x80070d <__FastSerial__txBuffer+0x2>
    216e:	90 91 0e 07 	lds	r25, 0x070E	; 0x80070e <__FastSerial__txBuffer+0x3>
    2172:	28 17       	cp	r18, r24
    2174:	39 07       	cpc	r19, r25
    2176:	29 f4       	brne	.+10     	; 0x2182 <__vector_21+0x86>
    2178:	80 91 c1 00 	lds	r24, 0x00C1	; 0x8000c1 <__data_load_end+0x7f76fd>
    217c:	8f 7d       	andi	r24, 0xDF	; 223
    217e:	80 93 c1 00 	sts	0x00C1, r24	; 0x8000c1 <__data_load_end+0x7f76fd>
    2182:	ff 91       	pop	r31
    2184:	ef 91       	pop	r30
    2186:	9f 91       	pop	r25
    2188:	8f 91       	pop	r24
    218a:	3f 91       	pop	r19
    218c:	2f 91       	pop	r18
    218e:	0f 90       	pop	r0
    2190:	0f be       	out	0x3f, r0	; 63
    2192:	0f 90       	pop	r0
    2194:	1f 90       	pop	r1
    2196:	18 95       	reti

00002198 <__vector_28>:
    2198:	1f 92       	push	r1
    219a:	0f 92       	push	r0
    219c:	0f b6       	in	r0, 0x3f	; 63
    219e:	0f 92       	push	r0
    21a0:	11 24       	eor	r1, r1
    21a2:	2f 93       	push	r18
    21a4:	3f 93       	push	r19
    21a6:	4f 93       	push	r20
    21a8:	8f 93       	push	r24
    21aa:	9f 93       	push	r25
    21ac:	ef 93       	push	r30
    21ae:	ff 93       	push	r31
    21b0:	40 91 ce 00 	lds	r20, 0x00CE	; 0x8000ce <__data_load_end+0x7f770a>
    21b4:	80 91 23 07 	lds	r24, 0x0723	; 0x800723 <__FastSerial__rxBuffer+0x8>
    21b8:	90 91 24 07 	lds	r25, 0x0724	; 0x800724 <__FastSerial__rxBuffer+0x9>
    21bc:	01 96       	adiw	r24, 0x01	; 1
    21be:	20 91 27 07 	lds	r18, 0x0727	; 0x800727 <__FastSerial__rxBuffer+0xc>
    21c2:	30 91 28 07 	lds	r19, 0x0728	; 0x800728 <__FastSerial__rxBuffer+0xd>
    21c6:	82 23       	and	r24, r18
    21c8:	93 23       	and	r25, r19
    21ca:	20 91 25 07 	lds	r18, 0x0725	; 0x800725 <__FastSerial__rxBuffer+0xa>
    21ce:	30 91 26 07 	lds	r19, 0x0726	; 0x800726 <__FastSerial__rxBuffer+0xb>
    21d2:	82 17       	cp	r24, r18
    21d4:	93 07       	cpc	r25, r19
    21d6:	79 f0       	breq	.+30     	; 0x21f6 <__vector_28+0x5e>
    21d8:	20 91 23 07 	lds	r18, 0x0723	; 0x800723 <__FastSerial__rxBuffer+0x8>
    21dc:	30 91 24 07 	lds	r19, 0x0724	; 0x800724 <__FastSerial__rxBuffer+0x9>
    21e0:	e0 91 29 07 	lds	r30, 0x0729	; 0x800729 <__FastSerial__rxBuffer+0xe>
    21e4:	f0 91 2a 07 	lds	r31, 0x072A	; 0x80072a <__FastSerial__rxBuffer+0xf>
    21e8:	e2 0f       	add	r30, r18
    21ea:	f3 1f       	adc	r31, r19
    21ec:	40 83       	st	Z, r20
    21ee:	90 93 24 07 	sts	0x0724, r25	; 0x800724 <__FastSerial__rxBuffer+0x9>
    21f2:	80 93 23 07 	sts	0x0723, r24	; 0x800723 <__FastSerial__rxBuffer+0x8>
    21f6:	ff 91       	pop	r31
    21f8:	ef 91       	pop	r30
    21fa:	9f 91       	pop	r25
    21fc:	8f 91       	pop	r24
    21fe:	4f 91       	pop	r20
    2200:	3f 91       	pop	r19
    2202:	2f 91       	pop	r18
    2204:	0f 90       	pop	r0
    2206:	0f be       	out	0x3f, r0	; 63
    2208:	0f 90       	pop	r0
    220a:	1f 90       	pop	r1
    220c:	18 95       	reti

0000220e <__vector_29>:
    220e:	1f 92       	push	r1
    2210:	0f 92       	push	r0
    2212:	0f b6       	in	r0, 0x3f	; 63
    2214:	0f 92       	push	r0
    2216:	11 24       	eor	r1, r1
    2218:	2f 93       	push	r18
    221a:	3f 93       	push	r19
    221c:	8f 93       	push	r24
    221e:	9f 93       	push	r25
    2220:	ef 93       	push	r30
    2222:	ff 93       	push	r31
    2224:	20 91 15 07 	lds	r18, 0x0715	; 0x800715 <__FastSerial__txBuffer+0xa>
    2228:	30 91 16 07 	lds	r19, 0x0716	; 0x800716 <__FastSerial__txBuffer+0xb>
    222c:	80 91 13 07 	lds	r24, 0x0713	; 0x800713 <__FastSerial__txBuffer+0x8>
    2230:	90 91 14 07 	lds	r25, 0x0714	; 0x800714 <__FastSerial__txBuffer+0x9>
    2234:	28 17       	cp	r18, r24
    2236:	39 07       	cpc	r19, r25
    2238:	e9 f0       	breq	.+58     	; 0x2274 <__vector_29+0x66>
    223a:	80 91 15 07 	lds	r24, 0x0715	; 0x800715 <__FastSerial__txBuffer+0xa>
    223e:	90 91 16 07 	lds	r25, 0x0716	; 0x800716 <__FastSerial__txBuffer+0xb>
    2242:	e0 91 19 07 	lds	r30, 0x0719	; 0x800719 <__FastSerial__txBuffer+0xe>
    2246:	f0 91 1a 07 	lds	r31, 0x071A	; 0x80071a <__FastSerial__txBuffer+0xf>
    224a:	e8 0f       	add	r30, r24
    224c:	f9 1f       	adc	r31, r25
    224e:	80 81       	ld	r24, Z
    2250:	80 93 ce 00 	sts	0x00CE, r24	; 0x8000ce <__data_load_end+0x7f770a>
    2254:	80 91 15 07 	lds	r24, 0x0715	; 0x800715 <__FastSerial__txBuffer+0xa>
    2258:	90 91 16 07 	lds	r25, 0x0716	; 0x800716 <__FastSerial__txBuffer+0xb>
    225c:	01 96       	adiw	r24, 0x01	; 1
    225e:	20 91 17 07 	lds	r18, 0x0717	; 0x800717 <__FastSerial__txBuffer+0xc>
    2262:	30 91 18 07 	lds	r19, 0x0718	; 0x800718 <__FastSerial__txBuffer+0xd>
    2266:	82 23       	and	r24, r18
    2268:	93 23       	and	r25, r19
    226a:	90 93 16 07 	sts	0x0716, r25	; 0x800716 <__FastSerial__txBuffer+0xb>
    226e:	80 93 15 07 	sts	0x0715, r24	; 0x800715 <__FastSerial__txBuffer+0xa>
    2272:	10 c0       	rjmp	.+32     	; 0x2294 <__vector_29+0x86>
    2274:	20 91 13 07 	lds	r18, 0x0713	; 0x800713 <__FastSerial__txBuffer+0x8>
    2278:	30 91 14 07 	lds	r19, 0x0714	; 0x800714 <__FastSerial__txBuffer+0x9>
    227c:	80 91 15 07 	lds	r24, 0x0715	; 0x800715 <__FastSerial__txBuffer+0xa>
    2280:	90 91 16 07 	lds	r25, 0x0716	; 0x800716 <__FastSerial__txBuffer+0xb>
    2284:	28 17       	cp	r18, r24
    2286:	39 07       	cpc	r19, r25
    2288:	29 f4       	brne	.+10     	; 0x2294 <__vector_29+0x86>
    228a:	80 91 c9 00 	lds	r24, 0x00C9	; 0x8000c9 <__data_load_end+0x7f7705>
    228e:	8f 7d       	andi	r24, 0xDF	; 223
    2290:	80 93 c9 00 	sts	0x00C9, r24	; 0x8000c9 <__data_load_end+0x7f7705>
    2294:	ff 91       	pop	r31
    2296:	ef 91       	pop	r30
    2298:	9f 91       	pop	r25
    229a:	8f 91       	pop	r24
    229c:	3f 91       	pop	r19
    229e:	2f 91       	pop	r18
    22a0:	0f 90       	pop	r0
    22a2:	0f be       	out	0x3f, r0	; 63
    22a4:	0f 90       	pop	r0
    22a6:	1f 90       	pop	r1
    22a8:	18 95       	reti

000022aa <_Z15eeprom_read_lenPhjj>:
    22aa:	ef 92       	push	r14
    22ac:	ff 92       	push	r15
    22ae:	0f 93       	push	r16
    22b0:	1f 93       	push	r17
    22b2:	cf 93       	push	r28
    22b4:	df 93       	push	r29
    22b6:	8c 01       	movw	r16, r24
    22b8:	04 0f       	add	r16, r20
    22ba:	15 1f       	adc	r17, r21
    22bc:	ec 01       	movw	r28, r24
    22be:	7b 01       	movw	r14, r22
    22c0:	e8 1a       	sub	r14, r24
    22c2:	f9 0a       	sbc	r15, r25
    22c4:	c0 17       	cp	r28, r16
    22c6:	d1 07       	cpc	r29, r17
    22c8:	39 f0       	breq	.+14     	; 0x22d8 <_Z15eeprom_read_lenPhjj+0x2e>
    22ca:	c7 01       	movw	r24, r14
    22cc:	8c 0f       	add	r24, r28
    22ce:	9d 1f       	adc	r25, r29
    22d0:	0e 94 a0 44 	call	0x8940	; 0x8940 <eeprom_read_byte>
    22d4:	89 93       	st	Y+, r24
    22d6:	f6 cf       	rjmp	.-20     	; 0x22c4 <_Z15eeprom_read_lenPhjj+0x1a>
    22d8:	cd b7       	in	r28, 0x3d	; 61
    22da:	de b7       	in	r29, 0x3e	; 62
    22dc:	e6 e0       	ldi	r30, 0x06	; 6
    22de:	0c 94 91 44 	jmp	0x8922	; 0x8922 <__epilogue_restores__+0x18>

000022e2 <_ZL11printSensorh>:
    22e2:	a8 e1       	ldi	r26, 0x18	; 24
    22e4:	b0 e0       	ldi	r27, 0x00	; 0
    22e6:	e7 e7       	ldi	r30, 0x77	; 119
    22e8:	f1 e1       	ldi	r31, 0x11	; 17
    22ea:	0c 94 78 44 	jmp	0x88f0	; 0x88f0 <__prologue_saves__+0x1e>
    22ee:	18 2f       	mov	r17, r24
    22f0:	88 e1       	ldi	r24, 0x18	; 24
    22f2:	18 9f       	mul	r17, r24
    22f4:	b0 01       	movw	r22, r0
    22f6:	11 24       	eor	r1, r1
    22f8:	60 58       	subi	r22, 0x80	; 128
    22fa:	7d 4f       	sbci	r23, 0xFD	; 253
    22fc:	48 e1       	ldi	r20, 0x18	; 24
    22fe:	50 e0       	ldi	r21, 0x00	; 0
    2300:	ce 01       	movw	r24, r28
    2302:	01 96       	adiw	r24, 0x01	; 1
    2304:	0e 94 55 11 	call	0x22aa	; 0x22aa <_Z15eeprom_read_lenPhjj>
    2308:	e1 2f       	mov	r30, r17
    230a:	f0 e0       	ldi	r31, 0x00	; 0
    230c:	ee 0f       	add	r30, r30
    230e:	ff 1f       	adc	r31, r31
    2310:	ef 55       	subi	r30, 0x5F	; 95
    2312:	fc 4f       	sbci	r31, 0xFC	; 252
    2314:	60 81       	ld	r22, Z
    2316:	71 81       	ldd	r23, Z+1	; 0x01
    2318:	80 e0       	ldi	r24, 0x00	; 0
    231a:	90 e0       	ldi	r25, 0x00	; 0
    231c:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    2320:	29 81       	ldd	r18, Y+1	; 0x01
    2322:	3a 81       	ldd	r19, Y+2	; 0x02
    2324:	4b 81       	ldd	r20, Y+3	; 0x03
    2326:	5c 81       	ldd	r21, Y+4	; 0x04
    2328:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    232c:	2d 81       	ldd	r18, Y+5	; 0x05
    232e:	3e 81       	ldd	r19, Y+6	; 0x06
    2330:	4f 81       	ldd	r20, Y+7	; 0x07
    2332:	58 85       	ldd	r21, Y+8	; 0x08
    2334:	0e 94 b8 3f 	call	0x7f70	; 0x7f70 <__addsf3>
    2338:	9f 93       	push	r25
    233a:	8f 93       	push	r24
    233c:	7f 93       	push	r23
    233e:	6f 93       	push	r22
    2340:	ce 01       	movw	r24, r28
    2342:	09 96       	adiw	r24, 0x09	; 9
    2344:	9f 93       	push	r25
    2346:	8f 93       	push	r24
    2348:	88 e6       	ldi	r24, 0x68	; 104
    234a:	93 e0       	ldi	r25, 0x03	; 3
    234c:	9f 93       	push	r25
    234e:	8f 93       	push	r24
    2350:	0e 94 d0 3a 	call	0x75a0	; 0x75a0 <_ZN12BetterStream6printfEPKcz>
    2354:	0f b6       	in	r0, 0x3f	; 63
    2356:	f8 94       	cli
    2358:	de bf       	out	0x3e, r29	; 62
    235a:	0f be       	out	0x3f, r0	; 63
    235c:	cd bf       	out	0x3d, r28	; 61
    235e:	68 96       	adiw	r28, 0x18	; 24
    2360:	e3 e0       	ldi	r30, 0x03	; 3
    2362:	0c 94 94 44 	jmp	0x8928	; 0x8928 <__epilogue_restores__+0x1e>

00002366 <_ZL9panSensor5Pointh.isra.18>:
    2366:	98 2f       	mov	r25, r24
    2368:	26 2f       	mov	r18, r22
    236a:	30 e0       	ldi	r19, 0x00	; 0
    236c:	f9 01       	movw	r30, r18
    236e:	e3 56       	subi	r30, 0x63	; 99
    2370:	fc 4f       	sbci	r31, 0xFC	; 252
    2372:	87 fd       	sbrc	r24, 7
    2374:	0d c0       	rjmp	.+26     	; 0x2390 <_ZL9panSensor5Pointh.isra.18+0x2a>
    2376:	86 2f       	mov	r24, r22
    2378:	41 e0       	ldi	r20, 0x01	; 1
    237a:	40 83       	st	Z, r20
    237c:	f9 01       	movw	r30, r18
    237e:	e7 56       	subi	r30, 0x67	; 103
    2380:	fc 4f       	sbci	r31, 0xFC	; 252
    2382:	96 fb       	bst	r25, 6
    2384:	99 27       	eor	r25, r25
    2386:	90 f9       	bld	r25, 0
    2388:	90 83       	st	Z, r25
    238a:	0e 94 71 11 	call	0x22e2	; 0x22e2 <_ZL11printSensorh>
    238e:	08 95       	ret
    2390:	10 82       	st	Z, r1
    2392:	08 95       	ret

00002394 <_ZL10panSensor45Point>:
    2394:	63 e0       	ldi	r22, 0x03	; 3
    2396:	89 2f       	mov	r24, r25
    2398:	0e 94 b3 11 	call	0x2366	; 0x2366 <_ZL9panSensor5Pointh.isra.18>
    239c:	08 95       	ret

0000239e <_ZL10panSensor35Point>:
    239e:	62 e0       	ldi	r22, 0x02	; 2
    23a0:	89 2f       	mov	r24, r25
    23a2:	0e 94 b3 11 	call	0x2366	; 0x2366 <_ZL9panSensor5Pointh.isra.18>
    23a6:	08 95       	ret

000023a8 <_ZL10panSensor25Point>:
    23a8:	61 e0       	ldi	r22, 0x01	; 1
    23aa:	89 2f       	mov	r24, r25
    23ac:	0e 94 b3 11 	call	0x2366	; 0x2366 <_ZL9panSensor5Pointh.isra.18>
    23b0:	08 95       	ret

000023b2 <_ZL10panSensor15Point>:
    23b2:	60 e0       	ldi	r22, 0x00	; 0
    23b4:	89 2f       	mov	r24, r25
    23b6:	0e 94 b3 11 	call	0x2366	; 0x2366 <_ZL9panSensor5Pointh.isra.18>
    23ba:	08 95       	ret

000023bc <_Z10setup_sensv>:
    23bc:	cf 93       	push	r28
    23be:	6a e0       	ldi	r22, 0x0A	; 10
    23c0:	86 e0       	ldi	r24, 0x06	; 6
    23c2:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    23c6:	c0 e0       	ldi	r28, 0x00	; 0
    23c8:	8c 2f       	mov	r24, r28
    23ca:	0e 94 71 11 	call	0x22e2	; 0x22e2 <_ZL11printSensorh>
    23ce:	0e 94 37 0a 	call	0x146e	; 0x146e <_ZL6osd_nlv>
    23d2:	cf 5f       	subi	r28, 0xFF	; 255
    23d4:	c4 30       	cpi	r28, 0x04	; 4
    23d6:	c1 f7       	brne	.-16     	; 0x23c8 <_Z10setup_sensv+0xc>
    23d8:	cf 91       	pop	r28
    23da:	08 95       	ret

000023dc <_Z16eeprom_write_lenPhjj>:
    23dc:	a0 e0       	ldi	r26, 0x00	; 0
    23de:	b0 e0       	ldi	r27, 0x00	; 0
    23e0:	e4 ef       	ldi	r30, 0xF4	; 244
    23e2:	f1 e1       	ldi	r31, 0x11	; 17
    23e4:	0c 94 74 44 	jmp	0x88e8	; 0x88e8 <__prologue_saves__+0x16>
    23e8:	eb 01       	movw	r28, r22
    23ea:	7c 01       	movw	r14, r24
    23ec:	8b 01       	movw	r16, r22
    23ee:	04 0f       	add	r16, r20
    23f0:	15 1f       	adc	r17, r21
    23f2:	c0 17       	cp	r28, r16
    23f4:	d1 07       	cpc	r29, r17
    23f6:	71 f0       	breq	.+28     	; 0x2414 <_Z16eeprom_write_lenPhjj+0x38>
    23f8:	f7 01       	movw	r30, r14
    23fa:	d1 90       	ld	r13, Z+
    23fc:	7f 01       	movw	r14, r30
    23fe:	ce 01       	movw	r24, r28
    2400:	0e 94 a0 44 	call	0x8940	; 0x8940 <eeprom_read_byte>
    2404:	8d 15       	cp	r24, r13
    2406:	21 f0       	breq	.+8      	; 0x2410 <_Z16eeprom_write_lenPhjj+0x34>
    2408:	6d 2d       	mov	r22, r13
    240a:	ce 01       	movw	r24, r28
    240c:	0e 94 a8 44 	call	0x8950	; 0x8950 <eeprom_write_byte>
    2410:	21 96       	adiw	r28, 0x01	; 1
    2412:	ef cf       	rjmp	.-34     	; 0x23f2 <_Z16eeprom_write_lenPhjj+0x16>
    2414:	cd b7       	in	r28, 0x3d	; 61
    2416:	de b7       	in	r29, 0x3e	; 62
    2418:	e7 e0       	ldi	r30, 0x07	; 7
    241a:	0c 94 90 44 	jmp	0x8920	; 0x8920 <__epilogue_restores__+0x16>

0000241e <_Z19print_eeprom_stringhPFvhE>:
    241e:	ef 92       	push	r14
    2420:	ff 92       	push	r15
    2422:	1f 93       	push	r17
    2424:	cf 93       	push	r28
    2426:	df 93       	push	r29
    2428:	18 2f       	mov	r17, r24
    242a:	7b 01       	movw	r14, r22
    242c:	c0 e0       	ldi	r28, 0x00	; 0
    242e:	d3 e0       	ldi	r29, 0x03	; 3
    2430:	ce 01       	movw	r24, r28
    2432:	0e 94 a0 44 	call	0x8940	; 0x8940 <eeprom_read_byte>
    2436:	8f 3f       	cpi	r24, 0xFF	; 255
    2438:	71 f0       	breq	.+28     	; 0x2456 <_Z19print_eeprom_stringhPFvhE+0x38>
    243a:	81 11       	cpse	r24, r1
    243c:	03 c0       	rjmp	.+6      	; 0x2444 <_Z19print_eeprom_stringhPFvhE+0x26>
    243e:	11 23       	and	r17, r17
    2440:	51 f0       	breq	.+20     	; 0x2456 <_Z19print_eeprom_stringhPFvhE+0x38>
    2442:	11 50       	subi	r17, 0x01	; 1
    2444:	11 11       	cpse	r17, r1
    2446:	02 c0       	rjmp	.+4      	; 0x244c <_Z19print_eeprom_stringhPFvhE+0x2e>
    2448:	f7 01       	movw	r30, r14
    244a:	09 95       	icall
    244c:	21 96       	adiw	r28, 0x01	; 1
    244e:	c0 38       	cpi	r28, 0x80	; 128
    2450:	f3 e0       	ldi	r31, 0x03	; 3
    2452:	df 07       	cpc	r29, r31
    2454:	69 f7       	brne	.-38     	; 0x2430 <_Z19print_eeprom_stringhPFvhE+0x12>
    2456:	df 91       	pop	r29
    2458:	cf 91       	pop	r28
    245a:	1f 91       	pop	r17
    245c:	ff 90       	pop	r15
    245e:	ef 90       	pop	r14
    2460:	08 95       	ret

00002462 <_Z11osd_print_SPKc>:
    2462:	bc 01       	movw	r22, r24
    2464:	88 e6       	ldi	r24, 0x68	; 104
    2466:	93 e0       	ldi	r25, 0x03	; 3
    2468:	0e 94 ab 3a 	call	0x7556	; 0x7556 <_ZN12BetterStream7print_PEPKc>
    246c:	08 95       	ret

0000246e <_ZL8panVario5Point>:
    246e:	1f 93       	push	r17
    2470:	cf 93       	push	r28
    2472:	df 93       	push	r29
    2474:	18 2f       	mov	r17, r24
    2476:	d9 2f       	mov	r29, r25
    2478:	87 fd       	sbrc	r24, 7
    247a:	10 c0       	rjmp	.+32     	; 0x249c <_ZL8panVario5Point+0x2e>
    247c:	96 ff       	sbrs	r25, 6
    247e:	04 c0       	rjmp	.+8      	; 0x2488 <_ZL8panVario5Point+0x1a>
    2480:	c0 e0       	ldi	r28, 0x00	; 0
    2482:	84 e4       	ldi	r24, 0x44	; 68
    2484:	94 e0       	ldi	r25, 0x04	; 4
    2486:	03 c0       	rjmp	.+6      	; 0x248e <_ZL8panVario5Point+0x20>
    2488:	c1 e0       	ldi	r28, 0x01	; 1
    248a:	83 e5       	ldi	r24, 0x53	; 83
    248c:	94 e0       	ldi	r25, 0x04	; 4
    248e:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    2492:	81 2f       	mov	r24, r17
    2494:	9d 2f       	mov	r25, r29
    2496:	0e 94 3b 0a 	call	0x1476	; 0x1476 <_ZL12osd_setPanel5Point>
    249a:	01 c0       	rjmp	.+2      	; 0x249e <_ZL8panVario5Point+0x30>
    249c:	c0 e0       	ldi	r28, 0x00	; 0
    249e:	80 91 f6 06 	lds	r24, 0x06F6	; 0x8006f6 <_ZL14vertical_speed>
    24a2:	90 91 f7 06 	lds	r25, 0x06F7	; 0x8006f7 <_ZL14vertical_speed+0x1>
    24a6:	a0 91 f8 06 	lds	r26, 0x06F8	; 0x8006f8 <_ZL14vertical_speed+0x2>
    24aa:	b0 91 f9 06 	lds	r27, 0x06F9	; 0x8006f9 <_ZL14vertical_speed+0x3>
    24ae:	bc 01       	movw	r22, r24
    24b0:	cd 01       	movw	r24, r26
    24b2:	90 58       	subi	r25, 0x80	; 128
    24b4:	9b 01       	movw	r18, r22
    24b6:	ac 01       	movw	r20, r24
    24b8:	0e 94 b8 3f 	call	0x7f70	; 0x7f70 <__addsf3>
    24bc:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    24c0:	80 91 ac 03 	lds	r24, 0x03AC	; 0x8003ac <screen_flags>
    24c4:	82 ff       	sbrs	r24, 2
    24c6:	05 c0       	rjmp	.+10     	; 0x24d2 <_ZL8panVario5Point+0x64>
    24c8:	cb 01       	movw	r24, r22
    24ca:	6c e3       	ldi	r22, 0x3C	; 60
    24cc:	70 e0       	ldi	r23, 0x00	; 0
    24ce:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    24d2:	d5 ff       	sbrs	r29, 5
    24d4:	05 c0       	rjmp	.+10     	; 0x24e0 <_ZL8panVario5Point+0x72>
    24d6:	cb 01       	movw	r24, r22
    24d8:	6a e0       	ldi	r22, 0x0A	; 10
    24da:	70 e0       	ldi	r23, 0x00	; 0
    24dc:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    24e0:	d4 ff       	sbrs	r29, 4
    24e2:	06 c0       	rjmp	.+12     	; 0x24f0 <_ZL8panVario5Point+0x82>
    24e4:	77 ff       	sbrs	r23, 7
    24e6:	02 c0       	rjmp	.+4      	; 0x24ec <_ZL8panVario5Point+0x7e>
    24e8:	6f 5f       	subi	r22, 0xFF	; 255
    24ea:	7f 4f       	sbci	r23, 0xFF	; 255
    24ec:	75 95       	asr	r23
    24ee:	67 95       	ror	r22
    24f0:	16 ff       	sbrs	r17, 6
    24f2:	08 c0       	rjmp	.+16     	; 0x2504 <_ZL8panVario5Point+0x96>
    24f4:	77 ff       	sbrs	r23, 7
    24f6:	02 c0       	rjmp	.+4      	; 0x24fc <_ZL8panVario5Point+0x8e>
    24f8:	6d 5f       	subi	r22, 0xFD	; 253
    24fa:	7f 4f       	sbci	r23, 0xFF	; 255
    24fc:	75 95       	asr	r23
    24fe:	67 95       	ror	r22
    2500:	75 95       	asr	r23
    2502:	67 95       	ror	r22
    2504:	9b 01       	movw	r18, r22
    2506:	23 5d       	subi	r18, 0xD3	; 211
    2508:	3f 4f       	sbci	r19, 0xFF	; 255
    250a:	37 ff       	sbrs	r19, 7
    250c:	02 c0       	rjmp	.+4      	; 0x2512 <_ZL8panVario5Point+0xa4>
    250e:	2f 5f       	subi	r18, 0xFF	; 255
    2510:	3f 4f       	sbci	r19, 0xFF	; 255
    2512:	c9 01       	movw	r24, r18
    2514:	95 95       	asr	r25
    2516:	87 95       	ror	r24
    2518:	69 e0       	ldi	r22, 0x09	; 9
    251a:	70 e0       	ldi	r23, 0x00	; 0
    251c:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    2520:	65 30       	cpi	r22, 0x05	; 5
    2522:	2c f4       	brge	.+10     	; 0x252e <_ZL8panVario5Point+0xc0>
    2524:	67 fd       	sbrc	r22, 7
    2526:	06 c0       	rjmp	.+12     	; 0x2534 <_ZL8panVario5Point+0xc6>
    2528:	4f ec       	ldi	r20, 0xCF	; 207
    252a:	48 1b       	sub	r20, r24
    252c:	05 c0       	rjmp	.+10     	; 0x2538 <_ZL8panVario5Point+0xca>
    252e:	4e e7       	ldi	r20, 0x7E	; 126
    2530:	64 e0       	ldi	r22, 0x04	; 4
    2532:	02 c0       	rjmp	.+4      	; 0x2538 <_ZL8panVario5Point+0xca>
    2534:	40 e6       	ldi	r20, 0x60	; 96
    2536:	60 e0       	ldi	r22, 0x00	; 0
    2538:	8c 2f       	mov	r24, r28
    253a:	0e 94 d0 08 	call	0x11a0	; 0x11a0 <_ZN3OSD8write_xyEhhh>
    253e:	df 91       	pop	r29
    2540:	cf 91       	pop	r28
    2542:	1f 91       	pop	r17
    2544:	08 95       	ret

00002546 <_ZL7panVibe5Point>:
    2546:	cf 93       	push	r28
    2548:	df 93       	push	r29
    254a:	87 fd       	sbrc	r24, 7
    254c:	04 c0       	rjmp	.+8      	; 0x2556 <_ZL7panVibe5Point+0x10>
    254e:	89 e3       	ldi	r24, 0x39	; 57
    2550:	94 e0       	ldi	r25, 0x04	; 4
    2552:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    2556:	ca e7       	ldi	r28, 0x7A	; 122
    2558:	d3 e0       	ldi	r29, 0x03	; 3
    255a:	49 91       	ld	r20, Y+
    255c:	59 91       	ld	r21, Y+
    255e:	69 91       	ld	r22, Y+
    2560:	79 91       	ld	r23, Y+
    2562:	84 e4       	ldi	r24, 0x44	; 68
    2564:	9a e0       	ldi	r25, 0x0A	; 10
    2566:	0e 94 f9 0c 	call	0x19f2	; 0x19f2 <_ZL12osd_printf_1PKcf>
    256a:	83 e0       	ldi	r24, 0x03	; 3
    256c:	c6 38       	cpi	r28, 0x86	; 134
    256e:	d8 07       	cpc	r29, r24
    2570:	a1 f7       	brne	.-24     	; 0x255a <_ZL7panVibe5Point+0x14>
    2572:	0e 94 37 0a 	call	0x146e	; 0x146e <_ZL6osd_nlv>
    2576:	c4 e7       	ldi	r28, 0x74	; 116
    2578:	d3 e0       	ldi	r29, 0x03	; 3
    257a:	69 91       	ld	r22, Y+
    257c:	79 91       	ld	r23, Y+
    257e:	8c e3       	ldi	r24, 0x3C	; 60
    2580:	9a e0       	ldi	r25, 0x0A	; 10
    2582:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    2586:	83 e0       	ldi	r24, 0x03	; 3
    2588:	ca 37       	cpi	r28, 0x7A	; 122
    258a:	d8 07       	cpc	r29, r24
    258c:	b1 f7       	brne	.-20     	; 0x257a <_ZL7panVibe5Point+0x34>
    258e:	df 91       	pop	r29
    2590:	cf 91       	pop	r28
    2592:	08 95       	ret

00002594 <_ZL7panRose5Point>:
    2594:	ff 92       	push	r15
    2596:	0f 93       	push	r16
    2598:	1f 93       	push	r17
    259a:	cf 93       	push	r28
    259c:	df 93       	push	r29
    259e:	d9 2f       	mov	r29, r25
    25a0:	80 95       	com	r24
    25a2:	18 2f       	mov	r17, r24
    25a4:	11 1f       	adc	r17, r17
    25a6:	11 27       	eor	r17, r17
    25a8:	11 1f       	adc	r17, r17
    25aa:	41 f0       	breq	.+16     	; 0x25bc <_ZL7panRose5Point+0x28>
    25ac:	96 fd       	sbrc	r25, 6
    25ae:	06 c0       	rjmp	.+12     	; 0x25bc <_ZL7panRose5Point+0x28>
    25b0:	95 ff       	sbrs	r25, 5
    25b2:	3a c0       	rjmp	.+116    	; 0x2628 <_ZL7panRose5Point+0x94>
    25b4:	81 e7       	ldi	r24, 0x71	; 113
    25b6:	93 e0       	ldi	r25, 0x03	; 3
    25b8:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    25bc:	83 ec       	ldi	r24, 0xC3	; 195
    25be:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    25c2:	20 91 80 06 	lds	r18, 0x0680	; 0x800680 <_ZL11osd_heading>
    25c6:	30 91 81 06 	lds	r19, 0x0681	; 0x800681 <_ZL11osd_heading+0x1>
    25ca:	48 e1       	ldi	r20, 0x18	; 24
    25cc:	42 9f       	mul	r20, r18
    25ce:	c0 01       	movw	r24, r0
    25d0:	43 9f       	mul	r20, r19
    25d2:	90 0d       	add	r25, r0
    25d4:	11 24       	eor	r1, r1
    25d6:	0c 96       	adiw	r24, 0x0c	; 12
    25d8:	68 e6       	ldi	r22, 0x68	; 104
    25da:	71 e0       	ldi	r23, 0x01	; 1
    25dc:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    25e0:	64 50       	subi	r22, 0x04	; 4
    25e2:	71 09       	sbc	r23, r1
    25e4:	c6 2f       	mov	r28, r22
    25e6:	77 ff       	sbrs	r23, 7
    25e8:	02 c0       	rjmp	.+4      	; 0x25ee <_ZL7panRose5Point+0x5a>
    25ea:	c8 e1       	ldi	r28, 0x18	; 24
    25ec:	c6 0f       	add	r28, r22
    25ee:	d5 fb       	bst	r29, 5
    25f0:	ff 24       	eor	r15, r15
    25f2:	f0 f8       	bld	r15, 0
    25f4:	d5 fd       	sbrc	r29, 5
    25f6:	02 c0       	rjmp	.+4      	; 0x25fc <_ZL7panRose5Point+0x68>
    25f8:	09 e0       	ldi	r16, 0x09	; 9
    25fa:	01 c0       	rjmp	.+2      	; 0x25fe <_ZL7panRose5Point+0x6a>
    25fc:	0a e0       	ldi	r16, 0x0A	; 10
    25fe:	ec 2f       	mov	r30, r28
    2600:	f0 e0       	ldi	r31, 0x00	; 0
    2602:	e4 5b       	subi	r30, 0xB4	; 180
    2604:	fc 4f       	sbci	r31, 0xFC	; 252
    2606:	84 91       	lpm	r24, Z
    2608:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    260c:	cf 5f       	subi	r28, 0xFF	; 255
    260e:	c8 31       	cpi	r28, 0x18	; 24
    2610:	08 f0       	brcs	.+2      	; 0x2614 <_ZL7panRose5Point+0x80>
    2612:	c0 e0       	ldi	r28, 0x00	; 0
    2614:	01 50       	subi	r16, 0x01	; 1
    2616:	99 f7       	brne	.-26     	; 0x25fe <_ZL7panRose5Point+0x6a>
    2618:	87 e8       	ldi	r24, 0x87	; 135
    261a:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    261e:	11 23       	and	r17, r17
    2620:	79 f0       	breq	.+30     	; 0x2640 <_ZL7panRose5Point+0xac>
    2622:	d6 fd       	sbrc	r29, 6
    2624:	04 c0       	rjmp	.+8      	; 0x262e <_ZL7panRose5Point+0x9a>
    2626:	0c c0       	rjmp	.+24     	; 0x2640 <_ZL7panRose5Point+0xac>
    2628:	84 e6       	ldi	r24, 0x64	; 100
    262a:	93 e0       	ldi	r25, 0x03	; 3
    262c:	c5 cf       	rjmp	.-118    	; 0x25b8 <_ZL7panRose5Point+0x24>
    262e:	f1 10       	cpse	r15, r1
    2630:	03 c0       	rjmp	.+6      	; 0x2638 <_ZL7panRose5Point+0xa4>
    2632:	85 e3       	ldi	r24, 0x35	; 53
    2634:	93 e0       	ldi	r25, 0x03	; 3
    2636:	02 c0       	rjmp	.+4      	; 0x263c <_ZL7panRose5Point+0xa8>
    2638:	81 e4       	ldi	r24, 0x41	; 65
    263a:	93 e0       	ldi	r25, 0x03	; 3
    263c:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    2640:	cd b7       	in	r28, 0x3d	; 61
    2642:	de b7       	in	r29, 0x3e	; 62
    2644:	e5 e0       	ldi	r30, 0x05	; 5
    2646:	0c 94 92 44 	jmp	0x8924	; 0x8924 <__epilogue_restores__+0x1a>

0000264a <_ZL6panGPS5Point>:
    264a:	1f 93       	push	r17
    264c:	cf 93       	push	r28
    264e:	df 93       	push	r29
    2650:	40 91 49 04 	lds	r20, 0x0449	; 0x800449 <osd_pos+0x4>
    2654:	50 91 4a 04 	lds	r21, 0x044A	; 0x80044a <osd_pos+0x5>
    2658:	60 91 4b 04 	lds	r22, 0x044B	; 0x80044b <osd_pos+0x6>
    265c:	70 91 4c 04 	lds	r23, 0x044C	; 0x80044c <osd_pos+0x7>
    2660:	45 2b       	or	r20, r21
    2662:	46 2b       	or	r20, r22
    2664:	47 2b       	or	r20, r23
    2666:	69 f4       	brne	.+26     	; 0x2682 <_ZL6panGPS5Point+0x38>
    2668:	40 91 45 04 	lds	r20, 0x0445	; 0x800445 <osd_pos>
    266c:	50 91 46 04 	lds	r21, 0x0446	; 0x800446 <osd_pos+0x1>
    2670:	60 91 47 04 	lds	r22, 0x0447	; 0x800447 <osd_pos+0x2>
    2674:	70 91 48 04 	lds	r23, 0x0448	; 0x800448 <osd_pos+0x3>
    2678:	45 2b       	or	r20, r21
    267a:	46 2b       	or	r20, r22
    267c:	47 2b       	or	r20, r23
    267e:	09 f4       	brne	.+2      	; 0x2682 <_ZL6panGPS5Point+0x38>
    2680:	42 c0       	rjmp	.+132    	; 0x2706 <_ZL6panGPS5Point+0xbc>
    2682:	94 fd       	sbrc	r25, 4
    2684:	02 c0       	rjmp	.+4      	; 0x268a <_ZL6panGPS5Point+0x40>
    2686:	1f ef       	ldi	r17, 0xFF	; 255
    2688:	01 c0       	rjmp	.+2      	; 0x268c <_ZL6panGPS5Point+0x42>
    268a:	10 e2       	ldi	r17, 0x20	; 32
    268c:	ec 01       	movw	r28, r24
    268e:	80 91 c0 03 	lds	r24, 0x03C0	; 0x8003c0 <lflags+0xc>
    2692:	88 23       	and	r24, r24
    2694:	f1 f0       	breq	.+60     	; 0x26d2 <_ZL6panGPS5Point+0x88>
    2696:	80 91 cc 03 	lds	r24, 0x03CC	; 0x8003cc <lflags+0x18>
    269a:	8a 30       	cpi	r24, 0x0A	; 10
    269c:	50 f0       	brcs	.+20     	; 0x26b2 <_ZL6panGPS5Point+0x68>
    269e:	89 e2       	ldi	r24, 0x29	; 41
    26a0:	93 e0       	ldi	r25, 0x03	; 3
    26a2:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    26a6:	81 2f       	mov	r24, r17
    26a8:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    26ac:	82 e2       	ldi	r24, 0x22	; 34
    26ae:	93 e0       	ldi	r25, 0x03	; 3
    26b0:	0d c0       	rjmp	.+26     	; 0x26cc <_ZL6panGPS5Point+0x82>
    26b2:	80 91 cd 03 	lds	r24, 0x03CD	; 0x8003cd <lflags+0x19>
    26b6:	8a 30       	cpi	r24, 0x0A	; 10
    26b8:	60 f0       	brcs	.+24     	; 0x26d2 <_ZL6panGPS5Point+0x88>
    26ba:	89 e2       	ldi	r24, 0x29	; 41
    26bc:	93 e0       	ldi	r25, 0x03	; 3
    26be:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    26c2:	81 2f       	mov	r24, r17
    26c4:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    26c8:	89 e1       	ldi	r24, 0x19	; 25
    26ca:	93 e0       	ldi	r25, 0x03	; 3
    26cc:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    26d0:	1a c0       	rjmp	.+52     	; 0x2706 <_ZL6panGPS5Point+0xbc>
    26d2:	c0 95       	com	r28
    26d4:	cc 1f       	adc	r28, r28
    26d6:	cc 27       	eor	r28, r28
    26d8:	cc 1f       	adc	r28, r28
    26da:	19 f0       	breq	.+6      	; 0x26e2 <_ZL6panGPS5Point+0x98>
    26dc:	83 e0       	ldi	r24, 0x03	; 3
    26de:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    26e2:	65 e4       	ldi	r22, 0x45	; 69
    26e4:	74 e0       	ldi	r23, 0x04	; 4
    26e6:	8d 2f       	mov	r24, r29
    26e8:	0e 94 cf 0f 	call	0x1f9e	; 0x1f9e <_ZL11print_coord5PointPf.isra.14>
    26ec:	81 2f       	mov	r24, r17
    26ee:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    26f2:	cc 23       	and	r28, r28
    26f4:	19 f0       	breq	.+6      	; 0x26fc <_ZL6panGPS5Point+0xb2>
    26f6:	84 e0       	ldi	r24, 0x04	; 4
    26f8:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    26fc:	69 e4       	ldi	r22, 0x49	; 73
    26fe:	74 e0       	ldi	r23, 0x04	; 4
    2700:	8d 2f       	mov	r24, r29
    2702:	0e 94 cf 0f 	call	0x1f9e	; 0x1f9e <_ZL11print_coord5PointPf.isra.14>
    2706:	df 91       	pop	r29
    2708:	cf 91       	pop	r28
    270a:	1f 91       	pop	r17
    270c:	08 95       	ret

0000270e <_Z9MAX_writehh>:
    270e:	8e bd       	out	0x2e, r24	; 46
    2710:	0d b4       	in	r0, 0x2d	; 45
    2712:	07 fe       	sbrs	r0, 7
    2714:	fd cf       	rjmp	.-6      	; 0x2710 <_Z9MAX_writehh+0x2>
    2716:	8e b5       	in	r24, 0x2e	; 46
    2718:	6e bd       	out	0x2e, r22	; 46
    271a:	0d b4       	in	r0, 0x2d	; 45
    271c:	07 fe       	sbrs	r0, 7
    271e:	fd cf       	rjmp	.-6      	; 0x271a <_Z9MAX_writehh+0xc>
    2720:	8e b5       	in	r24, 0x2e	; 46
    2722:	08 95       	ret

00002724 <_Z8MAX_readh>:
    2724:	8e bd       	out	0x2e, r24	; 46
    2726:	0d b4       	in	r0, 0x2d	; 45
    2728:	07 fe       	sbrs	r0, 7
    272a:	fd cf       	rjmp	.-6      	; 0x2726 <_Z8MAX_readh+0x2>
    272c:	8e b5       	in	r24, 0x2e	; 46
    272e:	8f ef       	ldi	r24, 0xFF	; 255
    2730:	8e bd       	out	0x2e, r24	; 46
    2732:	0d b4       	in	r0, 0x2d	; 45
    2734:	07 fe       	sbrs	r0, 7
    2736:	fd cf       	rjmp	.-6      	; 0x2732 <_Z8MAX_readh+0xe>
    2738:	8e b5       	in	r24, 0x2e	; 46
    273a:	08 95       	ret

0000273c <_Z11delay_telemv>:
    273c:	8a ea       	ldi	r24, 0xAA	; 170
    273e:	90 e0       	ldi	r25, 0x00	; 0
    2740:	0e 94 7b 36 	call	0x6cf6	; 0x6cf6 <delayMicroseconds>
    2744:	08 95       	ret

00002746 <_Z11get_alt_num5Point>:
    2746:	95 fb       	bst	r25, 5
    2748:	22 27       	eor	r18, r18
    274a:	20 f9       	bld	r18, 0
    274c:	94 fd       	sbrc	r25, 4
    274e:	02 c0       	rjmp	.+4      	; 0x2754 <_Z11get_alt_num5Point+0xe>
    2750:	90 e0       	ldi	r25, 0x00	; 0
    2752:	01 c0       	rjmp	.+2      	; 0x2756 <_Z11get_alt_num5Point+0x10>
    2754:	92 e0       	ldi	r25, 0x02	; 2
    2756:	92 2b       	or	r25, r18
    2758:	86 fd       	sbrc	r24, 6
    275a:	02 c0       	rjmp	.+4      	; 0x2760 <_Z11get_alt_num5Point+0x1a>
    275c:	80 e0       	ldi	r24, 0x00	; 0
    275e:	01 c0       	rjmp	.+2      	; 0x2762 <_Z11get_alt_num5Point+0x1c>
    2760:	84 e0       	ldi	r24, 0x04	; 4
    2762:	89 2b       	or	r24, r25
    2764:	08 95       	ret

00002766 <_ZL9panCValue5Point>:
    2766:	1f 93       	push	r17
    2768:	cf 93       	push	r28
    276a:	df 93       	push	r29
    276c:	18 2f       	mov	r17, r24
    276e:	0e 94 a3 13 	call	0x2746	; 0x2746 <_Z11get_alt_num5Point>
    2772:	8c 5f       	subi	r24, 0xFC	; 252
    2774:	c8 2f       	mov	r28, r24
    2776:	d0 e0       	ldi	r29, 0x00	; 0
    2778:	17 fd       	sbrc	r17, 7
    277a:	07 c0       	rjmp	.+14     	; 0x278a <_ZL9panCValue5Point+0x24>
    277c:	be 01       	movw	r22, r28
    277e:	6f 5f       	subi	r22, 0xFF	; 255
    2780:	7f 4f       	sbci	r23, 0xFF	; 255
    2782:	86 e7       	ldi	r24, 0x76	; 118
    2784:	98 e0       	ldi	r25, 0x08	; 8
    2786:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    278a:	cc 0f       	add	r28, r28
    278c:	dd 1f       	adc	r29, r29
    278e:	c1 54       	subi	r28, 0x41	; 65
    2790:	d9 4f       	sbci	r29, 0xF9	; 249
    2792:	68 81       	ld	r22, Y
    2794:	79 81       	ldd	r23, Y+1	; 0x01
    2796:	80 e4       	ldi	r24, 0x40	; 64
    2798:	9a e0       	ldi	r25, 0x0A	; 10
    279a:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    279e:	df 91       	pop	r29
    27a0:	cf 91       	pop	r28
    27a2:	1f 91       	pop	r17
    27a4:	08 95       	ret

000027a6 <_ZL8panScale5Point>:
    27a6:	1f 93       	push	r17
    27a8:	cf 93       	push	r28
    27aa:	df 93       	push	r29
    27ac:	18 2f       	mov	r17, r24
    27ae:	c9 2f       	mov	r28, r25
    27b0:	0e 94 a3 13 	call	0x2746	; 0x2746 <_Z11get_alt_num5Point>
    27b4:	d4 e0       	ldi	r29, 0x04	; 4
    27b6:	d8 0f       	add	r29, r24
    27b8:	17 fd       	sbrc	r17, 7
    27ba:	08 c0       	rjmp	.+16     	; 0x27cc <_ZL8panScale5Point+0x26>
    27bc:	6d 2f       	mov	r22, r29
    27be:	70 e0       	ldi	r23, 0x00	; 0
    27c0:	6f 5f       	subi	r22, 0xFF	; 255
    27c2:	7f 4f       	sbci	r23, 0xFF	; 255
    27c4:	88 e1       	ldi	r24, 0x18	; 24
    27c6:	94 e0       	ldi	r25, 0x04	; 4
    27c8:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    27cc:	c6 fb       	bst	r28, 6
    27ce:	66 27       	eor	r22, r22
    27d0:	60 f9       	bld	r22, 0
    27d2:	8d 2f       	mov	r24, r29
    27d4:	0e 94 8e 09 	call	0x131c	; 0x131c <_ZL12get_chan_poshh>
    27d8:	d8 2f       	mov	r29, r24
    27da:	c0 e0       	ldi	r28, 0x00	; 0
    27dc:	cd 13       	cpse	r28, r29
    27de:	02 c0       	rjmp	.+4      	; 0x27e4 <_ZL8panScale5Point+0x3e>
    27e0:	81 e8       	ldi	r24, 0x81	; 129
    27e2:	01 c0       	rjmp	.+2      	; 0x27e6 <_ZL8panScale5Point+0x40>
    27e4:	80 e8       	ldi	r24, 0x80	; 128
    27e6:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    27ea:	cf 5f       	subi	r28, 0xFF	; 255
    27ec:	c5 30       	cpi	r28, 0x05	; 5
    27ee:	b1 f7       	brne	.-20     	; 0x27dc <_ZL8panScale5Point+0x36>
    27f0:	df 91       	pop	r29
    27f2:	cf 91       	pop	r28
    27f4:	1f 91       	pop	r17
    27f6:	08 95       	ret

000027f8 <_ZL8panState5Point>:
    27f8:	1f 93       	push	r17
    27fa:	cf 93       	push	r28
    27fc:	df 93       	push	r29
    27fe:	18 2f       	mov	r17, r24
    2800:	c9 2f       	mov	r28, r25
    2802:	0e 94 a3 13 	call	0x2746	; 0x2746 <_Z11get_alt_num5Point>
    2806:	d4 e0       	ldi	r29, 0x04	; 4
    2808:	d8 0f       	add	r29, r24
    280a:	17 fd       	sbrc	r17, 7
    280c:	08 c0       	rjmp	.+16     	; 0x281e <_ZL8panState5Point+0x26>
    280e:	6d 2f       	mov	r22, r29
    2810:	70 e0       	ldi	r23, 0x00	; 0
    2812:	6f 5f       	subi	r22, 0xFF	; 255
    2814:	7f 4f       	sbci	r23, 0xFF	; 255
    2816:	86 e7       	ldi	r24, 0x76	; 118
    2818:	98 e0       	ldi	r25, 0x08	; 8
    281a:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    281e:	c6 fb       	bst	r28, 6
    2820:	66 27       	eor	r22, r22
    2822:	60 f9       	bld	r22, 0
    2824:	8d 2f       	mov	r24, r29
    2826:	0e 94 8e 09 	call	0x131c	; 0x131c <_ZL12get_chan_poshh>
    282a:	6d eb       	ldi	r22, 0xBD	; 189
    282c:	78 e0       	ldi	r23, 0x08	; 8
    282e:	0e 94 0f 12 	call	0x241e	; 0x241e <_Z19print_eeprom_stringhPFvhE>
    2832:	df 91       	pop	r29
    2834:	cf 91       	pop	r28
    2836:	1f 91       	pop	r17
    2838:	08 95       	ret

0000283a <_Z14get_alt_filter5Point>:
    283a:	96 fb       	bst	r25, 6
    283c:	22 27       	eor	r18, r18
    283e:	20 f9       	bld	r18, 0
    2840:	30 e0       	ldi	r19, 0x00	; 0
    2842:	95 fd       	sbrc	r25, 5
    2844:	03 c0       	rjmp	.+6      	; 0x284c <_Z14get_alt_filter5Point+0x12>
    2846:	80 e0       	ldi	r24, 0x00	; 0
    2848:	90 e0       	ldi	r25, 0x00	; 0
    284a:	02 c0       	rjmp	.+4      	; 0x2850 <_Z14get_alt_filter5Point+0x16>
    284c:	82 e0       	ldi	r24, 0x02	; 2
    284e:	90 e0       	ldi	r25, 0x00	; 0
    2850:	28 2b       	or	r18, r24
    2852:	39 2b       	or	r19, r25
    2854:	21 50       	subi	r18, 0x01	; 1
    2856:	31 09       	sbc	r19, r1
    2858:	23 30       	cpi	r18, 0x03	; 3
    285a:	31 05       	cpc	r19, r1
    285c:	28 f4       	brcc	.+10     	; 0x2868 <_Z14get_alt_filter5Point+0x2e>
    285e:	f9 01       	movw	r30, r18
    2860:	e0 5e       	subi	r30, 0xE0	; 224
    2862:	fe 4f       	sbci	r31, 0xFE	; 254
    2864:	80 81       	ld	r24, Z
    2866:	08 95       	ret
    2868:	80 e0       	ldi	r24, 0x00	; 0
    286a:	08 95       	ret

0000286c <_ZL8panClimb5Point>:
    286c:	cf 92       	push	r12
    286e:	df 92       	push	r13
    2870:	ef 92       	push	r14
    2872:	ff 92       	push	r15
    2874:	cf 93       	push	r28
    2876:	df 93       	push	r29
    2878:	d8 2f       	mov	r29, r24
    287a:	c9 2f       	mov	r28, r25
    287c:	0e 94 1d 14 	call	0x283a	; 0x283a <_Z14get_alt_filter5Point>
    2880:	80 93 0f 01 	sts	0x010F, r24	; 0x80010f <climb_filter>
    2884:	c7 fd       	sbrc	r28, 7
    2886:	47 c0       	rjmp	.+142    	; 0x2916 <_ZL8panClimb5Point+0xaa>
    2888:	c4 ff       	sbrs	r28, 4
    288a:	2a c0       	rjmp	.+84     	; 0x28e0 <_ZL8panClimb5Point+0x74>
    288c:	81 e0       	ldi	r24, 0x01	; 1
    288e:	80 93 c7 03 	sts	0x03C7, r24	; 0x8003c7 <lflags+0x13>
    2892:	29 e8       	ldi	r18, 0x89	; 137
    2894:	38 e8       	ldi	r19, 0x88	; 136
    2896:	48 e8       	ldi	r20, 0x88	; 136
    2898:	5c e3       	ldi	r21, 0x3C	; 60
    289a:	60 91 f6 06 	lds	r22, 0x06F6	; 0x8006f6 <_ZL14vertical_speed>
    289e:	70 91 f7 06 	lds	r23, 0x06F7	; 0x8006f7 <_ZL14vertical_speed+0x1>
    28a2:	80 91 f8 06 	lds	r24, 0x06F8	; 0x8006f8 <_ZL14vertical_speed+0x2>
    28a6:	90 91 f9 06 	lds	r25, 0x06F9	; 0x8006f9 <_ZL14vertical_speed+0x3>
    28aa:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    28ae:	6b 01       	movw	r12, r22
    28b0:	7c 01       	movw	r14, r24
    28b2:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    28b6:	9b 01       	movw	r18, r22
    28b8:	77 ff       	sbrs	r23, 7
    28ba:	04 c0       	rjmp	.+8      	; 0x28c4 <_ZL8panClimb5Point+0x58>
    28bc:	22 27       	eor	r18, r18
    28be:	33 27       	eor	r19, r19
    28c0:	26 1b       	sub	r18, r22
    28c2:	37 0b       	sbc	r19, r23
    28c4:	2a 30       	cpi	r18, 0x0A	; 10
    28c6:	31 05       	cpc	r19, r1
    28c8:	04 f5       	brge	.+64     	; 0x290a <_ZL8panClimb5Point+0x9e>
    28ca:	d6 fd       	sbrc	r29, 6
    28cc:	03 c0       	rjmp	.+6      	; 0x28d4 <_ZL8panClimb5Point+0x68>
    28ce:	87 e9       	ldi	r24, 0x97	; 151
    28d0:	93 e0       	ldi	r25, 0x03	; 3
    28d2:	02 c0       	rjmp	.+4      	; 0x28d8 <_ZL8panClimb5Point+0x6c>
    28d4:	80 e9       	ldi	r24, 0x90	; 144
    28d6:	93 e0       	ldi	r25, 0x03	; 3
    28d8:	28 e1       	ldi	r18, 0x18	; 24
    28da:	b7 01       	movw	r22, r14
    28dc:	a6 01       	movw	r20, r12
    28de:	12 c0       	rjmp	.+36     	; 0x2904 <_ZL8panClimb5Point+0x98>
    28e0:	10 92 c7 03 	sts	0x03C7, r1	; 0x8003c7 <lflags+0x13>
    28e4:	e0 91 bd 06 	lds	r30, 0x06BD	; 0x8006bd <_ZL7measure>
    28e8:	f0 91 be 06 	lds	r31, 0x06BE	; 0x8006be <_ZL7measure+0x1>
    28ec:	72 96       	adiw	r30, 0x12	; 18
    28ee:	24 91       	lpm	r18, Z
    28f0:	40 91 f6 06 	lds	r20, 0x06F6	; 0x8006f6 <_ZL14vertical_speed>
    28f4:	50 91 f7 06 	lds	r21, 0x06F7	; 0x8006f7 <_ZL14vertical_speed+0x1>
    28f8:	60 91 f8 06 	lds	r22, 0x06F8	; 0x8006f8 <_ZL14vertical_speed+0x2>
    28fc:	70 91 f9 06 	lds	r23, 0x06F9	; 0x8006f9 <_ZL14vertical_speed+0x3>
    2900:	89 e8       	ldi	r24, 0x89	; 137
    2902:	93 e0       	ldi	r25, 0x03	; 3
    2904:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    2908:	06 c0       	rjmp	.+12     	; 0x2916 <_ZL8panClimb5Point+0xaa>
    290a:	24 36       	cpi	r18, 0x64	; 100
    290c:	31 05       	cpc	r19, r1
    290e:	14 f3       	brlt	.-60     	; 0x28d4 <_ZL8panClimb5Point+0x68>
    2910:	89 e8       	ldi	r24, 0x89	; 137
    2912:	93 e0       	ldi	r25, 0x03	; 3
    2914:	e1 cf       	rjmp	.-62     	; 0x28d8 <_ZL8panClimb5Point+0x6c>
    2916:	df 91       	pop	r29
    2918:	cf 91       	pop	r28
    291a:	ff 90       	pop	r15
    291c:	ef 90       	pop	r14
    291e:	df 90       	pop	r13
    2920:	cf 90       	pop	r12
    2922:	08 95       	ret

00002924 <_Z9readPanelh>:
    2924:	a2 e0       	ldi	r26, 0x02	; 2
    2926:	b0 e0       	ldi	r27, 0x00	; 0
    2928:	e8 e9       	ldi	r30, 0x98	; 152
    292a:	f4 e1       	ldi	r31, 0x14	; 20
    292c:	0c 94 79 44 	jmp	0x88f2	; 0x88f2 <__prologue_saves__+0x20>
    2930:	90 91 56 06 	lds	r25, 0x0656	; 0x800656 <_ZL6panelN>
    2934:	68 2f       	mov	r22, r24
    2936:	70 e0       	ldi	r23, 0x00	; 0
    2938:	66 0f       	add	r22, r22
    293a:	77 1f       	adc	r23, r23
    293c:	80 e8       	ldi	r24, 0x80	; 128
    293e:	98 9f       	mul	r25, r24
    2940:	60 0d       	add	r22, r0
    2942:	71 1d       	adc	r23, r1
    2944:	11 24       	eor	r1, r1
    2946:	42 e0       	ldi	r20, 0x02	; 2
    2948:	50 e0       	ldi	r21, 0x00	; 0
    294a:	ce 01       	movw	r24, r28
    294c:	01 96       	adiw	r24, 0x01	; 1
    294e:	0e 94 55 11 	call	0x22aa	; 0x22aa <_Z15eeprom_read_lenPhjj>
    2952:	89 81       	ldd	r24, Y+1	; 0x01
    2954:	9a 81       	ldd	r25, Y+2	; 0x02
    2956:	22 96       	adiw	r28, 0x02	; 2
    2958:	e2 e0       	ldi	r30, 0x02	; 2
    295a:	0c 94 95 44 	jmp	0x892a	; 0x892a <__epilogue_restores__+0x20>

0000295e <_Z11millis_plusPmj>:
    295e:	0f 93       	push	r16
    2960:	1f 93       	push	r17
    2962:	cf 93       	push	r28
    2964:	df 93       	push	r29
    2966:	ec 01       	movw	r28, r24
    2968:	8b 01       	movw	r16, r22
    296a:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    296e:	dc 01       	movw	r26, r24
    2970:	cb 01       	movw	r24, r22
    2972:	80 0f       	add	r24, r16
    2974:	91 1f       	adc	r25, r17
    2976:	a1 1d       	adc	r26, r1
    2978:	b1 1d       	adc	r27, r1
    297a:	88 83       	st	Y, r24
    297c:	99 83       	std	Y+1, r25	; 0x01
    297e:	aa 83       	std	Y+2, r26	; 0x02
    2980:	bb 83       	std	Y+3, r27	; 0x03
    2982:	df 91       	pop	r29
    2984:	cf 91       	pop	r28
    2986:	1f 91       	pop	r17
    2988:	0f 91       	pop	r16
    298a:	08 95       	ret

0000298c <_Z9long_plusPmj>:
    298c:	9b 01       	movw	r18, r22
    298e:	fc 01       	movw	r30, r24
    2990:	40 81       	ld	r20, Z
    2992:	51 81       	ldd	r21, Z+1	; 0x01
    2994:	62 81       	ldd	r22, Z+2	; 0x02
    2996:	73 81       	ldd	r23, Z+3	; 0x03
    2998:	42 0f       	add	r20, r18
    299a:	53 1f       	adc	r21, r19
    299c:	61 1d       	adc	r22, r1
    299e:	71 1d       	adc	r23, r1
    29a0:	40 83       	st	Z, r20
    29a2:	51 83       	std	Z+1, r21	; 0x01
    29a4:	62 83       	std	Z+2, r22	; 0x02
    29a6:	73 83       	std	Z+3, r23	; 0x03
    29a8:	08 95       	ret

000029aa <_Z12get_converthv>:
    29aa:	e0 91 bd 06 	lds	r30, 0x06BD	; 0x8006bd <_ZL7measure>
    29ae:	f0 91 be 06 	lds	r31, 0x06BE	; 0x8006be <_ZL7measure+0x1>
    29b2:	34 96       	adiw	r30, 0x04	; 4
    29b4:	65 91       	lpm	r22, Z+
    29b6:	75 91       	lpm	r23, Z+
    29b8:	85 91       	lpm	r24, Z+
    29ba:	94 91       	lpm	r25, Z
    29bc:	08 95       	ret

000029be <_ZL13printFullDistf>:
    29be:	cf 92       	push	r12
    29c0:	df 92       	push	r13
    29c2:	ef 92       	push	r14
    29c4:	ff 92       	push	r15
    29c6:	cf 93       	push	r28
    29c8:	df 93       	push	r29
    29ca:	6b 01       	movw	r12, r22
    29cc:	7c 01       	movw	r14, r24
    29ce:	0e 94 d5 14 	call	0x29aa	; 0x29aa <_Z12get_converthv>
    29d2:	a7 01       	movw	r20, r14
    29d4:	96 01       	movw	r18, r12
    29d6:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    29da:	6b 01       	movw	r12, r22
    29dc:	7c 01       	movw	r14, r24
    29de:	20 e0       	ldi	r18, 0x00	; 0
    29e0:	3c e3       	ldi	r19, 0x3C	; 60
    29e2:	4c e1       	ldi	r20, 0x1C	; 28
    29e4:	56 e4       	ldi	r21, 0x46	; 70
    29e6:	0e 94 96 40 	call	0x812c	; 0x812c <__cmpsf2>
    29ea:	c0 91 bd 06 	lds	r28, 0x06BD	; 0x8006bd <_ZL7measure>
    29ee:	d0 91 be 06 	lds	r29, 0x06BE	; 0x8006be <_ZL7measure+0x1>
    29f2:	fe 01       	movw	r30, r28
    29f4:	18 16       	cp	r1, r24
    29f6:	3c f0       	brlt	.+14     	; 0x2a06 <_ZL13printFullDistf+0x48>
    29f8:	39 96       	adiw	r30, 0x09	; 9
    29fa:	24 91       	lpm	r18, Z
    29fc:	b7 01       	movw	r22, r14
    29fe:	a6 01       	movw	r20, r12
    2a00:	80 e2       	ldi	r24, 0x20	; 32
    2a02:	9a e0       	ldi	r25, 0x0A	; 10
    2a04:	24 c0       	rjmp	.+72     	; 0x2a4e <_ZL13printFullDistf+0x90>
    2a06:	70 96       	adiw	r30, 0x10	; 16
    2a08:	65 91       	lpm	r22, Z+
    2a0a:	74 91       	lpm	r23, Z
    2a0c:	80 e0       	ldi	r24, 0x00	; 0
    2a0e:	90 e0       	ldi	r25, 0x00	; 0
    2a10:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    2a14:	9b 01       	movw	r18, r22
    2a16:	ac 01       	movw	r20, r24
    2a18:	c7 01       	movw	r24, r14
    2a1a:	b6 01       	movw	r22, r12
    2a1c:	0e 94 a0 40 	call	0x8140	; 0x8140 <__divsf3>
    2a20:	6b 01       	movw	r12, r22
    2a22:	7c 01       	movw	r14, r24
    2a24:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    2a28:	6a 30       	cpi	r22, 0x0A	; 10
    2a2a:	71 05       	cpc	r23, r1
    2a2c:	34 f0       	brlt	.+12     	; 0x2a3a <_ZL13printFullDistf+0x7c>
    2a2e:	64 36       	cpi	r22, 0x64	; 100
    2a30:	71 05       	cpc	r23, r1
    2a32:	34 f0       	brlt	.+12     	; 0x2a40 <_ZL13printFullDistf+0x82>
    2a34:	80 e2       	ldi	r24, 0x20	; 32
    2a36:	9a e0       	ldi	r25, 0x0A	; 10
    2a38:	05 c0       	rjmp	.+10     	; 0x2a44 <_ZL13printFullDistf+0x86>
    2a3a:	8c e2       	ldi	r24, 0x2C	; 44
    2a3c:	9a e0       	ldi	r25, 0x0A	; 10
    2a3e:	02 c0       	rjmp	.+4      	; 0x2a44 <_ZL13printFullDistf+0x86>
    2a40:	86 e2       	ldi	r24, 0x26	; 38
    2a42:	9a e0       	ldi	r25, 0x0A	; 10
    2a44:	fe 01       	movw	r30, r28
    2a46:	3f 96       	adiw	r30, 0x0f	; 15
    2a48:	24 91       	lpm	r18, Z
    2a4a:	b7 01       	movw	r22, r14
    2a4c:	a6 01       	movw	r20, r12
    2a4e:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    2a52:	df 91       	pop	r29
    2a54:	cf 91       	pop	r28
    2a56:	ff 90       	pop	r15
    2a58:	ef 90       	pop	r14
    2a5a:	df 90       	pop	r13
    2a5c:	cf 90       	pop	r12
    2a5e:	08 95       	ret

00002a60 <_ZL10panHomeDis5Point>:
    2a60:	96 fb       	bst	r25, 6
    2a62:	88 27       	eor	r24, r24
    2a64:	80 f9       	bld	r24, 0
    2a66:	80 93 d1 03 	sts	0x03D1, r24	; 0x8003d1 <lflags+0x1d>
    2a6a:	80 91 c2 03 	lds	r24, 0x03C2	; 0x8003c2 <lflags+0xe>
    2a6e:	88 23       	and	r24, r24
    2a70:	71 f0       	breq	.+28     	; 0x2a8e <_ZL10panHomeDis5Point+0x2e>
    2a72:	97 fd       	sbrc	r25, 7
    2a74:	0c c0       	rjmp	.+24     	; 0x2a8e <_ZL10panHomeDis5Point+0x2e>
    2a76:	60 91 87 06 	lds	r22, 0x0687	; 0x800687 <_ZL17osd_home_distance>
    2a7a:	70 91 88 06 	lds	r23, 0x0688	; 0x800688 <_ZL17osd_home_distance+0x1>
    2a7e:	80 91 89 06 	lds	r24, 0x0689	; 0x800689 <_ZL17osd_home_distance+0x2>
    2a82:	90 91 8a 06 	lds	r25, 0x068A	; 0x80068a <_ZL17osd_home_distance+0x3>
    2a86:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    2a8a:	0e 94 df 14 	call	0x29be	; 0x29be <_ZL13printFullDistf>
    2a8e:	08 95       	ret

00002a90 <_ZL10panHomeAlt5Point>:
    2a90:	40 91 d7 06 	lds	r20, 0x06D7	; 0x8006d7 <_ZL15osd_alt_to_home>
    2a94:	50 91 d8 06 	lds	r21, 0x06D8	; 0x8006d8 <_ZL15osd_alt_to_home+0x1>
    2a98:	60 91 d9 06 	lds	r22, 0x06D9	; 0x8006d9 <_ZL15osd_alt_to_home+0x2>
    2a9c:	70 91 da 06 	lds	r23, 0x06DA	; 0x8006da <_ZL15osd_alt_to_home+0x3>
    2aa0:	96 fd       	sbrc	r25, 6
    2aa2:	0a c0       	rjmp	.+20     	; 0x2ab8 <_ZL10panHomeAlt5Point+0x28>
    2aa4:	41 15       	cp	r20, r1
    2aa6:	51 05       	cpc	r21, r1
    2aa8:	61 05       	cpc	r22, r1
    2aaa:	71 05       	cpc	r23, r1
    2aac:	29 f0       	breq	.+10     	; 0x2ab8 <_ZL10panHomeAlt5Point+0x28>
    2aae:	cb 01       	movw	r24, r22
    2ab0:	ba 01       	movw	r22, r20
    2ab2:	0e 94 df 14 	call	0x29be	; 0x29be <_ZL13printFullDistf>
    2ab6:	08 95       	ret
    2ab8:	40 91 7c 06 	lds	r20, 0x067C	; 0x80067c <_ZL11osd_alt_mav>
    2abc:	50 91 7d 06 	lds	r21, 0x067D	; 0x80067d <_ZL11osd_alt_mav+0x1>
    2ac0:	60 91 7e 06 	lds	r22, 0x067E	; 0x80067e <_ZL11osd_alt_mav+0x2>
    2ac4:	70 91 7f 06 	lds	r23, 0x067F	; 0x80067f <_ZL11osd_alt_mav+0x3>
    2ac8:	f2 cf       	rjmp	.-28     	; 0x2aae <_ZL10panHomeAlt5Point+0x1e>

00002aca <_ZL11panDistance5Point>:
    2aca:	60 91 f2 06 	lds	r22, 0x06F2	; 0x8006f2 <_ZL13trip_distance>
    2ace:	70 91 f3 06 	lds	r23, 0x06F3	; 0x8006f3 <_ZL13trip_distance+0x1>
    2ad2:	80 91 f4 06 	lds	r24, 0x06F4	; 0x8006f4 <_ZL13trip_distance+0x2>
    2ad6:	90 91 f5 06 	lds	r25, 0x06F5	; 0x8006f5 <_ZL13trip_distance+0x3>
    2ada:	0e 94 df 14 	call	0x29be	; 0x29be <_ZL13printFullDistf>
    2ade:	08 95       	ret

00002ae0 <_Z12get_convertsv>:
    2ae0:	e0 91 bd 06 	lds	r30, 0x06BD	; 0x8006bd <_ZL7measure>
    2ae4:	f0 91 be 06 	lds	r31, 0x06BE	; 0x8006be <_ZL7measure+0x1>
    2ae8:	65 91       	lpm	r22, Z+
    2aea:	75 91       	lpm	r23, Z+
    2aec:	85 91       	lpm	r24, Z+
    2aee:	94 91       	lpm	r25, Z
    2af0:	08 95       	ret

00002af2 <_ZL13printSpeedCnvPKcPfh.isra.21>:
    2af2:	cf 92       	push	r12
    2af4:	df 92       	push	r13
    2af6:	ef 92       	push	r14
    2af8:	ff 92       	push	r15
    2afa:	1f 93       	push	r17
    2afc:	cf 93       	push	r28
    2afe:	df 93       	push	r29
    2b00:	ec 01       	movw	r28, r24
    2b02:	6a 01       	movw	r12, r20
    2b04:	7b 01       	movw	r14, r22
    2b06:	12 2f       	mov	r17, r18
    2b08:	0e 94 70 15 	call	0x2ae0	; 0x2ae0 <_Z12get_convertsv>
    2b0c:	a7 01       	movw	r20, r14
    2b0e:	96 01       	movw	r18, r12
    2b10:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    2b14:	11 23       	and	r17, r17
    2b16:	41 f0       	breq	.+16     	; 0x2b28 <_ZL13printSpeedCnvPKcPfh.isra.21+0x36>
    2b18:	24 ee       	ldi	r18, 0xE4	; 228
    2b1a:	38 e3       	ldi	r19, 0x38	; 56
    2b1c:	4e e8       	ldi	r20, 0x8E	; 142
    2b1e:	5e e3       	ldi	r21, 0x3E	; 62
    2b20:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    2b24:	28 e1       	ldi	r18, 0x18	; 24
    2b26:	06 c0       	rjmp	.+12     	; 0x2b34 <_ZL13printSpeedCnvPKcPfh.isra.21+0x42>
    2b28:	e0 91 bd 06 	lds	r30, 0x06BD	; 0x8006bd <_ZL7measure>
    2b2c:	f0 91 be 06 	lds	r31, 0x06BE	; 0x8006be <_ZL7measure+0x1>
    2b30:	38 96       	adiw	r30, 0x08	; 8
    2b32:	24 91       	lpm	r18, Z
    2b34:	ab 01       	movw	r20, r22
    2b36:	bc 01       	movw	r22, r24
    2b38:	ce 01       	movw	r24, r28
    2b3a:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    2b3e:	df 91       	pop	r29
    2b40:	cf 91       	pop	r28
    2b42:	1f 91       	pop	r17
    2b44:	ff 90       	pop	r15
    2b46:	ef 90       	pop	r14
    2b48:	df 90       	pop	r13
    2b4a:	cf 90       	pop	r12
    2b4c:	08 95       	ret

00002b4e <_ZL11panAirSpeed5Point>:
    2b4e:	96 fb       	bst	r25, 6
    2b50:	22 27       	eor	r18, r18
    2b52:	20 f9       	bld	r18, 0
    2b54:	40 91 74 06 	lds	r20, 0x0674	; 0x800674 <_ZL12osd_airspeed>
    2b58:	50 91 75 06 	lds	r21, 0x0675	; 0x800675 <_ZL12osd_airspeed+0x1>
    2b5c:	60 91 76 06 	lds	r22, 0x0676	; 0x800676 <_ZL12osd_airspeed+0x2>
    2b60:	70 91 77 06 	lds	r23, 0x0677	; 0x800677 <_ZL12osd_airspeed+0x3>
    2b64:	84 e4       	ldi	r24, 0x44	; 68
    2b66:	9a e0       	ldi	r25, 0x0A	; 10
    2b68:	0e 94 79 15 	call	0x2af2	; 0x2af2 <_ZL13printSpeedCnvPKcPfh.isra.21>
    2b6c:	08 95       	ret

00002b6e <_ZL6panVel5Point>:
    2b6e:	96 fb       	bst	r25, 6
    2b70:	22 27       	eor	r18, r18
    2b72:	20 f9       	bld	r18, 0
    2b74:	40 91 6a 06 	lds	r20, 0x066A	; 0x80066a <_ZL15osd_groundspeed>
    2b78:	50 91 6b 06 	lds	r21, 0x066B	; 0x80066b <_ZL15osd_groundspeed+0x1>
    2b7c:	60 91 6c 06 	lds	r22, 0x066C	; 0x80066c <_ZL15osd_groundspeed+0x2>
    2b80:	70 91 6d 06 	lds	r23, 0x066D	; 0x80066d <_ZL15osd_groundspeed+0x3>
    2b84:	84 e4       	ldi	r24, 0x44	; 68
    2b86:	9a e0       	ldi	r25, 0x0A	; 10
    2b88:	0e 94 79 15 	call	0x2af2	; 0x2af2 <_ZL13printSpeedCnvPKcPfh.isra.21>
    2b8c:	08 95       	ret

00002b8e <_ZL10print_listPK7Formatsh>:
    2b8e:	a0 e0       	ldi	r26, 0x00	; 0
    2b90:	b0 e0       	ldi	r27, 0x00	; 0
    2b92:	ed ec       	ldi	r30, 0xCD	; 205
    2b94:	f5 e1       	ldi	r31, 0x15	; 21
    2b96:	0c 94 73 44 	jmp	0x88e6	; 0x88e6 <__prologue_saves__+0x14>
    2b9a:	ec 01       	movw	r28, r24
    2b9c:	d6 2e       	mov	r13, r22
    2b9e:	fe 01       	movw	r30, r28
    2ba0:	05 91       	lpm	r16, Z+
    2ba2:	14 91       	lpm	r17, Z
    2ba4:	01 15       	cp	r16, r1
    2ba6:	11 05       	cpc	r17, r1
    2ba8:	09 f4       	brne	.+2      	; 0x2bac <_ZL10print_listPK7Formatsh+0x1e>
    2baa:	6d c0       	rjmp	.+218    	; 0x2c86 <_ZL10print_listPK7Formatsh+0xf8>
    2bac:	fe 01       	movw	r30, r28
    2bae:	32 96       	adiw	r30, 0x02	; 2
    2bb0:	84 91       	lpm	r24, Z
    2bb2:	81 11       	cpse	r24, r1
    2bb4:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    2bb8:	fe 01       	movw	r30, r28
    2bba:	33 96       	adiw	r30, 0x03	; 3
    2bbc:	84 91       	lpm	r24, Z
    2bbe:	31 96       	adiw	r30, 0x01	; 1
    2bc0:	e5 90       	lpm	r14, Z+
    2bc2:	f4 90       	lpm	r15, Z
    2bc4:	89 36       	cpi	r24, 0x69	; 105
    2bc6:	91 f0       	breq	.+36     	; 0x2bec <_ZL10print_listPK7Formatsh+0x5e>
    2bc8:	30 f4       	brcc	.+12     	; 0x2bd6 <_ZL10print_listPK7Formatsh+0x48>
    2bca:	81 36       	cpi	r24, 0x61	; 97
    2bcc:	09 f4       	brne	.+2      	; 0x2bd0 <_ZL10print_listPK7Formatsh+0x42>
    2bce:	3f c0       	rjmp	.+126    	; 0x2c4e <_ZL10print_listPK7Formatsh+0xc0>
    2bd0:	88 36       	cpi	r24, 0x68	; 104
    2bd2:	c1 f0       	breq	.+48     	; 0x2c04 <_ZL10print_listPK7Formatsh+0x76>
    2bd4:	04 c0       	rjmp	.+8      	; 0x2bde <_ZL10print_listPK7Formatsh+0x50>
    2bd6:	83 37       	cpi	r24, 0x73	; 115
    2bd8:	f1 f0       	breq	.+60     	; 0x2c16 <_ZL10print_listPK7Formatsh+0x88>
    2bda:	86 37       	cpi	r24, 0x76	; 118
    2bdc:	29 f1       	breq	.+74     	; 0x2c28 <_ZL10print_listPK7Formatsh+0x9a>
    2bde:	50 e2       	ldi	r21, 0x20	; 32
    2be0:	c5 2e       	mov	r12, r21
    2be2:	60 e0       	ldi	r22, 0x00	; 0
    2be4:	70 e0       	ldi	r23, 0x00	; 0
    2be6:	80 e8       	ldi	r24, 0x80	; 128
    2be8:	9f e3       	ldi	r25, 0x3F	; 63
    2bea:	3a c0       	rjmp	.+116    	; 0x2c60 <_ZL10print_listPK7Formatsh+0xd2>
    2bec:	f7 01       	movw	r30, r14
    2bee:	60 81       	ld	r22, Z
    2bf0:	71 81       	ldd	r23, Z+1	; 0x01
    2bf2:	07 2e       	mov	r0, r23
    2bf4:	00 0c       	add	r0, r0
    2bf6:	88 0b       	sbc	r24, r24
    2bf8:	99 0b       	sbc	r25, r25
    2bfa:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    2bfe:	40 e2       	ldi	r20, 0x20	; 32
    2c00:	c4 2e       	mov	r12, r20
    2c02:	35 c0       	rjmp	.+106    	; 0x2c6e <_ZL10print_listPK7Formatsh+0xe0>
    2c04:	e0 91 bd 06 	lds	r30, 0x06BD	; 0x8006bd <_ZL7measure>
    2c08:	f0 91 be 06 	lds	r31, 0x06BE	; 0x8006be <_ZL7measure+0x1>
    2c0c:	39 96       	adiw	r30, 0x09	; 9
    2c0e:	c4 90       	lpm	r12, Z
    2c10:	0e 94 d5 14 	call	0x29aa	; 0x29aa <_Z12get_converthv>
    2c14:	25 c0       	rjmp	.+74     	; 0x2c60 <_ZL10print_listPK7Formatsh+0xd2>
    2c16:	e0 91 bd 06 	lds	r30, 0x06BD	; 0x8006bd <_ZL7measure>
    2c1a:	f0 91 be 06 	lds	r31, 0x06BE	; 0x8006be <_ZL7measure+0x1>
    2c1e:	38 96       	adiw	r30, 0x08	; 8
    2c20:	c4 90       	lpm	r12, Z
    2c22:	0e 94 70 15 	call	0x2ae0	; 0x2ae0 <_Z12get_convertsv>
    2c26:	1c c0       	rjmp	.+56     	; 0x2c60 <_ZL10print_listPK7Formatsh+0xd2>
    2c28:	0e 94 d5 14 	call	0x29aa	; 0x29aa <_Z12get_converthv>
    2c2c:	20 91 c7 03 	lds	r18, 0x03C7	; 0x8003c7 <lflags+0x13>
    2c30:	21 11       	cpse	r18, r1
    2c32:	14 c0       	rjmp	.+40     	; 0x2c5c <_ZL10print_listPK7Formatsh+0xce>
    2c34:	e0 91 bd 06 	lds	r30, 0x06BD	; 0x8006bd <_ZL7measure>
    2c38:	f0 91 be 06 	lds	r31, 0x06BE	; 0x8006be <_ZL7measure+0x1>
    2c3c:	72 96       	adiw	r30, 0x12	; 18
    2c3e:	c4 90       	lpm	r12, Z
    2c40:	20 e0       	ldi	r18, 0x00	; 0
    2c42:	30 e0       	ldi	r19, 0x00	; 0
    2c44:	40 e7       	ldi	r20, 0x70	; 112
    2c46:	52 e4       	ldi	r21, 0x42	; 66
    2c48:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    2c4c:	09 c0       	rjmp	.+18     	; 0x2c60 <_ZL10print_listPK7Formatsh+0xd2>
    2c4e:	31 e4       	ldi	r19, 0x41	; 65
    2c50:	c3 2e       	mov	r12, r19
    2c52:	6a e0       	ldi	r22, 0x0A	; 10
    2c54:	77 ed       	ldi	r23, 0xD7	; 215
    2c56:	83 e2       	ldi	r24, 0x23	; 35
    2c58:	9c e3       	ldi	r25, 0x3C	; 60
    2c5a:	02 c0       	rjmp	.+4      	; 0x2c60 <_ZL10print_listPK7Formatsh+0xd2>
    2c5c:	28 e1       	ldi	r18, 0x18	; 24
    2c5e:	c2 2e       	mov	r12, r18
    2c60:	f7 01       	movw	r30, r14
    2c62:	20 81       	ld	r18, Z
    2c64:	31 81       	ldd	r19, Z+1	; 0x01
    2c66:	42 81       	ldd	r20, Z+2	; 0x02
    2c68:	53 81       	ldd	r21, Z+3	; 0x03
    2c6a:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    2c6e:	2c 2d       	mov	r18, r12
    2c70:	ab 01       	movw	r20, r22
    2c72:	bc 01       	movw	r22, r24
    2c74:	c8 01       	movw	r24, r16
    2c76:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    2c7a:	0e 94 37 0a 	call	0x146e	; 0x146e <_ZL6osd_nlv>
    2c7e:	27 96       	adiw	r28, 0x07	; 7
    2c80:	da 94       	dec	r13
    2c82:	d1 10       	cpse	r13, r1
    2c84:	8c cf       	rjmp	.-232    	; 0x2b9e <_ZL10print_listPK7Formatsh+0x10>
    2c86:	cd b7       	in	r28, 0x3d	; 61
    2c88:	de b7       	in	r29, 0x3e	; 62
    2c8a:	e8 e0       	ldi	r30, 0x08	; 8
    2c8c:	0c 94 8f 44 	jmp	0x891e	; 0x891e <__epilogue_restores__+0x14>

00002c90 <_ZL7panTune5Point>:
    2c90:	67 e0       	ldi	r22, 0x07	; 7
    2c92:	85 ed       	ldi	r24, 0xD5	; 213
    2c94:	93 e0       	ldi	r25, 0x03	; 3
    2c96:	0e 94 c7 15 	call	0x2b8e	; 0x2b8e <_ZL10print_listPK7Formatsh>
    2c9a:	08 95       	ret

00002c9c <_ZL8panFdata5Point>:
    2c9c:	cf 93       	push	r28
    2c9e:	df 93       	push	r29
    2ca0:	d8 2f       	mov	r29, r24
    2ca2:	c9 2f       	mov	r28, r25
    2ca4:	0e 94 3b 0a 	call	0x1476	; 0x1476 <_ZL12osd_setPanel5Point>
    2ca8:	88 e0       	ldi	r24, 0x08	; 8
    2caa:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    2cae:	60 91 9e 06 	lds	r22, 0x069E	; 0x80069e <_ZL23total_flight_time_milis>
    2cb2:	70 91 9f 06 	lds	r23, 0x069F	; 0x80069f <_ZL23total_flight_time_milis+0x1>
    2cb6:	80 91 a0 06 	lds	r24, 0x06A0	; 0x8006a0 <_ZL23total_flight_time_milis+0x2>
    2cba:	90 91 a1 06 	lds	r25, 0x06A1	; 0x8006a1 <_ZL23total_flight_time_milis+0x3>
    2cbe:	40 e0       	ldi	r20, 0x00	; 0
    2cc0:	0e 94 8c 0f 	call	0x1f18	; 0x1f18 <_ZL12printTimeCnvPmh.isra.9>
    2cc4:	6a e0       	ldi	r22, 0x0A	; 10
    2cc6:	87 e5       	ldi	r24, 0x57	; 87
    2cc8:	92 e0       	ldi	r25, 0x02	; 2
    2cca:	0e 94 c7 15 	call	0x2b8e	; 0x2b8e <_ZL10print_listPK7Formatsh>
    2cce:	c6 ff       	sbrs	r28, 6
    2cd0:	05 c0       	rjmp	.+10     	; 0x2cdc <_ZL8panFdata5Point+0x40>
    2cd2:	6c 2f       	mov	r22, r28
    2cd4:	8a e0       	ldi	r24, 0x0A	; 10
    2cd6:	8d 0f       	add	r24, r29
    2cd8:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    2cdc:	83 e0       	ldi	r24, 0x03	; 3
    2cde:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    2ce2:	65 e4       	ldi	r22, 0x45	; 69
    2ce4:	74 e0       	ldi	r23, 0x04	; 4
    2ce6:	80 e0       	ldi	r24, 0x00	; 0
    2ce8:	0e 94 cf 0f 	call	0x1f9e	; 0x1f9e <_ZL11print_coord5PointPf.isra.14>
    2cec:	0e 94 37 0a 	call	0x146e	; 0x146e <_ZL6osd_nlv>
    2cf0:	84 e0       	ldi	r24, 0x04	; 4
    2cf2:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    2cf6:	69 e4       	ldi	r22, 0x49	; 73
    2cf8:	74 e0       	ldi	r23, 0x04	; 4
    2cfa:	80 e0       	ldi	r24, 0x00	; 0
    2cfc:	0e 94 cf 0f 	call	0x1f9e	; 0x1f9e <_ZL11print_coord5PointPf.isra.14>
    2d00:	df 91       	pop	r29
    2d02:	cf 91       	pop	r28
    2d04:	08 95       	ret

00002d06 <_ZL7panWarn5Point>:
    2d06:	a0 e0       	ldi	r26, 0x00	; 0
    2d08:	b0 e0       	ldi	r27, 0x00	; 0
    2d0a:	e9 e8       	ldi	r30, 0x89	; 137
    2d0c:	f6 e1       	ldi	r31, 0x16	; 22
    2d0e:	0c 94 73 44 	jmp	0x88e6	; 0x88e6 <__prologue_saves__+0x14>
    2d12:	09 2f       	mov	r16, r25
    2d14:	80 91 ba 03 	lds	r24, 0x03BA	; 0x8003ba <lflags+0x6>
    2d18:	88 23       	and	r24, r24
    2d1a:	09 f4       	brne	.+2      	; 0x2d1e <_ZL7panWarn5Point+0x18>
    2d1c:	e9 c0       	rjmp	.+466    	; 0x2ef0 <_ZL7panWarn5Point+0x1ea>
    2d1e:	10 92 ba 03 	sts	0x03BA, r1	; 0x8003ba <lflags+0x6>
    2d22:	c0 90 74 06 	lds	r12, 0x0674	; 0x800674 <_ZL12osd_airspeed>
    2d26:	d0 90 75 06 	lds	r13, 0x0675	; 0x800675 <_ZL12osd_airspeed+0x1>
    2d2a:	e0 90 76 06 	lds	r14, 0x0676	; 0x800676 <_ZL12osd_airspeed+0x2>
    2d2e:	f0 90 77 06 	lds	r15, 0x0677	; 0x800677 <_ZL12osd_airspeed+0x3>
    2d32:	0e 94 70 15 	call	0x2ae0	; 0x2ae0 <_Z12get_convertsv>
    2d36:	a7 01       	movw	r20, r14
    2d38:	96 01       	movw	r18, r12
    2d3a:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    2d3e:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    2d42:	a0 91 bb 06 	lds	r26, 0x06BB	; 0x8006bb <_ZL10osd_vbat_A>
    2d46:	b0 91 bc 06 	lds	r27, 0x06BC	; 0x8006bc <_ZL10osd_vbat_A+0x1>
    2d4a:	80 91 c6 03 	lds	r24, 0x03C6	; 0x8003c6 <lflags+0x12>
    2d4e:	88 23       	and	r24, r24
    2d50:	49 f0       	breq	.+18     	; 0x2d64 <_ZL7panWarn5Point+0x5e>
    2d52:	81 e0       	ldi	r24, 0x01	; 1
    2d54:	90 e0       	ldi	r25, 0x00	; 0
    2d56:	20 91 8f 06 	lds	r18, 0x068F	; 0x80068f <_ZL12osd_fix_type>
    2d5a:	22 30       	cpi	r18, 0x02	; 2
    2d5c:	08 f0       	brcs	.+2      	; 0x2d60 <_ZL7panWarn5Point+0x5a>
    2d5e:	80 e0       	ldi	r24, 0x00	; 0
    2d60:	ec 01       	movw	r28, r24
    2d62:	02 c0       	rjmp	.+4      	; 0x2d68 <_ZL7panWarn5Point+0x62>
    2d64:	c0 e0       	ldi	r28, 0x00	; 0
    2d66:	d0 e0       	ldi	r29, 0x00	; 0
    2d68:	e0 91 5d 04 	lds	r30, 0x045D	; 0x80045d <sets+0x4>
    2d6c:	e1 11       	cpse	r30, r1
    2d6e:	0a c0       	rjmp	.+20     	; 0x2d84 <_ZL7panWarn5Point+0x7e>
    2d70:	20 91 61 04 	lds	r18, 0x0461	; 0x800461 <sets+0x8>
    2d74:	30 e0       	ldi	r19, 0x00	; 0
    2d76:	62 17       	cp	r22, r18
    2d78:	73 07       	cpc	r23, r19
    2d7a:	24 f4       	brge	.+8      	; 0x2d84 <_ZL7panWarn5Point+0x7e>
    2d7c:	80 91 bf 03 	lds	r24, 0x03BF	; 0x8003bf <lflags+0xb>
    2d80:	80 fd       	sbrc	r24, 0
    2d82:	c2 60       	ori	r28, 0x02	; 2
    2d84:	20 91 60 04 	lds	r18, 0x0460	; 0x800460 <sets+0x7>
    2d88:	22 23       	and	r18, r18
    2d8a:	29 f0       	breq	.+10     	; 0x2d96 <_ZL7panWarn5Point+0x90>
    2d8c:	30 e0       	ldi	r19, 0x00	; 0
    2d8e:	26 17       	cp	r18, r22
    2d90:	37 07       	cpc	r19, r23
    2d92:	0c f4       	brge	.+2      	; 0x2d96 <_ZL7panWarn5Point+0x90>
    2d94:	c4 60       	ori	r28, 0x04	; 4
    2d96:	30 91 b6 06 	lds	r19, 0x06B6	; 0x8006b6 <_ZL23osd_battery_remaining_A>
    2d9a:	20 91 b4 06 	lds	r18, 0x06B4	; 0x8006b4 <_ZL19max_battery_reading>
    2d9e:	40 91 62 04 	lds	r20, 0x0462	; 0x800462 <sets+0x9>
    2da2:	44 23       	and	r20, r20
    2da4:	69 f0       	breq	.+26     	; 0x2dc0 <_ZL7panWarn5Point+0xba>
    2da6:	cd 01       	movw	r24, r26
    2da8:	64 e6       	ldi	r22, 0x64	; 100
    2daa:	70 e0       	ldi	r23, 0x00	; 0
    2dac:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    2db0:	61 15       	cp	r22, r1
    2db2:	71 05       	cpc	r23, r1
    2db4:	29 f0       	breq	.+10     	; 0x2dc0 <_ZL7panWarn5Point+0xba>
    2db6:	84 2f       	mov	r24, r20
    2db8:	90 e0       	ldi	r25, 0x00	; 0
    2dba:	68 17       	cp	r22, r24
    2dbc:	79 07       	cpc	r23, r25
    2dbe:	e4 f0       	brlt	.+56     	; 0x2df8 <_ZL7panWarn5Point+0xf2>
    2dc0:	40 91 68 04 	lds	r20, 0x0468	; 0x800468 <sets+0xf>
    2dc4:	44 23       	and	r20, r20
    2dc6:	c9 f0       	breq	.+50     	; 0x2dfa <_ZL7panWarn5Point+0xf4>
    2dc8:	54 e6       	ldi	r21, 0x64	; 100
    2dca:	35 9f       	mul	r19, r21
    2dcc:	c0 01       	movw	r24, r0
    2dce:	11 24       	eor	r1, r1
    2dd0:	32 2f       	mov	r19, r18
    2dd2:	27 ff       	sbrs	r18, 7
    2dd4:	02 c0       	rjmp	.+4      	; 0x2dda <_ZL7panWarn5Point+0xd4>
    2dd6:	31 e0       	ldi	r19, 0x01	; 1
    2dd8:	32 0f       	add	r19, r18
    2dda:	35 95       	asr	r19
    2ddc:	83 0f       	add	r24, r19
    2dde:	91 1d       	adc	r25, r1
    2de0:	37 fd       	sbrc	r19, 7
    2de2:	9a 95       	dec	r25
    2de4:	62 2f       	mov	r22, r18
    2de6:	22 0f       	add	r18, r18
    2de8:	77 0b       	sbc	r23, r23
    2dea:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    2dee:	84 2f       	mov	r24, r20
    2df0:	90 e0       	ldi	r25, 0x00	; 0
    2df2:	68 17       	cp	r22, r24
    2df4:	79 07       	cpc	r23, r25
    2df6:	0c f4       	brge	.+2      	; 0x2dfa <_ZL7panWarn5Point+0xf4>
    2df8:	c8 60       	ori	r28, 0x08	; 8
    2dfa:	80 91 67 04 	lds	r24, 0x0467	; 0x800467 <sets+0xe>
    2dfe:	80 fd       	sbrc	r24, 0
    2e00:	0b c0       	rjmp	.+22     	; 0x2e18 <_ZL7panWarn5Point+0x112>
    2e02:	80 91 69 04 	lds	r24, 0x0469	; 0x800469 <sets+0x10>
    2e06:	90 e0       	ldi	r25, 0x00	; 0
    2e08:	20 91 2b 04 	lds	r18, 0x042B	; 0x80042b <rssi_norm>
    2e0c:	30 91 2c 04 	lds	r19, 0x042C	; 0x80042c <rssi_norm+0x1>
    2e10:	28 17       	cp	r18, r24
    2e12:	39 07       	cpc	r19, r25
    2e14:	08 f4       	brcc	.+2      	; 0x2e18 <_ZL7panWarn5Point+0x112>
    2e16:	c0 61       	ori	r28, 0x10	; 16
    2e18:	80 91 f6 06 	lds	r24, 0x06F6	; 0x8006f6 <_ZL14vertical_speed>
    2e1c:	90 91 f7 06 	lds	r25, 0x06F7	; 0x8006f7 <_ZL14vertical_speed+0x1>
    2e20:	a0 91 f8 06 	lds	r26, 0x06F8	; 0x8006f8 <_ZL14vertical_speed+0x2>
    2e24:	b0 91 f9 06 	lds	r27, 0x06F9	; 0x8006f9 <_ZL14vertical_speed+0x3>
    2e28:	e1 30       	cpi	r30, 0x01	; 1
    2e2a:	a1 f4       	brne	.+40     	; 0x2e54 <_ZL7panWarn5Point+0x14e>
    2e2c:	10 91 61 04 	lds	r17, 0x0461	; 0x800461 <sets+0x8>
    2e30:	11 23       	and	r17, r17
    2e32:	81 f0       	breq	.+32     	; 0x2e54 <_ZL7panWarn5Point+0x14e>
    2e34:	bc 01       	movw	r22, r24
    2e36:	cd 01       	movw	r24, r26
    2e38:	9f 77       	andi	r25, 0x7F	; 127
    2e3a:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    2e3e:	cb 01       	movw	r24, r22
    2e40:	6a e0       	ldi	r22, 0x0A	; 10
    2e42:	70 e0       	ldi	r23, 0x00	; 0
    2e44:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    2e48:	81 2f       	mov	r24, r17
    2e4a:	90 e0       	ldi	r25, 0x00	; 0
    2e4c:	86 17       	cp	r24, r22
    2e4e:	97 07       	cpc	r25, r23
    2e50:	0c f4       	brge	.+2      	; 0x2e54 <_ZL7panWarn5Point+0x14e>
    2e52:	c0 62       	ori	r28, 0x20	; 32
    2e54:	80 91 b9 06 	lds	r24, 0x06B9	; 0x8006b9 <_ZL10osd_vbat_B>
    2e58:	90 91 ba 06 	lds	r25, 0x06BA	; 0x8006ba <_ZL10osd_vbat_B+0x1>
    2e5c:	20 91 9b 04 	lds	r18, 0x049B	; 0x80049b <sets+0x42>
    2e60:	22 23       	and	r18, r18
    2e62:	69 f0       	breq	.+26     	; 0x2e7e <_ZL7panWarn5Point+0x178>
    2e64:	64 e6       	ldi	r22, 0x64	; 100
    2e66:	70 e0       	ldi	r23, 0x00	; 0
    2e68:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    2e6c:	61 15       	cp	r22, r1
    2e6e:	71 05       	cpc	r23, r1
    2e70:	31 f0       	breq	.+12     	; 0x2e7e <_ZL7panWarn5Point+0x178>
    2e72:	82 2f       	mov	r24, r18
    2e74:	90 e0       	ldi	r25, 0x00	; 0
    2e76:	68 17       	cp	r22, r24
    2e78:	79 07       	cpc	r23, r25
    2e7a:	0c f4       	brge	.+2      	; 0x2e7e <_ZL7panWarn5Point+0x178>
    2e7c:	c0 64       	ori	r28, 0x40	; 64
    2e7e:	06 ff       	sbrs	r16, 6
    2e80:	0e c0       	rjmp	.+28     	; 0x2e9e <_ZL7panWarn5Point+0x198>
    2e82:	80 91 5a 06 	lds	r24, 0x065A	; 0x80065a <_ZL16mav_fence_status>
    2e86:	81 30       	cpi	r24, 0x01	; 1
    2e88:	11 f4       	brne	.+4      	; 0x2e8e <_ZL7panWarn5Point+0x188>
    2e8a:	c0 68       	ori	r28, 0x80	; 128
    2e8c:	0d c0       	rjmp	.+26     	; 0x2ea8 <_ZL7panWarn5Point+0x1a2>
    2e8e:	82 30       	cpi	r24, 0x02	; 2
    2e90:	11 f4       	brne	.+4      	; 0x2e96 <_ZL7panWarn5Point+0x190>
    2e92:	d1 60       	ori	r29, 0x01	; 1
    2e94:	09 c0       	rjmp	.+18     	; 0x2ea8 <_ZL7panWarn5Point+0x1a2>
    2e96:	83 30       	cpi	r24, 0x03	; 3
    2e98:	11 f4       	brne	.+4      	; 0x2e9e <_ZL7panWarn5Point+0x198>
    2e9a:	d2 60       	ori	r29, 0x02	; 2
    2e9c:	05 c0       	rjmp	.+10     	; 0x2ea8 <_ZL7panWarn5Point+0x1a2>
    2e9e:	20 97       	sbiw	r28, 0x00	; 0
    2ea0:	19 f4       	brne	.+6      	; 0x2ea8 <_ZL7panWarn5Point+0x1a2>
    2ea2:	10 92 3b 03 	sts	0x033B, r1	; 0x80033b <warning>
    2ea6:	24 c0       	rjmp	.+72     	; 0x2ef0 <_ZL7panWarn5Point+0x1ea>
    2ea8:	90 91 3b 03 	lds	r25, 0x033B	; 0x80033b <warning>
    2eac:	81 e0       	ldi	r24, 0x01	; 1
    2eae:	91 11       	cpse	r25, r1
    2eb0:	89 0f       	add	r24, r25
    2eb2:	80 93 3b 03 	sts	0x033B, r24	; 0x80033b <warning>
    2eb6:	80 91 3b 03 	lds	r24, 0x033B	; 0x80033b <warning>
    2eba:	4f ef       	ldi	r20, 0xFF	; 255
    2ebc:	48 0f       	add	r20, r24
    2ebe:	21 e0       	ldi	r18, 0x01	; 1
    2ec0:	30 e0       	ldi	r19, 0x00	; 0
    2ec2:	02 c0       	rjmp	.+4      	; 0x2ec8 <_ZL7panWarn5Point+0x1c2>
    2ec4:	22 0f       	add	r18, r18
    2ec6:	33 1f       	adc	r19, r19
    2ec8:	4a 95       	dec	r20
    2eca:	e2 f7       	brpl	.-8      	; 0x2ec4 <_ZL7panWarn5Point+0x1be>
    2ecc:	8b 30       	cpi	r24, 0x0B	; 11
    2ece:	18 f0       	brcs	.+6      	; 0x2ed6 <_ZL7panWarn5Point+0x1d0>
    2ed0:	81 e0       	ldi	r24, 0x01	; 1
    2ed2:	21 e0       	ldi	r18, 0x01	; 1
    2ed4:	30 e0       	ldi	r19, 0x00	; 0
    2ed6:	a9 01       	movw	r20, r18
    2ed8:	4c 23       	and	r20, r28
    2eda:	5d 23       	and	r21, r29
    2edc:	45 2b       	or	r20, r21
    2ede:	21 f4       	brne	.+8      	; 0x2ee8 <_ZL7panWarn5Point+0x1e2>
    2ee0:	8f 5f       	subi	r24, 0xFF	; 255
    2ee2:	22 0f       	add	r18, r18
    2ee4:	33 1f       	adc	r19, r19
    2ee6:	f2 cf       	rjmp	.-28     	; 0x2ecc <_ZL7panWarn5Point+0x1c6>
    2ee8:	80 93 3b 03 	sts	0x033B, r24	; 0x80033b <warning>
    2eec:	89 17       	cp	r24, r25
    2eee:	c9 f2       	breq	.-78     	; 0x2ea2 <_ZL7panWarn5Point+0x19c>
    2ef0:	e0 91 3b 03 	lds	r30, 0x033B	; 0x80033b <warning>
    2ef4:	ee 23       	and	r30, r30
    2ef6:	49 f0       	breq	.+18     	; 0x2f0a <_ZL7panWarn5Point+0x204>
    2ef8:	f0 e0       	ldi	r31, 0x00	; 0
    2efa:	ee 0f       	add	r30, r30
    2efc:	ff 1f       	adc	r31, r31
    2efe:	e9 56       	subi	r30, 0x69	; 105
    2f00:	f6 4f       	sbci	r31, 0xF6	; 246
    2f02:	85 91       	lpm	r24, Z+
    2f04:	94 91       	lpm	r25, Z
    2f06:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    2f0a:	cd b7       	in	r28, 0x3d	; 61
    2f0c:	de b7       	in	r29, 0x3e	; 62
    2f0e:	e8 e0       	ldi	r30, 0x08	; 8
    2f10:	0c 94 8f 44 	jmp	0x891e	; 0x891e <__epilogue_restores__+0x14>

00002f14 <_Z9f_div1000f>:
    2f14:	2f e6       	ldi	r18, 0x6F	; 111
    2f16:	32 e1       	ldi	r19, 0x12	; 18
    2f18:	43 e8       	ldi	r20, 0x83	; 131
    2f1a:	5a e3       	ldi	r21, 0x3A	; 58
    2f1c:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    2f20:	08 95       	ret

00002f22 <_ZL13panRadarScale5Point>:
    2f22:	cf 92       	push	r12
    2f24:	df 92       	push	r13
    2f26:	ef 92       	push	r14
    2f28:	ff 92       	push	r15
    2f2a:	cf 93       	push	r28
    2f2c:	df 93       	push	r29
    2f2e:	c0 91 0b 05 	lds	r28, 0x050B	; 0x80050b <_ZL10radar_zoom>
    2f32:	d0 91 0c 05 	lds	r29, 0x050C	; 0x80050c <_ZL10radar_zoom+0x1>
    2f36:	0e 94 d5 14 	call	0x29aa	; 0x29aa <_Z12get_converthv>
    2f3a:	6b 01       	movw	r12, r22
    2f3c:	7c 01       	movw	r14, r24
    2f3e:	2a ef       	ldi	r18, 0xFA	; 250
    2f40:	2c 9f       	mul	r18, r28
    2f42:	c0 01       	movw	r24, r0
    2f44:	2d 9f       	mul	r18, r29
    2f46:	90 0d       	add	r25, r0
    2f48:	11 24       	eor	r1, r1
    2f4a:	bc 01       	movw	r22, r24
    2f4c:	99 0f       	add	r25, r25
    2f4e:	88 0b       	sbc	r24, r24
    2f50:	99 0b       	sbc	r25, r25
    2f52:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    2f56:	9b 01       	movw	r18, r22
    2f58:	ac 01       	movw	r20, r24
    2f5a:	c7 01       	movw	r24, r14
    2f5c:	b6 01       	movw	r22, r12
    2f5e:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    2f62:	e0 91 bd 06 	lds	r30, 0x06BD	; 0x8006bd <_ZL7measure>
    2f66:	f0 91 be 06 	lds	r31, 0x06BE	; 0x8006be <_ZL7measure+0x1>
    2f6a:	a8 97       	sbiw	r28, 0x28	; 40
    2f6c:	54 f0       	brlt	.+20     	; 0x2f82 <_ZL13panRadarScale5Point+0x60>
    2f6e:	3f 96       	adiw	r30, 0x0f	; 15
    2f70:	c4 91       	lpm	r28, Z
    2f72:	0e 94 8a 17 	call	0x2f14	; 0x2f14 <_Z9f_div1000f>
    2f76:	ab 01       	movw	r20, r22
    2f78:	bc 01       	movw	r22, r24
    2f7a:	2c 2f       	mov	r18, r28
    2f7c:	8c e2       	ldi	r24, 0x2C	; 44
    2f7e:	9a e0       	ldi	r25, 0x0A	; 10
    2f80:	06 c0       	rjmp	.+12     	; 0x2f8e <_ZL13panRadarScale5Point+0x6c>
    2f82:	39 96       	adiw	r30, 0x09	; 9
    2f84:	24 91       	lpm	r18, Z
    2f86:	ab 01       	movw	r20, r22
    2f88:	bc 01       	movw	r22, r24
    2f8a:	80 e2       	ldi	r24, 0x20	; 32
    2f8c:	9a e0       	ldi	r25, 0x0A	; 10
    2f8e:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    2f92:	df 91       	pop	r29
    2f94:	cf 91       	pop	r28
    2f96:	ff 90       	pop	r15
    2f98:	ef 90       	pop	r14
    2f9a:	df 90       	pop	r13
    2f9c:	cf 90       	pop	r12
    2f9e:	08 95       	ret

00002fa0 <_ZL9printVoltjh>:
    2fa0:	cf 93       	push	r28
    2fa2:	df 93       	push	r29
    2fa4:	61 11       	cpse	r22, r1
    2fa6:	03 c0       	rjmp	.+6      	; 0x2fae <_ZL9printVoltjh+0xe>
    2fa8:	c2 e3       	ldi	r28, 0x32	; 50
    2faa:	da e0       	ldi	r29, 0x0A	; 10
    2fac:	02 c0       	rjmp	.+4      	; 0x2fb2 <_ZL9printVoltjh+0x12>
    2fae:	c6 e2       	ldi	r28, 0x26	; 38
    2fb0:	da e0       	ldi	r29, 0x0A	; 10
    2fb2:	bc 01       	movw	r22, r24
    2fb4:	80 e0       	ldi	r24, 0x00	; 0
    2fb6:	90 e0       	ldi	r25, 0x00	; 0
    2fb8:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    2fbc:	0e 94 8a 17 	call	0x2f14	; 0x2f14 <_Z9f_div1000f>
    2fc0:	ab 01       	movw	r20, r22
    2fc2:	bc 01       	movw	r22, r24
    2fc4:	2d e0       	ldi	r18, 0x0D	; 13
    2fc6:	ce 01       	movw	r24, r28
    2fc8:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    2fcc:	df 91       	pop	r29
    2fce:	cf 91       	pop	r28
    2fd0:	08 95       	ret

00002fd2 <_ZL6panAlt5Point>:
    2fd2:	0f 93       	push	r16
    2fd4:	1f 93       	push	r17
    2fd6:	29 2f       	mov	r18, r25
    2fd8:	20 74       	andi	r18, 0x40	; 64
    2fda:	95 ff       	sbrs	r25, 5
    2fdc:	15 c0       	rjmp	.+42     	; 0x3008 <_ZL6panAlt5Point+0x36>
    2fde:	60 91 7c 06 	lds	r22, 0x067C	; 0x80067c <_ZL11osd_alt_mav>
    2fe2:	70 91 7d 06 	lds	r23, 0x067D	; 0x80067d <_ZL11osd_alt_mav+0x1>
    2fe6:	80 91 7e 06 	lds	r24, 0x067E	; 0x80067e <_ZL11osd_alt_mav+0x2>
    2fea:	90 91 7f 06 	lds	r25, 0x067F	; 0x80067f <_ZL11osd_alt_mav+0x3>
    2fee:	22 23       	and	r18, r18
    2ff0:	29 f1       	breq	.+74     	; 0x303c <_ZL6panAlt5Point+0x6a>
    2ff2:	20 91 78 06 	lds	r18, 0x0678	; 0x800678 <_ZL12home_alt_mav>
    2ff6:	30 91 79 06 	lds	r19, 0x0679	; 0x800679 <_ZL12home_alt_mav+0x1>
    2ffa:	40 91 7a 06 	lds	r20, 0x067A	; 0x80067a <_ZL12home_alt_mav+0x2>
    2ffe:	50 91 7b 06 	lds	r21, 0x067B	; 0x80067b <_ZL12home_alt_mav+0x3>
    3002:	0e 94 b7 3f 	call	0x7f6e	; 0x7f6e <__subsf3>
    3006:	1a c0       	rjmp	.+52     	; 0x303c <_ZL6panAlt5Point+0x6a>
    3008:	60 91 4d 04 	lds	r22, 0x044D	; 0x80044d <osd_pos+0x8>
    300c:	70 91 4e 04 	lds	r23, 0x044E	; 0x80044e <osd_pos+0x9>
    3010:	80 91 4f 04 	lds	r24, 0x044F	; 0x80044f <osd_pos+0xa>
    3014:	90 91 50 04 	lds	r25, 0x0450	; 0x800450 <osd_pos+0xb>
    3018:	22 23       	and	r18, r18
    301a:	61 f0       	breq	.+24     	; 0x3034 <_ZL6panAlt5Point+0x62>
    301c:	00 91 41 04 	lds	r16, 0x0441	; 0x800441 <osd_home+0x8>
    3020:	10 91 42 04 	lds	r17, 0x0442	; 0x800442 <osd_home+0x9>
    3024:	20 91 43 04 	lds	r18, 0x0443	; 0x800443 <osd_home+0xa>
    3028:	30 91 44 04 	lds	r19, 0x0444	; 0x800444 <osd_home+0xb>
    302c:	60 1b       	sub	r22, r16
    302e:	71 0b       	sbc	r23, r17
    3030:	82 0b       	sbc	r24, r18
    3032:	93 0b       	sbc	r25, r19
    3034:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    3038:	0e 94 8a 17 	call	0x2f14	; 0x2f14 <_Z9f_div1000f>
    303c:	0e 94 df 14 	call	0x29be	; 0x29be <_ZL13printFullDistf>
    3040:	1f 91       	pop	r17
    3042:	0f 91       	pop	r16
    3044:	08 95       	ret

00003046 <_Z17mav_message_starthh>:
    3046:	20 91 63 06 	lds	r18, 0x0663	; 0x800663 <_ZL7seconds>
    304a:	30 91 64 06 	lds	r19, 0x0664	; 0x800664 <_ZL7seconds+0x1>
    304e:	26 0f       	add	r18, r22
    3050:	31 1d       	adc	r19, r1
    3052:	30 93 f5 03 	sts	0x03F5, r19	; 0x8003f5 <mav_msg_ttl+0x1>
    3056:	20 93 f4 03 	sts	0x03F4, r18	; 0x8003f4 <mav_msg_ttl>
    305a:	80 93 f3 03 	sts	0x03F3, r24	; 0x8003f3 <mav_msg_len>
    305e:	80 91 31 04 	lds	r24, 0x0431	; 0x800431 <count02s>
    3062:	80 93 f1 03 	sts	0x03F1, r24	; 0x8003f1 <mav_msg_shift>
    3066:	08 95       	ret

00003068 <_Z15normalize_anglei>:
    3068:	97 ff       	sbrs	r25, 7
    306a:	03 c0       	rjmp	.+6      	; 0x3072 <_Z15normalize_anglei+0xa>
    306c:	88 59       	subi	r24, 0x98	; 152
    306e:	9e 4f       	sbci	r25, 0xFE	; 254
    3070:	08 95       	ret
    3072:	89 36       	cpi	r24, 0x69	; 105
    3074:	21 e0       	ldi	r18, 0x01	; 1
    3076:	92 07       	cpc	r25, r18
    3078:	14 f0       	brlt	.+4      	; 0x307e <_Z15normalize_anglei+0x16>
    307a:	88 56       	subi	r24, 0x68	; 104
    307c:	91 40       	sbci	r25, 0x01	; 1
    307e:	08 95       	ret

00003080 <_Z10time_sincePm>:
    3080:	cf 93       	push	r28
    3082:	df 93       	push	r29
    3084:	ec 01       	movw	r28, r24
    3086:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    308a:	28 81       	ld	r18, Y
    308c:	39 81       	ldd	r19, Y+1	; 0x01
    308e:	cb 01       	movw	r24, r22
    3090:	82 1b       	sub	r24, r18
    3092:	93 0b       	sbc	r25, r19
    3094:	df 91       	pop	r29
    3096:	cf 91       	pop	r28
    3098:	08 95       	ret

0000309a <_Z15get_switch_timeh>:
    309a:	20 91 65 04 	lds	r18, 0x0465	; 0x800465 <sets+0xc>
    309e:	30 91 66 04 	lds	r19, 0x0466	; 0x800466 <sets+0xd>
    30a2:	81 50       	subi	r24, 0x01	; 1
    30a4:	18 f4       	brcc	.+6      	; 0x30ac <_Z15get_switch_timeh+0x12>
    30a6:	82 2f       	mov	r24, r18
    30a8:	8f 70       	andi	r24, 0x0F	; 15
    30aa:	08 95       	ret
    30ac:	94 e0       	ldi	r25, 0x04	; 4
    30ae:	36 95       	lsr	r19
    30b0:	27 95       	ror	r18
    30b2:	9a 95       	dec	r25
    30b4:	e1 f7       	brne	.-8      	; 0x30ae <_Z15get_switch_timeh+0x14>
    30b6:	f5 cf       	rjmp	.-22     	; 0x30a2 <_Z15get_switch_timeh+0x8>

000030b8 <_Z14doScreenSwitchv>:
    30b8:	81 e0       	ldi	r24, 0x01	; 1
    30ba:	80 93 b4 03 	sts	0x03B4, r24	; 0x8003b4 <lflags>
    30be:	88 e0       	ldi	r24, 0x08	; 8
    30c0:	e6 e4       	ldi	r30, 0x46	; 70
    30c2:	f6 e0       	ldi	r31, 0x06	; 6
    30c4:	df 01       	movw	r26, r30
    30c6:	1d 92       	st	X+, r1
    30c8:	8a 95       	dec	r24
    30ca:	e9 f7       	brne	.-6      	; 0x30c6 <_Z14doScreenSwitchv+0xe>
    30cc:	80 e0       	ldi	r24, 0x00	; 0
    30ce:	0e 94 92 14 	call	0x2924	; 0x2924 <_Z9readPanelh>
    30d2:	90 93 ad 03 	sts	0x03AD, r25	; 0x8003ad <screen_flags+0x1>
    30d6:	80 93 ac 03 	sts	0x03AC, r24	; 0x8003ac <screen_flags>
    30da:	08 95       	ret

000030dc <_Z12grad_to_secti>:
    30dc:	24 e0       	ldi	r18, 0x04	; 4
    30de:	88 0f       	add	r24, r24
    30e0:	99 1f       	adc	r25, r25
    30e2:	2a 95       	dec	r18
    30e4:	e1 f7       	brne	.-8      	; 0x30de <_Z12grad_to_secti+0x2>
    30e6:	8c 54       	subi	r24, 0x4C	; 76
    30e8:	9f 4f       	sbci	r25, 0xFF	; 255
    30ea:	68 e6       	ldi	r22, 0x68	; 104
    30ec:	71 e0       	ldi	r23, 0x01	; 1
    30ee:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    30f2:	cb 01       	movw	r24, r22
    30f4:	01 96       	adiw	r24, 0x01	; 1
    30f6:	08 95       	ret

000030f8 <_ZL8panWPDis5Point>:
    30f8:	cf 92       	push	r12
    30fa:	df 92       	push	r13
    30fc:	ef 92       	push	r14
    30fe:	ff 92       	push	r15
    3100:	1f 93       	push	r17
    3102:	cf 93       	push	r28
    3104:	df 93       	push	r29
    3106:	c0 91 d1 06 	lds	r28, 0x06D1	; 0x8006d1 <_ZL12xtrack_error>
    310a:	d0 91 d2 06 	lds	r29, 0x06D2	; 0x8006d2 <_ZL12xtrack_error+0x1>
    310e:	c8 3e       	cpi	r28, 0xE8	; 232
    3110:	83 e0       	ldi	r24, 0x03	; 3
    3112:	d8 07       	cpc	r29, r24
    3114:	3c f4       	brge	.+14     	; 0x3124 <_ZL8panWPDis5Point+0x2c>
    3116:	c9 31       	cpi	r28, 0x19	; 25
    3118:	8c ef       	ldi	r24, 0xFC	; 252
    311a:	d8 07       	cpc	r29, r24
    311c:	2c f4       	brge	.+10     	; 0x3128 <_ZL8panWPDis5Point+0x30>
    311e:	c9 e1       	ldi	r28, 0x19	; 25
    3120:	dc ef       	ldi	r29, 0xFC	; 252
    3122:	02 c0       	rjmp	.+4      	; 0x3128 <_ZL8panWPDis5Point+0x30>
    3124:	c7 ee       	ldi	r28, 0xE7	; 231
    3126:	d3 e0       	ldi	r29, 0x03	; 3
    3128:	e0 91 bd 06 	lds	r30, 0x06BD	; 0x8006bd <_ZL7measure>
    312c:	f0 91 be 06 	lds	r31, 0x06BE	; 0x8006be <_ZL7measure+0x1>
    3130:	39 96       	adiw	r30, 0x09	; 9
    3132:	14 91       	lpm	r17, Z
    3134:	60 91 e3 06 	lds	r22, 0x06E3	; 0x8006e3 <_ZL9wp_number>
    3138:	70 e0       	ldi	r23, 0x00	; 0
    313a:	88 e3       	ldi	r24, 0x38	; 56
    313c:	9a e0       	ldi	r25, 0x0A	; 10
    313e:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    3142:	0e 94 33 0a 	call	0x1466	; 0x1466 <_ZL9osd_blankv>
    3146:	60 91 e4 06 	lds	r22, 0x06E4	; 0x8006e4 <_ZL7wp_dist>
    314a:	70 91 e5 06 	lds	r23, 0x06E5	; 0x8006e5 <_ZL7wp_dist+0x1>
    314e:	80 e0       	ldi	r24, 0x00	; 0
    3150:	90 e0       	ldi	r25, 0x00	; 0
    3152:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    3156:	6b 01       	movw	r12, r22
    3158:	7c 01       	movw	r14, r24
    315a:	0e 94 d5 14 	call	0x29aa	; 0x29aa <_Z12get_converthv>
    315e:	a7 01       	movw	r20, r14
    3160:	96 01       	movw	r18, r12
    3162:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    3166:	ab 01       	movw	r20, r22
    3168:	bc 01       	movw	r22, r24
    316a:	21 2f       	mov	r18, r17
    316c:	80 e2       	ldi	r24, 0x20	; 32
    316e:	9a e0       	ldi	r25, 0x0A	; 10
    3170:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    3174:	0e 94 37 0a 	call	0x146e	; 0x146e <_ZL6osd_nlv>
    3178:	80 91 e6 06 	lds	r24, 0x06E6	; 0x8006e6 <_ZL17wp_target_bearing>
    317c:	90 91 e7 06 	lds	r25, 0x06E7	; 0x8006e7 <_ZL17wp_target_bearing+0x1>
    3180:	0e 94 34 18 	call	0x3068	; 0x3068 <_Z15normalize_anglei>
    3184:	20 91 80 06 	lds	r18, 0x0680	; 0x800680 <_ZL11osd_heading>
    3188:	30 91 81 06 	lds	r19, 0x0681	; 0x800681 <_ZL11osd_heading+0x1>
    318c:	82 1b       	sub	r24, r18
    318e:	93 0b       	sbc	r25, r19
    3190:	0e 94 6e 18 	call	0x30dc	; 0x30dc <_Z12grad_to_secti>
    3194:	0e 94 1a 0a 	call	0x1434	; 0x1434 <_ZL9showArrowh>
    3198:	8f e7       	ldi	r24, 0x7F	; 127
    319a:	93 e0       	ldi	r25, 0x03	; 3
    319c:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    31a0:	0e 94 d5 14 	call	0x29aa	; 0x29aa <_Z12get_converthv>
    31a4:	6b 01       	movw	r12, r22
    31a6:	7c 01       	movw	r14, r24
    31a8:	be 01       	movw	r22, r28
    31aa:	dd 0f       	add	r29, r29
    31ac:	88 0b       	sbc	r24, r24
    31ae:	99 0b       	sbc	r25, r25
    31b0:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    31b4:	a7 01       	movw	r20, r14
    31b6:	96 01       	movw	r18, r12
    31b8:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    31bc:	ab 01       	movw	r20, r22
    31be:	bc 01       	movw	r22, r24
    31c0:	21 2f       	mov	r18, r17
    31c2:	80 e2       	ldi	r24, 0x20	; 32
    31c4:	9a e0       	ldi	r25, 0x0A	; 10
    31c6:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    31ca:	df 91       	pop	r29
    31cc:	cf 91       	pop	r28
    31ce:	1f 91       	pop	r17
    31d0:	ff 90       	pop	r15
    31d2:	ef 90       	pop	r14
    31d4:	df 90       	pop	r13
    31d6:	cf 90       	pop	r12
    31d8:	08 95       	ret

000031da <_ZL6panCOG5Point>:
    31da:	80 91 8d 06 	lds	r24, 0x068D	; 0x80068d <_ZL7osd_cog>
    31de:	90 91 8e 06 	lds	r25, 0x068E	; 0x80068e <_ZL7osd_cog+0x1>
    31e2:	c2 96       	adiw	r24, 0x32	; 50
    31e4:	64 e6       	ldi	r22, 0x64	; 100
    31e6:	70 e0       	ldi	r23, 0x00	; 0
    31e8:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    31ec:	20 91 80 06 	lds	r18, 0x0680	; 0x800680 <_ZL11osd_heading>
    31f0:	30 91 81 06 	lds	r19, 0x0681	; 0x800681 <_ZL11osd_heading+0x1>
    31f4:	cb 01       	movw	r24, r22
    31f6:	82 1b       	sub	r24, r18
    31f8:	93 0b       	sbc	r25, r19
    31fa:	0e 94 34 18 	call	0x3068	; 0x3068 <_Z15normalize_anglei>
    31fe:	84 5b       	subi	r24, 0xB4	; 180
    3200:	91 09       	sbc	r25, r1
    3202:	90 93 8c 06 	sts	0x068C, r25	; 0x80068c <_ZL10off_course+0x1>
    3206:	80 93 8b 06 	sts	0x068B, r24	; 0x80068b <_ZL10off_course>
    320a:	0e 94 6e 18 	call	0x30dc	; 0x30dc <_Z12grad_to_secti>
    320e:	88 5f       	subi	r24, 0xF8	; 248
    3210:	0e 94 1a 0a 	call	0x1434	; 0x1434 <_ZL9showArrowh>
    3214:	60 91 8b 06 	lds	r22, 0x068B	; 0x80068b <_ZL10off_course>
    3218:	70 91 8c 06 	lds	r23, 0x068C	; 0x80068c <_ZL10off_course+0x1>
    321c:	80 e3       	ldi	r24, 0x30	; 48
    321e:	93 e0       	ldi	r25, 0x03	; 3
    3220:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    3224:	08 95       	ret

00003226 <_Z8calc_maxRff>:
    3226:	cf 92       	push	r12
    3228:	df 92       	push	r13
    322a:	ef 92       	push	r14
    322c:	ff 92       	push	r15
    322e:	cf 93       	push	r28
    3230:	df 93       	push	r29
    3232:	ec 01       	movw	r28, r24
    3234:	6a 01       	movw	r12, r20
    3236:	7b 01       	movw	r14, r22
    3238:	9a 01       	movw	r18, r20
    323a:	ab 01       	movw	r20, r22
    323c:	68 81       	ld	r22, Y
    323e:	79 81       	ldd	r23, Y+1	; 0x01
    3240:	8a 81       	ldd	r24, Y+2	; 0x02
    3242:	9b 81       	ldd	r25, Y+3	; 0x03
    3244:	0e 94 96 40 	call	0x812c	; 0x812c <__cmpsf2>
    3248:	87 ff       	sbrs	r24, 7
    324a:	04 c0       	rjmp	.+8      	; 0x3254 <_Z8calc_maxRff+0x2e>
    324c:	c8 82       	st	Y, r12
    324e:	d9 82       	std	Y+1, r13	; 0x01
    3250:	ea 82       	std	Y+2, r14	; 0x02
    3252:	fb 82       	std	Y+3, r15	; 0x03
    3254:	df 91       	pop	r29
    3256:	cf 91       	pop	r28
    3258:	ff 90       	pop	r15
    325a:	ef 90       	pop	r14
    325c:	df 90       	pop	r13
    325e:	cf 90       	pop	r12
    3260:	08 95       	ret

00003262 <_Z6filterRffh>:
    3262:	8f 92       	push	r8
    3264:	9f 92       	push	r9
    3266:	af 92       	push	r10
    3268:	bf 92       	push	r11
    326a:	cf 92       	push	r12
    326c:	df 92       	push	r13
    326e:	ef 92       	push	r14
    3270:	ff 92       	push	r15
    3272:	0f 93       	push	r16
    3274:	1f 93       	push	r17
    3276:	cf 93       	push	r28
    3278:	8c 01       	movw	r16, r24
    327a:	4a 01       	movw	r8, r20
    327c:	5b 01       	movw	r10, r22
    327e:	c2 2f       	mov	r28, r18
    3280:	fc 01       	movw	r30, r24
    3282:	c0 80       	ld	r12, Z
    3284:	d1 80       	ldd	r13, Z+1	; 0x01
    3286:	e2 80       	ldd	r14, Z+2	; 0x02
    3288:	f3 80       	ldd	r15, Z+3	; 0x03
    328a:	20 e0       	ldi	r18, 0x00	; 0
    328c:	30 e0       	ldi	r19, 0x00	; 0
    328e:	a9 01       	movw	r20, r18
    3290:	c7 01       	movw	r24, r14
    3292:	b6 01       	movw	r22, r12
    3294:	0e 94 96 40 	call	0x812c	; 0x812c <__cmpsf2>
    3298:	88 23       	and	r24, r24
    329a:	11 f0       	breq	.+4      	; 0x32a0 <_Z6filterRffh+0x3e>
    329c:	c2 30       	cpi	r28, 0x02	; 2
    329e:	30 f4       	brcc	.+12     	; 0x32ac <_Z6filterRffh+0x4a>
    32a0:	f8 01       	movw	r30, r16
    32a2:	80 82       	st	Z, r8
    32a4:	91 82       	std	Z+1, r9	; 0x01
    32a6:	a2 82       	std	Z+2, r10	; 0x02
    32a8:	b3 82       	std	Z+3, r11	; 0x03
    32aa:	1d c0       	rjmp	.+58     	; 0x32e6 <_Z6filterRffh+0x84>
    32ac:	a7 01       	movw	r20, r14
    32ae:	96 01       	movw	r18, r12
    32b0:	c5 01       	movw	r24, r10
    32b2:	b4 01       	movw	r22, r8
    32b4:	0e 94 b7 3f 	call	0x7f6e	; 0x7f6e <__subsf3>
    32b8:	4b 01       	movw	r8, r22
    32ba:	5c 01       	movw	r10, r24
    32bc:	6c 2f       	mov	r22, r28
    32be:	70 e0       	ldi	r23, 0x00	; 0
    32c0:	80 e0       	ldi	r24, 0x00	; 0
    32c2:	90 e0       	ldi	r25, 0x00	; 0
    32c4:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    32c8:	9b 01       	movw	r18, r22
    32ca:	ac 01       	movw	r20, r24
    32cc:	c5 01       	movw	r24, r10
    32ce:	b4 01       	movw	r22, r8
    32d0:	0e 94 a0 40 	call	0x8140	; 0x8140 <__divsf3>
    32d4:	a7 01       	movw	r20, r14
    32d6:	96 01       	movw	r18, r12
    32d8:	0e 94 b8 3f 	call	0x7f70	; 0x7f70 <__addsf3>
    32dc:	f8 01       	movw	r30, r16
    32de:	60 83       	st	Z, r22
    32e0:	71 83       	std	Z+1, r23	; 0x01
    32e2:	82 83       	std	Z+2, r24	; 0x02
    32e4:	93 83       	std	Z+3, r25	; 0x03
    32e6:	cf 91       	pop	r28
    32e8:	1f 91       	pop	r17
    32ea:	0f 91       	pop	r16
    32ec:	ff 90       	pop	r15
    32ee:	ef 90       	pop	r14
    32f0:	df 90       	pop	r13
    32f2:	cf 90       	pop	r12
    32f4:	bf 90       	pop	r11
    32f6:	af 90       	pop	r10
    32f8:	9f 90       	pop	r9
    32fa:	8f 90       	pop	r8
    32fc:	08 95       	ret

000032fe <_ZL9panBatt_B5Point>:
    32fe:	cf 93       	push	r28
    3300:	df 93       	push	r29
    3302:	97 fd       	sbrc	r25, 7
    3304:	29 c0       	rjmp	.+82     	; 0x3358 <_ZL9panBatt_B5Point+0x5a>
    3306:	c9 2f       	mov	r28, r25
    3308:	91 e0       	ldi	r25, 0x01	; 1
    330a:	90 93 d0 03 	sts	0x03D0, r25	; 0x8003d0 <lflags+0x1c>
    330e:	9c 2f       	mov	r25, r28
    3310:	0e 94 1d 14 	call	0x283a	; 0x283a <_Z14get_alt_filter5Point>
    3314:	d8 2f       	mov	r29, r24
    3316:	60 91 b9 06 	lds	r22, 0x06B9	; 0x8006b9 <_ZL10osd_vbat_B>
    331a:	70 91 ba 06 	lds	r23, 0x06BA	; 0x8006ba <_ZL10osd_vbat_B+0x1>
    331e:	80 e0       	ldi	r24, 0x00	; 0
    3320:	90 e0       	ldi	r25, 0x00	; 0
    3322:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    3326:	ab 01       	movw	r20, r22
    3328:	bc 01       	movw	r22, r24
    332a:	2d 2f       	mov	r18, r29
    332c:	8b ee       	ldi	r24, 0xEB	; 235
    332e:	94 e0       	ldi	r25, 0x04	; 4
    3330:	0e 94 31 19 	call	0x3262	; 0x3262 <_Z6filterRffh>
    3334:	c2 95       	swap	r28
    3336:	c1 70       	andi	r28, 0x01	; 1
    3338:	60 91 eb 04 	lds	r22, 0x04EB	; 0x8004eb <_ZZL9panBatt_B5PointE4volt>
    333c:	70 91 ec 04 	lds	r23, 0x04EC	; 0x8004ec <_ZZL9panBatt_B5PointE4volt+0x1>
    3340:	80 91 ed 04 	lds	r24, 0x04ED	; 0x8004ed <_ZZL9panBatt_B5PointE4volt+0x2>
    3344:	90 91 ee 04 	lds	r25, 0x04EE	; 0x8004ee <_ZZL9panBatt_B5PointE4volt+0x3>
    3348:	0e 94 19 41 	call	0x8232	; 0x8232 <__fixunssfsi>
    334c:	dc 01       	movw	r26, r24
    334e:	cb 01       	movw	r24, r22
    3350:	6c 2f       	mov	r22, r28
    3352:	0e 94 d0 17 	call	0x2fa0	; 0x2fa0 <_ZL9printVoltjh>
    3356:	08 c0       	rjmp	.+16     	; 0x3368 <_ZL9panBatt_B5Point+0x6a>
    3358:	81 e0       	ldi	r24, 0x01	; 1
    335a:	90 91 9b 04 	lds	r25, 0x049B	; 0x80049b <sets+0x42>
    335e:	91 11       	cpse	r25, r1
    3360:	01 c0       	rjmp	.+2      	; 0x3364 <_ZL9panBatt_B5Point+0x66>
    3362:	80 e0       	ldi	r24, 0x00	; 0
    3364:	80 93 d0 03 	sts	0x03D0, r24	; 0x8003d0 <lflags+0x1c>
    3368:	df 91       	pop	r29
    336a:	cf 91       	pop	r28
    336c:	08 95       	ret

0000336e <_ZL9panBatt_A5Point>:
    336e:	cf 93       	push	r28
    3370:	df 93       	push	r29
    3372:	c9 2f       	mov	r28, r25
    3374:	0e 94 1d 14 	call	0x283a	; 0x283a <_Z14get_alt_filter5Point>
    3378:	d8 2f       	mov	r29, r24
    337a:	60 91 bb 06 	lds	r22, 0x06BB	; 0x8006bb <_ZL10osd_vbat_A>
    337e:	70 91 bc 06 	lds	r23, 0x06BC	; 0x8006bc <_ZL10osd_vbat_A+0x1>
    3382:	80 e0       	ldi	r24, 0x00	; 0
    3384:	90 e0       	ldi	r25, 0x00	; 0
    3386:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    338a:	ab 01       	movw	r20, r22
    338c:	bc 01       	movw	r22, r24
    338e:	2d 2f       	mov	r18, r29
    3390:	87 ee       	ldi	r24, 0xE7	; 231
    3392:	94 e0       	ldi	r25, 0x04	; 4
    3394:	0e 94 31 19 	call	0x3262	; 0x3262 <_Z6filterRffh>
    3398:	c2 95       	swap	r28
    339a:	c1 70       	andi	r28, 0x01	; 1
    339c:	60 91 e7 04 	lds	r22, 0x04E7	; 0x8004e7 <_ZZL9panBatt_A5PointE4volt>
    33a0:	70 91 e8 04 	lds	r23, 0x04E8	; 0x8004e8 <_ZZL9panBatt_A5PointE4volt+0x1>
    33a4:	80 91 e9 04 	lds	r24, 0x04E9	; 0x8004e9 <_ZZL9panBatt_A5PointE4volt+0x2>
    33a8:	90 91 ea 04 	lds	r25, 0x04EA	; 0x8004ea <_ZZL9panBatt_A5PointE4volt+0x3>
    33ac:	0e 94 19 41 	call	0x8232	; 0x8232 <__fixunssfsi>
    33b0:	dc 01       	movw	r26, r24
    33b2:	cb 01       	movw	r24, r22
    33b4:	6c 2f       	mov	r22, r28
    33b6:	0e 94 d0 17 	call	0x2fa0	; 0x2fa0 <_ZL9printVoltjh>
    33ba:	df 91       	pop	r29
    33bc:	cf 91       	pop	r28
    33be:	08 95       	ret

000033c0 <_ZL8panCur_A5Point>:
    33c0:	cf 93       	push	r28
    33c2:	df 93       	push	r29
    33c4:	c9 2f       	mov	r28, r25
    33c6:	0e 94 1d 14 	call	0x283a	; 0x283a <_Z14get_alt_filter5Point>
    33ca:	d8 2f       	mov	r29, r24
    33cc:	60 91 b7 06 	lds	r22, 0x06B7	; 0x8006b7 <_ZL10osd_curr_A>
    33d0:	70 91 b8 06 	lds	r23, 0x06B8	; 0x8006b8 <_ZL10osd_curr_A+0x1>
    33d4:	07 2e       	mov	r0, r23
    33d6:	00 0c       	add	r0, r0
    33d8:	88 0b       	sbc	r24, r24
    33da:	99 0b       	sbc	r25, r25
    33dc:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    33e0:	ab 01       	movw	r20, r22
    33e2:	bc 01       	movw	r22, r24
    33e4:	2d 2f       	mov	r18, r29
    33e6:	8f ee       	ldi	r24, 0xEF	; 239
    33e8:	94 e0       	ldi	r25, 0x04	; 4
    33ea:	0e 94 31 19 	call	0x3262	; 0x3262 <_Z6filterRffh>
    33ee:	c4 fd       	sbrc	r28, 4
    33f0:	03 c0       	rjmp	.+6      	; 0x33f8 <_ZL8panCur_A5Point+0x38>
    33f2:	c2 e3       	ldi	r28, 0x32	; 50
    33f4:	da e0       	ldi	r29, 0x0A	; 10
    33f6:	02 c0       	rjmp	.+4      	; 0x33fc <_ZL8panCur_A5Point+0x3c>
    33f8:	c6 e2       	ldi	r28, 0x26	; 38
    33fa:	da e0       	ldi	r29, 0x0A	; 10
    33fc:	2a e0       	ldi	r18, 0x0A	; 10
    33fe:	37 ed       	ldi	r19, 0xD7	; 215
    3400:	43 e2       	ldi	r20, 0x23	; 35
    3402:	5c e3       	ldi	r21, 0x3C	; 60
    3404:	60 91 ef 04 	lds	r22, 0x04EF	; 0x8004ef <_ZZL8panCur_A5PointE4curr>
    3408:	70 91 f0 04 	lds	r23, 0x04F0	; 0x8004f0 <_ZZL8panCur_A5PointE4curr+0x1>
    340c:	80 91 f1 04 	lds	r24, 0x04F1	; 0x8004f1 <_ZZL8panCur_A5PointE4curr+0x2>
    3410:	90 91 f2 04 	lds	r25, 0x04F2	; 0x8004f2 <_ZZL8panCur_A5PointE4curr+0x3>
    3414:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    3418:	ab 01       	movw	r20, r22
    341a:	bc 01       	movw	r22, r24
    341c:	2e e0       	ldi	r18, 0x0E	; 14
    341e:	ce 01       	movw	r24, r28
    3420:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    3424:	df 91       	pop	r29
    3426:	cf 91       	pop	r28
    3428:	08 95       	ret

0000342a <_ZL12panWindSpeed5Point>:
    342a:	a0 e0       	ldi	r26, 0x00	; 0
    342c:	b0 e0       	ldi	r27, 0x00	; 0
    342e:	eb e1       	ldi	r30, 0x1B	; 27
    3430:	fa e1       	ldi	r31, 0x1A	; 26
    3432:	0c 94 73 44 	jmp	0x88e6	; 0x88e6 <__prologue_saves__+0x14>
    3436:	d9 2f       	mov	r29, r25
    3438:	80 91 6e 06 	lds	r24, 0x066E	; 0x80066e <_ZL17osd_winddirection>
    343c:	90 91 6f 06 	lds	r25, 0x066F	; 0x80066f <_ZL17osd_winddirection+0x1>
    3440:	0e 94 34 18 	call	0x3068	; 0x3068 <_Z15normalize_anglei>
    3444:	8c 01       	movw	r16, r24
    3446:	c0 90 70 06 	lds	r12, 0x0670	; 0x800670 <_ZL13osd_windspeed>
    344a:	d0 90 71 06 	lds	r13, 0x0671	; 0x800671 <_ZL13osd_windspeed+0x1>
    344e:	e0 90 72 06 	lds	r14, 0x0672	; 0x800672 <_ZL13osd_windspeed+0x2>
    3452:	f0 90 73 06 	lds	r15, 0x0673	; 0x800673 <_ZL13osd_windspeed+0x3>
    3456:	24 e6       	ldi	r18, 0x64	; 100
    3458:	b7 01       	movw	r22, r14
    345a:	a6 01       	movw	r20, r12
    345c:	8a ef       	ldi	r24, 0xFA	; 250
    345e:	96 e0       	ldi	r25, 0x06	; 6
    3460:	0e 94 31 19 	call	0x3262	; 0x3262 <_Z6filterRffh>
    3464:	d6 fb       	bst	r29, 6
    3466:	cc 27       	eor	r28, r28
    3468:	c0 f9       	bld	r28, 0
    346a:	2c 2f       	mov	r18, r28
    346c:	b7 01       	movw	r22, r14
    346e:	a6 01       	movw	r20, r12
    3470:	84 e4       	ldi	r24, 0x44	; 68
    3472:	9a e0       	ldi	r25, 0x0A	; 10
    3474:	0e 94 79 15 	call	0x2af2	; 0x2af2 <_ZL13printSpeedCnvPKcPfh.isra.21>
    3478:	0e 94 37 0a 	call	0x146e	; 0x146e <_ZL6osd_nlv>
    347c:	20 91 80 06 	lds	r18, 0x0680	; 0x800680 <_ZL11osd_heading>
    3480:	30 91 81 06 	lds	r19, 0x0681	; 0x800681 <_ZL11osd_heading+0x1>
    3484:	c8 01       	movw	r24, r16
    3486:	82 1b       	sub	r24, r18
    3488:	93 0b       	sbc	r25, r19
    348a:	0e 94 6e 18 	call	0x30dc	; 0x30dc <_Z12grad_to_secti>
    348e:	d5 fd       	sbrc	r29, 5
    3490:	02 c0       	rjmp	.+4      	; 0x3496 <_ZL12panWindSpeed5Point+0x6c>
    3492:	90 e0       	ldi	r25, 0x00	; 0
    3494:	01 c0       	rjmp	.+2      	; 0x3498 <_ZL12panWindSpeed5Point+0x6e>
    3496:	98 e0       	ldi	r25, 0x08	; 8
    3498:	89 0f       	add	r24, r25
    349a:	0e 94 1a 0a 	call	0x1434	; 0x1434 <_ZL9showArrowh>
    349e:	40 91 fa 06 	lds	r20, 0x06FA	; 0x8006fa <_ZL17nor_osd_windspeed>
    34a2:	50 91 fb 06 	lds	r21, 0x06FB	; 0x8006fb <_ZL17nor_osd_windspeed+0x1>
    34a6:	60 91 fc 06 	lds	r22, 0x06FC	; 0x8006fc <_ZL17nor_osd_windspeed+0x2>
    34aa:	70 91 fd 06 	lds	r23, 0x06FD	; 0x8006fd <_ZL17nor_osd_windspeed+0x3>
    34ae:	2c 2f       	mov	r18, r28
    34b0:	83 e8       	ldi	r24, 0x83	; 131
    34b2:	93 e0       	ldi	r25, 0x03	; 3
    34b4:	0e 94 79 15 	call	0x2af2	; 0x2af2 <_ZL13printSpeedCnvPKcPfh.isra.21>
    34b8:	cd b7       	in	r28, 0x3d	; 61
    34ba:	de b7       	in	r29, 0x3e	; 62
    34bc:	e8 e0       	ldi	r30, 0x08	; 8
    34be:	0c 94 8f 44 	jmp	0x891e	; 0x891e <__epilogue_restores__+0x14>

000034c2 <_ZL7panRSSI5Point>:
    34c2:	cf 93       	push	r28
    34c4:	df 93       	push	r29
    34c6:	c9 2f       	mov	r28, r25
    34c8:	0e 94 1d 14 	call	0x283a	; 0x283a <_Z14get_alt_filter5Point>
    34cc:	d8 2f       	mov	r29, r24
    34ce:	60 91 2b 04 	lds	r22, 0x042B	; 0x80042b <rssi_norm>
    34d2:	70 91 2c 04 	lds	r23, 0x042C	; 0x80042c <rssi_norm+0x1>
    34d6:	80 e0       	ldi	r24, 0x00	; 0
    34d8:	90 e0       	ldi	r25, 0x00	; 0
    34da:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    34de:	ab 01       	movw	r20, r22
    34e0:	bc 01       	movw	r22, r24
    34e2:	2d 2f       	mov	r18, r29
    34e4:	83 ef       	ldi	r24, 0xF3	; 243
    34e6:	94 e0       	ldi	r25, 0x04	; 4
    34e8:	0e 94 31 19 	call	0x3262	; 0x3262 <_Z6filterRffh>
    34ec:	60 91 f3 04 	lds	r22, 0x04F3	; 0x8004f3 <_ZZL7panRSSI5PointE4rssi>
    34f0:	70 91 f4 04 	lds	r23, 0x04F4	; 0x8004f4 <_ZZL7panRSSI5PointE4rssi+0x1>
    34f4:	80 91 f5 04 	lds	r24, 0x04F5	; 0x8004f5 <_ZZL7panRSSI5PointE4rssi+0x2>
    34f8:	90 91 f6 04 	lds	r25, 0x04F6	; 0x8004f6 <_ZZL7panRSSI5PointE4rssi+0x3>
    34fc:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    3500:	8c e3       	ldi	r24, 0x3C	; 60
    3502:	9a e0       	ldi	r25, 0x0A	; 10
    3504:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    3508:	80 91 67 04 	lds	r24, 0x0467	; 0x800467 <sets+0xe>
    350c:	80 fd       	sbrc	r24, 0
    350e:	03 c0       	rjmp	.+6      	; 0x3516 <_ZL7panRSSI5Point+0x54>
    3510:	c4 fd       	sbrc	r28, 4
    3512:	0e 94 2f 0a 	call	0x145e	; 0x145e <_ZL11osd_percentv>
    3516:	df 91       	pop	r29
    3518:	cf 91       	pop	r28
    351a:	08 95       	ret

0000351c <_ZL11calc_energyv>:
    351c:	8f 92       	push	r8
    351e:	9f 92       	push	r9
    3520:	af 92       	push	r10
    3522:	bf 92       	push	r11
    3524:	cf 92       	push	r12
    3526:	df 92       	push	r13
    3528:	ef 92       	push	r14
    352a:	ff 92       	push	r15
    352c:	60 91 b7 06 	lds	r22, 0x06B7	; 0x8006b7 <_ZL10osd_curr_A>
    3530:	70 91 b8 06 	lds	r23, 0x06B8	; 0x8006b8 <_ZL10osd_curr_A+0x1>
    3534:	07 2e       	mov	r0, r23
    3536:	00 0c       	add	r0, r0
    3538:	88 0b       	sbc	r24, r24
    353a:	99 0b       	sbc	r25, r25
    353c:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    3540:	6b 01       	movw	r12, r22
    3542:	7c 01       	movw	r14, r24
    3544:	80 90 6a 06 	lds	r8, 0x066A	; 0x80066a <_ZL15osd_groundspeed>
    3548:	90 90 6b 06 	lds	r9, 0x066B	; 0x80066b <_ZL15osd_groundspeed+0x1>
    354c:	a0 90 6c 06 	lds	r10, 0x066C	; 0x80066c <_ZL15osd_groundspeed+0x2>
    3550:	b0 90 6d 06 	lds	r11, 0x066D	; 0x80066d <_ZL15osd_groundspeed+0x3>
    3554:	0e 94 70 15 	call	0x2ae0	; 0x2ae0 <_Z12get_convertsv>
    3558:	a5 01       	movw	r20, r10
    355a:	94 01       	movw	r18, r8
    355c:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    3560:	9b 01       	movw	r18, r22
    3562:	ac 01       	movw	r20, r24
    3564:	c7 01       	movw	r24, r14
    3566:	b6 01       	movw	r22, r12
    3568:	0e 94 a0 40 	call	0x8140	; 0x8140 <__divsf3>
    356c:	20 e0       	ldi	r18, 0x00	; 0
    356e:	30 e0       	ldi	r19, 0x00	; 0
    3570:	40 e2       	ldi	r20, 0x20	; 32
    3572:	51 e4       	ldi	r21, 0x41	; 65
    3574:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    3578:	ab 01       	movw	r20, r22
    357a:	bc 01       	movw	r22, r24
    357c:	24 e6       	ldi	r18, 0x64	; 100
    357e:	87 e0       	ldi	r24, 0x07	; 7
    3580:	95 e0       	ldi	r25, 0x05	; 5
    3582:	0e 94 31 19 	call	0x3262	; 0x3262 <_Z6filterRffh>
    3586:	ff 90       	pop	r15
    3588:	ef 90       	pop	r14
    358a:	df 90       	pop	r13
    358c:	cf 90       	pop	r12
    358e:	bf 90       	pop	r11
    3590:	af 90       	pop	r10
    3592:	9f 90       	pop	r9
    3594:	8f 90       	pop	r8
    3596:	08 95       	ret

00003598 <_ZL6panEff5Point>:
    3598:	a0 e0       	ldi	r26, 0x00	; 0
    359a:	b0 e0       	ldi	r27, 0x00	; 0
    359c:	e2 ed       	ldi	r30, 0xD2	; 210
    359e:	fa e1       	ldi	r31, 0x1A	; 26
    35a0:	0c 94 6f 44 	jmp	0x88de	; 0x88de <__prologue_saves__+0xc>
    35a4:	20 91 bb 03 	lds	r18, 0x03BB	; 0x8003bb <lflags+0x7>
    35a8:	22 23       	and	r18, r18
    35aa:	09 f4       	brne	.+2      	; 0x35ae <_ZL6panEff5Point+0x16>
    35ac:	32 c1       	rjmp	.+612    	; 0x3812 <_ZL6panEff5Point+0x27a>
    35ae:	c8 2f       	mov	r28, r24
    35b0:	96 ff       	sbrs	r25, 6
    35b2:	13 c0       	rjmp	.+38     	; 0x35da <_ZL6panEff5Point+0x42>
    35b4:	20 e0       	ldi	r18, 0x00	; 0
    35b6:	30 e0       	ldi	r19, 0x00	; 0
    35b8:	a9 01       	movw	r20, r18
    35ba:	60 91 6a 06 	lds	r22, 0x066A	; 0x80066a <_ZL15osd_groundspeed>
    35be:	70 91 6b 06 	lds	r23, 0x066B	; 0x80066b <_ZL15osd_groundspeed+0x1>
    35c2:	80 91 6c 06 	lds	r24, 0x066C	; 0x80066c <_ZL15osd_groundspeed+0x2>
    35c6:	90 91 6d 06 	lds	r25, 0x066D	; 0x80066d <_ZL15osd_groundspeed+0x3>
    35ca:	0e 94 96 40 	call	0x812c	; 0x812c <__cmpsf2>
    35ce:	88 23       	and	r24, r24
    35d0:	09 f4       	brne	.+2      	; 0x35d4 <_ZL6panEff5Point+0x3c>
    35d2:	1f c1       	rjmp	.+574    	; 0x3812 <_ZL6panEff5Point+0x27a>
    35d4:	0e 94 8e 1a 	call	0x351c	; 0x351c <_ZL11calc_energyv>
    35d8:	21 c0       	rjmp	.+66     	; 0x361c <_ZL6panEff5Point+0x84>
    35da:	80 91 5d 04 	lds	r24, 0x045D	; 0x80045d <sets+0x4>
    35de:	81 11       	cpse	r24, r1
    35e0:	ca c0       	rjmp	.+404    	; 0x3776 <_ZL6panEff5Point+0x1de>
    35e2:	20 e0       	ldi	r18, 0x00	; 0
    35e4:	30 e0       	ldi	r19, 0x00	; 0
    35e6:	a9 01       	movw	r20, r18
    35e8:	60 91 6a 06 	lds	r22, 0x066A	; 0x80066a <_ZL15osd_groundspeed>
    35ec:	70 91 6b 06 	lds	r23, 0x066B	; 0x80066b <_ZL15osd_groundspeed+0x1>
    35f0:	80 91 6c 06 	lds	r24, 0x066C	; 0x80066c <_ZL15osd_groundspeed+0x2>
    35f4:	90 91 6d 06 	lds	r25, 0x066D	; 0x80066d <_ZL15osd_groundspeed+0x3>
    35f8:	0e 94 96 40 	call	0x812c	; 0x812c <__cmpsf2>
    35fc:	88 23       	and	r24, r24
    35fe:	09 f4       	brne	.+2      	; 0x3602 <_ZL6panEff5Point+0x6a>
    3600:	08 c1       	rjmp	.+528    	; 0x3812 <_ZL6panEff5Point+0x27a>
    3602:	0e 94 8e 1a 	call	0x351c	; 0x351c <_ZL11calc_energyv>
    3606:	90 91 65 06 	lds	r25, 0x0665	; 0x800665 <_ZL12osd_throttle>
    360a:	80 91 be 03 	lds	r24, 0x03BE	; 0x8003be <lflags+0xa>
    360e:	93 30       	cpi	r25, 0x03	; 3
    3610:	48 f0       	brcs	.+18     	; 0x3624 <_ZL6panEff5Point+0x8c>
    3612:	81 11       	cpse	r24, r1
    3614:	03 c0       	rjmp	.+6      	; 0x361c <_ZL6panEff5Point+0x84>
    3616:	81 e0       	ldi	r24, 0x01	; 1
    3618:	80 93 be 03 	sts	0x03BE, r24	; 0x8003be <lflags+0xa>
    361c:	8c 2f       	mov	r24, r28
    361e:	0e 94 aa 0f 	call	0x1f54	; 0x1f54 <_ZL12print_energy5Point.isra.12>
    3622:	f7 c0       	rjmp	.+494    	; 0x3812 <_ZL6panEff5Point+0x27a>
    3624:	88 23       	and	r24, r24
    3626:	11 f1       	breq	.+68     	; 0x366c <_ZL6panEff5Point+0xd4>
    3628:	80 91 d7 06 	lds	r24, 0x06D7	; 0x8006d7 <_ZL15osd_alt_to_home>
    362c:	90 91 d8 06 	lds	r25, 0x06D8	; 0x8006d8 <_ZL15osd_alt_to_home+0x1>
    3630:	a0 91 d9 06 	lds	r26, 0x06D9	; 0x8006d9 <_ZL15osd_alt_to_home+0x2>
    3634:	b0 91 da 06 	lds	r27, 0x06DA	; 0x8006da <_ZL15osd_alt_to_home+0x3>
    3638:	80 93 95 06 	sts	0x0695, r24	; 0x800695 <_ZL4palt>
    363c:	90 93 96 06 	sts	0x0696, r25	; 0x800696 <_ZL4palt+0x1>
    3640:	a0 93 97 06 	sts	0x0697, r26	; 0x800697 <_ZL4palt+0x2>
    3644:	b0 93 98 06 	sts	0x0698, r27	; 0x800698 <_ZL4palt+0x3>
    3648:	80 91 f2 06 	lds	r24, 0x06F2	; 0x8006f2 <_ZL13trip_distance>
    364c:	90 91 f3 06 	lds	r25, 0x06F3	; 0x8006f3 <_ZL13trip_distance+0x1>
    3650:	a0 91 f4 06 	lds	r26, 0x06F4	; 0x8006f4 <_ZL13trip_distance+0x2>
    3654:	b0 91 f5 06 	lds	r27, 0x06F5	; 0x8006f5 <_ZL13trip_distance+0x3>
    3658:	80 93 f7 04 	sts	0x04F7, r24	; 0x8004f7 <_ZZL6panEff5PointE9ddistance>
    365c:	90 93 f8 04 	sts	0x04F8, r25	; 0x8004f8 <_ZZL6panEff5PointE9ddistance+0x1>
    3660:	a0 93 f9 04 	sts	0x04F9, r26	; 0x8004f9 <_ZZL6panEff5PointE9ddistance+0x2>
    3664:	b0 93 fa 04 	sts	0x04FA, r27	; 0x8004fa <_ZZL6panEff5PointE9ddistance+0x3>
    3668:	10 92 be 03 	sts	0x03BE, r1	; 0x8003be <lflags+0xa>
    366c:	2d ec       	ldi	r18, 0xCD	; 205
    366e:	3c ec       	ldi	r19, 0xCC	; 204
    3670:	4c e4       	ldi	r20, 0x4C	; 76
    3672:	5d eb       	ldi	r21, 0xBD	; 189
    3674:	60 91 91 06 	lds	r22, 0x0691	; 0x800691 <_ZL9osd_climb>
    3678:	70 91 92 06 	lds	r23, 0x0692	; 0x800692 <_ZL9osd_climb+0x1>
    367c:	80 91 93 06 	lds	r24, 0x0693	; 0x800693 <_ZL9osd_climb+0x2>
    3680:	90 91 94 06 	lds	r25, 0x0694	; 0x800694 <_ZL9osd_climb+0x3>
    3684:	0e 94 96 40 	call	0x812c	; 0x812c <__cmpsf2>
    3688:	87 ff       	sbrs	r24, 7
    368a:	63 c0       	rjmp	.+198    	; 0x3752 <_ZL6panEff5Point+0x1ba>
    368c:	c0 90 d7 06 	lds	r12, 0x06D7	; 0x8006d7 <_ZL15osd_alt_to_home>
    3690:	d0 90 d8 06 	lds	r13, 0x06D8	; 0x8006d8 <_ZL15osd_alt_to_home+0x1>
    3694:	e0 90 d9 06 	lds	r14, 0x06D9	; 0x8006d9 <_ZL15osd_alt_to_home+0x2>
    3698:	f0 90 da 06 	lds	r15, 0x06DA	; 0x8006da <_ZL15osd_alt_to_home+0x3>
    369c:	20 91 f7 04 	lds	r18, 0x04F7	; 0x8004f7 <_ZZL6panEff5PointE9ddistance>
    36a0:	30 91 f8 04 	lds	r19, 0x04F8	; 0x8004f8 <_ZZL6panEff5PointE9ddistance+0x1>
    36a4:	40 91 f9 04 	lds	r20, 0x04F9	; 0x8004f9 <_ZZL6panEff5PointE9ddistance+0x2>
    36a8:	50 91 fa 04 	lds	r21, 0x04FA	; 0x8004fa <_ZZL6panEff5PointE9ddistance+0x3>
    36ac:	60 91 f2 06 	lds	r22, 0x06F2	; 0x8006f2 <_ZL13trip_distance>
    36b0:	70 91 f3 06 	lds	r23, 0x06F3	; 0x8006f3 <_ZL13trip_distance+0x1>
    36b4:	80 91 f4 06 	lds	r24, 0x06F4	; 0x8006f4 <_ZL13trip_distance+0x2>
    36b8:	90 91 f5 06 	lds	r25, 0x06F5	; 0x8006f5 <_ZL13trip_distance+0x3>
    36bc:	0e 94 b7 3f 	call	0x7f6e	; 0x7f6e <__subsf3>
    36c0:	4b 01       	movw	r8, r22
    36c2:	5c 01       	movw	r10, r24
    36c4:	a7 01       	movw	r20, r14
    36c6:	96 01       	movw	r18, r12
    36c8:	60 91 95 06 	lds	r22, 0x0695	; 0x800695 <_ZL4palt>
    36cc:	70 91 96 06 	lds	r23, 0x0696	; 0x800696 <_ZL4palt+0x1>
    36d0:	80 91 97 06 	lds	r24, 0x0697	; 0x800697 <_ZL4palt+0x2>
    36d4:	90 91 98 06 	lds	r25, 0x0698	; 0x800698 <_ZL4palt+0x3>
    36d8:	0e 94 b7 3f 	call	0x7f6e	; 0x7f6e <__subsf3>
    36dc:	9b 01       	movw	r18, r22
    36de:	ac 01       	movw	r20, r24
    36e0:	c7 01       	movw	r24, r14
    36e2:	b6 01       	movw	r22, r12
    36e4:	0e 94 a0 40 	call	0x8140	; 0x8140 <__divsf3>
    36e8:	9b 01       	movw	r18, r22
    36ea:	ac 01       	movw	r20, r24
    36ec:	c5 01       	movw	r24, r10
    36ee:	b4 01       	movw	r22, r8
    36f0:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    36f4:	6b 01       	movw	r12, r22
    36f6:	7c 01       	movw	r14, r24
    36f8:	0e 94 d5 14 	call	0x29aa	; 0x29aa <_Z12get_converthv>
    36fc:	9b 01       	movw	r18, r22
    36fe:	ac 01       	movw	r20, r24
    3700:	c7 01       	movw	r24, r14
    3702:	b6 01       	movw	r22, r12
    3704:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    3708:	6b 01       	movw	r12, r22
    370a:	7c 01       	movw	r14, r24
    370c:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    3710:	cb 01       	movw	r24, r22
    3712:	60 31       	cpi	r22, 0x10	; 16
    3714:	77 42       	sbci	r23, 0x27	; 39
    3716:	24 f4       	brge	.+8      	; 0x3720 <_ZL6panEff5Point+0x188>
    3718:	18 16       	cp	r1, r24
    371a:	19 06       	cpc	r1, r25
    371c:	44 f0       	brlt	.+16     	; 0x372e <_ZL6panEff5Point+0x196>
    371e:	79 c0       	rjmp	.+242    	; 0x3812 <_ZL6panEff5Point+0x27a>
    3720:	c1 2c       	mov	r12, r1
    3722:	8c e3       	ldi	r24, 0x3C	; 60
    3724:	d8 2e       	mov	r13, r24
    3726:	8c e1       	ldi	r24, 0x1C	; 28
    3728:	e8 2e       	mov	r14, r24
    372a:	86 e4       	ldi	r24, 0x46	; 70
    372c:	f8 2e       	mov	r15, r24
    372e:	c7 fd       	sbrc	r28, 7
    3730:	03 c0       	rjmp	.+6      	; 0x3738 <_ZL6panEff5Point+0x1a0>
    3732:	8e ee       	ldi	r24, 0xEE	; 238
    3734:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    3738:	e0 91 bd 06 	lds	r30, 0x06BD	; 0x8006bd <_ZL7measure>
    373c:	f0 91 be 06 	lds	r31, 0x06BE	; 0x8006be <_ZL7measure+0x1>
    3740:	39 96       	adiw	r30, 0x09	; 9
    3742:	24 91       	lpm	r18, Z
    3744:	b7 01       	movw	r22, r14
    3746:	a6 01       	movw	r20, r12
    3748:	80 e2       	ldi	r24, 0x20	; 32
    374a:	9a e0       	ldi	r25, 0x0A	; 10
    374c:	0e 94 8e 0c 	call	0x191c	; 0x191c <_ZL12osd_printf_2PKcfh>
    3750:	60 c0       	rjmp	.+192    	; 0x3812 <_ZL6panEff5Point+0x27a>
    3752:	80 91 33 04 	lds	r24, 0x0433	; 0x800433 <osd_att>
    3756:	90 91 34 04 	lds	r25, 0x0434	; 0x800434 <osd_att+0x1>
    375a:	97 ff       	sbrs	r25, 7
    375c:	5a c0       	rjmp	.+180    	; 0x3812 <_ZL6panEff5Point+0x27a>
    375e:	80 91 c0 03 	lds	r24, 0x03C0	; 0x8003c0 <lflags+0xc>
    3762:	88 23       	and	r24, r24
    3764:	19 f0       	breq	.+6      	; 0x376c <_ZL6panEff5Point+0x1d4>
    3766:	87 e0       	ldi	r24, 0x07	; 7
    3768:	94 e0       	ldi	r25, 0x04	; 4
    376a:	02 c0       	rjmp	.+4      	; 0x3770 <_ZL6panEff5Point+0x1d8>
    376c:	86 e0       	ldi	r24, 0x06	; 6
    376e:	94 e0       	ldi	r25, 0x04	; 4
    3770:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    3774:	4e c0       	rjmp	.+156    	; 0x3812 <_ZL6panEff5Point+0x27a>
    3776:	d0 91 b6 06 	lds	r29, 0x06B6	; 0x8006b6 <_ZL23osd_battery_remaining_A>
    377a:	0d 2f       	mov	r16, r29
    377c:	10 e0       	ldi	r17, 0x00	; 0
    377e:	80 91 b3 06 	lds	r24, 0x06B3	; 0x8006b3 <_ZL20last_battery_reading>
    3782:	08 2e       	mov	r0, r24
    3784:	00 0c       	add	r0, r0
    3786:	99 0b       	sbc	r25, r25
    3788:	08 17       	cp	r16, r24
    378a:	19 07       	cpc	r17, r25
    378c:	b9 f1       	breq	.+110    	; 0x37fc <_ZL6panEff5Point+0x264>
    378e:	60 91 9e 06 	lds	r22, 0x069E	; 0x80069e <_ZL23total_flight_time_milis>
    3792:	70 91 9f 06 	lds	r23, 0x069F	; 0x80069f <_ZL23total_flight_time_milis+0x1>
    3796:	80 91 a0 06 	lds	r24, 0x06A0	; 0x8006a0 <_ZL23total_flight_time_milis+0x2>
    379a:	90 91 a1 06 	lds	r25, 0x06A1	; 0x8006a1 <_ZL23total_flight_time_milis+0x3>
    379e:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    37a2:	6b 01       	movw	r12, r22
    37a4:	7c 01       	movw	r14, r24
    37a6:	6d 2f       	mov	r22, r29
    37a8:	70 e0       	ldi	r23, 0x00	; 0
    37aa:	80 e0       	ldi	r24, 0x00	; 0
    37ac:	90 e0       	ldi	r25, 0x00	; 0
    37ae:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    37b2:	9b 01       	movw	r18, r22
    37b4:	ac 01       	movw	r20, r24
    37b6:	c7 01       	movw	r24, r14
    37b8:	b6 01       	movw	r22, r12
    37ba:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    37be:	6b 01       	movw	r12, r22
    37c0:	7c 01       	movw	r14, r24
    37c2:	40 91 b4 06 	lds	r20, 0x06B4	; 0x8006b4 <_ZL19max_battery_reading>
    37c6:	04 2e       	mov	r0, r20
    37c8:	00 0c       	add	r0, r0
    37ca:	55 0b       	sbc	r21, r21
    37cc:	40 1b       	sub	r20, r16
    37ce:	51 0b       	sbc	r21, r17
    37d0:	ba 01       	movw	r22, r20
    37d2:	55 0f       	add	r21, r21
    37d4:	88 0b       	sbc	r24, r24
    37d6:	99 0b       	sbc	r25, r25
    37d8:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    37dc:	9b 01       	movw	r18, r22
    37de:	ac 01       	movw	r20, r24
    37e0:	c7 01       	movw	r24, r14
    37e2:	b6 01       	movw	r22, r12
    37e4:	0e 94 a0 40 	call	0x8140	; 0x8140 <__divsf3>
    37e8:	0e 94 8a 17 	call	0x2f14	; 0x2f14 <_Z9f_div1000f>
    37ec:	0e 94 19 41 	call	0x8232	; 0x8232 <__fixunssfsi>
    37f0:	70 93 b0 06 	sts	0x06B0, r23	; 0x8006b0 <_ZL39remaining_estimated_flight_time_seconds+0x1>
    37f4:	60 93 af 06 	sts	0x06AF, r22	; 0x8006af <_ZL39remaining_estimated_flight_time_seconds>
    37f8:	d0 93 b3 06 	sts	0x06B3, r29	; 0x8006b3 <_ZL20last_battery_reading>
    37fc:	c7 fd       	sbrc	r28, 7
    37fe:	03 c0       	rjmp	.+6      	; 0x3806 <_ZL6panEff5Point+0x26e>
    3800:	87 e1       	ldi	r24, 0x17	; 23
    3802:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    3806:	80 91 af 06 	lds	r24, 0x06AF	; 0x8006af <_ZL39remaining_estimated_flight_time_seconds>
    380a:	90 91 b0 06 	lds	r25, 0x06B0	; 0x8006b0 <_ZL39remaining_estimated_flight_time_seconds+0x1>
    380e:	0e 94 89 0c 	call	0x1912	; 0x1912 <_ZL9printTimei>
    3812:	cd b7       	in	r28, 0x3d	; 61
    3814:	de b7       	in	r29, 0x3e	; 62
    3816:	ec e0       	ldi	r30, 0x0C	; 12
    3818:	0c 94 8b 44 	jmp	0x8916	; 0x8916 <__epilogue_restores__+0xc>

0000381c <_Z6filterRff>:
    381c:	2a e0       	ldi	r18, 0x0A	; 10
    381e:	0e 94 31 19 	call	0x3262	; 0x3262 <_Z6filterRffh>
    3822:	08 95       	ret

00003824 <_Z9float_addRff>:
    3824:	cf 93       	push	r28
    3826:	df 93       	push	r29
    3828:	ec 01       	movw	r28, r24
    382a:	9a 01       	movw	r18, r20
    382c:	ab 01       	movw	r20, r22
    382e:	68 81       	ld	r22, Y
    3830:	79 81       	ldd	r23, Y+1	; 0x01
    3832:	8a 81       	ldd	r24, Y+2	; 0x02
    3834:	9b 81       	ldd	r25, Y+3	; 0x03
    3836:	0e 94 b8 3f 	call	0x7f70	; 0x7f70 <__addsf3>
    383a:	68 83       	st	Y, r22
    383c:	79 83       	std	Y+1, r23	; 0x01
    383e:	8a 83       	std	Y+2, r24	; 0x02
    3840:	9b 83       	std	Y+3, r25	; 0x03
    3842:	df 91       	pop	r29
    3844:	cf 91       	pop	r28
    3846:	08 95       	ret

00003848 <_Z12setFdataVarsv>:
    3848:	a7 e0       	ldi	r26, 0x07	; 7
    384a:	b0 e0       	ldi	r27, 0x00	; 0
    384c:	ea e2       	ldi	r30, 0x2A	; 42
    384e:	fc e1       	ldi	r31, 0x1C	; 28
    3850:	0c 94 69 44 	jmp	0x88d2	; 0x88d2 <__prologue_saves__>
    3854:	81 e5       	ldi	r24, 0x51	; 81
    3856:	94 e0       	ldi	r25, 0x04	; 4
    3858:	0e 94 40 18 	call	0x3080	; 0x3080 <_Z10time_sincePm>
    385c:	1c 01       	movw	r2, r24
    385e:	60 e0       	ldi	r22, 0x00	; 0
    3860:	70 e0       	ldi	r23, 0x00	; 0
    3862:	81 e5       	ldi	r24, 0x51	; 81
    3864:	94 e0       	ldi	r25, 0x04	; 4
    3866:	0e 94 af 14 	call	0x295e	; 0x295e <_Z11millis_plusPmj>
    386a:	b1 01       	movw	r22, r2
    386c:	80 e0       	ldi	r24, 0x00	; 0
    386e:	90 e0       	ldi	r25, 0x00	; 0
    3870:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    3874:	0e 94 8a 17 	call	0x2f14	; 0x2f14 <_Z9f_div1000f>
    3878:	6a 83       	std	Y+2, r22	; 0x02
    387a:	7b 83       	std	Y+3, r23	; 0x03
    387c:	8c 83       	std	Y+4, r24	; 0x04
    387e:	9d 83       	std	Y+5, r25	; 0x05
    3880:	60 91 b7 06 	lds	r22, 0x06B7	; 0x8006b7 <_ZL10osd_curr_A>
    3884:	70 91 b8 06 	lds	r23, 0x06B8	; 0x8006b8 <_ZL10osd_curr_A+0x1>
    3888:	07 2e       	mov	r0, r23
    388a:	00 0c       	add	r0, r0
    388c:	88 0b       	sbc	r24, r24
    388e:	99 0b       	sbc	r25, r25
    3890:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    3894:	6b 01       	movw	r12, r22
    3896:	7c 01       	movw	r14, r24
    3898:	60 91 bb 06 	lds	r22, 0x06BB	; 0x8006bb <_ZL10osd_vbat_A>
    389c:	70 91 bc 06 	lds	r23, 0x06BC	; 0x8006bc <_ZL10osd_vbat_A+0x1>
    38a0:	80 e0       	ldi	r24, 0x00	; 0
    38a2:	90 e0       	ldi	r25, 0x00	; 0
    38a4:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    38a8:	a7 01       	movw	r20, r14
    38aa:	96 01       	movw	r18, r12
    38ac:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    38b0:	2c ea       	ldi	r18, 0xAC	; 172
    38b2:	35 ec       	ldi	r19, 0xC5	; 197
    38b4:	47 e2       	ldi	r20, 0x27	; 39
    38b6:	57 e3       	ldi	r21, 0x37	; 55
    38b8:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    38bc:	ab 01       	movw	r20, r22
    38be:	bc 01       	movw	r22, r24
    38c0:	85 e5       	ldi	r24, 0x55	; 85
    38c2:	94 e0       	ldi	r25, 0x04	; 4
    38c4:	0e 94 0e 1c 	call	0x381c	; 0x381c <_Z6filterRff>
    38c8:	10 91 0f 01 	lds	r17, 0x010F	; 0x80010f <climb_filter>
    38cc:	80 90 91 06 	lds	r8, 0x0691	; 0x800691 <_ZL9osd_climb>
    38d0:	90 90 92 06 	lds	r9, 0x0692	; 0x800692 <_ZL9osd_climb+0x1>
    38d4:	a0 90 93 06 	lds	r10, 0x0693	; 0x800693 <_ZL9osd_climb+0x2>
    38d8:	b0 90 94 06 	lds	r11, 0x0694	; 0x800694 <_ZL9osd_climb+0x3>
    38dc:	0e 94 d5 14 	call	0x29aa	; 0x29aa <_Z12get_converthv>
    38e0:	2b 01       	movw	r4, r22
    38e2:	3c 01       	movw	r6, r24
    38e4:	20 e0       	ldi	r18, 0x00	; 0
    38e6:	30 e0       	ldi	r19, 0x00	; 0
    38e8:	40 e7       	ldi	r20, 0x70	; 112
    38ea:	52 e4       	ldi	r21, 0x42	; 66
    38ec:	c5 01       	movw	r24, r10
    38ee:	b4 01       	movw	r22, r8
    38f0:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    38f4:	a3 01       	movw	r20, r6
    38f6:	92 01       	movw	r18, r4
    38f8:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    38fc:	ab 01       	movw	r20, r22
    38fe:	bc 01       	movw	r22, r24
    3900:	21 2f       	mov	r18, r17
    3902:	86 ef       	ldi	r24, 0xF6	; 246
    3904:	96 e0       	ldi	r25, 0x06	; 6
    3906:	0e 94 31 19 	call	0x3262	; 0x3262 <_Z6filterRffh>
    390a:	20 91 b6 06 	lds	r18, 0x06B6	; 0x8006b6 <_ZL23osd_battery_remaining_A>
    390e:	80 91 b4 06 	lds	r24, 0x06B4	; 0x8006b4 <_ZL19max_battery_reading>
    3912:	08 2e       	mov	r0, r24
    3914:	00 0c       	add	r0, r0
    3916:	99 0b       	sbc	r25, r25
    3918:	42 2f       	mov	r20, r18
    391a:	50 e0       	ldi	r21, 0x00	; 0
    391c:	84 17       	cp	r24, r20
    391e:	95 07       	cpc	r25, r21
    3920:	14 f4       	brge	.+4      	; 0x3926 <_Z12setFdataVarsv+0xde>
    3922:	20 93 b4 06 	sts	0x06B4, r18	; 0x8006b4 <_ZL19max_battery_reading>
    3926:	80 91 5d 04 	lds	r24, 0x045D	; 0x80045d <sets+0x4>
    392a:	81 11       	cpse	r24, r1
    392c:	20 c0       	rjmp	.+64     	; 0x396e <_Z12setFdataVarsv+0x126>
    392e:	10 91 bf 03 	lds	r17, 0x03BF	; 0x8003bf <lflags+0xb>
    3932:	10 fd       	sbrc	r17, 0
    3934:	1c c0       	rjmp	.+56     	; 0x396e <_Z12setFdataVarsv+0x126>
    3936:	60 91 d7 06 	lds	r22, 0x06D7	; 0x8006d7 <_ZL15osd_alt_to_home>
    393a:	70 91 d8 06 	lds	r23, 0x06D8	; 0x8006d8 <_ZL15osd_alt_to_home+0x1>
    393e:	80 91 d9 06 	lds	r24, 0x06D9	; 0x8006d9 <_ZL15osd_alt_to_home+0x2>
    3942:	90 91 da 06 	lds	r25, 0x06DA	; 0x8006da <_ZL15osd_alt_to_home+0x3>
    3946:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    394a:	66 30       	cpi	r22, 0x06	; 6
    394c:	71 05       	cpc	r23, r1
    394e:	7c f0       	brlt	.+30     	; 0x396e <_Z12setFdataVarsv+0x126>
    3950:	80 91 65 06 	lds	r24, 0x0665	; 0x800665 <_ZL12osd_throttle>
    3954:	8f 31       	cpi	r24, 0x1F	; 31
    3956:	58 f0       	brcs	.+22     	; 0x396e <_Z12setFdataVarsv+0x126>
    3958:	11 60       	ori	r17, 0x01	; 1
    395a:	10 93 bf 03 	sts	0x03BF, r17	; 0x8003bf <lflags+0xb>
    395e:	10 92 f2 06 	sts	0x06F2, r1	; 0x8006f2 <_ZL13trip_distance>
    3962:	10 92 f3 06 	sts	0x06F3, r1	; 0x8006f3 <_ZL13trip_distance+0x1>
    3966:	10 92 f4 06 	sts	0x06F4, r1	; 0x8006f4 <_ZL13trip_distance+0x2>
    396a:	10 92 f5 06 	sts	0x06F5, r1	; 0x8006f5 <_ZL13trip_distance+0x3>
    396e:	21 e6       	ldi	r18, 0x61	; 97
    3970:	3b e0       	ldi	r19, 0x0B	; 11
    3972:	46 e3       	ldi	r20, 0x36	; 54
    3974:	5b e3       	ldi	r21, 0x3B	; 59
    3976:	c7 01       	movw	r24, r14
    3978:	b6 01       	movw	r22, r12
    397a:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    397e:	2a 81       	ldd	r18, Y+2	; 0x02
    3980:	3b 81       	ldd	r19, Y+3	; 0x03
    3982:	4c 81       	ldd	r20, Y+4	; 0x04
    3984:	5d 81       	ldd	r21, Y+5	; 0x05
    3986:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    398a:	ab 01       	movw	r20, r22
    398c:	bc 01       	movw	r22, r24
    398e:	8e ee       	ldi	r24, 0xEE	; 238
    3990:	96 e0       	ldi	r25, 0x06	; 6
    3992:	0e 94 12 1c 	call	0x3824	; 0x3824 <_Z9float_addRff>
    3996:	80 91 2d 04 	lds	r24, 0x042D	; 0x80042d <rssi_in>
    399a:	90 91 2e 04 	lds	r25, 0x042E	; 0x80042e <rssi_in+0x1>
    399e:	20 91 67 04 	lds	r18, 0x0467	; 0x800467 <sets+0xe>
    39a2:	20 fd       	sbrc	r18, 0
    39a4:	5f c0       	rjmp	.+190    	; 0x3a64 <_Z12setFdataVarsv+0x21c>
    39a6:	20 91 a1 04 	lds	r18, 0x04A1	; 0x8004a1 <sets+0x48>
    39aa:	30 91 a2 04 	lds	r19, 0x04A2	; 0x8004a2 <sets+0x49>
    39ae:	3f 83       	std	Y+7, r19	; 0x07
    39b0:	2e 83       	std	Y+6, r18	; 0x06
    39b2:	00 91 a3 04 	lds	r16, 0x04A3	; 0x8004a3 <sets+0x4a>
    39b6:	10 91 a4 04 	lds	r17, 0x04A4	; 0x8004a4 <sets+0x4b>
    39ba:	02 17       	cp	r16, r18
    39bc:	13 07       	cpc	r17, r19
    39be:	4c f4       	brge	.+18     	; 0x39d2 <_Z12setFdataVarsv+0x18a>
    39c0:	3e 81       	ldd	r19, Y+6	; 0x06
    39c2:	2f 81       	ldd	r18, Y+7	; 0x07
    39c4:	1f 83       	std	Y+7, r17	; 0x07
    39c6:	0e 83       	std	Y+6, r16	; 0x06
    39c8:	03 2f       	mov	r16, r19
    39ca:	12 2f       	mov	r17, r18
    39cc:	31 e0       	ldi	r19, 0x01	; 1
    39ce:	39 83       	std	Y+1, r19	; 0x01
    39d0:	01 c0       	rjmp	.+2      	; 0x39d4 <_Z12setFdataVarsv+0x18c>
    39d2:	19 82       	std	Y+1, r1	; 0x01
    39d4:	3e 81       	ldd	r19, Y+6	; 0x06
    39d6:	2f 81       	ldd	r18, Y+7	; 0x07
    39d8:	4e 81       	ldd	r20, Y+6	; 0x06
    39da:	5f 81       	ldd	r21, Y+7	; 0x07
    39dc:	48 17       	cp	r20, r24
    39de:	59 07       	cpc	r21, r25
    39e0:	14 f4       	brge	.+4      	; 0x39e6 <_Z12setFdataVarsv+0x19e>
    39e2:	38 2f       	mov	r19, r24
    39e4:	29 2f       	mov	r18, r25
    39e6:	63 2f       	mov	r22, r19
    39e8:	72 2f       	mov	r23, r18
    39ea:	06 17       	cp	r16, r22
    39ec:	17 07       	cpc	r17, r23
    39ee:	0c f4       	brge	.+2      	; 0x39f2 <_Z12setFdataVarsv+0x1aa>
    39f0:	b8 01       	movw	r22, r16
    39f2:	8e 81       	ldd	r24, Y+6	; 0x06
    39f4:	9f 81       	ldd	r25, Y+7	; 0x07
    39f6:	68 1b       	sub	r22, r24
    39f8:	79 0b       	sbc	r23, r25
    39fa:	80 e0       	ldi	r24, 0x00	; 0
    39fc:	90 e0       	ldi	r25, 0x00	; 0
    39fe:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    3a02:	2b 01       	movw	r4, r22
    3a04:	3c 01       	movw	r6, r24
    3a06:	b8 01       	movw	r22, r16
    3a08:	ee 81       	ldd	r30, Y+6	; 0x06
    3a0a:	ff 81       	ldd	r31, Y+7	; 0x07
    3a0c:	6e 1b       	sub	r22, r30
    3a0e:	7f 0b       	sbc	r23, r31
    3a10:	80 e0       	ldi	r24, 0x00	; 0
    3a12:	90 e0       	ldi	r25, 0x00	; 0
    3a14:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    3a18:	9b 01       	movw	r18, r22
    3a1a:	ac 01       	movw	r20, r24
    3a1c:	c3 01       	movw	r24, r6
    3a1e:	b2 01       	movw	r22, r4
    3a20:	0e 94 a0 40 	call	0x8140	; 0x8140 <__divsf3>
    3a24:	20 e0       	ldi	r18, 0x00	; 0
    3a26:	30 e0       	ldi	r19, 0x00	; 0
    3a28:	48 ec       	ldi	r20, 0xC8	; 200
    3a2a:	52 e4       	ldi	r21, 0x42	; 66
    3a2c:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    3a30:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    3a34:	65 36       	cpi	r22, 0x65	; 101
    3a36:	71 05       	cpc	r23, r1
    3a38:	2c f4       	brge	.+10     	; 0x3a44 <_Z12setFdataVarsv+0x1fc>
    3a3a:	77 ff       	sbrs	r23, 7
    3a3c:	05 c0       	rjmp	.+10     	; 0x3a48 <_Z12setFdataVarsv+0x200>
    3a3e:	60 e0       	ldi	r22, 0x00	; 0
    3a40:	70 e0       	ldi	r23, 0x00	; 0
    3a42:	02 c0       	rjmp	.+4      	; 0x3a48 <_Z12setFdataVarsv+0x200>
    3a44:	64 e6       	ldi	r22, 0x64	; 100
    3a46:	70 e0       	ldi	r23, 0x00	; 0
    3a48:	f9 81       	ldd	r31, Y+1	; 0x01
    3a4a:	ff 23       	and	r31, r31
    3a4c:	31 f0       	breq	.+12     	; 0x3a5a <_Z12setFdataVarsv+0x212>
    3a4e:	84 e6       	ldi	r24, 0x64	; 100
    3a50:	90 e0       	ldi	r25, 0x00	; 0
    3a52:	9c 01       	movw	r18, r24
    3a54:	26 1b       	sub	r18, r22
    3a56:	37 0b       	sbc	r19, r23
    3a58:	b9 01       	movw	r22, r18
    3a5a:	70 93 2c 04 	sts	0x042C, r23	; 0x80042c <rssi_norm+0x1>
    3a5e:	60 93 2b 04 	sts	0x042B, r22	; 0x80042b <rssi_norm>
    3a62:	04 c0       	rjmp	.+8      	; 0x3a6c <_Z12setFdataVarsv+0x224>
    3a64:	90 93 2c 04 	sts	0x042C, r25	; 0x80042c <rssi_norm+0x1>
    3a68:	80 93 2b 04 	sts	0x042B, r24	; 0x80042b <rssi_norm>
    3a6c:	80 91 5d 04 	lds	r24, 0x045D	; 0x80045d <sets+0x4>
    3a70:	81 11       	cpse	r24, r1
    3a72:	04 c0       	rjmp	.+8      	; 0x3a7c <_Z12setFdataVarsv+0x234>
    3a74:	80 91 bf 03 	lds	r24, 0x03BF	; 0x8003bf <lflags+0xb>
    3a78:	80 fd       	sbrc	r24, 0
    3a7a:	05 c0       	rjmp	.+10     	; 0x3a86 <_Z12setFdataVarsv+0x23e>
    3a7c:	80 91 bb 03 	lds	r24, 0x03BB	; 0x8003bb <lflags+0x7>
    3a80:	88 23       	and	r24, r24
    3a82:	09 f4       	brne	.+2      	; 0x3a86 <_Z12setFdataVarsv+0x23e>
    3a84:	7c c0       	rjmp	.+248    	; 0x3b7e <_Z12setFdataVarsv+0x336>
    3a86:	b1 01       	movw	r22, r2
    3a88:	8e e9       	ldi	r24, 0x9E	; 158
    3a8a:	96 e0       	ldi	r25, 0x06	; 6
    3a8c:	0e 94 c6 14 	call	0x298c	; 0x298c <_Z9long_plusPmj>
    3a90:	80 91 c2 03 	lds	r24, 0x03C2	; 0x8003c2 <lflags+0xe>
    3a94:	88 23       	and	r24, r24
    3a96:	a1 f0       	breq	.+40     	; 0x3ac0 <_Z12setFdataVarsv+0x278>
    3a98:	20 91 6a 06 	lds	r18, 0x066A	; 0x80066a <_ZL15osd_groundspeed>
    3a9c:	30 91 6b 06 	lds	r19, 0x066B	; 0x80066b <_ZL15osd_groundspeed+0x1>
    3aa0:	40 91 6c 06 	lds	r20, 0x066C	; 0x80066c <_ZL15osd_groundspeed+0x2>
    3aa4:	50 91 6d 06 	lds	r21, 0x066D	; 0x80066d <_ZL15osd_groundspeed+0x3>
    3aa8:	6a 81       	ldd	r22, Y+2	; 0x02
    3aaa:	7b 81       	ldd	r23, Y+3	; 0x03
    3aac:	8c 81       	ldd	r24, Y+4	; 0x04
    3aae:	9d 81       	ldd	r25, Y+5	; 0x05
    3ab0:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    3ab4:	ab 01       	movw	r20, r22
    3ab6:	bc 01       	movw	r22, r24
    3ab8:	82 ef       	ldi	r24, 0xF2	; 242
    3aba:	96 e0       	ldi	r25, 0x06	; 6
    3abc:	0e 94 12 1c 	call	0x3824	; 0x3824 <_Z9float_addRff>
    3ac0:	60 91 87 06 	lds	r22, 0x0687	; 0x800687 <_ZL17osd_home_distance>
    3ac4:	70 91 88 06 	lds	r23, 0x0688	; 0x800688 <_ZL17osd_home_distance+0x1>
    3ac8:	80 91 89 06 	lds	r24, 0x0689	; 0x800689 <_ZL17osd_home_distance+0x2>
    3acc:	90 91 8a 06 	lds	r25, 0x068A	; 0x80068a <_ZL17osd_home_distance+0x3>
    3ad0:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    3ad4:	ab 01       	movw	r20, r22
    3ad6:	bc 01       	movw	r22, r24
    3ad8:	8d e3       	ldi	r24, 0x3D	; 61
    3ada:	96 e0       	ldi	r25, 0x06	; 6
    3adc:	0e 94 13 19 	call	0x3226	; 0x3226 <_Z8calc_maxRff>
    3ae0:	40 91 74 06 	lds	r20, 0x0674	; 0x800674 <_ZL12osd_airspeed>
    3ae4:	50 91 75 06 	lds	r21, 0x0675	; 0x800675 <_ZL12osd_airspeed+0x1>
    3ae8:	60 91 76 06 	lds	r22, 0x0676	; 0x800676 <_ZL12osd_airspeed+0x2>
    3aec:	70 91 77 06 	lds	r23, 0x0677	; 0x800677 <_ZL12osd_airspeed+0x3>
    3af0:	89 e3       	ldi	r24, 0x39	; 57
    3af2:	96 e0       	ldi	r25, 0x06	; 6
    3af4:	0e 94 13 19 	call	0x3226	; 0x3226 <_Z8calc_maxRff>
    3af8:	40 91 6a 06 	lds	r20, 0x066A	; 0x80066a <_ZL15osd_groundspeed>
    3afc:	50 91 6b 06 	lds	r21, 0x066B	; 0x80066b <_ZL15osd_groundspeed+0x1>
    3b00:	60 91 6c 06 	lds	r22, 0x066C	; 0x80066c <_ZL15osd_groundspeed+0x2>
    3b04:	70 91 6d 06 	lds	r23, 0x066D	; 0x80066d <_ZL15osd_groundspeed+0x3>
    3b08:	85 e3       	ldi	r24, 0x35	; 53
    3b0a:	96 e0       	ldi	r25, 0x06	; 6
    3b0c:	0e 94 13 19 	call	0x3226	; 0x3226 <_Z8calc_maxRff>
    3b10:	40 91 7c 06 	lds	r20, 0x067C	; 0x80067c <_ZL11osd_alt_mav>
    3b14:	50 91 7d 06 	lds	r21, 0x067D	; 0x80067d <_ZL11osd_alt_mav+0x1>
    3b18:	60 91 7e 06 	lds	r22, 0x067E	; 0x80067e <_ZL11osd_alt_mav+0x2>
    3b1c:	70 91 7f 06 	lds	r23, 0x067F	; 0x80067f <_ZL11osd_alt_mav+0x3>
    3b20:	81 e3       	ldi	r24, 0x31	; 49
    3b22:	96 e0       	ldi	r25, 0x06	; 6
    3b24:	0e 94 13 19 	call	0x3226	; 0x3226 <_Z8calc_maxRff>
    3b28:	40 91 70 06 	lds	r20, 0x0670	; 0x800670 <_ZL13osd_windspeed>
    3b2c:	50 91 71 06 	lds	r21, 0x0671	; 0x800671 <_ZL13osd_windspeed+0x1>
    3b30:	60 91 72 06 	lds	r22, 0x0672	; 0x800672 <_ZL13osd_windspeed+0x2>
    3b34:	70 91 73 06 	lds	r23, 0x0673	; 0x800673 <_ZL13osd_windspeed+0x3>
    3b38:	8d e2       	ldi	r24, 0x2D	; 45
    3b3a:	96 e0       	ldi	r25, 0x06	; 6
    3b3c:	0e 94 13 19 	call	0x3226	; 0x3226 <_Z8calc_maxRff>
    3b40:	40 91 55 04 	lds	r20, 0x0455	; 0x800455 <power>
    3b44:	50 91 56 04 	lds	r21, 0x0456	; 0x800456 <power+0x1>
    3b48:	60 91 57 04 	lds	r22, 0x0457	; 0x800457 <power+0x2>
    3b4c:	70 91 58 04 	lds	r23, 0x0458	; 0x800458 <power+0x3>
    3b50:	8d e1       	ldi	r24, 0x1D	; 29
    3b52:	96 e0       	ldi	r25, 0x06	; 6
    3b54:	0e 94 13 19 	call	0x3226	; 0x3226 <_Z8calc_maxRff>
    3b58:	b7 01       	movw	r22, r14
    3b5a:	a6 01       	movw	r20, r12
    3b5c:	89 e2       	ldi	r24, 0x29	; 41
    3b5e:	96 e0       	ldi	r25, 0x06	; 6
    3b60:	0e 94 13 19 	call	0x3226	; 0x3226 <_Z8calc_maxRff>
    3b64:	b5 01       	movw	r22, r10
    3b66:	a4 01       	movw	r20, r8
    3b68:	85 e2       	ldi	r24, 0x25	; 37
    3b6a:	96 e0       	ldi	r25, 0x06	; 6
    3b6c:	0e 94 13 19 	call	0x3226	; 0x3226 <_Z8calc_maxRff>
    3b70:	b5 01       	movw	r22, r10
    3b72:	a4 01       	movw	r20, r8
    3b74:	70 58       	subi	r23, 0x80	; 128
    3b76:	81 e2       	ldi	r24, 0x21	; 33
    3b78:	96 e0       	ldi	r25, 0x06	; 6
    3b7a:	0e 94 13 19 	call	0x3226	; 0x3226 <_Z8calc_maxRff>
    3b7e:	27 96       	adiw	r28, 0x07	; 7
    3b80:	e2 e1       	ldi	r30, 0x12	; 18
    3b82:	0c 94 85 44 	jmp	0x890a	; 0x890a <__epilogue_restores__>

00003b86 <_Z8gps_normRfl>:
    3b86:	cf 93       	push	r28
    3b88:	df 93       	push	r29
    3b8a:	ec 01       	movw	r28, r24
    3b8c:	cb 01       	movw	r24, r22
    3b8e:	ba 01       	movw	r22, r20
    3b90:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    3b94:	25 e9       	ldi	r18, 0x95	; 149
    3b96:	3f eb       	ldi	r19, 0xBF	; 191
    3b98:	46 ed       	ldi	r20, 0xD6	; 214
    3b9a:	53 e3       	ldi	r21, 0x33	; 51
    3b9c:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    3ba0:	68 83       	st	Y, r22
    3ba2:	79 83       	std	Y+1, r23	; 0x01
    3ba4:	8a 83       	std	Y+2, r24	; 0x02
    3ba6:	9b 83       	std	Y+3, r25	; 0x03
    3ba8:	df 91       	pop	r29
    3baa:	cf 91       	pop	r28
    3bac:	08 95       	ret

00003bae <_Z12set_data_gotv>:
    3bae:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    3bb2:	60 93 5d 06 	sts	0x065D, r22	; 0x80065d <_ZL11lastMAVBeat>
    3bb6:	70 93 5e 06 	sts	0x065E, r23	; 0x80065e <_ZL11lastMAVBeat+0x1>
    3bba:	80 93 5f 06 	sts	0x065F, r24	; 0x80065f <_ZL11lastMAVBeat+0x2>
    3bbe:	90 93 60 06 	sts	0x0660, r25	; 0x800660 <_ZL11lastMAVBeat+0x3>
    3bc2:	80 91 63 06 	lds	r24, 0x0663	; 0x800663 <_ZL7seconds>
    3bc6:	90 91 64 06 	lds	r25, 0x0664	; 0x800664 <_ZL7seconds+0x1>
    3bca:	90 93 62 06 	sts	0x0662, r25	; 0x800662 <_ZL14lastMavSeconds+0x1>
    3bce:	80 93 61 06 	sts	0x0661, r24	; 0x800661 <_ZL14lastMavSeconds>
    3bd2:	81 e0       	ldi	r24, 0x01	; 1
    3bd4:	80 93 b4 03 	sts	0x03B4, r24	; 0x8003b4 <lflags>
    3bd8:	80 91 b6 03 	lds	r24, 0x03B6	; 0x8003b6 <lflags+0x2>
    3bdc:	81 11       	cpse	r24, r1
    3bde:	04 c0       	rjmp	.+8      	; 0x3be8 <_Z12set_data_gotv+0x3a>
    3be0:	10 92 e0 03 	sts	0x03E0, r1	; 0x8003e0 <max_dly+0x1>
    3be4:	10 92 df 03 	sts	0x03DF, r1	; 0x8003df <max_dly>
    3be8:	81 e0       	ldi	r24, 0x01	; 1
    3bea:	80 93 b6 03 	sts	0x03B6, r24	; 0x8003b6 <lflags+0x2>
    3bee:	08 95       	ret

00003bf0 <_Z12generate_PWMb>:
    3bf0:	cf 93       	push	r28
    3bf2:	90 91 ab 03 	lds	r25, 0x03AB	; 0x8003ab <PWM_out_bit>
    3bf6:	99 23       	and	r25, r25
    3bf8:	09 f4       	brne	.+2      	; 0x3bfc <_Z12generate_PWMb+0xc>
    3bfa:	47 c0       	rjmp	.+142    	; 0x3c8a <_Z12generate_PWMb+0x9a>
    3bfc:	e0 91 9e 04 	lds	r30, 0x049E	; 0x80049e <sets+0x45>
    3c00:	f0 e0       	ldi	r31, 0x00	; 0
    3c02:	ee 0f       	add	r30, r30
    3c04:	ff 1f       	adc	r31, r31
    3c06:	e9 53       	subi	r30, 0x39	; 57
    3c08:	f9 4f       	sbci	r31, 0xF9	; 249
    3c0a:	20 81       	ld	r18, Z
    3c0c:	31 81       	ldd	r19, Z+1	; 0x01
    3c0e:	cf b7       	in	r28, 0x3f	; 63
    3c10:	88 23       	and	r24, r24
    3c12:	09 f0       	breq	.+2      	; 0x3c16 <_Z12generate_PWMb+0x26>
    3c14:	f8 94       	cli
    3c16:	80 91 a5 04 	lds	r24, 0x04A5	; 0x8004a5 <sets+0x4c>
    3c1a:	81 30       	cpi	r24, 0x01	; 1
    3c1c:	d9 f0       	breq	.+54     	; 0x3c54 <_Z12generate_PWMb+0x64>
    3c1e:	18 f0       	brcs	.+6      	; 0x3c26 <_Z12generate_PWMb+0x36>
    3c20:	82 30       	cpi	r24, 0x02	; 2
    3c22:	11 f1       	breq	.+68     	; 0x3c68 <_Z12generate_PWMb+0x78>
    3c24:	31 c0       	rjmp	.+98     	; 0x3c88 <_Z12generate_PWMb+0x98>
    3c26:	e0 91 a9 03 	lds	r30, 0x03A9	; 0x8003a9 <PWM_out_port>
    3c2a:	f0 91 aa 03 	lds	r31, 0x03AA	; 0x8003aa <PWM_out_port+0x1>
    3c2e:	90 81       	ld	r25, Z
    3c30:	80 91 ab 03 	lds	r24, 0x03AB	; 0x8003ab <PWM_out_bit>
    3c34:	89 2b       	or	r24, r25
    3c36:	80 83       	st	Z, r24
    3c38:	c9 01       	movw	r24, r18
    3c3a:	0e 94 7b 36 	call	0x6cf6	; 0x6cf6 <delayMicroseconds>
    3c3e:	e0 91 a9 03 	lds	r30, 0x03A9	; 0x8003a9 <PWM_out_port>
    3c42:	f0 91 aa 03 	lds	r31, 0x03AA	; 0x8003aa <PWM_out_port+0x1>
    3c46:	90 81       	ld	r25, Z
    3c48:	80 91 ab 03 	lds	r24, 0x03AB	; 0x8003ab <PWM_out_bit>
    3c4c:	80 95       	com	r24
    3c4e:	89 23       	and	r24, r25
    3c50:	80 83       	st	Z, r24
    3c52:	1a c0       	rjmp	.+52     	; 0x3c88 <_Z12generate_PWMb+0x98>
    3c54:	90 91 ab 03 	lds	r25, 0x03AB	; 0x8003ab <PWM_out_bit>
    3c58:	e0 91 a9 03 	lds	r30, 0x03A9	; 0x8003a9 <PWM_out_port>
    3c5c:	f0 91 aa 03 	lds	r31, 0x03AA	; 0x8003aa <PWM_out_port+0x1>
    3c60:	2d 3d       	cpi	r18, 0xDD	; 221
    3c62:	35 40       	sbci	r19, 0x05	; 5
    3c64:	6c f0       	brlt	.+26     	; 0x3c80 <_Z12generate_PWMb+0x90>
    3c66:	09 c0       	rjmp	.+18     	; 0x3c7a <_Z12generate_PWMb+0x8a>
    3c68:	90 91 ab 03 	lds	r25, 0x03AB	; 0x8003ab <PWM_out_bit>
    3c6c:	e0 91 a9 03 	lds	r30, 0x03A9	; 0x8003a9 <PWM_out_port>
    3c70:	f0 91 aa 03 	lds	r31, 0x03AA	; 0x8003aa <PWM_out_port+0x1>
    3c74:	2c 3d       	cpi	r18, 0xDC	; 220
    3c76:	35 40       	sbci	r19, 0x05	; 5
    3c78:	1c f4       	brge	.+6      	; 0x3c80 <_Z12generate_PWMb+0x90>
    3c7a:	80 81       	ld	r24, Z
    3c7c:	98 2b       	or	r25, r24
    3c7e:	03 c0       	rjmp	.+6      	; 0x3c86 <_Z12generate_PWMb+0x96>
    3c80:	80 81       	ld	r24, Z
    3c82:	90 95       	com	r25
    3c84:	98 23       	and	r25, r24
    3c86:	90 83       	st	Z, r25
    3c88:	cf bf       	out	0x3f, r28	; 63
    3c8a:	cf 91       	pop	r28
    3c8c:	08 95       	ret

00003c8e <_Z9delay_150v>:
    3c8e:	66 e9       	ldi	r22, 0x96	; 150
    3c90:	70 e0       	ldi	r23, 0x00	; 0
    3c92:	80 e0       	ldi	r24, 0x00	; 0
    3c94:	90 e0       	ldi	r25, 0x00	; 0
    3c96:	0e 94 3f 36 	call	0x6c7e	; 0x6c7e <delay>
    3c9a:	08 95       	ret

00003c9c <_Z4logov>:
    3c9c:	65 e0       	ldi	r22, 0x05	; 5
    3c9e:	82 e0       	ldi	r24, 0x02	; 2
    3ca0:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    3ca4:	8e e8       	ldi	r24, 0x8E	; 142
    3ca6:	95 e0       	ldi	r25, 0x05	; 5
    3ca8:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    3cac:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    3cb0:	4a e0       	ldi	r20, 0x0A	; 10
    3cb2:	50 e0       	ldi	r21, 0x00	; 0
    3cb4:	88 e6       	ldi	r24, 0x68	; 104
    3cb6:	93 e0       	ldi	r25, 0x03	; 3
    3cb8:	0e 94 25 38 	call	0x704a	; 0x704a <_ZN5Print5printEji>
    3cbc:	80 91 ce 03 	lds	r24, 0x03CE	; 0x8003ce <lflags+0x1a>
    3cc0:	88 23       	and	r24, r24
    3cc2:	59 f0       	breq	.+22     	; 0x3cda <_Z4logov+0x3e>
    3cc4:	61 e0       	ldi	r22, 0x01	; 1
    3cc6:	81 e0       	ldi	r24, 0x01	; 1
    3cc8:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    3ccc:	60 91 73 04 	lds	r22, 0x0473	; 0x800473 <sets+0x1a>
    3cd0:	70 e0       	ldi	r23, 0x00	; 0
    3cd2:	89 e7       	ldi	r24, 0x79	; 121
    3cd4:	95 e0       	ldi	r25, 0x05	; 5
    3cd6:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    3cda:	0e 94 d9 08 	call	0x11b2	; 0x11b2 <_ZN3OSD6updateEv>
    3cde:	0e 94 47 1e 	call	0x3c8e	; 0x3c8e <_Z9delay_150v>
    3ce2:	08 95       	ret

00003ce4 <_Z10radar_charv>:
    3ce4:	84 e2       	ldi	r24, 0x24	; 36
    3ce6:	0e 94 92 14 	call	0x2924	; 0x2924 <_Z9readPanelh>
    3cea:	96 ff       	sbrs	r25, 6
    3cec:	08 c0       	rjmp	.+16     	; 0x3cfe <_Z10radar_charv+0x1a>
    3cee:	80 91 86 06 	lds	r24, 0x0686	; 0x800686 <_ZL18osd_home_direction>
    3cf2:	90 e0       	ldi	r25, 0x00	; 0
    3cf4:	8c 54       	subi	r24, 0x4C	; 76
    3cf6:	9f 4f       	sbci	r25, 0xFF	; 255
    3cf8:	0e 94 34 18 	call	0x3068	; 0x3068 <_Z15normalize_anglei>
    3cfc:	04 c0       	rjmp	.+8      	; 0x3d06 <_Z10radar_charv+0x22>
    3cfe:	80 91 80 06 	lds	r24, 0x0680	; 0x800680 <_ZL11osd_heading>
    3d02:	90 91 81 06 	lds	r25, 0x0681	; 0x800681 <_ZL11osd_heading+0x1>
    3d06:	88 0f       	add	r24, r24
    3d08:	99 1f       	adc	r25, r25
    3d0a:	8d 96       	adiw	r24, 0x2d	; 45
    3d0c:	6a e5       	ldi	r22, 0x5A	; 90
    3d0e:	70 e0       	ldi	r23, 0x00	; 0
    3d10:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    3d14:	77 ff       	sbrs	r23, 7
    3d16:	03 c0       	rjmp	.+6      	; 0x3d1e <_Z10radar_charv+0x3a>
    3d18:	68 5f       	subi	r22, 0xF8	; 248
    3d1a:	7f 4f       	sbci	r23, 0xFF	; 255
    3d1c:	fb cf       	rjmp	.-10     	; 0x3d14 <_Z10radar_charv+0x30>
    3d1e:	67 70       	andi	r22, 0x07	; 7
    3d20:	77 27       	eor	r23, r23
    3d22:	fb 01       	movw	r30, r22
    3d24:	e3 5a       	subi	r30, 0xA3	; 163
    3d26:	fb 4f       	sbci	r31, 0xFB	; 251
    3d28:	84 91       	lpm	r24, Z
    3d2a:	08 95       	ret

00003d2c <_ZL10panHeading5Point>:
    3d2c:	87 fd       	sbrc	r24, 7
    3d2e:	04 c0       	rjmp	.+8      	; 0x3d38 <_ZL10panHeading5Point+0xc>
    3d30:	0e 94 72 1e 	call	0x3ce4	; 0x3ce4 <_Z10radar_charv>
    3d34:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    3d38:	60 91 80 06 	lds	r22, 0x0680	; 0x800680 <_ZL11osd_heading>
    3d3c:	70 91 81 06 	lds	r23, 0x0681	; 0x800681 <_ZL11osd_heading+0x1>
    3d40:	8c e3       	ldi	r24, 0x3C	; 60
    3d42:	9a e0       	ldi	r25, 0x0A	; 10
    3d44:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    3d48:	85 e0       	ldi	r24, 0x05	; 5
    3d4a:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    3d4e:	08 95       	ret

00003d50 <_ZL10panHorizon5Point>:
    3d50:	4f 92       	push	r4
    3d52:	5f 92       	push	r5
    3d54:	6f 92       	push	r6
    3d56:	7f 92       	push	r7
    3d58:	8f 92       	push	r8
    3d5a:	9f 92       	push	r9
    3d5c:	af 92       	push	r10
    3d5e:	bf 92       	push	r11
    3d60:	df 92       	push	r13
    3d62:	ef 92       	push	r14
    3d64:	ff 92       	push	r15
    3d66:	0f 93       	push	r16
    3d68:	1f 93       	push	r17
    3d6a:	cf 93       	push	r28
    3d6c:	df 93       	push	r29
    3d6e:	7c 01       	movw	r14, r24
    3d70:	f6 fc       	sbrc	r15, 6
    3d72:	0c c0       	rjmp	.+24     	; 0x3d8c <_ZL10panHorizon5Point+0x3c>
    3d74:	6f 2d       	mov	r22, r15
    3d76:	81 e0       	ldi	r24, 0x01	; 1
    3d78:	8e 0d       	add	r24, r14
    3d7a:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    3d7e:	80 91 ac 03 	lds	r24, 0x03AC	; 0x8003ac <screen_flags>
    3d82:	81 fd       	sbrc	r24, 1
    3d84:	1c c0       	rjmp	.+56     	; 0x3dbe <_ZL10panHorizon5Point+0x6e>
    3d86:	0e 94 1f 0d 	call	0x1a3e	; 0x1a3e <_ZL11showHorizonv>
    3d8a:	19 c0       	rjmp	.+50     	; 0x3dbe <_ZL10panHorizon5Point+0x6e>
    3d8c:	c5 e0       	ldi	r28, 0x05	; 5
    3d8e:	82 eb       	ldi	r24, 0xB2	; 178
    3d90:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    3d94:	dd e0       	ldi	r29, 0x0D	; 13
    3d96:	d1 50       	subi	r29, 0x01	; 1
    3d98:	19 f0       	breq	.+6      	; 0x3da0 <_ZL10panHorizon5Point+0x50>
    3d9a:	0e 94 33 0a 	call	0x1466	; 0x1466 <_ZL9osd_blankv>
    3d9e:	fb cf       	rjmp	.-10     	; 0x3d96 <_ZL10panHorizon5Point+0x46>
    3da0:	c3 30       	cpi	r28, 0x03	; 3
    3da2:	11 f0       	breq	.+4      	; 0x3da8 <_ZL10panHorizon5Point+0x58>
    3da4:	83 eb       	ldi	r24, 0xB3	; 179
    3da6:	01 c0       	rjmp	.+2      	; 0x3daa <_ZL10panHorizon5Point+0x5a>
    3da8:	85 ec       	ldi	r24, 0xC5	; 197
    3daa:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    3dae:	0e 94 37 0a 	call	0x146e	; 0x146e <_ZL6osd_nlv>
    3db2:	c1 50       	subi	r28, 0x01	; 1
    3db4:	f9 f2       	breq	.-66     	; 0x3d74 <_ZL10panHorizon5Point+0x24>
    3db6:	c3 30       	cpi	r28, 0x03	; 3
    3db8:	51 f7       	brne	.-44     	; 0x3d8e <_ZL10panHorizon5Point+0x3e>
    3dba:	86 ec       	ldi	r24, 0xC6	; 198
    3dbc:	e9 cf       	rjmp	.-46     	; 0x3d90 <_ZL10panHorizon5Point+0x40>
    3dbe:	f4 fe       	sbrs	r15, 4
    3dc0:	b2 c0       	rjmp	.+356    	; 0x3f26 <_ZL10panHorizon5Point+0x1d6>
    3dc2:	c0 91 84 06 	lds	r28, 0x0684	; 0x800684 <_ZL5dst_x>
    3dc6:	d0 91 85 06 	lds	r29, 0x0685	; 0x800685 <_ZL5dst_x+0x1>
    3dca:	00 91 82 06 	lds	r16, 0x0682	; 0x800682 <_ZL5dst_y>
    3dce:	10 91 83 06 	lds	r17, 0x0683	; 0x800683 <_ZL5dst_y+0x1>
    3dd2:	c8 01       	movw	r24, r16
    3dd4:	17 ff       	sbrs	r17, 7
    3dd6:	04 c0       	rjmp	.+8      	; 0x3de0 <_ZL10panHorizon5Point+0x90>
    3dd8:	88 27       	eor	r24, r24
    3dda:	99 27       	eor	r25, r25
    3ddc:	80 1b       	sub	r24, r16
    3dde:	91 0b       	sbc	r25, r17
    3de0:	6a ef       	ldi	r22, 0xFA	; 250
    3de2:	70 e0       	ldi	r23, 0x00	; 0
    3de4:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    3de8:	e6 2f       	mov	r30, r22
    3dea:	47 2f       	mov	r20, r23
    3dec:	ce 01       	movw	r24, r28
    3dee:	d7 ff       	sbrs	r29, 7
    3df0:	04 c0       	rjmp	.+8      	; 0x3dfa <_ZL10panHorizon5Point+0xaa>
    3df2:	88 27       	eor	r24, r24
    3df4:	99 27       	eor	r25, r25
    3df6:	8c 1b       	sub	r24, r28
    3df8:	9d 0b       	sbc	r25, r29
    3dfa:	6a ef       	ldi	r22, 0xFA	; 250
    3dfc:	70 e0       	ldi	r23, 0x00	; 0
    3dfe:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    3e02:	2e 2f       	mov	r18, r30
    3e04:	34 2f       	mov	r19, r20
    3e06:	26 17       	cp	r18, r22
    3e08:	37 07       	cpc	r19, r23
    3e0a:	0c f4       	brge	.+2      	; 0x3e0e <_ZL10panHorizon5Point+0xbe>
    3e0c:	9b 01       	movw	r18, r22
    3e0e:	b9 01       	movw	r22, r18
    3e10:	6f 5f       	subi	r22, 0xFF	; 255
    3e12:	7f 4f       	sbci	r23, 0xFF	; 255
    3e14:	70 93 0c 05 	sts	0x050C, r23	; 0x80050c <_ZL10radar_zoom+0x1>
    3e18:	60 93 0b 05 	sts	0x050B, r22	; 0x80050b <_ZL10radar_zoom>
    3e1c:	07 2e       	mov	r0, r23
    3e1e:	00 0c       	add	r0, r0
    3e20:	88 0b       	sbc	r24, r24
    3e22:	99 0b       	sbc	r25, r25
    3e24:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    3e28:	4b 01       	movw	r8, r22
    3e2a:	5c 01       	movw	r10, r24
    3e2c:	b8 01       	movw	r22, r16
    3e2e:	11 0f       	add	r17, r17
    3e30:	88 0b       	sbc	r24, r24
    3e32:	99 0b       	sbc	r25, r25
    3e34:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    3e38:	2b 01       	movw	r4, r22
    3e3a:	3c 01       	movw	r6, r24
    3e3c:	24 ee       	ldi	r18, 0xE4	; 228
    3e3e:	38 e3       	ldi	r19, 0x38	; 56
    3e40:	4e e5       	ldi	r20, 0x5E	; 94
    3e42:	52 e4       	ldi	r21, 0x42	; 66
    3e44:	c5 01       	movw	r24, r10
    3e46:	b4 01       	movw	r22, r8
    3e48:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    3e4c:	9b 01       	movw	r18, r22
    3e4e:	ac 01       	movw	r20, r24
    3e50:	c3 01       	movw	r24, r6
    3e52:	b2 01       	movw	r22, r4
    3e54:	0e 94 a0 40 	call	0x8140	; 0x8140 <__divsf3>
    3e58:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    3e5c:	16 2f       	mov	r17, r22
    3e5e:	be 01       	movw	r22, r28
    3e60:	dd 0f       	add	r29, r29
    3e62:	88 0b       	sbc	r24, r24
    3e64:	99 0b       	sbc	r25, r25
    3e66:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    3e6a:	2b 01       	movw	r4, r22
    3e6c:	3c 01       	movw	r6, r24
    3e6e:	2d e6       	ldi	r18, 0x6D	; 109
    3e70:	3b ed       	ldi	r19, 0xDB	; 219
    3e72:	4e e0       	ldi	r20, 0x0E	; 14
    3e74:	52 e4       	ldi	r21, 0x42	; 66
    3e76:	c5 01       	movw	r24, r10
    3e78:	b4 01       	movw	r22, r8
    3e7a:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    3e7e:	9b 01       	movw	r18, r22
    3e80:	ac 01       	movw	r20, r24
    3e82:	c3 01       	movw	r24, r6
    3e84:	b2 01       	movw	r22, r4
    3e86:	0e 94 a0 40 	call	0x8140	; 0x8140 <__divsf3>
    3e8a:	20 e0       	ldi	r18, 0x00	; 0
    3e8c:	30 e0       	ldi	r19, 0x00	; 0
    3e8e:	40 e0       	ldi	r20, 0x00	; 0
    3e90:	5f e3       	ldi	r21, 0x3F	; 63
    3e92:	0e 94 b8 3f 	call	0x7f70	; 0x7f70 <__addsf3>
    3e96:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    3e9a:	06 2f       	mov	r16, r22
    3e9c:	e6 fc       	sbrc	r14, 6
    3e9e:	0a c0       	rjmp	.+20     	; 0x3eb4 <_ZL10panHorizon5Point+0x164>
    3ea0:	0e 94 72 1e 	call	0x3ce4	; 0x3ce4 <_Z10radar_charv>
    3ea4:	62 e0       	ldi	r22, 0x02	; 2
    3ea6:	61 1b       	sub	r22, r17
    3ea8:	48 2f       	mov	r20, r24
    3eaa:	85 e0       	ldi	r24, 0x05	; 5
    3eac:	80 0f       	add	r24, r16
    3eae:	0e 94 d0 08 	call	0x11a0	; 0x11a0 <_ZN3OSD8write_xyEhhh>
    3eb2:	39 c0       	rjmp	.+114    	; 0x3f26 <_ZL10panHorizon5Point+0x1d6>
    3eb4:	90 91 4e 06 	lds	r25, 0x064E	; 0x80064e <_ZL3trk>
    3eb8:	96 13       	cpse	r25, r22
    3eba:	04 c0       	rjmp	.+8      	; 0x3ec4 <_ZL10panHorizon5Point+0x174>
    3ebc:	80 91 4f 06 	lds	r24, 0x064F	; 0x80064f <_ZL3trk+0x1>
    3ec0:	81 17       	cp	r24, r17
    3ec2:	e1 f0       	breq	.+56     	; 0x3efc <_ZL10panHorizon5Point+0x1ac>
    3ec4:	80 91 52 06 	lds	r24, 0x0652	; 0x800652 <_ZL3trk+0x4>
    3ec8:	90 91 53 06 	lds	r25, 0x0653	; 0x800653 <_ZL3trk+0x5>
    3ecc:	90 93 55 06 	sts	0x0655, r25	; 0x800655 <_ZL3trk+0x7>
    3ed0:	80 93 54 06 	sts	0x0654, r24	; 0x800654 <_ZL3trk+0x6>
    3ed4:	80 91 50 06 	lds	r24, 0x0650	; 0x800650 <_ZL3trk+0x2>
    3ed8:	90 91 51 06 	lds	r25, 0x0651	; 0x800651 <_ZL3trk+0x3>
    3edc:	90 93 53 06 	sts	0x0653, r25	; 0x800653 <_ZL3trk+0x5>
    3ee0:	80 93 52 06 	sts	0x0652, r24	; 0x800652 <_ZL3trk+0x4>
    3ee4:	80 91 4e 06 	lds	r24, 0x064E	; 0x80064e <_ZL3trk>
    3ee8:	90 91 4f 06 	lds	r25, 0x064F	; 0x80064f <_ZL3trk+0x1>
    3eec:	90 93 51 06 	sts	0x0651, r25	; 0x800651 <_ZL3trk+0x3>
    3ef0:	80 93 50 06 	sts	0x0650, r24	; 0x800650 <_ZL3trk+0x2>
    3ef4:	00 93 4e 06 	sts	0x064E, r16	; 0x80064e <_ZL3trk>
    3ef8:	10 93 4f 06 	sts	0x064F, r17	; 0x80064f <_ZL3trk+0x1>
    3efc:	c0 e0       	ldi	r28, 0x00	; 0
    3efe:	d0 e0       	ldi	r29, 0x00	; 0
    3f00:	32 e0       	ldi	r19, 0x02	; 2
    3f02:	b3 2e       	mov	r11, r19
    3f04:	fe 01       	movw	r30, r28
    3f06:	e2 5b       	subi	r30, 0xB2	; 178
    3f08:	f9 4f       	sbci	r31, 0xF9	; 249
    3f0a:	87 81       	ldd	r24, Z+7	; 0x07
    3f0c:	6b 2d       	mov	r22, r11
    3f0e:	68 1b       	sub	r22, r24
    3f10:	86 81       	ldd	r24, Z+6	; 0x06
    3f12:	44 e2       	ldi	r20, 0x24	; 36
    3f14:	8b 5f       	subi	r24, 0xFB	; 251
    3f16:	0e 94 d0 08 	call	0x11a0	; 0x11a0 <_ZN3OSD8write_xyEhhh>
    3f1a:	22 97       	sbiw	r28, 0x02	; 2
    3f1c:	ca 3f       	cpi	r28, 0xFA	; 250
    3f1e:	4f ef       	ldi	r20, 0xFF	; 255
    3f20:	d4 07       	cpc	r29, r20
    3f22:	81 f7       	brne	.-32     	; 0x3f04 <_ZL10panHorizon5Point+0x1b4>
    3f24:	bd cf       	rjmp	.-134    	; 0x3ea0 <_ZL10panHorizon5Point+0x150>
    3f26:	e7 fc       	sbrc	r14, 7
    3f28:	08 c0       	rjmp	.+16     	; 0x3f3a <_ZL10panHorizon5Point+0x1ea>
    3f2a:	62 e0       	ldi	r22, 0x02	; 2
    3f2c:	85 e0       	ldi	r24, 0x05	; 5
    3f2e:	0e 94 98 08 	call	0x1130	; 0x1130 <_ZN3OSD8relPanelEhh>
    3f32:	8a e0       	ldi	r24, 0x0A	; 10
    3f34:	93 e0       	ldi	r25, 0x03	; 3
    3f36:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    3f3a:	f5 fe       	sbrs	r15, 5
    3f3c:	bb c0       	rjmp	.+374    	; 0x40b4 <_ZL10panHorizon5Point+0x364>
    3f3e:	80 91 bb 03 	lds	r24, 0x03BB	; 0x8003bb <lflags+0x7>
    3f42:	88 23       	and	r24, r24
    3f44:	09 f4       	brne	.+2      	; 0x3f48 <_ZL10panHorizon5Point+0x1f8>
    3f46:	b6 c0       	rjmp	.+364    	; 0x40b4 <_ZL10panHorizon5Point+0x364>
    3f48:	80 91 5d 04 	lds	r24, 0x045D	; 0x80045d <sets+0x4>
    3f4c:	81 11       	cpse	r24, r1
    3f4e:	80 c0       	rjmp	.+256    	; 0x4050 <_ZL10panHorizon5Point+0x300>
    3f50:	60 91 87 06 	lds	r22, 0x0687	; 0x800687 <_ZL17osd_home_distance>
    3f54:	70 91 88 06 	lds	r23, 0x0688	; 0x800688 <_ZL17osd_home_distance+0x1>
    3f58:	80 91 89 06 	lds	r24, 0x0689	; 0x800689 <_ZL17osd_home_distance+0x2>
    3f5c:	90 91 8a 06 	lds	r25, 0x068A	; 0x80068a <_ZL17osd_home_distance+0x3>
    3f60:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    3f64:	9b 01       	movw	r18, r22
    3f66:	ac 01       	movw	r20, r24
    3f68:	60 91 d7 06 	lds	r22, 0x06D7	; 0x8006d7 <_ZL15osd_alt_to_home>
    3f6c:	70 91 d8 06 	lds	r23, 0x06D8	; 0x8006d8 <_ZL15osd_alt_to_home+0x1>
    3f70:	80 91 d9 06 	lds	r24, 0x06D9	; 0x8006d9 <_ZL15osd_alt_to_home+0x2>
    3f74:	90 91 da 06 	lds	r25, 0x06DA	; 0x8006da <_ZL15osd_alt_to_home+0x3>
    3f78:	0e 94 37 40 	call	0x806e	; 0x806e <atan2>
    3f7c:	21 ee       	ldi	r18, 0xE1	; 225
    3f7e:	3e e2       	ldi	r19, 0x2E	; 46
    3f80:	45 ee       	ldi	r20, 0xE5	; 229
    3f82:	52 e4       	ldi	r21, 0x42	; 66
    3f84:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    3f88:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    3f8c:	6a 50       	subi	r22, 0x0A	; 10
    3f8e:	71 09       	sbc	r23, r1
    3f90:	2d e2       	ldi	r18, 0x2D	; 45
    3f92:	26 9f       	mul	r18, r22
    3f94:	c0 01       	movw	r24, r0
    3f96:	27 9f       	mul	r18, r23
    3f98:	90 0d       	add	r25, r0
    3f9a:	11 24       	eor	r1, r1
    3f9c:	6a e0       	ldi	r22, 0x0A	; 10
    3f9e:	70 e0       	ldi	r23, 0x00	; 0
    3fa0:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    3fa4:	cb 01       	movw	r24, r22
    3fa6:	8d 96       	adiw	r24, 0x2d	; 45
    3fa8:	97 fd       	sbrc	r25, 7
    3faa:	01 96       	adiw	r24, 0x01	; 1
    3fac:	95 95       	asr	r25
    3fae:	87 95       	ror	r24
    3fb0:	69 e0       	ldi	r22, 0x09	; 9
    3fb2:	70 e0       	ldi	r23, 0x00	; 0
    3fb4:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    3fb8:	d6 2f       	mov	r29, r22
    3fba:	65 30       	cpi	r22, 0x05	; 5
    3fbc:	58 f4       	brcc	.+22     	; 0x3fd4 <_ZL10panHorizon5Point+0x284>
    3fbe:	cf ec       	ldi	r28, 0xCF	; 207
    3fc0:	c8 1b       	sub	r28, r24
    3fc2:	4c 2f       	mov	r20, r28
    3fc4:	8c e0       	ldi	r24, 0x0C	; 12
    3fc6:	0e 94 d0 08 	call	0x11a0	; 0x11a0 <_ZN3OSD8write_xyEhhh>
    3fca:	4c 2f       	mov	r20, r28
    3fcc:	6d 2f       	mov	r22, r29
    3fce:	81 e0       	ldi	r24, 0x01	; 1
    3fd0:	0e 94 d0 08 	call	0x11a0	; 0x11a0 <_ZN3OSD8write_xyEhhh>
    3fd4:	80 91 86 06 	lds	r24, 0x0686	; 0x800686 <_ZL18osd_home_direction>
    3fd8:	90 e0       	ldi	r25, 0x00	; 0
    3fda:	20 91 16 01 	lds	r18, 0x0116	; 0x800116 <_ZL15takeoff_heading>
    3fde:	30 91 17 01 	lds	r19, 0x0117	; 0x800117 <_ZL15takeoff_heading+0x1>
    3fe2:	82 1b       	sub	r24, r18
    3fe4:	93 0b       	sbc	r25, r19
    3fe6:	0e 94 34 18 	call	0x3068	; 0x3068 <_Z15normalize_anglei>
    3fea:	85 3b       	cpi	r24, 0xB5	; 181
    3fec:	91 05       	cpc	r25, r1
    3fee:	34 f0       	brlt	.+12     	; 0x3ffc <_ZL10panHorizon5Point+0x2ac>
    3ff0:	28 e6       	ldi	r18, 0x68	; 104
    3ff2:	31 e0       	ldi	r19, 0x01	; 1
    3ff4:	a9 01       	movw	r20, r18
    3ff6:	48 1b       	sub	r20, r24
    3ff8:	59 0b       	sbc	r21, r25
    3ffa:	ca 01       	movw	r24, r20
    3ffc:	9c 01       	movw	r18, r24
    3ffe:	24 5b       	subi	r18, 0xB4	; 180
    4000:	31 09       	sbc	r19, r1
    4002:	48 e4       	ldi	r20, 0x48	; 72
    4004:	42 9f       	mul	r20, r18
    4006:	c0 01       	movw	r24, r0
    4008:	43 9f       	mul	r20, r19
    400a:	90 0d       	add	r25, r0
    400c:	11 24       	eor	r1, r1
    400e:	6a e0       	ldi	r22, 0x0A	; 10
    4010:	70 e0       	ldi	r23, 0x00	; 0
    4012:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    4016:	cb 01       	movw	r24, r22
    4018:	84 96       	adiw	r24, 0x24	; 36
    401a:	66 e0       	ldi	r22, 0x06	; 6
    401c:	70 e0       	ldi	r23, 0x00	; 0
    401e:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    4022:	67 fd       	sbrc	r22, 7
    4024:	07 c0       	rjmp	.+14     	; 0x4034 <_ZL10panHorizon5Point+0x2e4>
    4026:	6d 30       	cpi	r22, 0x0D	; 13
    4028:	44 f4       	brge	.+16     	; 0x403a <_ZL10panHorizon5Point+0x2ea>
    402a:	df eb       	ldi	r29, 0xBF	; 191
    402c:	d8 0f       	add	r29, r24
    402e:	c1 e0       	ldi	r28, 0x01	; 1
    4030:	c6 0f       	add	r28, r22
    4032:	05 c0       	rjmp	.+10     	; 0x403e <_ZL10panHorizon5Point+0x2ee>
    4034:	c1 e0       	ldi	r28, 0x01	; 1
    4036:	dc e3       	ldi	r29, 0x3C	; 60
    4038:	02 c0       	rjmp	.+4      	; 0x403e <_ZL10panHorizon5Point+0x2ee>
    403a:	cc e0       	ldi	r28, 0x0C	; 12
    403c:	de e3       	ldi	r29, 0x3E	; 62
    403e:	4d 2f       	mov	r20, r29
    4040:	64 e0       	ldi	r22, 0x04	; 4
    4042:	8c 2f       	mov	r24, r28
    4044:	0e 94 d0 08 	call	0x11a0	; 0x11a0 <_ZN3OSD8write_xyEhhh>
    4048:	4d 2f       	mov	r20, r29
    404a:	60 e0       	ldi	r22, 0x00	; 0
    404c:	8c 2f       	mov	r24, r28
    404e:	30 c0       	rjmp	.+96     	; 0x40b0 <_ZL10panHorizon5Point+0x360>
    4050:	80 90 7c 06 	lds	r8, 0x067C	; 0x80067c <_ZL11osd_alt_mav>
    4054:	90 90 7d 06 	lds	r9, 0x067D	; 0x80067d <_ZL11osd_alt_mav+0x1>
    4058:	a0 90 7e 06 	lds	r10, 0x067E	; 0x80067e <_ZL11osd_alt_mav+0x2>
    405c:	b0 90 7f 06 	lds	r11, 0x067F	; 0x80067f <_ZL11osd_alt_mav+0x3>
    4060:	0e 94 d5 14 	call	0x29aa	; 0x29aa <_Z12get_converthv>
    4064:	a5 01       	movw	r20, r10
    4066:	94 01       	movw	r18, r8
    4068:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    406c:	20 e0       	ldi	r18, 0x00	; 0
    406e:	30 e0       	ldi	r19, 0x00	; 0
    4070:	40 ea       	ldi	r20, 0xA0	; 160
    4072:	50 e4       	ldi	r21, 0x40	; 64
    4074:	0e 94 b8 3f 	call	0x7f70	; 0x7f70 <__addsf3>
    4078:	2d ec       	ldi	r18, 0xCD	; 205
    407a:	3c ec       	ldi	r19, 0xCC	; 204
    407c:	4c e8       	ldi	r20, 0x8C	; 140
    407e:	50 e4       	ldi	r21, 0x40	; 64
    4080:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    4084:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    4088:	86 2f       	mov	r24, r22
    408a:	9f ef       	ldi	r25, 0xFF	; 255
    408c:	96 0f       	add	r25, r22
    408e:	9b 32       	cpi	r25, 0x2B	; 43
    4090:	38 f4       	brcc	.+14     	; 0x40a0 <_ZL10panHorizon5Point+0x350>
    4092:	69 e0       	ldi	r22, 0x09	; 9
    4094:	0e 94 7e 43 	call	0x86fc	; 0x86fc <__divmodqi4>
    4098:	4f ec       	ldi	r20, 0xCF	; 207
    409a:	49 1b       	sub	r20, r25
    409c:	68 2f       	mov	r22, r24
    409e:	07 c0       	rjmp	.+14     	; 0x40ae <_ZL10panHorizon5Point+0x35e>
    40a0:	6c 32       	cpi	r22, 0x2C	; 44
    40a2:	1c f0       	brlt	.+6      	; 0x40aa <_ZL10panHorizon5Point+0x35a>
    40a4:	64 e0       	ldi	r22, 0x04	; 4
    40a6:	4e e2       	ldi	r20, 0x2E	; 46
    40a8:	02 c0       	rjmp	.+4      	; 0x40ae <_ZL10panHorizon5Point+0x35e>
    40aa:	60 e0       	ldi	r22, 0x00	; 0
    40ac:	4f ec       	ldi	r20, 0xCF	; 207
    40ae:	86 e0       	ldi	r24, 0x06	; 6
    40b0:	0e 94 d0 08 	call	0x11a0	; 0x11a0 <_ZN3OSD8write_xyEhhh>
    40b4:	df 91       	pop	r29
    40b6:	cf 91       	pop	r28
    40b8:	1f 91       	pop	r17
    40ba:	0f 91       	pop	r16
    40bc:	ff 90       	pop	r15
    40be:	ef 90       	pop	r14
    40c0:	df 90       	pop	r13
    40c2:	bf 90       	pop	r11
    40c4:	af 90       	pop	r10
    40c6:	9f 90       	pop	r9
    40c8:	8f 90       	pop	r8
    40ca:	7f 90       	pop	r7
    40cc:	6f 90       	pop	r6
    40ce:	5f 90       	pop	r5
    40d0:	4f 90       	pop	r4
    40d2:	08 95       	ret

000040d4 <_Z11writePanelsm>:
    40d4:	ab e0       	ldi	r26, 0x0B	; 11
    40d6:	b0 e0       	ldi	r27, 0x00	; 0
    40d8:	e0 e7       	ldi	r30, 0x70	; 112
    40da:	f0 e2       	ldi	r31, 0x20	; 32
    40dc:	0c 94 69 44 	jmp	0x88d2	; 0x88d2 <__prologue_saves__>
    40e0:	6b 01       	movw	r12, r22
    40e2:	7c 01       	movw	r14, r24
    40e4:	0e 94 cf 07 	call	0xf9e	; 0xf9e <_ZN3OSD10detectModeEv>
    40e8:	80 91 5d 04 	lds	r24, 0x045D	; 0x80045d <sets+0x4>
    40ec:	10 91 bb 03 	lds	r17, 0x03BB	; 0x8003bb <lflags+0x7>
    40f0:	81 11       	cpse	r24, r1
    40f2:	2d c0       	rjmp	.+90     	; 0x414e <_Z11writePanelsm+0x7a>
    40f4:	11 23       	and	r17, r17
    40f6:	89 f1       	breq	.+98     	; 0x415a <_Z11writePanelsm+0x86>
    40f8:	80 91 bf 03 	lds	r24, 0x03BF	; 0x8003bf <lflags+0xb>
    40fc:	80 ff       	sbrs	r24, 0
    40fe:	2d c0       	rjmp	.+90     	; 0x415a <_Z11writePanelsm+0x86>
    4100:	60 91 d7 06 	lds	r22, 0x06D7	; 0x8006d7 <_ZL15osd_alt_to_home>
    4104:	70 91 d8 06 	lds	r23, 0x06D8	; 0x8006d8 <_ZL15osd_alt_to_home+0x1>
    4108:	80 91 d9 06 	lds	r24, 0x06D9	; 0x8006d9 <_ZL15osd_alt_to_home+0x2>
    410c:	90 91 da 06 	lds	r25, 0x06DA	; 0x8006da <_ZL15osd_alt_to_home+0x3>
    4110:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    4114:	6b 30       	cpi	r22, 0x0B	; 11
    4116:	71 05       	cpc	r23, r1
    4118:	8c f4       	brge	.+34     	; 0x413c <_Z11writePanelsm+0x68>
    411a:	60 91 6a 06 	lds	r22, 0x066A	; 0x80066a <_ZL15osd_groundspeed>
    411e:	70 91 6b 06 	lds	r23, 0x066B	; 0x80066b <_ZL15osd_groundspeed+0x1>
    4122:	80 91 6c 06 	lds	r24, 0x066C	; 0x80066c <_ZL15osd_groundspeed+0x2>
    4126:	90 91 6d 06 	lds	r25, 0x066D	; 0x80066d <_ZL15osd_groundspeed+0x3>
    412a:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    412e:	62 30       	cpi	r22, 0x02	; 2
    4130:	71 05       	cpc	r23, r1
    4132:	24 f4       	brge	.+8      	; 0x413c <_Z11writePanelsm+0x68>
    4134:	80 91 65 06 	lds	r24, 0x0665	; 0x800665 <_ZL12osd_throttle>
    4138:	82 30       	cpi	r24, 0x02	; 2
    413a:	78 f0       	brcs	.+30     	; 0x415a <_Z11writePanelsm+0x86>
    413c:	c0 92 d3 06 	sts	0x06D3, r12	; 0x8006d3 <_ZL6landed>
    4140:	d0 92 d4 06 	sts	0x06D4, r13	; 0x8006d4 <_ZL6landed+0x1>
    4144:	e0 92 d5 06 	sts	0x06D5, r14	; 0x8006d5 <_ZL6landed+0x2>
    4148:	f0 92 d6 06 	sts	0x06D6, r15	; 0x8006d6 <_ZL6landed+0x3>
    414c:	06 c0       	rjmp	.+12     	; 0x415a <_Z11writePanelsm+0x86>
    414e:	11 11       	cpse	r17, r1
    4150:	04 c0       	rjmp	.+8      	; 0x415a <_Z11writePanelsm+0x86>
    4152:	80 91 bc 03 	lds	r24, 0x03BC	; 0x8003bc <lflags+0x8>
    4156:	81 11       	cpse	r24, r1
    4158:	f1 cf       	rjmp	.-30     	; 0x413c <_Z11writePanelsm+0x68>
    415a:	10 93 bc 03 	sts	0x03BC, r17	; 0x8003bc <lflags+0x8>
    415e:	80 91 a0 04 	lds	r24, 0x04A0	; 0x8004a0 <sets+0x47>
    4162:	85 30       	cpi	r24, 0x05	; 5
    4164:	18 f0       	brcs	.+6      	; 0x416c <_Z11writePanelsm+0x98>
    4166:	84 e0       	ldi	r24, 0x04	; 4
    4168:	80 93 a0 04 	sts	0x04A0, r24	; 0x8004a0 <sets+0x47>
    416c:	8d e5       	ldi	r24, 0x5D	; 93
    416e:	96 e0       	ldi	r25, 0x06	; 6
    4170:	0e 94 40 18 	call	0x3080	; 0x3080 <_Z10time_sincePm>
    4174:	85 3c       	cpi	r24, 0xC5	; 197
    4176:	99 40       	sbci	r25, 0x09	; 9
    4178:	08 f4       	brcc	.+2      	; 0x417c <_Z11writePanelsm+0xa8>
    417a:	83 c0       	rjmp	.+262    	; 0x4282 <_Z11writePanelsm+0x1ae>
    417c:	10 92 6a 06 	sts	0x066A, r1	; 0x80066a <_ZL15osd_groundspeed>
    4180:	10 92 6b 06 	sts	0x066B, r1	; 0x80066b <_ZL15osd_groundspeed+0x1>
    4184:	10 92 6c 06 	sts	0x066C, r1	; 0x80066c <_ZL15osd_groundspeed+0x2>
    4188:	10 92 6d 06 	sts	0x066D, r1	; 0x80066d <_ZL15osd_groundspeed+0x3>
    418c:	62 e0       	ldi	r22, 0x02	; 2
    418e:	85 e0       	ldi	r24, 0x05	; 5
    4190:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    4194:	60 91 63 06 	lds	r22, 0x0663	; 0x800663 <_ZL7seconds>
    4198:	70 91 64 06 	lds	r23, 0x0664	; 0x800664 <_ZL7seconds+0x1>
    419c:	80 91 61 06 	lds	r24, 0x0661	; 0x800661 <_ZL14lastMavSeconds>
    41a0:	90 91 62 06 	lds	r25, 0x0662	; 0x800662 <_ZL14lastMavSeconds+0x1>
    41a4:	68 1b       	sub	r22, r24
    41a6:	79 0b       	sbc	r23, r25
    41a8:	87 ef       	ldi	r24, 0xF7	; 247
    41aa:	92 e0       	ldi	r25, 0x02	; 2
    41ac:	0e 94 3f 0a 	call	0x147e	; 0x147e <_ZL12osd_printi_1PKci>
    41b0:	40 91 eb 03 	lds	r20, 0x03EB	; 0x8003eb <serial_speed>
    41b4:	50 91 ec 03 	lds	r21, 0x03EC	; 0x8003ec <serial_speed+0x1>
    41b8:	60 91 ed 03 	lds	r22, 0x03ED	; 0x8003ed <serial_speed+0x2>
    41bc:	70 91 ee 03 	lds	r23, 0x03EE	; 0x8003ee <serial_speed+0x3>
    41c0:	41 15       	cp	r20, r1
    41c2:	51 05       	cpc	r21, r1
    41c4:	61 05       	cpc	r22, r1
    41c6:	71 05       	cpc	r23, r1
    41c8:	31 f0       	breq	.+12     	; 0x41d6 <_Z11writePanelsm+0x102>
    41ca:	2a e0       	ldi	r18, 0x0A	; 10
    41cc:	30 e0       	ldi	r19, 0x00	; 0
    41ce:	88 e6       	ldi	r24, 0x68	; 104
    41d0:	93 e0       	ldi	r25, 0x03	; 3
    41d2:	0e 94 04 38 	call	0x7008	; 0x7008 <_ZN5Print5printEmi>
    41d6:	65 e0       	ldi	r22, 0x05	; 5
    41d8:	81 e0       	ldi	r24, 0x01	; 1
    41da:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    41de:	80 91 dd 03 	lds	r24, 0x03DD	; 0x8003dd <lost_bytes>
    41e2:	90 91 de 03 	lds	r25, 0x03DE	; 0x8003de <lost_bytes+0x1>
    41e6:	9f 93       	push	r25
    41e8:	8f 93       	push	r24
    41ea:	80 91 e4 03 	lds	r24, 0x03E4	; 0x8003e4 <bytes_comes+0x3>
    41ee:	8f 93       	push	r24
    41f0:	80 91 e3 03 	lds	r24, 0x03E3	; 0x8003e3 <bytes_comes+0x2>
    41f4:	8f 93       	push	r24
    41f6:	80 91 e2 03 	lds	r24, 0x03E2	; 0x8003e2 <bytes_comes+0x1>
    41fa:	8f 93       	push	r24
    41fc:	80 91 e1 03 	lds	r24, 0x03E1	; 0x8003e1 <bytes_comes>
    4200:	8f 93       	push	r24
    4202:	80 91 ea 03 	lds	r24, 0x03EA	; 0x8003ea <packet_drops+0x1>
    4206:	8f 93       	push	r24
    4208:	80 91 e9 03 	lds	r24, 0x03E9	; 0x8003e9 <packet_drops>
    420c:	8f 93       	push	r24
    420e:	80 91 e0 03 	lds	r24, 0x03E0	; 0x8003e0 <max_dly+0x1>
    4212:	8f 93       	push	r24
    4214:	80 91 df 03 	lds	r24, 0x03DF	; 0x8003df <max_dly>
    4218:	8f 93       	push	r24
    421a:	88 ec       	ldi	r24, 0xC8	; 200
    421c:	92 e0       	ldi	r25, 0x02	; 2
    421e:	9f 93       	push	r25
    4220:	8f 93       	push	r24
    4222:	08 e6       	ldi	r16, 0x68	; 104
    4224:	13 e0       	ldi	r17, 0x03	; 3
    4226:	1f 93       	push	r17
    4228:	0f 93       	push	r16
    422a:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    422e:	80 91 e8 03 	lds	r24, 0x03E8	; 0x8003e8 <packets_skip+0x1>
    4232:	8f 93       	push	r24
    4234:	80 91 e7 03 	lds	r24, 0x03E7	; 0x8003e7 <packets_skip>
    4238:	8f 93       	push	r24
    423a:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <packets_got+0x1>
    423e:	8f 93       	push	r24
    4240:	80 91 e5 03 	lds	r24, 0x03E5	; 0x8003e5 <packets_got>
    4244:	8f 93       	push	r24
    4246:	80 eb       	ldi	r24, 0xB0	; 176
    4248:	92 e0       	ldi	r25, 0x02	; 2
    424a:	9f 93       	push	r25
    424c:	8f 93       	push	r24
    424e:	1f 93       	push	r17
    4250:	0f 93       	push	r16
    4252:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    4256:	80 91 11 01 	lds	r24, 0x0111	; 0x800111 <stack_bottom>
    425a:	90 91 12 01 	lds	r25, 0x0112	; 0x800112 <stack_bottom+0x1>
    425e:	9f 93       	push	r25
    4260:	8f 93       	push	r24
    4262:	8d e9       	ldi	r24, 0x9D	; 157
    4264:	92 e0       	ldi	r25, 0x02	; 2
    4266:	9f 93       	push	r25
    4268:	8f 93       	push	r24
    426a:	1f 93       	push	r17
    426c:	0f 93       	push	r16
    426e:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    4272:	10 92 b6 03 	sts	0x03B6, r1	; 0x8003b6 <lflags+0x2>
    4276:	0f b6       	in	r0, 0x3f	; 63
    4278:	f8 94       	cli
    427a:	de bf       	out	0x3e, r29	; 62
    427c:	0f be       	out	0x3f, r0	; 63
    427e:	cd bf       	out	0x3d, r28	; 61
    4280:	43 c3       	rjmp	.+1670   	; 0x4908 <_Z11writePanelsm+0x834>
    4282:	80 91 5a 04 	lds	r24, 0x045A	; 0x80045a <sets+0x1>
    4286:	80 ff       	sbrs	r24, 0
    4288:	36 c0       	rjmp	.+108    	; 0x42f6 <_Z11writePanelsm+0x222>
    428a:	80 91 bb 03 	lds	r24, 0x03BB	; 0x8003bb <lflags+0x7>
    428e:	81 11       	cpse	r24, r1
    4290:	2e c0       	rjmp	.+92     	; 0x42ee <_Z11writePanelsm+0x21a>
    4292:	80 91 d3 06 	lds	r24, 0x06D3	; 0x8006d3 <_ZL6landed>
    4296:	90 91 d4 06 	lds	r25, 0x06D4	; 0x8006d4 <_ZL6landed+0x1>
    429a:	a0 91 d5 06 	lds	r26, 0x06D5	; 0x8006d5 <_ZL6landed+0x2>
    429e:	b0 91 d6 06 	lds	r27, 0x06D6	; 0x8006d6 <_ZL6landed+0x3>
    42a2:	89 2b       	or	r24, r25
    42a4:	8a 2b       	or	r24, r26
    42a6:	8b 2b       	or	r24, r27
    42a8:	11 f1       	breq	.+68     	; 0x42ee <_Z11writePanelsm+0x21a>
    42aa:	83 ed       	ldi	r24, 0xD3	; 211
    42ac:	96 e0       	ldi	r25, 0x06	; 6
    42ae:	0e 94 40 18 	call	0x3080	; 0x3080 <_Z10time_sincePm>
    42b2:	88 3b       	cpi	r24, 0xB8	; 184
    42b4:	9b 40       	sbci	r25, 0x0B	; 11
    42b6:	d8 f4       	brcc	.+54     	; 0x42ee <_Z11writePanelsm+0x21a>
    42b8:	60 91 f2 06 	lds	r22, 0x06F2	; 0x8006f2 <_ZL13trip_distance>
    42bc:	70 91 f3 06 	lds	r23, 0x06F3	; 0x8006f3 <_ZL13trip_distance+0x1>
    42c0:	80 91 f4 06 	lds	r24, 0x06F4	; 0x8006f4 <_ZL13trip_distance+0x2>
    42c4:	90 91 f5 06 	lds	r25, 0x06F5	; 0x8006f5 <_ZL13trip_distance+0x3>
    42c8:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    42cc:	66 30       	cpi	r22, 0x06	; 6
    42ce:	71 05       	cpc	r23, r1
    42d0:	74 f0       	brlt	.+28     	; 0x42ee <_Z11writePanelsm+0x21a>
    42d2:	81 e0       	ldi	r24, 0x01	; 1
    42d4:	80 93 c9 03 	sts	0x03C9, r24	; 0x8003c9 <lflags+0x15>
    42d8:	0e 94 b6 09 	call	0x136c	; 0x136c <_ZL13storeChannelsv>
    42dc:	80 91 56 06 	lds	r24, 0x0656	; 0x800656 <_ZL6panelN>
    42e0:	80 93 98 03 	sts	0x0398, r24	; 0x800398 <fdata_screen>
    42e4:	81 e0       	ldi	r24, 0x01	; 1
    42e6:	91 e0       	ldi	r25, 0x01	; 1
    42e8:	0e 94 4e 16 	call	0x2c9c	; 0x2c9c <_ZL8panFdata5Point>
    42ec:	0d c3       	rjmp	.+1562   	; 0x4908 <_Z11writePanelsm+0x834>
    42ee:	80 91 c9 03 	lds	r24, 0x03C9	; 0x8003c9 <lflags+0x15>
    42f2:	81 11       	cpse	r24, r1
    42f4:	cd c2       	rjmp	.+1434   	; 0x4890 <_Z11writePanelsm+0x7bc>
    42f6:	80 91 a0 04 	lds	r24, 0x04A0	; 0x8004a0 <sets+0x47>
    42fa:	88 23       	and	r24, r24
    42fc:	29 f0       	breq	.+10     	; 0x4308 <_Z11writePanelsm+0x234>
    42fe:	90 91 56 06 	lds	r25, 0x0656	; 0x800656 <_ZL6panelN>
    4302:	98 17       	cp	r25, r24
    4304:	08 f0       	brcs	.+2      	; 0x4308 <_Z11writePanelsm+0x234>
    4306:	67 c0       	rjmp	.+206    	; 0x43d6 <_Z11writePanelsm+0x302>
    4308:	60 e0       	ldi	r22, 0x00	; 0
    430a:	80 e0       	ldi	r24, 0x00	; 0
    430c:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    4310:	80 91 dd 03 	lds	r24, 0x03DD	; 0x8003dd <lost_bytes>
    4314:	90 91 de 03 	lds	r25, 0x03DE	; 0x8003de <lost_bytes+0x1>
    4318:	9f 93       	push	r25
    431a:	8f 93       	push	r24
    431c:	80 91 e4 03 	lds	r24, 0x03E4	; 0x8003e4 <bytes_comes+0x3>
    4320:	8f 93       	push	r24
    4322:	80 91 e3 03 	lds	r24, 0x03E3	; 0x8003e3 <bytes_comes+0x2>
    4326:	8f 93       	push	r24
    4328:	80 91 e2 03 	lds	r24, 0x03E2	; 0x8003e2 <bytes_comes+0x1>
    432c:	8f 93       	push	r24
    432e:	80 91 e1 03 	lds	r24, 0x03E1	; 0x8003e1 <bytes_comes>
    4332:	8f 93       	push	r24
    4334:	80 91 ea 03 	lds	r24, 0x03EA	; 0x8003ea <packet_drops+0x1>
    4338:	8f 93       	push	r24
    433a:	80 91 e9 03 	lds	r24, 0x03E9	; 0x8003e9 <packet_drops>
    433e:	8f 93       	push	r24
    4340:	8a e2       	ldi	r24, 0x2A	; 42
    4342:	92 e0       	ldi	r25, 0x02	; 2
    4344:	9f 93       	push	r25
    4346:	8f 93       	push	r24
    4348:	08 e6       	ldi	r16, 0x68	; 104
    434a:	13 e0       	ldi	r17, 0x03	; 3
    434c:	1f 93       	push	r17
    434e:	0f 93       	push	r16
    4350:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    4354:	80 91 e8 03 	lds	r24, 0x03E8	; 0x8003e8 <packets_skip+0x1>
    4358:	8f 93       	push	r24
    435a:	80 91 e7 03 	lds	r24, 0x03E7	; 0x8003e7 <packets_skip>
    435e:	8f 93       	push	r24
    4360:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <packets_got+0x1>
    4364:	8f 93       	push	r24
    4366:	80 91 e5 03 	lds	r24, 0x03E5	; 0x8003e5 <packets_got>
    436a:	8f 93       	push	r24
    436c:	8d e1       	ldi	r24, 0x1D	; 29
    436e:	92 e0       	ldi	r25, 0x02	; 2
    4370:	9f 93       	push	r25
    4372:	8f 93       	push	r24
    4374:	1f 93       	push	r17
    4376:	0f 93       	push	r16
    4378:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    437c:	0f b6       	in	r0, 0x3f	; 63
    437e:	f8 94       	cli
    4380:	de bf       	out	0x3e, r29	; 62
    4382:	0f be       	out	0x3f, r0	; 63
    4384:	cd bf       	out	0x3d, r28	; 61
    4386:	06 eb       	ldi	r16, 0xB6	; 182
    4388:	15 e0       	ldi	r17, 0x05	; 5
    438a:	f8 01       	movw	r30, r16
    438c:	b4 90       	lpm	r11, Z
    438e:	c8 01       	movw	r24, r16
    4390:	01 96       	adiw	r24, 0x01	; 1
    4392:	fc 01       	movw	r30, r24
    4394:	c5 90       	lpm	r12, Z+
    4396:	d4 90       	lpm	r13, Z
    4398:	c1 14       	cp	r12, r1
    439a:	d1 04       	cpc	r13, r1
    439c:	09 f4       	brne	.+2      	; 0x43a0 <_Z11writePanelsm+0x2cc>
    439e:	b4 c2       	rjmp	.+1384   	; 0x4908 <_Z11writePanelsm+0x834>
    43a0:	8b 2d       	mov	r24, r11
    43a2:	8f 77       	andi	r24, 0x7F	; 127
    43a4:	0e 94 92 14 	call	0x2924	; 0x2924 <_Z9readPanelh>
    43a8:	7c 01       	movw	r14, r24
    43aa:	0e 94 3b 0a 	call	0x1476	; 0x1476 <_ZL12osd_setPanel5Point>
    43ae:	f7 fc       	sbrc	r15, 7
    43b0:	0a c0       	rjmp	.+20     	; 0x43c6 <_Z11writePanelsm+0x2f2>
    43b2:	e7 fc       	sbrc	r14, 7
    43b4:	0a c0       	rjmp	.+20     	; 0x43ca <_Z11writePanelsm+0x2f6>
    43b6:	f8 01       	movw	r30, r16
    43b8:	33 96       	adiw	r30, 0x03	; 3
    43ba:	84 91       	lpm	r24, Z
    43bc:	88 23       	and	r24, r24
    43be:	29 f0       	breq	.+10     	; 0x43ca <_Z11writePanelsm+0x2f6>
    43c0:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    43c4:	02 c0       	rjmp	.+4      	; 0x43ca <_Z11writePanelsm+0x2f6>
    43c6:	b7 fe       	sbrs	r11, 7
    43c8:	03 c0       	rjmp	.+6      	; 0x43d0 <_Z11writePanelsm+0x2fc>
    43ca:	c7 01       	movw	r24, r14
    43cc:	f6 01       	movw	r30, r12
    43ce:	09 95       	icall
    43d0:	0c 5f       	subi	r16, 0xFC	; 252
    43d2:	1f 4f       	sbci	r17, 0xFF	; 255
    43d4:	da cf       	rjmp	.-76     	; 0x438a <_Z11writePanelsm+0x2b6>
    43d6:	80 91 bb 03 	lds	r24, 0x03BB	; 0x8003bb <lflags+0x7>
    43da:	81 11       	cpse	r24, r1
    43dc:	50 c2       	rjmp	.+1184   	; 0x487e <_Z11writePanelsm+0x7aa>
    43de:	1d 82       	std	Y+5, r1	; 0x05
    43e0:	1e 82       	std	Y+6, r1	; 0x06
    43e2:	1f 82       	std	Y+7, r1	; 0x07
    43e4:	18 86       	std	Y+8, r1	; 0x08
    43e6:	40 91 45 06 	lds	r20, 0x0645	; 0x800645 <_ZL12setup_screen>
    43ea:	a4 2e       	mov	r10, r20
    43ec:	b1 2c       	mov	r11, r1
    43ee:	f5 e0       	ldi	r31, 0x05	; 5
    43f0:	4f 9f       	mul	r20, r31
    43f2:	a0 01       	movw	r20, r0
    43f4:	11 24       	eor	r1, r1
    43f6:	fa 01       	movw	r30, r20
    43f8:	ea 57       	subi	r30, 0x7A	; 122
    43fa:	f9 4f       	sbci	r31, 0xF9	; 249
    43fc:	85 91       	lpm	r24, Z+
    43fe:	94 91       	lpm	r25, Z
    4400:	90 93 93 03 	sts	0x0393, r25	; 0x800393 <params+0x1>
    4404:	80 93 92 03 	sts	0x0392, r24	; 0x800392 <params>
    4408:	fa 01       	movw	r30, r20
    440a:	e8 57       	subi	r30, 0x78	; 120
    440c:	f9 4f       	sbci	r31, 0xF9	; 249
    440e:	f4 90       	lpm	r15, Z
    4410:	0e 94 b6 09 	call	0x136c	; 0x136c <_ZL13storeChannelsv>
    4414:	c1 2c       	mov	r12, r1
    4416:	d1 2c       	mov	r13, r1
    4418:	e1 2c       	mov	r14, r1
    441a:	1a 86       	std	Y+10, r1	; 0x0a
    441c:	1b 86       	std	Y+11, r1	; 0x0b
    441e:	31 2c       	mov	r3, r1
    4420:	21 2c       	mov	r2, r1
    4422:	19 86       	std	Y+9, r1	; 0x09
    4424:	ef 14       	cp	r14, r15
    4426:	09 f4       	brne	.+2      	; 0x442a <_Z11writePanelsm+0x356>
    4428:	be c0       	rjmp	.+380    	; 0x45a6 <_Z11writePanelsm+0x4d2>
    442a:	55 24       	eor	r5, r5
    442c:	53 94       	inc	r5
    442e:	5e 0c       	add	r5, r14
    4430:	00 91 92 03 	lds	r16, 0x0392	; 0x800392 <params>
    4434:	10 91 93 03 	lds	r17, 0x0393	; 0x800393 <params+0x1>
    4438:	0c 0d       	add	r16, r12
    443a:	1d 1d       	adc	r17, r13
    443c:	f8 01       	movw	r30, r16
    443e:	85 90       	lpm	r8, Z+
    4440:	94 90       	lpm	r9, Z
    4442:	65 2d       	mov	r22, r5
    4444:	81 e0       	ldi	r24, 0x01	; 1
    4446:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    444a:	c4 01       	movw	r24, r8
    444c:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    4450:	65 2d       	mov	r22, r5
    4452:	83 e1       	ldi	r24, 0x13	; 19
    4454:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    4458:	80 91 10 01 	lds	r24, 0x0110	; 0x800110 <_ZL10setup_menu>
    445c:	e8 12       	cpse	r14, r24
    445e:	03 c0       	rjmp	.+6      	; 0x4466 <_Z11writePanelsm+0x392>
    4460:	8e e3       	ldi	r24, 0x3E	; 62
    4462:	0e 94 bd 08 	call	0x117a	; 0x117a <_ZN3OSD7write_SEh>
    4466:	f8 01       	movw	r30, r16
    4468:	32 96       	adiw	r30, 0x02	; 2
    446a:	e4 91       	lpm	r30, Z
    446c:	ef 77       	andi	r30, 0x7F	; 127
    446e:	e3 36       	cpi	r30, 0x63	; 99
    4470:	09 f4       	brne	.+2      	; 0x4474 <_Z11writePanelsm+0x3a0>
    4472:	57 c0       	rjmp	.+174    	; 0x4522 <_Z11writePanelsm+0x44e>
    4474:	80 f4       	brcc	.+32     	; 0x4496 <_Z11writePanelsm+0x3c2>
    4476:	e2 34       	cpi	r30, 0x42	; 66
    4478:	b9 f1       	breq	.+110    	; 0x44e8 <_Z11writePanelsm+0x414>
    447a:	20 f4       	brcc	.+8      	; 0x4484 <_Z11writePanelsm+0x3b0>
    447c:	ee 23       	and	r30, r30
    447e:	09 f4       	brne	.+2      	; 0x4482 <_Z11writePanelsm+0x3ae>
    4480:	8d c0       	rjmp	.+282    	; 0x459c <_Z11writePanelsm+0x4c8>
    4482:	6f c0       	rjmp	.+222    	; 0x4562 <_Z11writePanelsm+0x48e>
    4484:	ea 35       	cpi	r30, 0x5A	; 90
    4486:	09 f4       	brne	.+2      	; 0x448a <_Z11writePanelsm+0x3b6>
    4488:	4a c0       	rjmp	.+148    	; 0x451e <_Z11writePanelsm+0x44a>
    448a:	e2 36       	cpi	r30, 0x62	; 98
    448c:	09 f0       	breq	.+2      	; 0x4490 <_Z11writePanelsm+0x3bc>
    448e:	69 c0       	rjmp	.+210    	; 0x4562 <_Z11writePanelsm+0x48e>
    4490:	44 24       	eor	r4, r4
    4492:	43 94       	inc	r4
    4494:	2b c0       	rjmp	.+86     	; 0x44ec <_Z11writePanelsm+0x418>
    4496:	e8 36       	cpi	r30, 0x68	; 104
    4498:	d9 f0       	breq	.+54     	; 0x44d0 <_Z11writePanelsm+0x3fc>
    449a:	88 f4       	brcc	.+34     	; 0x44be <_Z11writePanelsm+0x3ea>
    449c:	e6 36       	cpi	r30, 0x66	; 102
    449e:	09 f0       	breq	.+2      	; 0x44a2 <_Z11writePanelsm+0x3ce>
    44a0:	60 c0       	rjmp	.+192    	; 0x4562 <_Z11writePanelsm+0x48e>
    44a2:	f8 01       	movw	r30, r16
    44a4:	33 96       	adiw	r30, 0x03	; 3
    44a6:	a5 91       	lpm	r26, Z+
    44a8:	b4 91       	lpm	r27, Z
    44aa:	8d 91       	ld	r24, X+
    44ac:	9d 91       	ld	r25, X+
    44ae:	0d 90       	ld	r0, X+
    44b0:	bc 91       	ld	r27, X
    44b2:	a0 2d       	mov	r26, r0
    44b4:	8d 83       	std	Y+5, r24	; 0x05
    44b6:	9e 83       	std	Y+6, r25	; 0x06
    44b8:	af 83       	std	Y+7, r26	; 0x07
    44ba:	b8 87       	std	Y+8, r27	; 0x08
    44bc:	52 c0       	rjmp	.+164    	; 0x4562 <_Z11writePanelsm+0x48e>
    44be:	e3 37       	cpi	r30, 0x73	; 115
    44c0:	09 f4       	brne	.+2      	; 0x44c4 <_Z11writePanelsm+0x3f0>
    44c2:	45 c0       	rjmp	.+138    	; 0x454e <_Z11writePanelsm+0x47a>
    44c4:	ea 37       	cpi	r30, 0x7A	; 122
    44c6:	09 f0       	breq	.+2      	; 0x44ca <_Z11writePanelsm+0x3f6>
    44c8:	4c c0       	rjmp	.+152    	; 0x4562 <_Z11writePanelsm+0x48e>
    44ca:	20 e1       	ldi	r18, 0x10	; 16
    44cc:	29 87       	std	Y+9, r18	; 0x09
    44ce:	29 c0       	rjmp	.+82     	; 0x4522 <_Z11writePanelsm+0x44e>
    44d0:	80 91 37 03 	lds	r24, 0x0337	; 0x800337 <_ZN3OSD10video_modeE>
    44d4:	80 34       	cpi	r24, 0x40	; 64
    44d6:	19 f0       	breq	.+6      	; 0x44de <_Z11writePanelsm+0x40a>
    44d8:	8e e0       	ldi	r24, 0x0E	; 14
    44da:	92 e0       	ldi	r25, 0x02	; 2
    44dc:	02 c0       	rjmp	.+4      	; 0x44e2 <_Z11writePanelsm+0x40e>
    44de:	86 e1       	ldi	r24, 0x16	; 22
    44e0:	92 e0       	ldi	r25, 0x02	; 2
    44e2:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    44e6:	5a c0       	rjmp	.+180    	; 0x459c <_Z11writePanelsm+0x4c8>
    44e8:	6a e0       	ldi	r22, 0x0A	; 10
    44ea:	46 2e       	mov	r4, r22
    44ec:	f8 01       	movw	r30, r16
    44ee:	33 96       	adiw	r30, 0x03	; 3
    44f0:	a5 91       	lpm	r26, Z+
    44f2:	b4 91       	lpm	r27, Z
    44f4:	6c 91       	ld	r22, X
    44f6:	70 e0       	ldi	r23, 0x00	; 0
    44f8:	80 e0       	ldi	r24, 0x00	; 0
    44fa:	90 e0       	ldi	r25, 0x00	; 0
    44fc:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    4500:	3b 01       	movw	r6, r22
    4502:	4c 01       	movw	r8, r24
    4504:	64 2d       	mov	r22, r4
    4506:	70 e0       	ldi	r23, 0x00	; 0
    4508:	80 e0       	ldi	r24, 0x00	; 0
    450a:	90 e0       	ldi	r25, 0x00	; 0
    450c:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    4510:	9b 01       	movw	r18, r22
    4512:	ac 01       	movw	r20, r24
    4514:	c4 01       	movw	r24, r8
    4516:	b3 01       	movw	r22, r6
    4518:	0e 94 a0 40 	call	0x8140	; 0x8140 <__divsf3>
    451c:	13 c0       	rjmp	.+38     	; 0x4544 <_Z11writePanelsm+0x470>
    451e:	80 e2       	ldi	r24, 0x20	; 32
    4520:	89 87       	std	Y+9, r24	; 0x09
    4522:	f8 01       	movw	r30, r16
    4524:	33 96       	adiw	r30, 0x03	; 3
    4526:	a5 91       	lpm	r26, Z+
    4528:	b4 91       	lpm	r27, Z
    452a:	6c 91       	ld	r22, X
    452c:	06 2e       	mov	r0, r22
    452e:	00 0c       	add	r0, r0
    4530:	77 0b       	sbc	r23, r23
    4532:	99 85       	ldd	r25, Y+9	; 0x09
    4534:	69 1b       	sub	r22, r25
    4536:	71 09       	sbc	r23, r1
    4538:	07 2e       	mov	r0, r23
    453a:	00 0c       	add	r0, r0
    453c:	88 0b       	sbc	r24, r24
    453e:	99 0b       	sbc	r25, r25
    4540:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    4544:	6d 83       	std	Y+5, r22	; 0x05
    4546:	7e 83       	std	Y+6, r23	; 0x06
    4548:	8f 83       	std	Y+7, r24	; 0x07
    454a:	98 87       	std	Y+8, r25	; 0x08
    454c:	0a c0       	rjmp	.+20     	; 0x4562 <_Z11writePanelsm+0x48e>
    454e:	f8 01       	movw	r30, r16
    4550:	33 96       	adiw	r30, 0x03	; 3
    4552:	65 91       	lpm	r22, Z+
    4554:	74 91       	lpm	r23, Z
    4556:	44 e0       	ldi	r20, 0x04	; 4
    4558:	50 e0       	ldi	r21, 0x00	; 0
    455a:	ce 01       	movw	r24, r28
    455c:	05 96       	adiw	r24, 0x05	; 5
    455e:	0e 94 55 11 	call	0x22aa	; 0x22aa <_Z15eeprom_read_lenPhjj>
    4562:	80 91 10 01 	lds	r24, 0x0110	; 0x800110 <_ZL10setup_menu>
    4566:	bd 81       	ldd	r27, Y+5	; 0x05
    4568:	ae 81       	ldd	r26, Y+6	; 0x06
    456a:	3f 81       	ldd	r19, Y+7	; 0x07
    456c:	28 85       	ldd	r18, Y+8	; 0x08
    456e:	e8 12       	cpse	r14, r24
    4570:	03 c0       	rjmp	.+6      	; 0x4578 <_Z11writePanelsm+0x4a4>
    4572:	ba 87       	std	Y+10, r27	; 0x0a
    4574:	ab 87       	std	Y+11, r26	; 0x0b
    4576:	19 01       	movw	r2, r18
    4578:	f8 01       	movw	r30, r16
    457a:	35 96       	adiw	r30, 0x05	; 5
    457c:	e4 91       	lpm	r30, Z
    457e:	e2 95       	swap	r30
    4580:	ef 70       	andi	r30, 0x0F	; 15
    4582:	f0 e0       	ldi	r31, 0x00	; 0
    4584:	ee 0f       	add	r30, r30
    4586:	ff 1f       	adc	r31, r31
    4588:	e0 50       	subi	r30, 0x00	; 0
    458a:	f9 4f       	sbci	r31, 0xF9	; 249
    458c:	85 91       	lpm	r24, Z+
    458e:	94 91       	lpm	r25, Z
    4590:	4b 2f       	mov	r20, r27
    4592:	5a 2f       	mov	r21, r26
    4594:	63 2f       	mov	r22, r19
    4596:	72 2f       	mov	r23, r18
    4598:	0e 94 f9 0c 	call	0x19f2	; 0x19f2 <_ZL12osd_printf_1PKcf>
    459c:	e6 e0       	ldi	r30, 0x06	; 6
    459e:	ce 0e       	add	r12, r30
    45a0:	d1 1c       	adc	r13, r1
    45a2:	e5 2c       	mov	r14, r5
    45a4:	3f cf       	rjmp	.-386    	; 0x4424 <_Z11writePanelsm+0x350>
    45a6:	85 e0       	ldi	r24, 0x05	; 5
    45a8:	8a 9d       	mul	r24, r10
    45aa:	f0 01       	movw	r30, r0
    45ac:	8b 9d       	mul	r24, r11
    45ae:	f0 0d       	add	r31, r0
    45b0:	11 24       	eor	r1, r1
    45b2:	e7 57       	subi	r30, 0x77	; 119
    45b4:	f9 4f       	sbci	r31, 0xF9	; 249
    45b6:	85 91       	lpm	r24, Z+
    45b8:	94 91       	lpm	r25, Z
    45ba:	00 97       	sbiw	r24, 0x00	; 0
    45bc:	11 f0       	breq	.+4      	; 0x45c2 <_Z11writePanelsm+0x4ee>
    45be:	fc 01       	movw	r30, r24
    45c0:	09 95       	icall
    45c2:	80 91 c3 03 	lds	r24, 0x03C3	; 0x8003c3 <lflags+0xf>
    45c6:	88 23       	and	r24, r24
    45c8:	09 f4       	brne	.+2      	; 0x45cc <_Z11writePanelsm+0x4f8>
    45ca:	9e c1       	rjmp	.+828    	; 0x4908 <_Z11writePanelsm+0x834>
    45cc:	10 92 c3 03 	sts	0x03C3, r1	; 0x8003c3 <lflags+0xf>
    45d0:	11 e0       	ldi	r17, 0x01	; 1
    45d2:	10 93 b4 03 	sts	0x03B4, r17	; 0x8003b4 <lflags>
    45d6:	81 e0       	ldi	r24, 0x01	; 1
    45d8:	0e 94 cb 09 	call	0x1396	; 0x1396 <_ZL11channelDiffh>
    45dc:	87 39       	cpi	r24, 0x97	; 151
    45de:	91 05       	cpc	r25, r1
    45e0:	14 f0       	brlt	.+4      	; 0x45e6 <_Z11writePanelsm+0x512>
    45e2:	81 e0       	ldi	r24, 0x01	; 1
    45e4:	04 c0       	rjmp	.+8      	; 0x45ee <_Z11writePanelsm+0x51a>
    45e6:	8a 36       	cpi	r24, 0x6A	; 106
    45e8:	9f 4f       	sbci	r25, 0xFF	; 255
    45ea:	24 f4       	brge	.+8      	; 0x45f4 <_Z11writePanelsm+0x520>
    45ec:	8f ef       	ldi	r24, 0xFF	; 255
    45ee:	0e 94 db 09 	call	0x13b6	; 0x13b6 <_ZL9move_menuc>
    45f2:	8a c1       	rjmp	.+788    	; 0x4908 <_Z11writePanelsm+0x834>
    45f4:	83 e0       	ldi	r24, 0x03	; 3
    45f6:	0e 94 cb 09 	call	0x1396	; 0x1396 <_ZL11channelDiffh>
    45fa:	87 39       	cpi	r24, 0x97	; 151
    45fc:	91 05       	cpc	r25, r1
    45fe:	5c f0       	brlt	.+22     	; 0x4616 <_Z11writePanelsm+0x542>
    4600:	10 93 10 01 	sts	0x0110, r17	; 0x800110 <_ZL10setup_menu>
    4604:	80 91 45 06 	lds	r24, 0x0645	; 0x800645 <_ZL12setup_screen>
    4608:	82 30       	cpi	r24, 0x02	; 2
    460a:	19 f4       	brne	.+6      	; 0x4612 <_Z11writePanelsm+0x53e>
    460c:	10 92 45 06 	sts	0x0645, r1	; 0x800645 <_ZL12setup_screen>
    4610:	7b c1       	rjmp	.+758    	; 0x4908 <_Z11writePanelsm+0x834>
    4612:	8f 5f       	subi	r24, 0xFF	; 255
    4614:	0c c0       	rjmp	.+24     	; 0x462e <_Z11writePanelsm+0x55a>
    4616:	8a 36       	cpi	r24, 0x6A	; 106
    4618:	9f 4f       	sbci	r25, 0xFF	; 255
    461a:	64 f4       	brge	.+24     	; 0x4634 <_Z11writePanelsm+0x560>
    461c:	10 93 10 01 	sts	0x0110, r17	; 0x800110 <_ZL10setup_menu>
    4620:	80 91 45 06 	lds	r24, 0x0645	; 0x800645 <_ZL12setup_screen>
    4624:	81 11       	cpse	r24, r1
    4626:	02 c0       	rjmp	.+4      	; 0x462c <_Z11writePanelsm+0x558>
    4628:	82 e0       	ldi	r24, 0x02	; 2
    462a:	01 c0       	rjmp	.+2      	; 0x462e <_Z11writePanelsm+0x55a>
    462c:	81 50       	subi	r24, 0x01	; 1
    462e:	80 93 45 06 	sts	0x0645, r24	; 0x800645 <_ZL12setup_screen>
    4632:	6a c1       	rjmp	.+724    	; 0x4908 <_Z11writePanelsm+0x834>
    4634:	60 91 10 01 	lds	r22, 0x0110	; 0x800110 <_ZL10setup_menu>
    4638:	6f 5f       	subi	r22, 0xFF	; 255
    463a:	84 e1       	ldi	r24, 0x14	; 20
    463c:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    4640:	80 91 10 01 	lds	r24, 0x0110	; 0x800110 <_ZL10setup_menu>
    4644:	00 91 92 03 	lds	r16, 0x0392	; 0x800392 <params>
    4648:	10 91 93 03 	lds	r17, 0x0393	; 0x800393 <params+0x1>
    464c:	48 01       	movw	r8, r16
    464e:	96 e0       	ldi	r25, 0x06	; 6
    4650:	89 9f       	mul	r24, r25
    4652:	80 0c       	add	r8, r0
    4654:	91 1c       	adc	r9, r1
    4656:	11 24       	eor	r1, r1
    4658:	80 e0       	ldi	r24, 0x00	; 0
    465a:	0e 94 cb 09 	call	0x1396	; 0x1396 <_ZL11channelDiffh>
    465e:	5c 01       	movw	r10, r24
    4660:	97 ff       	sbrs	r25, 7
    4662:	06 c0       	rjmp	.+12     	; 0x4670 <_Z11writePanelsm+0x59c>
    4664:	b1 94       	neg	r11
    4666:	a1 94       	neg	r10
    4668:	b1 08       	sbc	r11, r1
    466a:	ee 24       	eor	r14, r14
    466c:	e3 94       	inc	r14
    466e:	01 c0       	rjmp	.+2      	; 0x4672 <_Z11writePanelsm+0x59e>
    4670:	e1 2c       	mov	r14, r1
    4672:	f4 01       	movw	r30, r8
    4674:	33 96       	adiw	r30, 0x03	; 3
    4676:	c5 90       	lpm	r12, Z+
    4678:	d4 90       	lpm	r13, Z
    467a:	f4 01       	movw	r30, r8
    467c:	32 96       	adiw	r30, 0x02	; 2
    467e:	24 91       	lpm	r18, Z
    4680:	29 87       	std	Y+9, r18	; 0x09
    4682:	8a 85       	ldd	r24, Y+10	; 0x0a
    4684:	9b 85       	ldd	r25, Y+11	; 0x0b
    4686:	a3 2d       	mov	r26, r3
    4688:	b2 2d       	mov	r27, r2
    468a:	8d 83       	std	Y+5, r24	; 0x05
    468c:	9e 83       	std	Y+6, r25	; 0x06
    468e:	af 83       	std	Y+7, r26	; 0x07
    4690:	b8 87       	std	Y+8, r27	; 0x08
    4692:	12 2f       	mov	r17, r18
    4694:	1f 77       	andi	r17, 0x7F	; 127
    4696:	14 36       	cpi	r17, 0x64	; 100
    4698:	40 f4       	brcc	.+16     	; 0x46aa <_Z11writePanelsm+0x5d6>
    469a:	12 36       	cpi	r17, 0x62	; 98
    469c:	80 f4       	brcc	.+32     	; 0x46be <_Z11writePanelsm+0x5ea>
    469e:	12 34       	cpi	r17, 0x42	; 66
    46a0:	61 f0       	breq	.+24     	; 0x46ba <_Z11writePanelsm+0x5e6>
    46a2:	1a 35       	cpi	r17, 0x5A	; 90
    46a4:	09 f0       	breq	.+2      	; 0x46a8 <_Z11writePanelsm+0x5d4>
    46a6:	49 c0       	rjmp	.+146    	; 0x473a <_Z11writePanelsm+0x666>
    46a8:	0a c0       	rjmp	.+20     	; 0x46be <_Z11writePanelsm+0x5ea>
    46aa:	13 37       	cpi	r17, 0x73	; 115
    46ac:	51 f1       	breq	.+84     	; 0x4702 <_Z11writePanelsm+0x62e>
    46ae:	1a 37       	cpi	r17, 0x7A	; 122
    46b0:	31 f0       	breq	.+12     	; 0x46be <_Z11writePanelsm+0x5ea>
    46b2:	16 36       	cpi	r17, 0x66	; 102
    46b4:	09 f0       	breq	.+2      	; 0x46b8 <_Z11writePanelsm+0x5e4>
    46b6:	41 c0       	rjmp	.+130    	; 0x473a <_Z11writePanelsm+0x666>
    46b8:	24 c0       	rjmp	.+72     	; 0x4702 <_Z11writePanelsm+0x62e>
    46ba:	0a e0       	ldi	r16, 0x0A	; 10
    46bc:	01 c0       	rjmp	.+2      	; 0x46c0 <_Z11writePanelsm+0x5ec>
    46be:	01 e0       	ldi	r16, 0x01	; 1
    46c0:	8d e2       	ldi	r24, 0x2D	; 45
    46c2:	a8 16       	cp	r10, r24
    46c4:	81 e0       	ldi	r24, 0x01	; 1
    46c6:	b8 06       	cpc	r11, r24
    46c8:	3c f0       	brlt	.+14     	; 0x46d8 <_Z11writePanelsm+0x604>
    46ca:	41 2c       	mov	r4, r1
    46cc:	51 2c       	mov	r5, r1
    46ce:	40 e2       	ldi	r20, 0x20	; 32
    46d0:	64 2e       	mov	r6, r20
    46d2:	41 e4       	ldi	r20, 0x41	; 65
    46d4:	74 2e       	mov	r7, r20
    46d6:	06 c0       	rjmp	.+12     	; 0x46e4 <_Z11writePanelsm+0x610>
    46d8:	41 2c       	mov	r4, r1
    46da:	51 2c       	mov	r5, r1
    46dc:	30 e8       	ldi	r19, 0x80	; 128
    46de:	63 2e       	mov	r6, r19
    46e0:	3f e3       	ldi	r19, 0x3F	; 63
    46e2:	73 2e       	mov	r7, r19
    46e4:	60 2f       	mov	r22, r16
    46e6:	70 e0       	ldi	r23, 0x00	; 0
    46e8:	80 e0       	ldi	r24, 0x00	; 0
    46ea:	90 e0       	ldi	r25, 0x00	; 0
    46ec:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    46f0:	9b 01       	movw	r18, r22
    46f2:	ac 01       	movw	r20, r24
    46f4:	c3 01       	movw	r24, r6
    46f6:	b2 01       	movw	r22, r4
    46f8:	0e 94 a0 40 	call	0x8140	; 0x8140 <__divsf3>
    46fc:	ff 24       	eor	r15, r15
    46fe:	f3 94       	inc	r15
    4700:	21 c0       	rjmp	.+66     	; 0x4744 <_Z11writePanelsm+0x670>
    4702:	c5 01       	movw	r24, r10
    4704:	64 e6       	ldi	r22, 0x64	; 100
    4706:	70 e0       	ldi	r23, 0x00	; 0
    4708:	0e 94 a0 43 	call	0x8740	; 0x8740 <__divmodhi4>
    470c:	fb 01       	movw	r30, r22
    470e:	ee 0f       	add	r30, r30
    4710:	ff 1f       	adc	r31, r31
    4712:	ec 5f       	subi	r30, 0xFC	; 252
    4714:	fd 4f       	sbci	r31, 0xFD	; 253
    4716:	60 81       	ld	r22, Z
    4718:	71 81       	ldd	r23, Z+1	; 0x01
    471a:	80 e0       	ldi	r24, 0x00	; 0
    471c:	90 e0       	ldi	r25, 0x00	; 0
    471e:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    4722:	9b 01       	movw	r18, r22
    4724:	ac 01       	movw	r20, r24
    4726:	60 e0       	ldi	r22, 0x00	; 0
    4728:	70 e0       	ldi	r23, 0x00	; 0
    472a:	80 e8       	ldi	r24, 0x80	; 128
    472c:	9f e3       	ldi	r25, 0x3F	; 63
    472e:	0e 94 a0 40 	call	0x8140	; 0x8140 <__divsf3>
    4732:	01 e0       	ldi	r16, 0x01	; 1
    4734:	24 e0       	ldi	r18, 0x04	; 4
    4736:	f2 2e       	mov	r15, r18
    4738:	05 c0       	rjmp	.+10     	; 0x4744 <_Z11writePanelsm+0x670>
    473a:	60 e0       	ldi	r22, 0x00	; 0
    473c:	70 e0       	ldi	r23, 0x00	; 0
    473e:	80 e8       	ldi	r24, 0x80	; 128
    4740:	9f e3       	ldi	r25, 0x3F	; 63
    4742:	01 e0       	ldi	r16, 0x01	; 1
    4744:	e5 e6       	ldi	r30, 0x65	; 101
    4746:	ae 16       	cp	r10, r30
    4748:	b1 04       	cpc	r11, r1
    474a:	0c f4       	brge	.+2      	; 0x474e <_Z11writePanelsm+0x67a>
    474c:	46 c0       	rjmp	.+140    	; 0x47da <_Z11writePanelsm+0x706>
    474e:	e1 10       	cpse	r14, r1
    4750:	90 58       	subi	r25, 0x80	; 128
    4752:	ab 01       	movw	r20, r22
    4754:	bc 01       	movw	r22, r24
    4756:	ce 01       	movw	r24, r28
    4758:	05 96       	adiw	r24, 0x05	; 5
    475a:	0e 94 12 1c 	call	0x3824	; 0x3824 <_Z9float_addRff>
    475e:	f4 01       	movw	r30, r8
    4760:	35 96       	adiw	r30, 0x05	; 5
    4762:	e4 91       	lpm	r30, Z
    4764:	ef 70       	andi	r30, 0x0F	; 15
    4766:	f4 e0       	ldi	r31, 0x04	; 4
    4768:	ef 9f       	mul	r30, r31
    476a:	30 01       	movw	r6, r0
    476c:	11 24       	eor	r1, r1
    476e:	f3 01       	movw	r30, r6
    4770:	ea 5f       	subi	r30, 0xFA	; 250
    4772:	f8 4f       	sbci	r31, 0xF8	; 248
    4774:	65 91       	lpm	r22, Z+
    4776:	74 91       	lpm	r23, Z
    4778:	07 2e       	mov	r0, r23
    477a:	00 0c       	add	r0, r0
    477c:	88 0b       	sbc	r24, r24
    477e:	99 0b       	sbc	r25, r25
    4780:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    4784:	4b 01       	movw	r8, r22
    4786:	5c 01       	movw	r10, r24
    4788:	9b 01       	movw	r18, r22
    478a:	ac 01       	movw	r20, r24
    478c:	6d 81       	ldd	r22, Y+5	; 0x05
    478e:	7e 81       	ldd	r23, Y+6	; 0x06
    4790:	8f 81       	ldd	r24, Y+7	; 0x07
    4792:	98 85       	ldd	r25, Y+8	; 0x08
    4794:	0e 94 96 40 	call	0x812c	; 0x812c <__cmpsf2>
    4798:	87 ff       	sbrs	r24, 7
    479a:	04 c0       	rjmp	.+8      	; 0x47a4 <_Z11writePanelsm+0x6d0>
    479c:	8d 82       	std	Y+5, r8	; 0x05
    479e:	9e 82       	std	Y+6, r9	; 0x06
    47a0:	af 82       	std	Y+7, r10	; 0x07
    47a2:	b8 86       	std	Y+8, r11	; 0x08
    47a4:	f3 01       	movw	r30, r6
    47a6:	e8 5f       	subi	r30, 0xF8	; 248
    47a8:	f8 4f       	sbci	r31, 0xF8	; 248
    47aa:	65 91       	lpm	r22, Z+
    47ac:	74 91       	lpm	r23, Z
    47ae:	07 2e       	mov	r0, r23
    47b0:	00 0c       	add	r0, r0
    47b2:	88 0b       	sbc	r24, r24
    47b4:	99 0b       	sbc	r25, r25
    47b6:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    47ba:	4b 01       	movw	r8, r22
    47bc:	5c 01       	movw	r10, r24
    47be:	9b 01       	movw	r18, r22
    47c0:	ac 01       	movw	r20, r24
    47c2:	6d 81       	ldd	r22, Y+5	; 0x05
    47c4:	7e 81       	ldd	r23, Y+6	; 0x06
    47c6:	8f 81       	ldd	r24, Y+7	; 0x07
    47c8:	98 85       	ldd	r25, Y+8	; 0x08
    47ca:	0e 94 60 42 	call	0x84c0	; 0x84c0 <__gesf2>
    47ce:	18 16       	cp	r1, r24
    47d0:	24 f4       	brge	.+8      	; 0x47da <_Z11writePanelsm+0x706>
    47d2:	8d 82       	std	Y+5, r8	; 0x05
    47d4:	9e 82       	std	Y+6, r9	; 0x06
    47d6:	af 82       	std	Y+7, r10	; 0x07
    47d8:	b8 86       	std	Y+8, r11	; 0x08
    47da:	8d 80       	ldd	r8, Y+5	; 0x05
    47dc:	9e 80       	ldd	r9, Y+6	; 0x06
    47de:	af 80       	ldd	r10, Y+7	; 0x07
    47e0:	b8 84       	ldd	r11, Y+8	; 0x08
    47e2:	2a 85       	ldd	r18, Y+10	; 0x0a
    47e4:	3b 85       	ldd	r19, Y+11	; 0x0b
    47e6:	43 2d       	mov	r20, r3
    47e8:	52 2d       	mov	r21, r2
    47ea:	c5 01       	movw	r24, r10
    47ec:	b4 01       	movw	r22, r8
    47ee:	0e 94 96 40 	call	0x812c	; 0x812c <__cmpsf2>
    47f2:	88 23       	and	r24, r24
    47f4:	09 f4       	brne	.+2      	; 0x47f8 <_Z11writePanelsm+0x724>
    47f6:	88 c0       	rjmp	.+272    	; 0x4908 <_Z11writePanelsm+0x834>
    47f8:	60 2f       	mov	r22, r16
    47fa:	70 e0       	ldi	r23, 0x00	; 0
    47fc:	80 e0       	ldi	r24, 0x00	; 0
    47fe:	90 e0       	ldi	r25, 0x00	; 0
    4800:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    4804:	a5 01       	movw	r20, r10
    4806:	94 01       	movw	r18, r8
    4808:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    480c:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    4810:	13 36       	cpi	r17, 0x63	; 99
    4812:	c1 f0       	breq	.+48     	; 0x4844 <_Z11writePanelsm+0x770>
    4814:	38 f4       	brcc	.+14     	; 0x4824 <_Z11writePanelsm+0x750>
    4816:	1a 35       	cpi	r17, 0x5A	; 90
    4818:	89 f0       	breq	.+34     	; 0x483c <_Z11writePanelsm+0x768>
    481a:	12 36       	cpi	r17, 0x62	; 98
    481c:	a9 f0       	breq	.+42     	; 0x4848 <_Z11writePanelsm+0x774>
    481e:	12 34       	cpi	r17, 0x42	; 66
    4820:	01 f5       	brne	.+64     	; 0x4862 <_Z11writePanelsm+0x78e>
    4822:	12 c0       	rjmp	.+36     	; 0x4848 <_Z11writePanelsm+0x774>
    4824:	13 37       	cpi	r17, 0x73	; 115
    4826:	99 f0       	breq	.+38     	; 0x484e <_Z11writePanelsm+0x77a>
    4828:	1a 37       	cpi	r17, 0x7A	; 122
    482a:	51 f0       	breq	.+20     	; 0x4840 <_Z11writePanelsm+0x76c>
    482c:	16 36       	cpi	r17, 0x66	; 102
    482e:	c9 f4       	brne	.+50     	; 0x4862 <_Z11writePanelsm+0x78e>
    4830:	f6 01       	movw	r30, r12
    4832:	80 82       	st	Z, r8
    4834:	91 82       	std	Z+1, r9	; 0x01
    4836:	a2 82       	std	Z+2, r10	; 0x02
    4838:	b3 82       	std	Z+3, r11	; 0x03
    483a:	13 c0       	rjmp	.+38     	; 0x4862 <_Z11writePanelsm+0x78e>
    483c:	80 e2       	ldi	r24, 0x20	; 32
    483e:	03 c0       	rjmp	.+6      	; 0x4846 <_Z11writePanelsm+0x772>
    4840:	80 e1       	ldi	r24, 0x10	; 16
    4842:	01 c0       	rjmp	.+2      	; 0x4846 <_Z11writePanelsm+0x772>
    4844:	80 e0       	ldi	r24, 0x00	; 0
    4846:	68 0f       	add	r22, r24
    4848:	f6 01       	movw	r30, r12
    484a:	60 83       	st	Z, r22
    484c:	0a c0       	rjmp	.+20     	; 0x4862 <_Z11writePanelsm+0x78e>
    484e:	89 82       	std	Y+1, r8	; 0x01
    4850:	9a 82       	std	Y+2, r9	; 0x02
    4852:	ab 82       	std	Y+3, r10	; 0x03
    4854:	bc 82       	std	Y+4, r11	; 0x04
    4856:	44 e0       	ldi	r20, 0x04	; 4
    4858:	50 e0       	ldi	r21, 0x00	; 0
    485a:	b6 01       	movw	r22, r12
    485c:	ce 01       	movw	r24, r28
    485e:	01 96       	adiw	r24, 0x01	; 1
    4860:	06 c0       	rjmp	.+12     	; 0x486e <_Z11writePanelsm+0x79a>
    4862:	4f 2d       	mov	r20, r15
    4864:	50 e0       	ldi	r21, 0x00	; 0
    4866:	b6 01       	movw	r22, r12
    4868:	69 55       	subi	r22, 0x59	; 89
    486a:	72 40       	sbci	r23, 0x02	; 2
    486c:	c6 01       	movw	r24, r12
    486e:	0e 94 ee 11 	call	0x23dc	; 0x23dc <_Z16eeprom_write_lenPhjj>
    4872:	f9 85       	ldd	r31, Y+9	; 0x09
    4874:	f7 ff       	sbrs	r31, 7
    4876:	48 c0       	rjmp	.+144    	; 0x4908 <_Z11writePanelsm+0x834>
    4878:	0e 94 10 08 	call	0x1020	; 0x1020 <_ZN3OSD6adjustEv>
    487c:	45 c0       	rjmp	.+138    	; 0x4908 <_Z11writePanelsm+0x834>
    487e:	83 e0       	ldi	r24, 0x03	; 3
    4880:	93 e0       	ldi	r25, 0x03	; 3
    4882:	0e 94 3b 0a 	call	0x1476	; 0x1476 <_ZL12osd_setPanel5Point>
    4886:	83 e0       	ldi	r24, 0x03	; 3
    4888:	93 e0       	ldi	r25, 0x03	; 3
    488a:	0e 94 83 16 	call	0x2d06	; 0x2d06 <_ZL7panWarn5Point>
    488e:	3c c0       	rjmp	.+120    	; 0x4908 <_Z11writePanelsm+0x834>
    4890:	80 91 98 03 	lds	r24, 0x0398	; 0x800398 <fdata_screen>
    4894:	90 91 56 06 	lds	r25, 0x0656	; 0x800656 <_ZL6panelN>
    4898:	89 17       	cp	r24, r25
    489a:	21 f0       	breq	.+8      	; 0x48a4 <_Z11writePanelsm+0x7d0>
    489c:	80 93 56 06 	sts	0x0656, r24	; 0x800656 <_ZL6panelN>
    48a0:	10 92 c9 03 	sts	0x03C9, r1	; 0x8003c9 <lflags+0x15>
    48a4:	82 e0       	ldi	r24, 0x02	; 2
    48a6:	0e 94 cb 09 	call	0x1396	; 0x1396 <_ZL11channelDiffh>
    48aa:	09 2e       	mov	r0, r25
    48ac:	00 0c       	add	r0, r0
    48ae:	aa 0b       	sbc	r26, r26
    48b0:	bb 0b       	sbc	r27, r27
    48b2:	b7 ff       	sbrs	r27, 7
    48b4:	07 c0       	rjmp	.+14     	; 0x48c4 <_Z11writePanelsm+0x7f0>
    48b6:	b0 95       	com	r27
    48b8:	a0 95       	com	r26
    48ba:	90 95       	com	r25
    48bc:	81 95       	neg	r24
    48be:	9f 4f       	sbci	r25, 0xFF	; 255
    48c0:	af 4f       	sbci	r26, 0xFF	; 255
    48c2:	bf 4f       	sbci	r27, 0xFF	; 255
    48c4:	8d 32       	cpi	r24, 0x2D	; 45
    48c6:	91 40       	sbci	r25, 0x01	; 1
    48c8:	a1 05       	cpc	r26, r1
    48ca:	b1 05       	cpc	r27, r1
    48cc:	d4 f4       	brge	.+52     	; 0x4902 <_Z11writePanelsm+0x82e>
    48ce:	83 e0       	ldi	r24, 0x03	; 3
    48d0:	0e 94 cb 09 	call	0x1396	; 0x1396 <_ZL11channelDiffh>
    48d4:	09 2e       	mov	r0, r25
    48d6:	00 0c       	add	r0, r0
    48d8:	aa 0b       	sbc	r26, r26
    48da:	bb 0b       	sbc	r27, r27
    48dc:	b7 ff       	sbrs	r27, 7
    48de:	07 c0       	rjmp	.+14     	; 0x48ee <_Z11writePanelsm+0x81a>
    48e0:	b0 95       	com	r27
    48e2:	a0 95       	com	r26
    48e4:	90 95       	com	r25
    48e6:	81 95       	neg	r24
    48e8:	9f 4f       	sbci	r25, 0xFF	; 255
    48ea:	af 4f       	sbci	r26, 0xFF	; 255
    48ec:	bf 4f       	sbci	r27, 0xFF	; 255
    48ee:	8d 32       	cpi	r24, 0x2D	; 45
    48f0:	91 40       	sbci	r25, 0x01	; 1
    48f2:	a1 05       	cpc	r26, r1
    48f4:	b1 05       	cpc	r27, r1
    48f6:	2c f4       	brge	.+10     	; 0x4902 <_Z11writePanelsm+0x82e>
    48f8:	80 91 bb 03 	lds	r24, 0x03BB	; 0x8003bb <lflags+0x7>
    48fc:	88 23       	and	r24, r24
    48fe:	09 f4       	brne	.+2      	; 0x4902 <_Z11writePanelsm+0x82e>
    4900:	f1 cc       	rjmp	.-1566   	; 0x42e4 <_Z11writePanelsm+0x210>
    4902:	10 92 c9 03 	sts	0x03C9, r1	; 0x8003c9 <lflags+0x15>
    4906:	ee cc       	rjmp	.-1572   	; 0x42e4 <_Z11writePanelsm+0x210>
    4908:	2b 96       	adiw	r28, 0x0b	; 11
    490a:	e2 e1       	ldi	r30, 0x12	; 18
    490c:	0c 94 85 44 	jmp	0x890a	; 0x890a <__epilogue_restores__>

00004910 <__vector_3>:
    4910:	1f 92       	push	r1
    4912:	0f 92       	push	r0
    4914:	0f b6       	in	r0, 0x3f	; 63
    4916:	0f 92       	push	r0
    4918:	11 24       	eor	r1, r1
    491a:	2f 93       	push	r18
    491c:	3f 93       	push	r19
    491e:	4f 93       	push	r20
    4920:	5f 93       	push	r21
    4922:	6f 93       	push	r22
    4924:	7f 93       	push	r23
    4926:	8f 93       	push	r24
    4928:	9f 93       	push	r25
    492a:	af 93       	push	r26
    492c:	bf 93       	push	r27
    492e:	ef 93       	push	r30
    4930:	ff 93       	push	r31
    4932:	cf 93       	push	r28
    4934:	df 93       	push	r29
    4936:	1f 92       	push	r1
    4938:	cd b7       	in	r28, 0x3d	; 61
    493a:	de b7       	in	r29, 0x3e	; 62
    493c:	81 e0       	ldi	r24, 0x01	; 1
    493e:	80 93 3a 03 	sts	0x033A, r24	; 0x80033a <vas_vsync>
    4942:	10 92 b3 03 	sts	0x03B3, r1	; 0x8003b3 <vsync_wait>
    4946:	80 91 b2 03 	lds	r24, 0x03B2	; 0x8003b2 <vsync_count>
    494a:	8f 5f       	subi	r24, 0xFF	; 255
    494c:	80 93 b2 03 	sts	0x03B2, r24	; 0x8003b2 <vsync_count>
    4950:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    4954:	60 93 ae 03 	sts	0x03AE, r22	; 0x8003ae <vsync_time>
    4958:	70 93 af 03 	sts	0x03AF, r23	; 0x8003af <vsync_time+0x1>
    495c:	80 93 b0 03 	sts	0x03B0, r24	; 0x8003b0 <vsync_time+0x2>
    4960:	90 93 b1 03 	sts	0x03B1, r25	; 0x8003b1 <vsync_time+0x3>
    4964:	80 91 ef 03 	lds	r24, 0x03EF	; 0x8003ef <update_screen>
    4968:	88 23       	and	r24, r24
    496a:	21 f0       	breq	.+8      	; 0x4974 <__vector_3+0x64>
    496c:	0e 94 d9 08 	call	0x11b2	; 0x11b2 <_ZN3OSD6updateEv>
    4970:	10 92 ef 03 	sts	0x03EF, r1	; 0x8003ef <update_screen>
    4974:	ce 01       	movw	r24, r28
    4976:	01 96       	adiw	r24, 0x01	; 1
    4978:	20 91 11 01 	lds	r18, 0x0111	; 0x800111 <stack_bottom>
    497c:	30 91 12 01 	lds	r19, 0x0112	; 0x800112 <stack_bottom+0x1>
    4980:	82 17       	cp	r24, r18
    4982:	93 07       	cpc	r25, r19
    4984:	20 f4       	brcc	.+8      	; 0x498e <__vector_3+0x7e>
    4986:	90 93 12 01 	sts	0x0112, r25	; 0x800112 <stack_bottom+0x1>
    498a:	80 93 11 01 	sts	0x0111, r24	; 0x800111 <stack_bottom>
    498e:	0f 90       	pop	r0
    4990:	df 91       	pop	r29
    4992:	cf 91       	pop	r28
    4994:	ff 91       	pop	r31
    4996:	ef 91       	pop	r30
    4998:	bf 91       	pop	r27
    499a:	af 91       	pop	r26
    499c:	9f 91       	pop	r25
    499e:	8f 91       	pop	r24
    49a0:	7f 91       	pop	r23
    49a2:	6f 91       	pop	r22
    49a4:	5f 91       	pop	r21
    49a6:	4f 91       	pop	r20
    49a8:	3f 91       	pop	r19
    49aa:	2f 91       	pop	r18
    49ac:	0f 90       	pop	r0
    49ae:	0f be       	out	0x3f, r0	; 63
    49b0:	0f 90       	pop	r0
    49b2:	1f 90       	pop	r1
    49b4:	18 95       	reti

000049b6 <_Z7avgRSSIj>:
    49b6:	e0 91 03 01 	lds	r30, 0x0103	; 0x800103 <_ZZ7avgRSSIjE3ind>
    49ba:	ef 5f       	subi	r30, 0xFF	; 255
    49bc:	e0 93 03 01 	sts	0x0103, r30	; 0x800103 <_ZZ7avgRSSIjE3ind>
    49c0:	e7 70       	andi	r30, 0x07	; 7
    49c2:	f0 e0       	ldi	r31, 0x00	; 0
    49c4:	ee 0f       	add	r30, r30
    49c6:	ff 1f       	adc	r31, r31
    49c8:	e9 52       	subi	r30, 0x29	; 41
    49ca:	fb 4f       	sbci	r31, 0xFB	; 251
    49cc:	91 83       	std	Z+1, r25	; 0x01
    49ce:	80 83       	st	Z, r24
    49d0:	88 e0       	ldi	r24, 0x08	; 8
    49d2:	60 e0       	ldi	r22, 0x00	; 0
    49d4:	70 e0       	ldi	r23, 0x00	; 0
    49d6:	81 50       	subi	r24, 0x01	; 1
    49d8:	e8 2f       	mov	r30, r24
    49da:	f0 e0       	ldi	r31, 0x00	; 0
    49dc:	ee 0f       	add	r30, r30
    49de:	ff 1f       	adc	r31, r31
    49e0:	e9 52       	subi	r30, 0x29	; 41
    49e2:	fb 4f       	sbci	r31, 0xFB	; 251
    49e4:	20 81       	ld	r18, Z
    49e6:	31 81       	ldd	r19, Z+1	; 0x01
    49e8:	62 0f       	add	r22, r18
    49ea:	73 1f       	adc	r23, r19
    49ec:	81 11       	cpse	r24, r1
    49ee:	f3 cf       	rjmp	.-26     	; 0x49d6 <_Z7avgRSSIj+0x20>
    49f0:	80 e0       	ldi	r24, 0x00	; 0
    49f2:	90 e0       	ldi	r25, 0x00	; 0
    49f4:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    49f8:	20 e0       	ldi	r18, 0x00	; 0
    49fa:	30 e0       	ldi	r19, 0x00	; 0
    49fc:	40 e0       	ldi	r20, 0x00	; 0
    49fe:	5e e3       	ldi	r21, 0x3E	; 62
    4a00:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    4a04:	08 95       	ret

00004a06 <_Z17normalize_voltagei>:
    4a06:	97 fd       	sbrc	r25, 7
    4a08:	05 c0       	rjmp	.+10     	; 0x4a14 <_Z17normalize_voltagei+0xe>
    4a0a:	8f 3f       	cpi	r24, 0xFF	; 255
    4a0c:	91 05       	cpc	r25, r1
    4a0e:	09 f0       	breq	.+2      	; 0x4a12 <_Z17normalize_voltagei+0xc>
    4a10:	1c f4       	brge	.+6      	; 0x4a18 <_Z17normalize_voltagei+0x12>
    4a12:	08 95       	ret
    4a14:	80 e0       	ldi	r24, 0x00	; 0
    4a16:	08 95       	ret
    4a18:	8f ef       	ldi	r24, 0xFF	; 255
    4a1a:	08 95       	ret

00004a1c <_Z7On100msv>:
    4a1c:	cf 92       	push	r12
    4a1e:	df 92       	push	r13
    4a20:	ef 92       	push	r14
    4a22:	ff 92       	push	r15
    4a24:	cf 93       	push	r28
    4a26:	df 93       	push	r29
    4a28:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
    4a2c:	84 fd       	sbrc	r24, 4
    4a2e:	05 c0       	rjmp	.+10     	; 0x4a3a <_Z7On100msv+0x1e>
    4a30:	80 91 9d 03 	lds	r24, 0x039D	; 0x80039d <flgSensor>
    4a34:	88 23       	and	r24, r24
    4a36:	09 f4       	brne	.+2      	; 0x4a3a <_Z7On100msv+0x1e>
    4a38:	a1 c0       	rjmp	.+322    	; 0x4b7c <_Z7On100msv+0x160>
    4a3a:	c0 91 02 01 	lds	r28, 0x0102	; 0x800102 <_ZZ7On100msvE3ind>
    4a3e:	cf 5f       	subi	r28, 0xFF	; 255
    4a40:	c0 93 02 01 	sts	0x0102, r28	; 0x800102 <_ZZ7On100msvE3ind>
    4a44:	80 e1       	ldi	r24, 0x10	; 16
    4a46:	0e 94 53 37 	call	0x6ea6	; 0x6ea6 <analogRead>
    4a4a:	c7 70       	andi	r28, 0x07	; 7
    4a4c:	ec 2f       	mov	r30, r28
    4a4e:	f0 e0       	ldi	r31, 0x00	; 0
    4a50:	ee 0f       	add	r30, r30
    4a52:	ff 1f       	adc	r31, r31
    4a54:	e9 53       	subi	r30, 0x39	; 57
    4a56:	fb 4f       	sbci	r31, 0xFB	; 251
    4a58:	91 83       	std	Z+1, r25	; 0x01
    4a5a:	80 83       	st	Z, r24
    4a5c:	88 e0       	ldi	r24, 0x08	; 8
    4a5e:	c0 e0       	ldi	r28, 0x00	; 0
    4a60:	d0 e0       	ldi	r29, 0x00	; 0
    4a62:	81 50       	subi	r24, 0x01	; 1
    4a64:	e8 2f       	mov	r30, r24
    4a66:	f0 e0       	ldi	r31, 0x00	; 0
    4a68:	ee 0f       	add	r30, r30
    4a6a:	ff 1f       	adc	r31, r31
    4a6c:	e9 53       	subi	r30, 0x39	; 57
    4a6e:	fb 4f       	sbci	r31, 0xFB	; 251
    4a70:	20 81       	ld	r18, Z
    4a72:	31 81       	ldd	r19, Z+1	; 0x01
    4a74:	c2 0f       	add	r28, r18
    4a76:	d3 1f       	adc	r29, r19
    4a78:	81 11       	cpse	r24, r1
    4a7a:	f3 cf       	rjmp	.-26     	; 0x4a62 <_Z7On100msv+0x46>
    4a7c:	20 91 a1 03 	lds	r18, 0x03A1	; 0x8003a1 <sensorData>
    4a80:	30 91 a2 03 	lds	r19, 0x03A2	; 0x8003a2 <sensorData+0x1>
    4a84:	47 e0       	ldi	r20, 0x07	; 7
    4a86:	42 9f       	mul	r20, r18
    4a88:	c0 01       	movw	r24, r0
    4a8a:	43 9f       	mul	r20, r19
    4a8c:	90 0d       	add	r25, r0
    4a8e:	11 24       	eor	r1, r1
    4a90:	8c 0f       	add	r24, r28
    4a92:	9d 1f       	adc	r25, r29
    4a94:	23 e0       	ldi	r18, 0x03	; 3
    4a96:	96 95       	lsr	r25
    4a98:	87 95       	ror	r24
    4a9a:	2a 95       	dec	r18
    4a9c:	e1 f7       	brne	.-8      	; 0x4a96 <_Z7On100msv+0x7a>
    4a9e:	90 93 a2 03 	sts	0x03A2, r25	; 0x8003a2 <sensorData+0x1>
    4aa2:	80 93 a1 03 	sts	0x03A1, r24	; 0x8003a1 <sensorData>
    4aa6:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
    4aaa:	84 ff       	sbrs	r24, 4
    4aac:	67 c0       	rjmp	.+206    	; 0x4b7c <_Z7On100msv+0x160>
    4aae:	29 e5       	ldi	r18, 0x59	; 89
    4ab0:	3e ee       	ldi	r19, 0xEE	; 238
    4ab2:	49 e0       	ldi	r20, 0x09	; 9
    4ab4:	50 e4       	ldi	r21, 0x40	; 64
    4ab6:	60 91 7b 04 	lds	r22, 0x047B	; 0x80047b <sets+0x22>
    4aba:	70 91 7c 04 	lds	r23, 0x047C	; 0x80047c <sets+0x23>
    4abe:	80 91 7d 04 	lds	r24, 0x047D	; 0x80047d <sets+0x24>
    4ac2:	90 91 7e 04 	lds	r25, 0x047E	; 0x80047e <sets+0x25>
    4ac6:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    4aca:	6b 01       	movw	r12, r22
    4acc:	7c 01       	movw	r14, r24
    4ace:	be 01       	movw	r22, r28
    4ad0:	80 e0       	ldi	r24, 0x00	; 0
    4ad2:	90 e0       	ldi	r25, 0x00	; 0
    4ad4:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    4ad8:	9b 01       	movw	r18, r22
    4ada:	ac 01       	movw	r20, r24
    4adc:	c7 01       	movw	r24, r14
    4ade:	b6 01       	movw	r22, r12
    4ae0:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    4ae4:	0e 94 19 41 	call	0x8232	; 0x8232 <__fixunssfsi>
    4ae8:	40 91 bb 06 	lds	r20, 0x06BB	; 0x8006bb <_ZL10osd_vbat_A>
    4aec:	50 91 bc 06 	lds	r21, 0x06BC	; 0x8006bc <_ZL10osd_vbat_A+0x1>
    4af0:	41 15       	cp	r20, r1
    4af2:	51 05       	cpc	r21, r1
    4af4:	29 f4       	brne	.+10     	; 0x4b00 <_Z7On100msv+0xe4>
    4af6:	70 93 bc 06 	sts	0x06BC, r23	; 0x8006bc <_ZL10osd_vbat_A+0x1>
    4afa:	60 93 bb 06 	sts	0x06BB, r22	; 0x8006bb <_ZL10osd_vbat_A>
    4afe:	12 c0       	rjmp	.+36     	; 0x4b24 <_Z7On100msv+0x108>
    4b00:	9a 01       	movw	r18, r20
    4b02:	22 0f       	add	r18, r18
    4b04:	33 1f       	adc	r19, r19
    4b06:	24 0f       	add	r18, r20
    4b08:	35 1f       	adc	r19, r21
    4b0a:	2e 5f       	subi	r18, 0xFE	; 254
    4b0c:	3f 4f       	sbci	r19, 0xFF	; 255
    4b0e:	a9 01       	movw	r20, r18
    4b10:	46 0f       	add	r20, r22
    4b12:	57 1f       	adc	r21, r23
    4b14:	56 95       	lsr	r21
    4b16:	47 95       	ror	r20
    4b18:	56 95       	lsr	r21
    4b1a:	47 95       	ror	r20
    4b1c:	50 93 bc 06 	sts	0x06BC, r21	; 0x8006bc <_ZL10osd_vbat_A+0x1>
    4b20:	40 93 bb 06 	sts	0x06BB, r20	; 0x8006bb <_ZL10osd_vbat_A>
    4b24:	81 e0       	ldi	r24, 0x01	; 1
    4b26:	80 93 b4 03 	sts	0x03B4, r24	; 0x8003b4 <lflags>
    4b2a:	e0 91 62 04 	lds	r30, 0x0462	; 0x800462 <sets+0x9>
    4b2e:	8e 2f       	mov	r24, r30
    4b30:	61 e2       	ldi	r22, 0x21	; 33
    4b32:	0e 94 72 43 	call	0x86e4	; 0x86e4 <__udivmodqi4>
    4b36:	48 2f       	mov	r20, r24
    4b38:	80 91 bb 06 	lds	r24, 0x06BB	; 0x8006bb <_ZL10osd_vbat_A>
    4b3c:	90 91 bc 06 	lds	r25, 0x06BC	; 0x8006bc <_ZL10osd_vbat_A+0x1>
    4b40:	c2 96       	adiw	r24, 0x32	; 50
    4b42:	64 e6       	ldi	r22, 0x64	; 100
    4b44:	70 e0       	ldi	r23, 0x00	; 0
    4b46:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    4b4a:	f0 e0       	ldi	r31, 0x00	; 0
    4b4c:	9b 01       	movw	r18, r22
    4b4e:	2e 1b       	sub	r18, r30
    4b50:	3f 0b       	sbc	r19, r31
    4b52:	af ef       	ldi	r26, 0xFF	; 255
    4b54:	b0 e0       	ldi	r27, 0x00	; 0
    4b56:	0e 94 fb 43 	call	0x87f6	; 0x87f6 <__umulhisi3>
    4b5a:	5a e2       	ldi	r21, 0x2A	; 42
    4b5c:	45 9f       	mul	r20, r21
    4b5e:	90 01       	movw	r18, r0
    4b60:	11 24       	eor	r1, r1
    4b62:	2e 1b       	sub	r18, r30
    4b64:	3f 0b       	sbc	r19, r31
    4b66:	03 2e       	mov	r0, r19
    4b68:	00 0c       	add	r0, r0
    4b6a:	44 0b       	sbc	r20, r20
    4b6c:	55 0b       	sbc	r21, r21
    4b6e:	0e 94 d6 43 	call	0x87ac	; 0x87ac <__divmodsi4>
    4b72:	c9 01       	movw	r24, r18
    4b74:	0e 94 03 25 	call	0x4a06	; 0x4a06 <_Z17normalize_voltagei>
    4b78:	80 93 b6 06 	sts	0x06B6, r24	; 0x8006b6 <_ZL23osd_battery_remaining_A>
    4b7c:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
    4b80:	85 ff       	sbrs	r24, 5
    4b82:	04 c0       	rjmp	.+8      	; 0x4b8c <_Z7On100msv+0x170>
    4b84:	80 91 d0 03 	lds	r24, 0x03D0	; 0x8003d0 <lflags+0x1c>
    4b88:	81 11       	cpse	r24, r1
    4b8a:	05 c0       	rjmp	.+10     	; 0x4b96 <_Z7On100msv+0x17a>
    4b8c:	80 91 9e 03 	lds	r24, 0x039E	; 0x80039e <flgSensor+0x1>
    4b90:	88 23       	and	r24, r24
    4b92:	09 f4       	brne	.+2      	; 0x4b96 <_Z7On100msv+0x17a>
    4b94:	9e c0       	rjmp	.+316    	; 0x4cd2 <_Z7On100msv+0x2b6>
    4b96:	c0 91 01 01 	lds	r28, 0x0101	; 0x800101 <_ZZ7On100msvE3ind_0>
    4b9a:	cf 5f       	subi	r28, 0xFF	; 255
    4b9c:	c0 93 01 01 	sts	0x0101, r28	; 0x800101 <_ZZ7On100msvE3ind_0>
    4ba0:	8e e0       	ldi	r24, 0x0E	; 14
    4ba2:	0e 94 53 37 	call	0x6ea6	; 0x6ea6 <analogRead>
    4ba6:	c7 70       	andi	r28, 0x07	; 7
    4ba8:	ec 2f       	mov	r30, r28
    4baa:	f0 e0       	ldi	r31, 0x00	; 0
    4bac:	ee 0f       	add	r30, r30
    4bae:	ff 1f       	adc	r31, r31
    4bb0:	e9 54       	subi	r30, 0x49	; 73
    4bb2:	fb 4f       	sbci	r31, 0xFB	; 251
    4bb4:	91 83       	std	Z+1, r25	; 0x01
    4bb6:	80 83       	st	Z, r24
    4bb8:	88 e0       	ldi	r24, 0x08	; 8
    4bba:	c0 e0       	ldi	r28, 0x00	; 0
    4bbc:	d0 e0       	ldi	r29, 0x00	; 0
    4bbe:	81 50       	subi	r24, 0x01	; 1
    4bc0:	e8 2f       	mov	r30, r24
    4bc2:	f0 e0       	ldi	r31, 0x00	; 0
    4bc4:	ee 0f       	add	r30, r30
    4bc6:	ff 1f       	adc	r31, r31
    4bc8:	e9 54       	subi	r30, 0x49	; 73
    4bca:	fb 4f       	sbci	r31, 0xFB	; 251
    4bcc:	20 81       	ld	r18, Z
    4bce:	31 81       	ldd	r19, Z+1	; 0x01
    4bd0:	c2 0f       	add	r28, r18
    4bd2:	d3 1f       	adc	r29, r19
    4bd4:	81 11       	cpse	r24, r1
    4bd6:	f3 cf       	rjmp	.-26     	; 0x4bbe <_Z7On100msv+0x1a2>
    4bd8:	20 91 a3 03 	lds	r18, 0x03A3	; 0x8003a3 <sensorData+0x2>
    4bdc:	30 91 a4 03 	lds	r19, 0x03A4	; 0x8003a4 <sensorData+0x3>
    4be0:	47 e0       	ldi	r20, 0x07	; 7
    4be2:	42 9f       	mul	r20, r18
    4be4:	c0 01       	movw	r24, r0
    4be6:	43 9f       	mul	r20, r19
    4be8:	90 0d       	add	r25, r0
    4bea:	11 24       	eor	r1, r1
    4bec:	8c 0f       	add	r24, r28
    4bee:	9d 1f       	adc	r25, r29
    4bf0:	a3 e0       	ldi	r26, 0x03	; 3
    4bf2:	96 95       	lsr	r25
    4bf4:	87 95       	ror	r24
    4bf6:	aa 95       	dec	r26
    4bf8:	e1 f7       	brne	.-8      	; 0x4bf2 <_Z7On100msv+0x1d6>
    4bfa:	90 93 a4 03 	sts	0x03A4, r25	; 0x8003a4 <sensorData+0x3>
    4bfe:	80 93 a3 03 	sts	0x03A3, r24	; 0x8003a3 <sensorData+0x2>
    4c02:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
    4c06:	85 ff       	sbrs	r24, 5
    4c08:	64 c0       	rjmp	.+200    	; 0x4cd2 <_Z7On100msv+0x2b6>
    4c0a:	29 ea       	ldi	r18, 0xA9	; 169
    4c0c:	3c ec       	ldi	r19, 0xCC	; 204
    4c0e:	48 e0       	ldi	r20, 0x08	; 8
    4c10:	50 e4       	ldi	r21, 0x40	; 64
    4c12:	60 91 7f 04 	lds	r22, 0x047F	; 0x80047f <sets+0x26>
    4c16:	70 91 80 04 	lds	r23, 0x0480	; 0x800480 <sets+0x27>
    4c1a:	80 91 81 04 	lds	r24, 0x0481	; 0x800481 <sets+0x28>
    4c1e:	90 91 82 04 	lds	r25, 0x0482	; 0x800482 <sets+0x29>
    4c22:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    4c26:	6b 01       	movw	r12, r22
    4c28:	7c 01       	movw	r14, r24
    4c2a:	be 01       	movw	r22, r28
    4c2c:	80 e0       	ldi	r24, 0x00	; 0
    4c2e:	90 e0       	ldi	r25, 0x00	; 0
    4c30:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    4c34:	9b 01       	movw	r18, r22
    4c36:	ac 01       	movw	r20, r24
    4c38:	c7 01       	movw	r24, r14
    4c3a:	b6 01       	movw	r22, r12
    4c3c:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    4c40:	0e 94 19 41 	call	0x8232	; 0x8232 <__fixunssfsi>
    4c44:	40 91 b9 06 	lds	r20, 0x06B9	; 0x8006b9 <_ZL10osd_vbat_B>
    4c48:	50 91 ba 06 	lds	r21, 0x06BA	; 0x8006ba <_ZL10osd_vbat_B+0x1>
    4c4c:	41 15       	cp	r20, r1
    4c4e:	51 05       	cpc	r21, r1
    4c50:	29 f4       	brne	.+10     	; 0x4c5c <_Z7On100msv+0x240>
    4c52:	70 93 ba 06 	sts	0x06BA, r23	; 0x8006ba <_ZL10osd_vbat_B+0x1>
    4c56:	60 93 b9 06 	sts	0x06B9, r22	; 0x8006b9 <_ZL10osd_vbat_B>
    4c5a:	12 c0       	rjmp	.+36     	; 0x4c80 <_Z7On100msv+0x264>
    4c5c:	9a 01       	movw	r18, r20
    4c5e:	22 0f       	add	r18, r18
    4c60:	33 1f       	adc	r19, r19
    4c62:	24 0f       	add	r18, r20
    4c64:	35 1f       	adc	r19, r21
    4c66:	2e 5f       	subi	r18, 0xFE	; 254
    4c68:	3f 4f       	sbci	r19, 0xFF	; 255
    4c6a:	a9 01       	movw	r20, r18
    4c6c:	46 0f       	add	r20, r22
    4c6e:	57 1f       	adc	r21, r23
    4c70:	56 95       	lsr	r21
    4c72:	47 95       	ror	r20
    4c74:	56 95       	lsr	r21
    4c76:	47 95       	ror	r20
    4c78:	50 93 ba 06 	sts	0x06BA, r21	; 0x8006ba <_ZL10osd_vbat_B+0x1>
    4c7c:	40 93 b9 06 	sts	0x06B9, r20	; 0x8006b9 <_ZL10osd_vbat_B>
    4c80:	e0 91 9b 04 	lds	r30, 0x049B	; 0x80049b <sets+0x42>
    4c84:	8e 2f       	mov	r24, r30
    4c86:	61 e2       	ldi	r22, 0x21	; 33
    4c88:	0e 94 72 43 	call	0x86e4	; 0x86e4 <__udivmodqi4>
    4c8c:	48 2f       	mov	r20, r24
    4c8e:	80 91 b9 06 	lds	r24, 0x06B9	; 0x8006b9 <_ZL10osd_vbat_B>
    4c92:	90 91 ba 06 	lds	r25, 0x06BA	; 0x8006ba <_ZL10osd_vbat_B+0x1>
    4c96:	c2 96       	adiw	r24, 0x32	; 50
    4c98:	64 e6       	ldi	r22, 0x64	; 100
    4c9a:	70 e0       	ldi	r23, 0x00	; 0
    4c9c:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    4ca0:	f0 e0       	ldi	r31, 0x00	; 0
    4ca2:	9b 01       	movw	r18, r22
    4ca4:	2e 1b       	sub	r18, r30
    4ca6:	3f 0b       	sbc	r19, r31
    4ca8:	af ef       	ldi	r26, 0xFF	; 255
    4caa:	b0 e0       	ldi	r27, 0x00	; 0
    4cac:	0e 94 fb 43 	call	0x87f6	; 0x87f6 <__umulhisi3>
    4cb0:	5a e2       	ldi	r21, 0x2A	; 42
    4cb2:	45 9f       	mul	r20, r21
    4cb4:	90 01       	movw	r18, r0
    4cb6:	11 24       	eor	r1, r1
    4cb8:	2e 1b       	sub	r18, r30
    4cba:	3f 0b       	sbc	r19, r31
    4cbc:	03 2e       	mov	r0, r19
    4cbe:	00 0c       	add	r0, r0
    4cc0:	44 0b       	sbc	r20, r20
    4cc2:	55 0b       	sbc	r21, r21
    4cc4:	0e 94 d6 43 	call	0x87ac	; 0x87ac <__divmodsi4>
    4cc8:	c9 01       	movw	r24, r18
    4cca:	0e 94 03 25 	call	0x4a06	; 0x4a06 <_Z17normalize_voltagei>
    4cce:	80 93 b5 06 	sts	0x06B5, r24	; 0x8006b5 <_ZL23osd_battery_remaining_B>
    4cd2:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
    4cd6:	86 fd       	sbrc	r24, 6
    4cd8:	05 c0       	rjmp	.+10     	; 0x4ce4 <_Z7On100msv+0x2c8>
    4cda:	80 91 9f 03 	lds	r24, 0x039F	; 0x80039f <flgSensor+0x2>
    4cde:	88 23       	and	r24, r24
    4ce0:	09 f4       	brne	.+2      	; 0x4ce4 <_Z7On100msv+0x2c8>
    4ce2:	82 c0       	rjmp	.+260    	; 0x4de8 <_Z7On100msv+0x3cc>
    4ce4:	80 91 9b 03 	lds	r24, 0x039B	; 0x80039b <fPulseSensor+0x2>
    4ce8:	88 23       	and	r24, r24
    4cea:	51 f0       	breq	.+20     	; 0x4d00 <_Z7On100msv+0x2e4>
    4cec:	20 e1       	ldi	r18, 0x10	; 16
    4cee:	37 e2       	ldi	r19, 0x27	; 39
    4cf0:	40 e0       	ldi	r20, 0x00	; 0
    4cf2:	50 e0       	ldi	r21, 0x00	; 0
    4cf4:	61 e0       	ldi	r22, 0x01	; 1
    4cf6:	8f e0       	ldi	r24, 0x0F	; 15
    4cf8:	0e 94 1e 37 	call	0x6e3c	; 0x6e3c <pulseIn>
    4cfc:	cb 01       	movw	r24, r22
    4cfe:	03 c0       	rjmp	.+6      	; 0x4d06 <_Z7On100msv+0x2ea>
    4d00:	8f e0       	ldi	r24, 0x0F	; 15
    4d02:	0e 94 53 37 	call	0x6ea6	; 0x6ea6 <analogRead>
    4d06:	e0 91 00 01 	lds	r30, 0x0100	; 0x800100 <__data_start>
    4d0a:	ef 5f       	subi	r30, 0xFF	; 255
    4d0c:	e0 93 00 01 	sts	0x0100, r30	; 0x800100 <__data_start>
    4d10:	e7 70       	andi	r30, 0x07	; 7
    4d12:	f0 e0       	ldi	r31, 0x00	; 0
    4d14:	ee 0f       	add	r30, r30
    4d16:	ff 1f       	adc	r31, r31
    4d18:	e9 55       	subi	r30, 0x59	; 89
    4d1a:	fb 4f       	sbci	r31, 0xFB	; 251
    4d1c:	91 83       	std	Z+1, r25	; 0x01
    4d1e:	80 83       	st	Z, r24
    4d20:	88 e0       	ldi	r24, 0x08	; 8
    4d22:	c0 e0       	ldi	r28, 0x00	; 0
    4d24:	d0 e0       	ldi	r29, 0x00	; 0
    4d26:	81 50       	subi	r24, 0x01	; 1
    4d28:	e8 2f       	mov	r30, r24
    4d2a:	f0 e0       	ldi	r31, 0x00	; 0
    4d2c:	ee 0f       	add	r30, r30
    4d2e:	ff 1f       	adc	r31, r31
    4d30:	e9 55       	subi	r30, 0x59	; 89
    4d32:	fb 4f       	sbci	r31, 0xFB	; 251
    4d34:	20 81       	ld	r18, Z
    4d36:	31 81       	ldd	r19, Z+1	; 0x01
    4d38:	c2 0f       	add	r28, r18
    4d3a:	d3 1f       	adc	r29, r19
    4d3c:	81 11       	cpse	r24, r1
    4d3e:	f3 cf       	rjmp	.-26     	; 0x4d26 <_Z7On100msv+0x30a>
    4d40:	20 91 a5 03 	lds	r18, 0x03A5	; 0x8003a5 <sensorData+0x4>
    4d44:	30 91 a6 03 	lds	r19, 0x03A6	; 0x8003a6 <sensorData+0x5>
    4d48:	47 e0       	ldi	r20, 0x07	; 7
    4d4a:	42 9f       	mul	r20, r18
    4d4c:	c0 01       	movw	r24, r0
    4d4e:	43 9f       	mul	r20, r19
    4d50:	90 0d       	add	r25, r0
    4d52:	11 24       	eor	r1, r1
    4d54:	8c 0f       	add	r24, r28
    4d56:	9d 1f       	adc	r25, r29
    4d58:	33 e0       	ldi	r19, 0x03	; 3
    4d5a:	96 95       	lsr	r25
    4d5c:	87 95       	ror	r24
    4d5e:	3a 95       	dec	r19
    4d60:	e1 f7       	brne	.-8      	; 0x4d5a <_Z7On100msv+0x33e>
    4d62:	90 93 a6 03 	sts	0x03A6, r25	; 0x8003a6 <sensorData+0x5>
    4d66:	80 93 a5 03 	sts	0x03A5, r24	; 0x8003a5 <sensorData+0x4>
    4d6a:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
    4d6e:	86 ff       	sbrs	r24, 6
    4d70:	3b c0       	rjmp	.+118    	; 0x4de8 <_Z7On100msv+0x3cc>
    4d72:	2d e0       	ldi	r18, 0x0D	; 13
    4d74:	32 e3       	ldi	r19, 0x32	; 50
    4d76:	48 ec       	ldi	r20, 0xC8	; 200
    4d78:	5c e3       	ldi	r21, 0x3C	; 60
    4d7a:	60 91 83 04 	lds	r22, 0x0483	; 0x800483 <sets+0x2a>
    4d7e:	70 91 84 04 	lds	r23, 0x0484	; 0x800484 <sets+0x2b>
    4d82:	80 91 85 04 	lds	r24, 0x0485	; 0x800485 <sets+0x2c>
    4d86:	90 91 86 04 	lds	r25, 0x0486	; 0x800486 <sets+0x2d>
    4d8a:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    4d8e:	6b 01       	movw	r12, r22
    4d90:	7c 01       	movw	r14, r24
    4d92:	be 01       	movw	r22, r28
    4d94:	80 e0       	ldi	r24, 0x00	; 0
    4d96:	90 e0       	ldi	r25, 0x00	; 0
    4d98:	0e 94 48 41 	call	0x8290	; 0x8290 <__floatunsisf>
    4d9c:	9b 01       	movw	r18, r22
    4d9e:	ac 01       	movw	r20, r24
    4da0:	c7 01       	movw	r24, r14
    4da2:	b6 01       	movw	r22, r12
    4da4:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    4da8:	0e 94 19 41 	call	0x8232	; 0x8232 <__fixunssfsi>
    4dac:	40 91 b7 06 	lds	r20, 0x06B7	; 0x8006b7 <_ZL10osd_curr_A>
    4db0:	50 91 b8 06 	lds	r21, 0x06B8	; 0x8006b8 <_ZL10osd_curr_A+0x1>
    4db4:	41 15       	cp	r20, r1
    4db6:	51 05       	cpc	r21, r1
    4db8:	29 f4       	brne	.+10     	; 0x4dc4 <_Z7On100msv+0x3a8>
    4dba:	70 93 b8 06 	sts	0x06B8, r23	; 0x8006b8 <_ZL10osd_curr_A+0x1>
    4dbe:	60 93 b7 06 	sts	0x06B7, r22	; 0x8006b7 <_ZL10osd_curr_A>
    4dc2:	12 c0       	rjmp	.+36     	; 0x4de8 <_Z7On100msv+0x3cc>
    4dc4:	9a 01       	movw	r18, r20
    4dc6:	22 0f       	add	r18, r18
    4dc8:	33 1f       	adc	r19, r19
    4dca:	24 0f       	add	r18, r20
    4dcc:	35 1f       	adc	r19, r21
    4dce:	2e 5f       	subi	r18, 0xFE	; 254
    4dd0:	3f 4f       	sbci	r19, 0xFF	; 255
    4dd2:	a9 01       	movw	r20, r18
    4dd4:	46 0f       	add	r20, r22
    4dd6:	57 1f       	adc	r21, r23
    4dd8:	56 95       	lsr	r21
    4dda:	47 95       	ror	r20
    4ddc:	56 95       	lsr	r21
    4dde:	47 95       	ror	r20
    4de0:	50 93 b8 06 	sts	0x06B8, r21	; 0x8006b8 <_ZL10osd_curr_A+0x1>
    4de4:	40 93 b7 06 	sts	0x06B7, r20	; 0x8006b7 <_ZL10osd_curr_A>
    4de8:	80 91 67 04 	lds	r24, 0x0467	; 0x800467 <sets+0xe>
    4dec:	86 95       	lsr	r24
    4dee:	81 30       	cpi	r24, 0x01	; 1
    4df0:	41 f0       	breq	.+16     	; 0x4e02 <_Z7On100msv+0x3e6>
    4df2:	50 f1       	brcs	.+84     	; 0x4e48 <_Z7On100msv+0x42c>
    4df4:	82 30       	cpi	r24, 0x02	; 2
    4df6:	49 f0       	breq	.+18     	; 0x4e0a <_Z7On100msv+0x3ee>
    4df8:	83 30       	cpi	r24, 0x03	; 3
    4dfa:	51 f5       	brne	.+84     	; 0x4e50 <_Z7On100msv+0x434>
    4dfc:	80 91 2f 04 	lds	r24, 0x042F	; 0x80042f <telem_rssi>
    4e00:	25 c0       	rjmp	.+74     	; 0x4e4c <_Z7On100msv+0x430>
    4e02:	81 e1       	ldi	r24, 0x11	; 17
    4e04:	0e 94 53 37 	call	0x6ea6	; 0x6ea6 <analogRead>
    4e08:	09 c0       	rjmp	.+18     	; 0x4e1c <_Z7On100msv+0x400>
    4e0a:	20 e2       	ldi	r18, 0x20	; 32
    4e0c:	3e e4       	ldi	r19, 0x4E	; 78
    4e0e:	40 e0       	ldi	r20, 0x00	; 0
    4e10:	50 e0       	ldi	r21, 0x00	; 0
    4e12:	61 e0       	ldi	r22, 0x01	; 1
    4e14:	81 e1       	ldi	r24, 0x11	; 17
    4e16:	0e 94 1e 37 	call	0x6e3c	; 0x6e3c <pulseIn>
    4e1a:	cb 01       	movw	r24, r22
    4e1c:	0e 94 db 24 	call	0x49b6	; 0x49b6 <_Z7avgRSSIj>
    4e20:	20 91 87 04 	lds	r18, 0x0487	; 0x800487 <sets+0x2e>
    4e24:	30 91 88 04 	lds	r19, 0x0488	; 0x800488 <sets+0x2f>
    4e28:	40 91 89 04 	lds	r20, 0x0489	; 0x800489 <sets+0x30>
    4e2c:	50 91 8a 04 	lds	r21, 0x048A	; 0x80048a <sets+0x31>
    4e30:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    4e34:	0e 94 19 41 	call	0x8232	; 0x8232 <__fixunssfsi>
    4e38:	70 93 2e 04 	sts	0x042E, r23	; 0x80042e <rssi_in+0x1>
    4e3c:	60 93 2d 04 	sts	0x042D, r22	; 0x80042d <rssi_in>
    4e40:	81 e0       	ldi	r24, 0x01	; 1
    4e42:	80 93 b4 03 	sts	0x03B4, r24	; 0x8003b4 <lflags>
    4e46:	3a c0       	rjmp	.+116    	; 0x4ebc <_Z7On100msv+0x4a0>
    4e48:	80 91 30 04 	lds	r24, 0x0430	; 0x800430 <osd_rssi>
    4e4c:	90 e0       	ldi	r25, 0x00	; 0
    4e4e:	04 c0       	rjmp	.+8      	; 0x4e58 <_Z7On100msv+0x43c>
    4e50:	80 91 cd 06 	lds	r24, 0x06CD	; 0x8006cd <_ZL8chan_raw+0xe>
    4e54:	90 91 ce 06 	lds	r25, 0x06CE	; 0x8006ce <_ZL8chan_raw+0xf>
    4e58:	0e 94 db 24 	call	0x49b6	; 0x49b6 <_Z7avgRSSIj>
    4e5c:	0e 94 19 41 	call	0x8232	; 0x8232 <__fixunssfsi>
    4e60:	70 93 2e 04 	sts	0x042E, r23	; 0x80042e <rssi_in+0x1>
    4e64:	60 93 2d 04 	sts	0x042D, r22	; 0x80042d <rssi_in>
    4e68:	80 91 a0 03 	lds	r24, 0x03A0	; 0x8003a0 <flgSensor+0x3>
    4e6c:	88 23       	and	r24, r24
    4e6e:	31 f1       	breq	.+76     	; 0x4ebc <_Z7On100msv+0x4a0>
    4e70:	80 91 9c 03 	lds	r24, 0x039C	; 0x80039c <fPulseSensor+0x3>
    4e74:	88 23       	and	r24, r24
    4e76:	49 f0       	breq	.+18     	; 0x4e8a <_Z7On100msv+0x46e>
    4e78:	20 e1       	ldi	r18, 0x10	; 16
    4e7a:	37 e2       	ldi	r19, 0x27	; 39
    4e7c:	40 e0       	ldi	r20, 0x00	; 0
    4e7e:	50 e0       	ldi	r21, 0x00	; 0
    4e80:	61 e0       	ldi	r22, 0x01	; 1
    4e82:	81 e1       	ldi	r24, 0x11	; 17
    4e84:	0e 94 1e 37 	call	0x6e3c	; 0x6e3c <pulseIn>
    4e88:	04 c0       	rjmp	.+8      	; 0x4e92 <_Z7On100msv+0x476>
    4e8a:	81 e1       	ldi	r24, 0x11	; 17
    4e8c:	0e 94 53 37 	call	0x6ea6	; 0x6ea6 <analogRead>
    4e90:	bc 01       	movw	r22, r24
    4e92:	80 91 a7 03 	lds	r24, 0x03A7	; 0x8003a7 <sensorData+0x6>
    4e96:	90 91 a8 03 	lds	r25, 0x03A8	; 0x8003a8 <sensorData+0x7>
    4e9a:	47 e0       	ldi	r20, 0x07	; 7
    4e9c:	48 9f       	mul	r20, r24
    4e9e:	90 01       	movw	r18, r0
    4ea0:	49 9f       	mul	r20, r25
    4ea2:	30 0d       	add	r19, r0
    4ea4:	11 24       	eor	r1, r1
    4ea6:	62 0f       	add	r22, r18
    4ea8:	73 1f       	adc	r23, r19
    4eaa:	83 e0       	ldi	r24, 0x03	; 3
    4eac:	76 95       	lsr	r23
    4eae:	67 95       	ror	r22
    4eb0:	8a 95       	dec	r24
    4eb2:	e1 f7       	brne	.-8      	; 0x4eac <_Z7On100msv+0x490>
    4eb4:	70 93 a8 03 	sts	0x03A8, r23	; 0x8003a8 <sensorData+0x7>
    4eb8:	60 93 a7 03 	sts	0x03A7, r22	; 0x8003a7 <sensorData+0x6>
    4ebc:	df 91       	pop	r29
    4ebe:	cf 91       	pop	r28
    4ec0:	ff 90       	pop	r15
    4ec2:	ef 90       	pop	r14
    4ec4:	df 90       	pop	r13
    4ec6:	cf 90       	pop	r12
    4ec8:	08 95       	ret

00004eca <_Z6On20msv>:
    4eca:	81 e0       	ldi	r24, 0x01	; 1
    4ecc:	0e 94 f8 1d 	call	0x3bf0	; 0x3bf0 <_Z12generate_PWMb>
    4ed0:	08 95       	ret

00004ed2 <_GLOBAL__sub_I_sets>:
    4ed2:	8f 92       	push	r8
    4ed4:	af 92       	push	r10
    4ed6:	cf 92       	push	r12
    4ed8:	ef 92       	push	r14
    4eda:	ff 92       	push	r15
    4edc:	0f 93       	push	r16
    4ede:	1f 93       	push	r17
    4ee0:	e8 e6       	ldi	r30, 0x68	; 104
    4ee2:	f3 e0       	ldi	r31, 0x03	; 3
    4ee4:	13 82       	std	Z+3, r1	; 0x03
    4ee6:	12 82       	std	Z+2, r1	; 0x02
    4ee8:	87 e2       	ldi	r24, 0x27	; 39
    4eea:	91 e0       	ldi	r25, 0x01	; 1
    4eec:	91 83       	std	Z+1, r25	; 0x01
    4eee:	80 83       	st	Z, r24
    4ef0:	80 e2       	ldi	r24, 0x20	; 32
    4ef2:	88 2e       	mov	r8, r24
    4ef4:	98 e9       	ldi	r25, 0x98	; 152
    4ef6:	a9 2e       	mov	r10, r25
    4ef8:	cc 24       	eor	r12, r12
    4efa:	c3 94       	inc	r12
    4efc:	21 ec       	ldi	r18, 0xC1	; 193
    4efe:	e2 2e       	mov	r14, r18
    4f00:	f1 2c       	mov	r15, r1
    4f02:	00 ec       	ldi	r16, 0xC0	; 192
    4f04:	10 e0       	ldi	r17, 0x00	; 0
    4f06:	24 ec       	ldi	r18, 0xC4	; 196
    4f08:	30 e0       	ldi	r19, 0x00	; 0
    4f0a:	45 ec       	ldi	r20, 0xC5	; 197
    4f0c:	50 e0       	ldi	r21, 0x00	; 0
    4f0e:	60 e0       	ldi	r22, 0x00	; 0
    4f10:	83 e5       	ldi	r24, 0x53	; 83
    4f12:	93 e0       	ldi	r25, 0x03	; 3
    4f14:	0e 94 3e 39 	call	0x727c	; 0x727c <_ZN10FastSerialC1EhPVhS1_S1_S1_hhh>
    4f18:	39 ec       	ldi	r19, 0xC9	; 201
    4f1a:	e3 2e       	mov	r14, r19
    4f1c:	f1 2c       	mov	r15, r1
    4f1e:	08 ec       	ldi	r16, 0xC8	; 200
    4f20:	10 e0       	ldi	r17, 0x00	; 0
    4f22:	2c ec       	ldi	r18, 0xCC	; 204
    4f24:	30 e0       	ldi	r19, 0x00	; 0
    4f26:	4d ec       	ldi	r20, 0xCD	; 205
    4f28:	50 e0       	ldi	r21, 0x00	; 0
    4f2a:	61 e0       	ldi	r22, 0x01	; 1
    4f2c:	8e e3       	ldi	r24, 0x3E	; 62
    4f2e:	93 e0       	ldi	r25, 0x03	; 3
    4f30:	0e 94 3e 39 	call	0x727c	; 0x727c <_ZN10FastSerialC1EhPVhS1_S1_S1_hhh>
    4f34:	e0 e7       	ldi	r30, 0x70	; 112
    4f36:	fa e0       	ldi	r31, 0x0A	; 10
    4f38:	88 e9       	ldi	r24, 0x98	; 152
    4f3a:	92 e0       	ldi	r25, 0x02	; 2
    4f3c:	96 8b       	std	Z+22, r25	; 0x16
    4f3e:	85 8b       	std	Z+21, r24	; 0x15
    4f40:	8c e9       	ldi	r24, 0x9C	; 156
    4f42:	92 e0       	ldi	r25, 0x02	; 2
    4f44:	94 8f       	std	Z+28, r25	; 0x1c
    4f46:	83 8f       	std	Z+27, r24	; 0x1b
    4f48:	80 eb       	ldi	r24, 0xB0	; 176
    4f4a:	92 e0       	ldi	r25, 0x02	; 2
    4f4c:	92 a3       	std	Z+34, r25	; 0x22
    4f4e:	81 a3       	std	Z+33, r24	; 0x21
    4f50:	84 eb       	ldi	r24, 0xB4	; 180
    4f52:	92 e0       	ldi	r25, 0x02	; 2
    4f54:	90 a7       	std	Z+40, r25	; 0x28
    4f56:	87 a3       	std	Z+39, r24	; 0x27
    4f58:	88 ec       	ldi	r24, 0xC8	; 200
    4f5a:	92 e0       	ldi	r25, 0x02	; 2
    4f5c:	96 a7       	std	Z+46, r25	; 0x2e
    4f5e:	85 a7       	std	Z+45, r24	; 0x2d
    4f60:	8c ec       	ldi	r24, 0xCC	; 204
    4f62:	92 e0       	ldi	r25, 0x02	; 2
    4f64:	94 ab       	std	Z+52, r25	; 0x34
    4f66:	83 ab       	std	Z+51, r24	; 0x33
    4f68:	1f 91       	pop	r17
    4f6a:	0f 91       	pop	r16
    4f6c:	ff 90       	pop	r15
    4f6e:	ef 90       	pop	r14
    4f70:	cf 90       	pop	r12
    4f72:	af 90       	pop	r10
    4f74:	8f 90       	pop	r8
    4f76:	08 95       	ret

00004f78 <setup>:
    4f78:	cf 93       	push	r28
    4f7a:	df 93       	push	r29
    4f7c:	0f b6       	in	r0, 0x3f	; 63
    4f7e:	f8 94       	cli
    4f80:	a8 95       	wdr
    4f82:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <__data_load_end+0x7f769c>
    4f86:	88 61       	ori	r24, 0x18	; 24
    4f88:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <__data_load_end+0x7f769c>
    4f8c:	10 92 60 00 	sts	0x0060, r1	; 0x800060 <__data_load_end+0x7f769c>
    4f90:	0f be       	out	0x3f, r0	; 63
    4f92:	61 e0       	ldi	r22, 0x01	; 1
    4f94:	8b e1       	ldi	r24, 0x1B	; 27
    4f96:	0e 94 a9 36 	call	0x6d52	; 0x6d52 <pinMode>
    4f9a:	61 e0       	ldi	r22, 0x01	; 1
    4f9c:	8b e1       	ldi	r24, 0x1B	; 27
    4f9e:	0e 94 e5 36 	call	0x6dca	; 0x6dca <digitalWrite>
    4fa2:	40 e0       	ldi	r20, 0x00	; 0
    4fa4:	51 ee       	ldi	r21, 0xE1	; 225
    4fa6:	60 e0       	ldi	r22, 0x00	; 0
    4fa8:	70 e0       	ldi	r23, 0x00	; 0
    4faa:	83 e5       	ldi	r24, 0x53	; 83
    4fac:	93 e0       	ldi	r25, 0x03	; 3
    4fae:	0e 94 75 38 	call	0x70ea	; 0x70ea <_ZN10FastSerial5beginEl>
    4fb2:	60 e0       	ldi	r22, 0x00	; 0
    4fb4:	72 e0       	ldi	r23, 0x02	; 2
    4fb6:	83 e5       	ldi	r24, 0x53	; 83
    4fb8:	93 e0       	ldi	r25, 0x03	; 3
    4fba:	0e 94 ab 3a 	call	0x7556	; 0x7556 <_ZN12BetterStream7print_PEPKc>
    4fbe:	83 e5       	ldi	r24, 0x53	; 83
    4fc0:	93 e0       	ldi	r25, 0x03	; 3
    4fc2:	0e 94 b6 37 	call	0x6f6c	; 0x6f6c <_ZN5Print7printlnEv>
    4fc6:	83 e5       	ldi	r24, 0x53	; 83
    4fc8:	93 e0       	ldi	r25, 0x03	; 3
    4fca:	0e 94 84 39 	call	0x7308	; 0x7308 <_ZN10FastSerial4waitEv>
    4fce:	4e e4       	ldi	r20, 0x4E	; 78
    4fd0:	50 e0       	ldi	r21, 0x00	; 0
    4fd2:	60 e0       	ldi	r22, 0x00	; 0
    4fd4:	72 e0       	ldi	r23, 0x02	; 2
    4fd6:	89 e5       	ldi	r24, 0x59	; 89
    4fd8:	94 e0       	ldi	r25, 0x04	; 4
    4fda:	0e 94 55 11 	call	0x22aa	; 0x22aa <_Z15eeprom_read_lenPhjj>
    4fde:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
    4fe2:	81 fd       	sbrc	r24, 1
    4fe4:	03 c0       	rjmp	.+6      	; 0x4fec <setup+0x74>
    4fe6:	8d e5       	ldi	r24, 0x5D	; 93
    4fe8:	9a e0       	ldi	r25, 0x0A	; 10
    4fea:	02 c0       	rjmp	.+4      	; 0x4ff0 <setup+0x78>
    4fec:	8a e4       	ldi	r24, 0x4A	; 74
    4fee:	9a e0       	ldi	r25, 0x0A	; 10
    4ff0:	90 93 be 06 	sts	0x06BE, r25	; 0x8006be <_ZL7measure+0x1>
    4ff4:	80 93 bd 06 	sts	0x06BD, r24	; 0x8006bd <_ZL7measure>
    4ff8:	80 91 73 04 	lds	r24, 0x0473	; 0x800473 <sets+0x1a>
    4ffc:	8f 34       	cpi	r24, 0x4F	; 79
    4ffe:	21 f4       	brne	.+8      	; 0x5008 <setup+0x90>
    5000:	80 91 74 04 	lds	r24, 0x0474	; 0x800474 <sets+0x1b>
    5004:	8a 31       	cpi	r24, 0x1A	; 26
    5006:	19 f0       	breq	.+6      	; 0x500e <setup+0x96>
    5008:	81 e0       	ldi	r24, 0x01	; 1
    500a:	80 93 ce 03 	sts	0x03CE, r24	; 0x8003ce <lflags+0x1a>
    500e:	84 b5       	in	r24, 0x24	; 36
    5010:	8c 7f       	andi	r24, 0xFC	; 252
    5012:	84 bd       	out	0x24, r24	; 36
    5014:	80 91 5a 04 	lds	r24, 0x045A	; 0x80045a <sets+0x1>
    5018:	84 ff       	sbrs	r24, 4
    501a:	02 c0       	rjmp	.+4      	; 0x5020 <setup+0xa8>
    501c:	81 e0       	ldi	r24, 0x01	; 1
    501e:	01 c0       	rjmp	.+2      	; 0x5022 <setup+0xaa>
    5020:	82 e0       	ldi	r24, 0x02	; 2
    5022:	0e 94 50 37 	call	0x6ea0	; 0x6ea0 <analogReference>
    5026:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__data_load_end+0x7f76b6>
    502a:	8b 7f       	andi	r24, 0xFB	; 251
    502c:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__data_load_end+0x7f76b6>
    5030:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__data_load_end+0x7f76b6>
    5034:	86 60       	ori	r24, 0x06	; 6
    5036:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__data_load_end+0x7f76b6>
    503a:	80 91 69 00 	lds	r24, 0x0069	; 0x800069 <__data_load_end+0x7f76a5>
    503e:	8c 7f       	andi	r24, 0xFC	; 252
    5040:	82 60       	ori	r24, 0x02	; 2
    5042:	80 93 69 00 	sts	0x0069, r24	; 0x800069 <__data_load_end+0x7f76a5>
    5046:	e8 9a       	sbi	0x1d, 0	; 29
    5048:	c3 e5       	ldi	r28, 0x53	; 83
    504a:	d3 e0       	ldi	r29, 0x03	; 3
    504c:	d0 93 3d 03 	sts	0x033D, r29	; 0x80033d <mavlink_comm_0_port+0x1>
    5050:	c0 93 3c 03 	sts	0x033C, r28	; 0x80033c <mavlink_comm_0_port>
    5054:	67 ef       	ldi	r22, 0xF7	; 247
    5056:	71 e0       	ldi	r23, 0x01	; 1
    5058:	ce 01       	movw	r24, r28
    505a:	0e 94 ab 3a 	call	0x7556	; 0x7556 <_ZN12BetterStream7print_PEPKc>
    505e:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    5062:	9f 93       	push	r25
    5064:	8f 93       	push	r24
    5066:	7f 93       	push	r23
    5068:	6f 93       	push	r22
    506a:	8d ee       	ldi	r24, 0xED	; 237
    506c:	91 e0       	ldi	r25, 0x01	; 1
    506e:	9f 93       	push	r25
    5070:	8f 93       	push	r24
    5072:	df 93       	push	r29
    5074:	cf 93       	push	r28
    5076:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    507a:	ce 01       	movw	r24, r28
    507c:	0e 94 84 39 	call	0x7308	; 0x7308 <_ZN10FastSerial4waitEv>
    5080:	0e 94 ae 07 	call	0xf5c	; 0xf5c <_Z12unplugSlavesv>
    5084:	6e ed       	ldi	r22, 0xDE	; 222
    5086:	71 e0       	ldi	r23, 0x01	; 1
    5088:	ce 01       	movw	r24, r28
    508a:	0e 94 ab 3a 	call	0x7556	; 0x7556 <_ZN12BetterStream7print_PEPKc>
    508e:	ce 01       	movw	r24, r28
    5090:	0e 94 b6 37 	call	0x6f6c	; 0x6f6c <_ZN5Print7printlnEv>
    5094:	ce 01       	movw	r24, r28
    5096:	0e 94 84 39 	call	0x7308	; 0x7308 <_ZN10FastSerial4waitEv>
    509a:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    509e:	9f 93       	push	r25
    50a0:	8f 93       	push	r24
    50a2:	7f 93       	push	r23
    50a4:	6f 93       	push	r22
    50a6:	84 ed       	ldi	r24, 0xD4	; 212
    50a8:	91 e0       	ldi	r25, 0x01	; 1
    50aa:	9f 93       	push	r25
    50ac:	8f 93       	push	r24
    50ae:	df 93       	push	r29
    50b0:	cf 93       	push	r28
    50b2:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    50b6:	ce 01       	movw	r24, r28
    50b8:	0e 94 84 39 	call	0x7308	; 0x7308 <_ZN10FastSerial4waitEv>
    50bc:	0e 94 d9 08 	call	0x11b2	; 0x11b2 <_ZN3OSD6updateEv>
    50c0:	6b ec       	ldi	r22, 0xCB	; 203
    50c2:	71 e0       	ldi	r23, 0x01	; 1
    50c4:	ce 01       	movw	r24, r28
    50c6:	0e 94 ab 3a 	call	0x7556	; 0x7556 <_ZN12BetterStream7print_PEPKc>
    50ca:	ce 01       	movw	r24, r28
    50cc:	0e 94 b6 37 	call	0x6f6c	; 0x6f6c <_ZN5Print7printlnEv>
    50d0:	ce 01       	movw	r24, r28
    50d2:	0e 94 84 39 	call	0x7308	; 0x7308 <_ZN10FastSerial4waitEv>
    50d6:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    50da:	9f 93       	push	r25
    50dc:	8f 93       	push	r24
    50de:	7f 93       	push	r23
    50e0:	6f 93       	push	r22
    50e2:	81 ec       	ldi	r24, 0xC1	; 193
    50e4:	91 e0       	ldi	r25, 0x01	; 1
    50e6:	9f 93       	push	r25
    50e8:	8f 93       	push	r24
    50ea:	df 93       	push	r29
    50ec:	cf 93       	push	r28
    50ee:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    50f2:	ce 01       	movw	r24, r28
    50f4:	0e 94 84 39 	call	0x7308	; 0x7308 <_ZN10FastSerial4waitEv>
    50f8:	78 94       	sei
    50fa:	6b eb       	ldi	r22, 0xBB	; 187
    50fc:	71 e0       	ldi	r23, 0x01	; 1
    50fe:	ce 01       	movw	r24, r28
    5100:	0e 94 ab 3a 	call	0x7556	; 0x7556 <_ZN12BetterStream7print_PEPKc>
    5104:	ce 01       	movw	r24, r28
    5106:	0e 94 b6 37 	call	0x6f6c	; 0x6f6c <_ZN5Print7printlnEv>
    510a:	ce 01       	movw	r24, r28
    510c:	0e 94 84 39 	call	0x7308	; 0x7308 <_ZN10FastSerial4waitEv>
    5110:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    5114:	9f 93       	push	r25
    5116:	8f 93       	push	r24
    5118:	7f 93       	push	r23
    511a:	6f 93       	push	r22
    511c:	81 eb       	ldi	r24, 0xB1	; 177
    511e:	91 e0       	ldi	r25, 0x01	; 1
    5120:	9f 93       	push	r25
    5122:	8f 93       	push	r24
    5124:	df 93       	push	r29
    5126:	cf 93       	push	r28
    5128:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    512c:	8d b7       	in	r24, 0x3d	; 61
    512e:	9e b7       	in	r25, 0x3e	; 62
    5130:	80 96       	adiw	r24, 0x20	; 32
    5132:	0f b6       	in	r0, 0x3f	; 63
    5134:	f8 94       	cli
    5136:	9e bf       	out	0x3e, r25	; 62
    5138:	0f be       	out	0x3f, r0	; 63
    513a:	8d bf       	out	0x3d, r24	; 61
    513c:	ce 01       	movw	r24, r28
    513e:	0e 94 84 39 	call	0x7308	; 0x7308 <_ZN10FastSerial4waitEv>
    5142:	80 91 75 04 	lds	r24, 0x0475	; 0x800475 <sets+0x1c>
    5146:	89 33       	cpi	r24, 0x39	; 57
    5148:	41 f4       	brne	.+16     	; 0x515a <setup+0x1e2>
    514a:	80 91 76 04 	lds	r24, 0x0476	; 0x800476 <sets+0x1d>
    514e:	83 33       	cpi	r24, 0x33	; 51
    5150:	21 f4       	brne	.+8      	; 0x515a <setup+0x1e2>
    5152:	80 91 77 04 	lds	r24, 0x0477	; 0x800477 <sets+0x1e>
    5156:	86 33       	cpi	r24, 0x36	; 54
    5158:	89 f0       	breq	.+34     	; 0x517c <setup+0x204>
    515a:	89 e3       	ldi	r24, 0x39	; 57
    515c:	80 93 75 04 	sts	0x0475, r24	; 0x800475 <sets+0x1c>
    5160:	83 e3       	ldi	r24, 0x33	; 51
    5162:	80 93 76 04 	sts	0x0476, r24	; 0x800476 <sets+0x1d>
    5166:	86 e3       	ldi	r24, 0x36	; 54
    5168:	80 93 77 04 	sts	0x0477, r24	; 0x800477 <sets+0x1e>
    516c:	43 e0       	ldi	r20, 0x03	; 3
    516e:	50 e0       	ldi	r21, 0x00	; 0
    5170:	6c e1       	ldi	r22, 0x1C	; 28
    5172:	72 e0       	ldi	r23, 0x02	; 2
    5174:	85 e7       	ldi	r24, 0x75	; 117
    5176:	94 e0       	ldi	r25, 0x04	; 4
    5178:	0e 94 ee 11 	call	0x23dc	; 0x23dc <_Z16eeprom_write_lenPhjj>
    517c:	80 91 a6 04 	lds	r24, 0x04A6	; 0x8004a6 <sets+0x4d>
    5180:	81 30       	cpi	r24, 0x01	; 1
    5182:	59 f0       	breq	.+22     	; 0x519a <setup+0x222>
    5184:	81 e0       	ldi	r24, 0x01	; 1
    5186:	80 93 a6 04 	sts	0x04A6, r24	; 0x8004a6 <sets+0x4d>
    518a:	41 e0       	ldi	r20, 0x01	; 1
    518c:	50 e0       	ldi	r21, 0x00	; 0
    518e:	6d e4       	ldi	r22, 0x4D	; 77
    5190:	72 e0       	ldi	r23, 0x02	; 2
    5192:	86 ea       	ldi	r24, 0xA6	; 166
    5194:	94 e0       	ldi	r25, 0x04	; 4
    5196:	0e 94 ee 11 	call	0x23dc	; 0x23dc <_Z16eeprom_write_lenPhjj>
    519a:	80 91 9e 04 	lds	r24, 0x049E	; 0x80049e <sets+0x45>
    519e:	88 23       	and	r24, r24
    51a0:	39 f1       	breq	.+78     	; 0x51f0 <setup+0x278>
    51a2:	e0 91 9f 04 	lds	r30, 0x049F	; 0x80049f <sets+0x46>
    51a6:	ee 23       	and	r30, r30
    51a8:	19 f1       	breq	.+70     	; 0x51f0 <setup+0x278>
    51aa:	f0 e0       	ldi	r31, 0x00	; 0
    51ac:	e4 55       	subi	r30, 0x54	; 84
    51ae:	fe 4f       	sbci	r31, 0xFE	; 254
    51b0:	c4 91       	lpm	r28, Z
    51b2:	2c 2f       	mov	r18, r28
    51b4:	30 e0       	ldi	r19, 0x00	; 0
    51b6:	f9 01       	movw	r30, r18
    51b8:	e2 53       	subi	r30, 0x32	; 50
    51ba:	f5 4f       	sbci	r31, 0xF5	; 245
    51bc:	94 91       	lpm	r25, Z
    51be:	f9 01       	movw	r30, r18
    51c0:	e6 54       	subi	r30, 0x46	; 70
    51c2:	f5 4f       	sbci	r31, 0xF5	; 245
    51c4:	24 91       	lpm	r18, Z
    51c6:	20 93 ab 03 	sts	0x03AB, r18	; 0x8003ab <PWM_out_bit>
    51ca:	e9 2f       	mov	r30, r25
    51cc:	f0 e0       	ldi	r31, 0x00	; 0
    51ce:	ee 0f       	add	r30, r30
    51d0:	ff 1f       	adc	r31, r31
    51d2:	e4 51       	subi	r30, 0x14	; 20
    51d4:	f5 4f       	sbci	r31, 0xF5	; 245
    51d6:	85 91       	lpm	r24, Z+
    51d8:	94 91       	lpm	r25, Z
    51da:	90 93 aa 03 	sts	0x03AA, r25	; 0x8003aa <PWM_out_port+0x1>
    51de:	80 93 a9 03 	sts	0x03A9, r24	; 0x8003a9 <PWM_out_port>
    51e2:	80 e0       	ldi	r24, 0x00	; 0
    51e4:	0e 94 f8 1d 	call	0x3bf0	; 0x3bf0 <_Z12generate_PWMb>
    51e8:	61 e0       	ldi	r22, 0x01	; 1
    51ea:	8c 2f       	mov	r24, r28
    51ec:	0e 94 a9 36 	call	0x6d52	; 0x6d52 <pinMode>
    51f0:	0e 94 5f 08 	call	0x10be	; 0x10be <_ZN3OSD4initEv>
    51f4:	0e 94 4e 1e 	call	0x3c9c	; 0x3c9c <_Z4logov>
    51f8:	60 e0       	ldi	r22, 0x00	; 0
    51fa:	8b e1       	ldi	r24, 0x1B	; 27
    51fc:	0e 94 e5 36 	call	0x6dca	; 0x6dca <digitalWrite>
    5200:	0e 94 5c 18 	call	0x30b8	; 0x30b8 <_Z14doScreenSwitchv>
    5204:	61 ea       	ldi	r22, 0xA1	; 161
    5206:	71 e0       	ldi	r23, 0x01	; 1
    5208:	83 e5       	ldi	r24, 0x53	; 83
    520a:	93 e0       	ldi	r25, 0x03	; 3
    520c:	0e 94 ab 3a 	call	0x7556	; 0x7556 <_ZN12BetterStream7print_PEPKc>
    5210:	83 e5       	ldi	r24, 0x53	; 83
    5212:	93 e0       	ldi	r25, 0x03	; 3
    5214:	0e 94 b6 37 	call	0x6f6c	; 0x6f6c <_ZN5Print7printlnEv>
    5218:	83 e5       	ldi	r24, 0x53	; 83
    521a:	93 e0       	ldi	r25, 0x03	; 3
    521c:	0e 94 84 39 	call	0x7308	; 0x7308 <_ZN10FastSerial4waitEv>
    5220:	df 91       	pop	r29
    5222:	cf 91       	pop	r28
    5224:	08 95       	ret

00005226 <_Z10delay_bytev>:
    5226:	83 e5       	ldi	r24, 0x53	; 83
    5228:	93 e0       	ldi	r25, 0x03	; 3
    522a:	0e 94 85 38 	call	0x710a	; 0x710a <_ZN10FastSerial9availableEv>
    522e:	81 11       	cpse	r24, r1
    5230:	02 c0       	rjmp	.+4      	; 0x5236 <_Z10delay_bytev+0x10>
    5232:	0e 94 9e 13 	call	0x273c	; 0x273c <_Z11delay_telemv>
    5236:	08 95       	ret

00005238 <_mavlink_send_uart.isra.17>:
    5238:	0f 93       	push	r16
    523a:	1f 93       	push	r17
    523c:	cf 93       	push	r28
    523e:	df 93       	push	r29
    5240:	16 2f       	mov	r17, r22
    5242:	08 2f       	mov	r16, r24
    5244:	ec 01       	movw	r28, r24
    5246:	8c 2f       	mov	r24, r28
    5248:	80 1b       	sub	r24, r16
    524a:	81 17       	cp	r24, r17
    524c:	30 f4       	brcc	.+12     	; 0x525a <_mavlink_send_uart.isra.17+0x22>
    524e:	69 91       	ld	r22, Y+
    5250:	83 e5       	ldi	r24, 0x53	; 83
    5252:	93 e0       	ldi	r25, 0x03	; 3
    5254:	0e 94 02 39 	call	0x7204	; 0x7204 <_ZN10FastSerial5writeEh>
    5258:	f6 cf       	rjmp	.-20     	; 0x5246 <_mavlink_send_uart.isra.17+0xe>
    525a:	df 91       	pop	r29
    525c:	cf 91       	pop	r28
    525e:	1f 91       	pop	r17
    5260:	0f 91       	pop	r16
    5262:	08 95       	ret

00005264 <_mav_finalize_message_chan_send.constprop.124>:
    5264:	aa e0       	ldi	r26, 0x0A	; 10
    5266:	b0 e0       	ldi	r27, 0x00	; 0
    5268:	e8 e3       	ldi	r30, 0x38	; 56
    526a:	f9 e2       	ldi	r31, 0x29	; 41
    526c:	0c 94 70 44 	jmp	0x88e0	; 0x88e0 <__prologue_saves__+0xe>
    5270:	d6 2e       	mov	r13, r22
    5272:	b7 2e       	mov	r11, r23
    5274:	c4 2e       	mov	r12, r20
    5276:	a2 2e       	mov	r10, r18
    5278:	9e ef       	ldi	r25, 0xFE	; 254
    527a:	99 83       	std	Y+1, r25	; 0x01
    527c:	4a 83       	std	Y+2, r20	; 0x02
    527e:	30 91 02 05 	lds	r19, 0x0502	; 0x800502 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x7>
    5282:	3b 83       	std	Y+3, r19	; 0x03
    5284:	90 91 09 01 	lds	r25, 0x0109	; 0x800109 <mavlink_system>
    5288:	9c 83       	std	Y+4, r25	; 0x04
    528a:	90 91 0a 01 	lds	r25, 0x010A	; 0x80010a <mavlink_system+0x1>
    528e:	9d 83       	std	Y+5, r25	; 0x05
    5290:	8e 83       	std	Y+6, r24	; 0x06
    5292:	3f 5f       	subi	r19, 0xFF	; 255
    5294:	30 93 02 05 	sts	0x0502, r19	; 0x800502 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x7>
    5298:	8f ef       	ldi	r24, 0xFF	; 255
    529a:	9f ef       	ldi	r25, 0xFF	; 255
    529c:	98 87       	std	Y+8, r25	; 0x08
    529e:	8f 83       	std	Y+7, r24	; 0x07
    52a0:	8e 01       	movw	r16, r28
    52a2:	0e 5f       	subi	r16, 0xFE	; 254
    52a4:	1f 4f       	sbci	r17, 0xFF	; 255
    52a6:	7e 01       	movw	r14, r28
    52a8:	87 e0       	ldi	r24, 0x07	; 7
    52aa:	e8 0e       	add	r14, r24
    52ac:	f1 1c       	adc	r15, r1
    52ae:	0e 15       	cp	r16, r14
    52b0:	1f 05       	cpc	r17, r15
    52b2:	39 f0       	breq	.+14     	; 0x52c2 <_mav_finalize_message_chan_send.constprop.124+0x5e>
    52b4:	b7 01       	movw	r22, r14
    52b6:	f8 01       	movw	r30, r16
    52b8:	81 91       	ld	r24, Z+
    52ba:	8f 01       	movw	r16, r30
    52bc:	0e 94 66 09 	call	0x12cc	; 0x12cc <crc_accumulate>
    52c0:	f6 cf       	rjmp	.-20     	; 0x52ae <_mav_finalize_message_chan_send.constprop.124+0x4a>
    52c2:	8f 81       	ldd	r24, Y+7	; 0x07
    52c4:	98 85       	ldd	r25, Y+8	; 0x08
    52c6:	9a 87       	std	Y+10, r25	; 0x0a
    52c8:	89 87       	std	Y+9, r24	; 0x09
    52ca:	0d 2d       	mov	r16, r13
    52cc:	1b 2d       	mov	r17, r11
    52ce:	9c 2c       	mov	r9, r12
    52d0:	9d 0c       	add	r9, r13
    52d2:	be 01       	movw	r22, r28
    52d4:	67 5f       	subi	r22, 0xF7	; 247
    52d6:	7f 4f       	sbci	r23, 0xFF	; 255
    52d8:	90 16       	cp	r9, r16
    52da:	31 f0       	breq	.+12     	; 0x52e8 <_mav_finalize_message_chan_send.constprop.124+0x84>
    52dc:	f8 01       	movw	r30, r16
    52de:	81 91       	ld	r24, Z+
    52e0:	8f 01       	movw	r16, r30
    52e2:	0e 94 66 09 	call	0x12cc	; 0x12cc <crc_accumulate>
    52e6:	f5 cf       	rjmp	.-22     	; 0x52d2 <_mav_finalize_message_chan_send.constprop.124+0x6e>
    52e8:	8a 2d       	mov	r24, r10
    52ea:	0e 94 66 09 	call	0x12cc	; 0x12cc <crc_accumulate>
    52ee:	99 85       	ldd	r25, Y+9	; 0x09
    52f0:	8a 85       	ldd	r24, Y+10	; 0x0a
    52f2:	9f 83       	std	Y+7, r25	; 0x07
    52f4:	88 87       	std	Y+8, r24	; 0x08
    52f6:	66 e0       	ldi	r22, 0x06	; 6
    52f8:	ce 01       	movw	r24, r28
    52fa:	01 96       	adiw	r24, 0x01	; 1
    52fc:	0e 94 1c 29 	call	0x5238	; 0x5238 <_mavlink_send_uart.isra.17>
    5300:	6c 2d       	mov	r22, r12
    5302:	8d 2d       	mov	r24, r13
    5304:	9b 2d       	mov	r25, r11
    5306:	0e 94 1c 29 	call	0x5238	; 0x5238 <_mavlink_send_uart.isra.17>
    530a:	62 e0       	ldi	r22, 0x02	; 2
    530c:	c7 01       	movw	r24, r14
    530e:	0e 94 1c 29 	call	0x5238	; 0x5238 <_mavlink_send_uart.isra.17>
    5312:	2a 96       	adiw	r28, 0x0a	; 10
    5314:	eb e0       	ldi	r30, 0x0B	; 11
    5316:	0c 94 8c 44 	jmp	0x8918	; 0x8918 <__epilogue_restores__+0xe>

0000531a <_Z9heartBeatv>:
    531a:	a9 e0       	ldi	r26, 0x09	; 9
    531c:	b0 e0       	ldi	r27, 0x00	; 0
    531e:	e3 e9       	ldi	r30, 0x93	; 147
    5320:	f9 e2       	ldi	r31, 0x29	; 41
    5322:	0c 94 78 44 	jmp	0x88f0	; 0x88f0 <__prologue_saves__+0x1e>
    5326:	80 91 67 04 	lds	r24, 0x0467	; 0x800467 <sets+0xe>
    532a:	86 50       	subi	r24, 0x06	; 6
    532c:	82 30       	cpi	r24, 0x02	; 2
    532e:	d0 f4       	brcc	.+52     	; 0x5364 <_Z9heartBeatv+0x4a>
    5330:	10 91 09 01 	lds	r17, 0x0109	; 0x800109 <mavlink_system>
    5334:	80 91 5c 06 	lds	r24, 0x065C	; 0x80065c <_ZL14apm_mav_system>
    5338:	80 93 09 01 	sts	0x0109, r24	; 0x800109 <mavlink_system>
    533c:	19 82       	std	Y+1, r1	; 0x01
    533e:	1a 82       	std	Y+2, r1	; 0x02
    5340:	1b 82       	std	Y+3, r1	; 0x03
    5342:	1c 82       	std	Y+4, r1	; 0x04
    5344:	1d 82       	std	Y+5, r1	; 0x05
    5346:	1e 82       	std	Y+6, r1	; 0x06
    5348:	1f 82       	std	Y+7, r1	; 0x07
    534a:	18 86       	std	Y+8, r1	; 0x08
    534c:	83 e0       	ldi	r24, 0x03	; 3
    534e:	89 87       	std	Y+9, r24	; 0x09
    5350:	22 e3       	ldi	r18, 0x32	; 50
    5352:	49 e0       	ldi	r20, 0x09	; 9
    5354:	be 01       	movw	r22, r28
    5356:	6f 5f       	subi	r22, 0xFF	; 255
    5358:	7f 4f       	sbci	r23, 0xFF	; 255
    535a:	80 e0       	ldi	r24, 0x00	; 0
    535c:	0e 94 32 29 	call	0x5264	; 0x5264 <_mav_finalize_message_chan_send.constprop.124>
    5360:	10 93 09 01 	sts	0x0109, r17	; 0x800109 <mavlink_system>
    5364:	29 96       	adiw	r28, 0x09	; 9
    5366:	e3 e0       	ldi	r30, 0x03	; 3
    5368:	0c 94 94 44 	jmp	0x8928	; 0x8928 <__epilogue_restores__+0x1e>

0000536c <_Z21request_mavlink_ratesv>:
    536c:	a6 e0       	ldi	r26, 0x06	; 6
    536e:	b0 e0       	ldi	r27, 0x00	; 0
    5370:	ec eb       	ldi	r30, 0xBC	; 188
    5372:	f9 e2       	ldi	r31, 0x29	; 41
    5374:	0c 94 76 44 	jmp	0x88ec	; 0x88ec <__prologue_saves__+0x1a>
    5378:	0d e6       	ldi	r16, 0x6D	; 109
    537a:	15 e0       	ldi	r17, 0x05	; 5
    537c:	ff 24       	eor	r15, r15
    537e:	f3 94       	inc	r15
    5380:	f8 01       	movw	r30, r16
    5382:	31 96       	adiw	r30, 0x01	; 1
    5384:	84 91       	lpm	r24, Z
    5386:	60 91 ff 06 	lds	r22, 0x06FF	; 0x8006ff <_ZL11stream_rate>
    538a:	66 23       	and	r22, r22
    538c:	39 f0       	breq	.+14     	; 0x539c <_Z21request_mavlink_ratesv+0x30>
    538e:	88 0f       	add	r24, r24
    5390:	88 0f       	add	r24, r24
    5392:	0e 94 72 43 	call	0x86e4	; 0x86e4 <__udivmodqi4>
    5396:	81 11       	cpse	r24, r1
    5398:	01 c0       	rjmp	.+2      	; 0x539c <_Z21request_mavlink_ratesv+0x30>
    539a:	81 e0       	ldi	r24, 0x01	; 1
    539c:	f8 01       	movw	r30, r16
    539e:	24 91       	lpm	r18, Z
    53a0:	30 91 5c 06 	lds	r19, 0x065C	; 0x80065c <_ZL14apm_mav_system>
    53a4:	90 e0       	ldi	r25, 0x00	; 0
    53a6:	9a 83       	std	Y+2, r25	; 0x02
    53a8:	89 83       	std	Y+1, r24	; 0x01
    53aa:	3b 83       	std	Y+3, r19	; 0x03
    53ac:	1c 82       	std	Y+4, r1	; 0x04
    53ae:	2d 83       	std	Y+5, r18	; 0x05
    53b0:	fe 82       	std	Y+6, r15	; 0x06
    53b2:	24 e9       	ldi	r18, 0x94	; 148
    53b4:	46 e0       	ldi	r20, 0x06	; 6
    53b6:	be 01       	movw	r22, r28
    53b8:	6f 5f       	subi	r22, 0xFF	; 255
    53ba:	7f 4f       	sbci	r23, 0xFF	; 255
    53bc:	82 e4       	ldi	r24, 0x42	; 66
    53be:	0e 94 32 29 	call	0x5264	; 0x5264 <_mav_finalize_message_chan_send.constprop.124>
    53c2:	0e 5f       	subi	r16, 0xFE	; 254
    53c4:	1f 4f       	sbci	r17, 0xFF	; 255
    53c6:	f5 e0       	ldi	r31, 0x05	; 5
    53c8:	09 37       	cpi	r16, 0x79	; 121
    53ca:	1f 07       	cpc	r17, r31
    53cc:	c9 f6       	brne	.-78     	; 0x5380 <_Z21request_mavlink_ratesv+0x14>
    53ce:	26 96       	adiw	r28, 0x06	; 6
    53d0:	e5 e0       	ldi	r30, 0x05	; 5
    53d2:	0c 94 92 44 	jmp	0x8924	; 0x8924 <__epilogue_restores__+0x1a>

000053d6 <_Z21mavlink_return_packethhh>:
    53d6:	a2 e0       	ldi	r26, 0x02	; 2
    53d8:	b0 e0       	ldi	r27, 0x00	; 0
    53da:	e1 ef       	ldi	r30, 0xF1	; 241
    53dc:	f9 e2       	ldi	r31, 0x29	; 41
    53de:	0c 94 73 44 	jmp	0x88e6	; 0x88e6 <__prologue_saves__+0x14>
    53e2:	16 2f       	mov	r17, r22
    53e4:	04 2f       	mov	r16, r20
    53e6:	9e ef       	ldi	r25, 0xFE	; 254
    53e8:	90 93 0f 05 	sts	0x050F, r25	; 0x80050f <msg+0x2>
    53ec:	60 93 10 05 	sts	0x0510, r22	; 0x800510 <msg+0x3>
    53f0:	80 93 14 05 	sts	0x0514, r24	; 0x800514 <msg+0x7>
    53f4:	80 91 09 01 	lds	r24, 0x0109	; 0x800109 <mavlink_system>
    53f8:	80 93 12 05 	sts	0x0512, r24	; 0x800512 <msg+0x5>
    53fc:	84 e6       	ldi	r24, 0x64	; 100
    53fe:	80 93 13 05 	sts	0x0513, r24	; 0x800513 <msg+0x6>
    5402:	8f ef       	ldi	r24, 0xFF	; 255
    5404:	9f ef       	ldi	r25, 0xFF	; 255
    5406:	9a 83       	std	Y+2, r25	; 0x02
    5408:	89 83       	std	Y+1, r24	; 0x01
    540a:	e6 2e       	mov	r14, r22
    540c:	f1 2c       	mov	r15, r1
    540e:	80 e1       	ldi	r24, 0x10	; 16
    5410:	c8 2e       	mov	r12, r24
    5412:	85 e0       	ldi	r24, 0x05	; 5
    5414:	d8 2e       	mov	r13, r24
    5416:	be 01       	movw	r22, r28
    5418:	6f 5f       	subi	r22, 0xFF	; 255
    541a:	7f 4f       	sbci	r23, 0xFF	; 255
    541c:	f6 01       	movw	r30, r12
    541e:	81 91       	ld	r24, Z+
    5420:	6f 01       	movw	r12, r30
    5422:	0e 94 66 09 	call	0x12cc	; 0x12cc <crc_accumulate>
    5426:	f1 e0       	ldi	r31, 0x01	; 1
    5428:	ef 1a       	sub	r14, r31
    542a:	f1 08       	sbc	r15, r1
    542c:	8b ef       	ldi	r24, 0xFB	; 251
    542e:	e8 16       	cp	r14, r24
    5430:	8f ef       	ldi	r24, 0xFF	; 255
    5432:	f8 06       	cpc	r15, r24
    5434:	81 f7       	brne	.-32     	; 0x5416 <_Z21mavlink_return_packethhh+0x40>
    5436:	be 01       	movw	r22, r28
    5438:	6f 5f       	subi	r22, 0xFF	; 255
    543a:	7f 4f       	sbci	r23, 0xFF	; 255
    543c:	80 2f       	mov	r24, r16
    543e:	0e 94 66 09 	call	0x12cc	; 0x12cc <crc_accumulate>
    5442:	66 e0       	ldi	r22, 0x06	; 6
    5444:	8f e0       	ldi	r24, 0x0F	; 15
    5446:	95 e0       	ldi	r25, 0x05	; 5
    5448:	0e 94 1c 29 	call	0x5238	; 0x5238 <_mavlink_send_uart.isra.17>
    544c:	61 2f       	mov	r22, r17
    544e:	85 e1       	ldi	r24, 0x15	; 21
    5450:	95 e0       	ldi	r25, 0x05	; 5
    5452:	0e 94 1c 29 	call	0x5238	; 0x5238 <_mavlink_send_uart.isra.17>
    5456:	62 e0       	ldi	r22, 0x02	; 2
    5458:	ce 01       	movw	r24, r28
    545a:	01 96       	adiw	r24, 0x01	; 1
    545c:	0e 94 1c 29 	call	0x5238	; 0x5238 <_mavlink_send_uart.isra.17>
    5460:	22 96       	adiw	r28, 0x02	; 2
    5462:	e8 e0       	ldi	r30, 0x08	; 8
    5464:	0c 94 8f 44 	jmp	0x891e	; 0x891e <__epilogue_restores__+0x14>

00005468 <_Z16parse_osd_packetPh>:
    5468:	fc 01       	movw	r30, r24
    546a:	80 81       	ld	r24, Z
    546c:	8e 3e       	cpi	r24, 0xEE	; 238
    546e:	09 f0       	breq	.+2      	; 0x5472 <_Z16parse_osd_packetPh+0xa>
    5470:	49 c0       	rjmp	.+146    	; 0x5504 <_Z16parse_osd_packetPh+0x9c>
    5472:	81 81       	ldd	r24, Z+1	; 0x01
    5474:	8f 34       	cpi	r24, 0x4F	; 79
    5476:	09 f0       	breq	.+2      	; 0x547a <_Z16parse_osd_packetPh+0x12>
    5478:	45 c0       	rjmp	.+138    	; 0x5504 <_Z16parse_osd_packetPh+0x9c>
    547a:	82 81       	ldd	r24, Z+2	; 0x02
    547c:	83 35       	cpi	r24, 0x53	; 83
    547e:	09 f0       	breq	.+2      	; 0x5482 <_Z16parse_osd_packetPh+0x1a>
    5480:	41 c0       	rjmp	.+130    	; 0x5504 <_Z16parse_osd_packetPh+0x9c>
    5482:	83 81       	ldd	r24, Z+3	; 0x03
    5484:	84 34       	cpi	r24, 0x44	; 68
    5486:	09 f0       	breq	.+2      	; 0x548a <_Z16parse_osd_packetPh+0x22>
    5488:	3d c0       	rjmp	.+122    	; 0x5504 <_Z16parse_osd_packetPh+0x9c>
    548a:	84 81       	ldd	r24, Z+4	; 0x04
    548c:	86 36       	cpi	r24, 0x66	; 102
    548e:	99 f1       	breq	.+102    	; 0x54f6 <_Z16parse_osd_packetPh+0x8e>
    5490:	18 f4       	brcc	.+6      	; 0x5498 <_Z16parse_osd_packetPh+0x30>
    5492:	82 36       	cpi	r24, 0x62	; 98
    5494:	a1 f0       	breq	.+40     	; 0x54be <_Z16parse_osd_packetPh+0x56>
    5496:	08 95       	ret
    5498:	82 37       	cpi	r24, 0x72	; 114
    549a:	e1 f0       	breq	.+56     	; 0x54d4 <_Z16parse_osd_packetPh+0x6c>
    549c:	87 37       	cpi	r24, 0x77	; 119
    549e:	91 f5       	brne	.+100    	; 0x5504 <_Z16parse_osd_packetPh+0x9c>
    54a0:	65 81       	ldd	r22, Z+5	; 0x05
    54a2:	46 81       	ldd	r20, Z+6	; 0x06
    54a4:	50 e0       	ldi	r21, 0x00	; 0
    54a6:	80 e8       	ldi	r24, 0x80	; 128
    54a8:	68 9f       	mul	r22, r24
    54aa:	b0 01       	movw	r22, r0
    54ac:	11 24       	eor	r1, r1
    54ae:	cf 01       	movw	r24, r30
    54b0:	07 96       	adiw	r24, 0x07	; 7
    54b2:	0e 94 ee 11 	call	0x23dc	; 0x23dc <_Z16eeprom_write_lenPhjj>
    54b6:	81 e0       	ldi	r24, 0x01	; 1
    54b8:	80 93 c8 03 	sts	0x03C8, r24	; 0x8003c8 <lflags+0x14>
    54bc:	08 95       	ret
    54be:	86 81       	ldd	r24, Z+6	; 0x06
    54c0:	81 11       	cpse	r24, r1
    54c2:	20 c0       	rjmp	.+64     	; 0x5504 <_Z16parse_osd_packetPh+0x9c>
    54c4:	80 91 c8 03 	lds	r24, 0x03C8	; 0x8003c8 <lflags+0x14>
    54c8:	88 23       	and	r24, r24
    54ca:	e1 f0       	breq	.+56     	; 0x5504 <_Z16parse_osd_packetPh+0x9c>
    54cc:	ee 27       	eor	r30, r30
    54ce:	ff 27       	eor	r31, r31
    54d0:	09 94       	ijmp
    54d2:	08 95       	ret
    54d4:	65 81       	ldd	r22, Z+5	; 0x05
    54d6:	46 81       	ldd	r20, Z+6	; 0x06
    54d8:	50 e0       	ldi	r21, 0x00	; 0
    54da:	80 e8       	ldi	r24, 0x80	; 128
    54dc:	68 9f       	mul	r22, r24
    54de:	b0 01       	movw	r22, r0
    54e0:	11 24       	eor	r1, r1
    54e2:	cf 01       	movw	r24, r30
    54e4:	07 96       	adiw	r24, 0x07	; 7
    54e6:	0e 94 55 11 	call	0x22aa	; 0x22aa <_Z15eeprom_read_lenPhjj>
    54ea:	4f ed       	ldi	r20, 0xDF	; 223
    54ec:	6f ef       	ldi	r22, 0xFF	; 255
    54ee:	83 e8       	ldi	r24, 0x83	; 131
    54f0:	0e 94 eb 29 	call	0x53d6	; 0x53d6 <_Z21mavlink_return_packethhh>
    54f4:	08 95       	ret
    54f6:	bf 01       	movw	r22, r30
    54f8:	67 5f       	subi	r22, 0xF7	; 247
    54fa:	7f 4f       	sbci	r23, 0xFF	; 255
    54fc:	87 81       	ldd	r24, Z+7	; 0x07
    54fe:	90 85       	ldd	r25, Z+8	; 0x08
    5500:	0e 94 31 09 	call	0x1262	; 0x1262 <_ZN3OSD9write_NVMEjPh>
    5504:	08 95       	ret

00005506 <_Z16mavlink_one_bytec>:
    5506:	4f 92       	push	r4
    5508:	5f 92       	push	r5
    550a:	6f 92       	push	r6
    550c:	7f 92       	push	r7
    550e:	8f 92       	push	r8
    5510:	9f 92       	push	r9
    5512:	af 92       	push	r10
    5514:	bf 92       	push	r11
    5516:	cf 92       	push	r12
    5518:	df 92       	push	r13
    551a:	ef 92       	push	r14
    551c:	ff 92       	push	r15
    551e:	0f 93       	push	r16
    5520:	1f 93       	push	r17
    5522:	cf 93       	push	r28
    5524:	c8 2f       	mov	r28, r24
    5526:	10 92 fb 04 	sts	0x04FB, r1	; 0x8004fb <_ZZ26mavlink_get_channel_statusE16m_mavlink_status>
    552a:	80 91 fe 04 	lds	r24, 0x04FE	; 0x8004fe <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x3>
    552e:	90 91 ff 04 	lds	r25, 0x04FF	; 0x8004ff <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x4>
    5532:	8b 30       	cpi	r24, 0x0B	; 11
    5534:	91 05       	cpc	r25, r1
    5536:	08 f0       	brcs	.+2      	; 0x553a <_Z16mavlink_one_bytec+0x34>
    5538:	b3 c0       	rjmp	.+358    	; 0x56a0 <_Z16mavlink_one_bytec+0x19a>
    553a:	fc 01       	movw	r30, r24
    553c:	e2 5c       	subi	r30, 0xC2	; 194
    553e:	ff 4f       	sbci	r31, 0xFF	; 255
    5540:	0c 94 f5 43 	jmp	0x87ea	; 0x87ea <__tablejump2__>
    5544:	10 92 06 05 	sts	0x0506, r1	; 0x800506 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0xb>
    5548:	10 92 05 05 	sts	0x0505, r1	; 0x800505 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0xa>
    554c:	ce 3f       	cpi	r28, 0xFE	; 254
    554e:	19 f0       	breq	.+6      	; 0x5556 <_Z16mavlink_one_bytec+0x50>
    5550:	81 e0       	ldi	r24, 0x01	; 1
    5552:	90 e0       	ldi	r25, 0x00	; 0
    5554:	1a c0       	rjmp	.+52     	; 0x558a <_Z16mavlink_one_bytec+0x84>
    5556:	82 e0       	ldi	r24, 0x02	; 2
    5558:	90 e0       	ldi	r25, 0x00	; 0
    555a:	90 93 ff 04 	sts	0x04FF, r25	; 0x8004ff <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x4>
    555e:	80 93 fe 04 	sts	0x04FE, r24	; 0x8004fe <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x3>
    5562:	10 92 10 05 	sts	0x0510, r1	; 0x800510 <msg+0x3>
    5566:	8f ef       	ldi	r24, 0xFF	; 255
    5568:	9f ef       	ldi	r25, 0xFF	; 255
    556a:	90 93 0e 05 	sts	0x050E, r25	; 0x80050e <msg+0x1>
    556e:	80 93 0d 05 	sts	0x050D, r24	; 0x80050d <msg>
    5572:	96 c0       	rjmp	.+300    	; 0x56a0 <_Z16mavlink_one_bytec+0x19a>
    5574:	c0 93 10 05 	sts	0x0510, r28	; 0x800510 <msg+0x3>
    5578:	10 92 00 05 	sts	0x0500, r1	; 0x800500 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x5>
    557c:	6c 2f       	mov	r22, r28
    557e:	8d e0       	ldi	r24, 0x0D	; 13
    5580:	95 e0       	ldi	r25, 0x05	; 5
    5582:	0e 94 88 09 	call	0x1310	; 0x1310 <mavlink_update_checksum>
    5586:	84 e0       	ldi	r24, 0x04	; 4
    5588:	90 e0       	ldi	r25, 0x00	; 0
    558a:	90 93 ff 04 	sts	0x04FF, r25	; 0x8004ff <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x4>
    558e:	80 93 fe 04 	sts	0x04FE, r24	; 0x8004fe <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x3>
    5592:	86 c0       	rjmp	.+268    	; 0x56a0 <_Z16mavlink_one_bytec+0x19a>
    5594:	c0 93 11 05 	sts	0x0511, r28	; 0x800511 <msg+0x4>
    5598:	6c 2f       	mov	r22, r28
    559a:	8d e0       	ldi	r24, 0x0D	; 13
    559c:	95 e0       	ldi	r25, 0x05	; 5
    559e:	0e 94 88 09 	call	0x1310	; 0x1310 <mavlink_update_checksum>
    55a2:	83 e0       	ldi	r24, 0x03	; 3
    55a4:	90 e0       	ldi	r25, 0x00	; 0
    55a6:	f1 cf       	rjmp	.-30     	; 0x558a <_Z16mavlink_one_bytec+0x84>
    55a8:	c0 93 12 05 	sts	0x0512, r28	; 0x800512 <msg+0x5>
    55ac:	6c 2f       	mov	r22, r28
    55ae:	8d e0       	ldi	r24, 0x0D	; 13
    55b0:	95 e0       	ldi	r25, 0x05	; 5
    55b2:	0e 94 88 09 	call	0x1310	; 0x1310 <mavlink_update_checksum>
    55b6:	85 e0       	ldi	r24, 0x05	; 5
    55b8:	90 e0       	ldi	r25, 0x00	; 0
    55ba:	e7 cf       	rjmp	.-50     	; 0x558a <_Z16mavlink_one_bytec+0x84>
    55bc:	c0 93 13 05 	sts	0x0513, r28	; 0x800513 <msg+0x6>
    55c0:	6c 2f       	mov	r22, r28
    55c2:	8d e0       	ldi	r24, 0x0D	; 13
    55c4:	95 e0       	ldi	r25, 0x05	; 5
    55c6:	0e 94 88 09 	call	0x1310	; 0x1310 <mavlink_update_checksum>
    55ca:	86 e0       	ldi	r24, 0x06	; 6
    55cc:	90 e0       	ldi	r25, 0x00	; 0
    55ce:	dd cf       	rjmp	.-70     	; 0x558a <_Z16mavlink_one_bytec+0x84>
    55d0:	c0 93 14 05 	sts	0x0514, r28	; 0x800514 <msg+0x7>
    55d4:	6c 2f       	mov	r22, r28
    55d6:	8d e0       	ldi	r24, 0x0D	; 13
    55d8:	95 e0       	ldi	r25, 0x05	; 5
    55da:	0e 94 88 09 	call	0x1310	; 0x1310 <mavlink_update_checksum>
    55de:	80 91 10 05 	lds	r24, 0x0510	; 0x800510 <msg+0x3>
    55e2:	81 11       	cpse	r24, r1
    55e4:	03 c0       	rjmp	.+6      	; 0x55ec <_Z16mavlink_one_bytec+0xe6>
    55e6:	88 e0       	ldi	r24, 0x08	; 8
    55e8:	90 e0       	ldi	r25, 0x00	; 0
    55ea:	cf cf       	rjmp	.-98     	; 0x558a <_Z16mavlink_one_bytec+0x84>
    55ec:	87 e0       	ldi	r24, 0x07	; 7
    55ee:	90 e0       	ldi	r25, 0x00	; 0
    55f0:	cc cf       	rjmp	.-104    	; 0x558a <_Z16mavlink_one_bytec+0x84>
    55f2:	e0 91 00 05 	lds	r30, 0x0500	; 0x800500 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x5>
    55f6:	81 e0       	ldi	r24, 0x01	; 1
    55f8:	8e 0f       	add	r24, r30
    55fa:	80 93 00 05 	sts	0x0500, r24	; 0x800500 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x5>
    55fe:	f0 e0       	ldi	r31, 0x00	; 0
    5600:	eb 5e       	subi	r30, 0xEB	; 235
    5602:	fa 4f       	sbci	r31, 0xFA	; 250
    5604:	c0 83       	st	Z, r28
    5606:	6c 2f       	mov	r22, r28
    5608:	8d e0       	ldi	r24, 0x0D	; 13
    560a:	95 e0       	ldi	r25, 0x05	; 5
    560c:	0e 94 88 09 	call	0x1310	; 0x1310 <mavlink_update_checksum>
    5610:	90 91 00 05 	lds	r25, 0x0500	; 0x800500 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x5>
    5614:	80 91 10 05 	lds	r24, 0x0510	; 0x800510 <msg+0x3>
    5618:	98 13       	cpse	r25, r24
    561a:	42 c0       	rjmp	.+132    	; 0x56a0 <_Z16mavlink_one_bytec+0x19a>
    561c:	e4 cf       	rjmp	.-56     	; 0x55e6 <_Z16mavlink_one_bytec+0xe0>
    561e:	e0 91 14 05 	lds	r30, 0x0514	; 0x800514 <msg+0x7>
    5622:	f0 e0       	ldi	r31, 0x00	; 0
    5624:	eb 59       	subi	r30, 0x9B	; 155
    5626:	fb 4f       	sbci	r31, 0xFB	; 251
    5628:	64 91       	lpm	r22, Z
    562a:	8d e0       	ldi	r24, 0x0D	; 13
    562c:	95 e0       	ldi	r25, 0x05	; 5
    562e:	0e 94 88 09 	call	0x1310	; 0x1310 <mavlink_update_checksum>
    5632:	2c 2f       	mov	r18, r28
    5634:	30 e0       	ldi	r19, 0x00	; 0
    5636:	80 91 0d 05 	lds	r24, 0x050D	; 0x80050d <msg>
    563a:	90 91 0e 05 	lds	r25, 0x050E	; 0x80050e <msg+0x1>
    563e:	99 27       	eor	r25, r25
    5640:	28 17       	cp	r18, r24
    5642:	39 07       	cpc	r19, r25
    5644:	31 f0       	breq	.+12     	; 0x5652 <_Z16mavlink_one_bytec+0x14c>
    5646:	ce 3f       	cpi	r28, 0xFE	; 254
    5648:	09 f4       	brne	.+2      	; 0x564c <_Z16mavlink_one_bytec+0x146>
    564a:	85 cf       	rjmp	.-246    	; 0x5556 <_Z16mavlink_one_bytec+0x50>
    564c:	8a e0       	ldi	r24, 0x0A	; 10
    564e:	90 e0       	ldi	r25, 0x00	; 0
    5650:	9c cf       	rjmp	.-200    	; 0x558a <_Z16mavlink_one_bytec+0x84>
    5652:	89 e0       	ldi	r24, 0x09	; 9
    5654:	90 e0       	ldi	r25, 0x00	; 0
    5656:	90 93 ff 04 	sts	0x04FF, r25	; 0x8004ff <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x4>
    565a:	80 93 fe 04 	sts	0x04FE, r24	; 0x8004fe <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x3>
    565e:	e0 91 00 05 	lds	r30, 0x0500	; 0x800500 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x5>
    5662:	f0 e0       	ldi	r31, 0x00	; 0
    5664:	eb 5e       	subi	r30, 0xEB	; 235
    5666:	fa 4f       	sbci	r31, 0xFA	; 250
    5668:	1a c0       	rjmp	.+52     	; 0x569e <_Z16mavlink_one_bytec+0x198>
    566a:	4c 2f       	mov	r20, r28
    566c:	50 e0       	ldi	r21, 0x00	; 0
    566e:	20 91 0e 05 	lds	r18, 0x050E	; 0x80050e <msg+0x1>
    5672:	30 e0       	ldi	r19, 0x00	; 0
    5674:	42 17       	cp	r20, r18
    5676:	53 07       	cpc	r21, r19
    5678:	09 f0       	breq	.+2      	; 0x567c <_Z16mavlink_one_bytec+0x176>
    567a:	68 cf       	rjmp	.-304    	; 0x554c <_Z16mavlink_one_bytec+0x46>
    567c:	0a 97       	sbiw	r24, 0x0a	; 10
    567e:	09 f4       	brne	.+2      	; 0x5682 <_Z16mavlink_one_bytec+0x17c>
    5680:	65 cf       	rjmp	.-310    	; 0x554c <_Z16mavlink_one_bytec+0x46>
    5682:	81 e0       	ldi	r24, 0x01	; 1
    5684:	80 93 fb 04 	sts	0x04FB, r24	; 0x8004fb <_ZZ26mavlink_get_channel_statusE16m_mavlink_status>
    5688:	81 e0       	ldi	r24, 0x01	; 1
    568a:	90 e0       	ldi	r25, 0x00	; 0
    568c:	90 93 ff 04 	sts	0x04FF, r25	; 0x8004ff <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x4>
    5690:	80 93 fe 04 	sts	0x04FE, r24	; 0x8004fe <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x3>
    5694:	e0 91 00 05 	lds	r30, 0x0500	; 0x800500 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x5>
    5698:	f0 e0       	ldi	r31, 0x00	; 0
    569a:	ea 5e       	subi	r30, 0xEA	; 234
    569c:	fa 4f       	sbci	r31, 0xFA	; 250
    569e:	c0 83       	st	Z, r28
    56a0:	20 91 fb 04 	lds	r18, 0x04FB	; 0x8004fb <_ZZ26mavlink_get_channel_statusE16m_mavlink_status>
    56a4:	22 23       	and	r18, r18
    56a6:	99 f0       	breq	.+38     	; 0x56ce <_Z16mavlink_one_bytec+0x1c8>
    56a8:	80 91 11 05 	lds	r24, 0x0511	; 0x800511 <msg+0x4>
    56ac:	80 93 01 05 	sts	0x0501, r24	; 0x800501 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x6>
    56b0:	80 91 03 05 	lds	r24, 0x0503	; 0x800503 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x8>
    56b4:	90 91 04 05 	lds	r25, 0x0504	; 0x800504 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x9>
    56b8:	00 97       	sbiw	r24, 0x00	; 0
    56ba:	21 f4       	brne	.+8      	; 0x56c4 <_Z16mavlink_one_bytec+0x1be>
    56bc:	10 92 06 05 	sts	0x0506, r1	; 0x800506 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0xb>
    56c0:	10 92 05 05 	sts	0x0505, r1	; 0x800505 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0xa>
    56c4:	01 96       	adiw	r24, 0x01	; 1
    56c6:	90 93 04 05 	sts	0x0504, r25	; 0x800504 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x9>
    56ca:	80 93 03 05 	sts	0x0503, r24	; 0x800503 <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x8>
    56ce:	10 92 fd 04 	sts	0x04FD, r1	; 0x8004fd <_ZZ26mavlink_get_channel_statusE16m_mavlink_status+0x2>
    56d2:	22 23       	and	r18, r18
    56d4:	09 f4       	brne	.+2      	; 0x56d8 <_Z16mavlink_one_bytec+0x1d2>
    56d6:	80 c4       	rjmp	.+2304   	; 0x5fd8 <_Z16mavlink_one_bytec+0xad2>
    56d8:	0e 94 d7 1d 	call	0x3bae	; 0x3bae <_Z12set_data_gotv>
    56dc:	80 91 14 05 	lds	r24, 0x0514	; 0x800514 <msg+0x7>
    56e0:	83 38       	cpi	r24, 0x83	; 131
    56e2:	e9 f4       	brne	.+58     	; 0x571e <_Z16mavlink_one_bytec+0x218>
    56e4:	90 91 12 05 	lds	r25, 0x0512	; 0x800512 <msg+0x5>
    56e8:	80 91 59 06 	lds	r24, 0x0659	; 0x800659 <_ZL10mav_gcs_id>
    56ec:	98 13       	cpse	r25, r24
    56ee:	17 c0       	rjmp	.+46     	; 0x571e <_Z16mavlink_one_bytec+0x218>
    56f0:	80 91 13 05 	lds	r24, 0x0513	; 0x800513 <msg+0x6>
    56f4:	84 36       	cpi	r24, 0x64	; 100
    56f6:	99 f4       	brne	.+38     	; 0x571e <_Z16mavlink_one_bytec+0x218>
    56f8:	80 91 15 05 	lds	r24, 0x0515	; 0x800515 <msg+0x8>
    56fc:	90 91 16 05 	lds	r25, 0x0516	; 0x800516 <msg+0x9>
    5700:	20 91 57 06 	lds	r18, 0x0657	; 0x800657 <_ZL10last_seq_n>
    5704:	30 91 58 06 	lds	r19, 0x0658	; 0x800658 <_ZL10last_seq_n+0x1>
    5708:	82 17       	cp	r24, r18
    570a:	93 07       	cpc	r25, r19
    570c:	41 f0       	breq	.+16     	; 0x571e <_Z16mavlink_one_bytec+0x218>
    570e:	90 93 58 06 	sts	0x0658, r25	; 0x800658 <_ZL10last_seq_n+0x1>
    5712:	80 93 57 06 	sts	0x0657, r24	; 0x800657 <_ZL10last_seq_n>
    5716:	87 e1       	ldi	r24, 0x17	; 23
    5718:	95 e0       	ldi	r25, 0x05	; 5
    571a:	0e 94 34 2a 	call	0x5468	; 0x5468 <_Z16parse_osd_packetPh>
    571e:	80 91 14 05 	lds	r24, 0x0514	; 0x800514 <msg+0x7>
    5722:	88 23       	and	r24, r24
    5724:	59 f0       	breq	.+22     	; 0x573c <_Z16mavlink_one_bytec+0x236>
    5726:	20 91 5c 06 	lds	r18, 0x065C	; 0x80065c <_ZL14apm_mav_system>
    572a:	22 23       	and	r18, r18
    572c:	39 f0       	breq	.+14     	; 0x573c <_Z16mavlink_one_bytec+0x236>
    572e:	90 91 12 05 	lds	r25, 0x0512	; 0x800512 <msg+0x5>
    5732:	29 17       	cp	r18, r25
    5734:	19 f0       	breq	.+6      	; 0x573c <_Z16mavlink_one_bytec+0x236>
    5736:	93 33       	cpi	r25, 0x33	; 51
    5738:	09 f0       	breq	.+2      	; 0x573c <_Z16mavlink_one_bytec+0x236>
    573a:	29 c1       	rjmp	.+594    	; 0x598e <_Z16mavlink_one_bytec+0x488>
    573c:	20 91 e5 03 	lds	r18, 0x03E5	; 0x8003e5 <packets_got>
    5740:	30 91 e6 03 	lds	r19, 0x03E6	; 0x8003e6 <packets_got+0x1>
    5744:	2f 5f       	subi	r18, 0xFF	; 255
    5746:	3f 4f       	sbci	r19, 0xFF	; 255
    5748:	30 93 e6 03 	sts	0x03E6, r19	; 0x8003e6 <packets_got+0x1>
    574c:	20 93 e5 03 	sts	0x03E5, r18	; 0x8003e5 <packets_got>
    5750:	8a 32       	cpi	r24, 0x2A	; 42
    5752:	09 f4       	brne	.+2      	; 0x5756 <_Z16mavlink_one_bytec+0x250>
    5754:	be c2       	rjmp	.+1404   	; 0x5cd2 <_Z16mavlink_one_bytec+0x7cc>
    5756:	08 f0       	brcs	.+2      	; 0x575a <_Z16mavlink_one_bytec+0x254>
    5758:	7f c0       	rjmp	.+254    	; 0x5858 <_Z16mavlink_one_bytec+0x352>
    575a:	8b 31       	cpi	r24, 0x1B	; 27
    575c:	09 f4       	brne	.+2      	; 0x5760 <_Z16mavlink_one_bytec+0x25a>
    575e:	62 c1       	rjmp	.+708    	; 0x5a24 <_Z16mavlink_one_bytec+0x51e>
    5760:	60 f4       	brcc	.+24     	; 0x577a <_Z16mavlink_one_bytec+0x274>
    5762:	81 30       	cpi	r24, 0x01	; 1
    5764:	09 f4       	brne	.+2      	; 0x5768 <_Z16mavlink_one_bytec+0x262>
    5766:	64 c1       	rjmp	.+712    	; 0x5a30 <_Z16mavlink_one_bytec+0x52a>
    5768:	08 f4       	brcc	.+2      	; 0x576c <_Z16mavlink_one_bytec+0x266>
    576a:	00 c1       	rjmp	.+512    	; 0x596c <_Z16mavlink_one_bytec+0x466>
    576c:	82 30       	cpi	r24, 0x02	; 2
    576e:	09 f4       	brne	.+2      	; 0x5772 <_Z16mavlink_one_bytec+0x26c>
    5770:	93 c3       	rjmp	.+1830   	; 0x5e98 <_Z16mavlink_one_bytec+0x992>
    5772:	88 31       	cpi	r24, 0x18	; 24
    5774:	09 f4       	brne	.+2      	; 0x5778 <_Z16mavlink_one_bytec+0x272>
    5776:	84 c1       	rjmp	.+776    	; 0x5a80 <_Z16mavlink_one_bytec+0x57a>
    5778:	31 c4       	rjmp	.+2146   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    577a:	81 32       	cpi	r24, 0x21	; 33
    577c:	09 f4       	brne	.+2      	; 0x5780 <_Z16mavlink_one_bytec+0x27a>
    577e:	fc c2       	rjmp	.+1528   	; 0x5d78 <_Z16mavlink_one_bytec+0x872>
    5780:	08 f0       	brcs	.+2      	; 0x5784 <_Z16mavlink_one_bytec+0x27e>
    5782:	43 c0       	rjmp	.+134    	; 0x580a <_Z16mavlink_one_bytec+0x304>
    5784:	8d 31       	cpi	r24, 0x1D	; 29
    5786:	09 f4       	brne	.+2      	; 0x578a <_Z16mavlink_one_bytec+0x284>
    5788:	ee c2       	rjmp	.+1500   	; 0x5d66 <_Z16mavlink_one_bytec+0x860>
    578a:	8e 31       	cpi	r24, 0x1E	; 30
    578c:	09 f0       	breq	.+2      	; 0x5790 <_Z16mavlink_one_bytec+0x28a>
    578e:	26 c4       	rjmp	.+2124   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5790:	21 ee       	ldi	r18, 0xE1	; 225
    5792:	3e e2       	ldi	r19, 0x2E	; 46
    5794:	45 e6       	ldi	r20, 0x65	; 101
    5796:	52 e4       	ldi	r21, 0x42	; 66
    5798:	60 91 1d 05 	lds	r22, 0x051D	; 0x80051d <msg+0x10>
    579c:	70 91 1e 05 	lds	r23, 0x051E	; 0x80051e <msg+0x11>
    57a0:	80 91 1f 05 	lds	r24, 0x051F	; 0x80051f <msg+0x12>
    57a4:	90 91 20 05 	lds	r25, 0x0520	; 0x800520 <msg+0x13>
    57a8:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    57ac:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    57b0:	70 93 34 04 	sts	0x0434, r23	; 0x800434 <osd_att+0x1>
    57b4:	60 93 33 04 	sts	0x0433, r22	; 0x800433 <osd_att>
    57b8:	21 ee       	ldi	r18, 0xE1	; 225
    57ba:	3e e2       	ldi	r19, 0x2E	; 46
    57bc:	45 e6       	ldi	r20, 0x65	; 101
    57be:	52 e4       	ldi	r21, 0x42	; 66
    57c0:	60 91 19 05 	lds	r22, 0x0519	; 0x800519 <msg+0xc>
    57c4:	70 91 1a 05 	lds	r23, 0x051A	; 0x80051a <msg+0xd>
    57c8:	80 91 1b 05 	lds	r24, 0x051B	; 0x80051b <msg+0xe>
    57cc:	90 91 1c 05 	lds	r25, 0x051C	; 0x80051c <msg+0xf>
    57d0:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    57d4:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    57d8:	70 93 36 04 	sts	0x0436, r23	; 0x800436 <osd_att+0x3>
    57dc:	60 93 35 04 	sts	0x0435, r22	; 0x800435 <osd_att+0x2>
    57e0:	21 ee       	ldi	r18, 0xE1	; 225
    57e2:	3e e2       	ldi	r19, 0x2E	; 46
    57e4:	45 e6       	ldi	r20, 0x65	; 101
    57e6:	52 e4       	ldi	r21, 0x42	; 66
    57e8:	60 91 21 05 	lds	r22, 0x0521	; 0x800521 <msg+0x14>
    57ec:	70 91 22 05 	lds	r23, 0x0522	; 0x800522 <msg+0x15>
    57f0:	80 91 23 05 	lds	r24, 0x0523	; 0x800523 <msg+0x16>
    57f4:	90 91 24 05 	lds	r25, 0x0524	; 0x800524 <msg+0x17>
    57f8:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    57fc:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    5800:	70 93 38 04 	sts	0x0438, r23	; 0x800438 <osd_att+0x5>
    5804:	60 93 37 04 	sts	0x0437, r22	; 0x800437 <osd_att+0x4>
    5808:	e9 c3       	rjmp	.+2002   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    580a:	83 32       	cpi	r24, 0x23	; 35
    580c:	09 f4       	brne	.+2      	; 0x5810 <_Z16mavlink_one_bytec+0x30a>
    580e:	66 c2       	rjmp	.+1228   	; 0x5cdc <_Z16mavlink_one_bytec+0x7d6>
    5810:	84 32       	cpi	r24, 0x24	; 36
    5812:	09 f0       	breq	.+2      	; 0x5816 <_Z16mavlink_one_bytec+0x310>
    5814:	e3 c3       	rjmp	.+1990   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5816:	80 91 19 05 	lds	r24, 0x0519	; 0x800519 <msg+0xc>
    581a:	90 91 1a 05 	lds	r25, 0x051A	; 0x80051a <msg+0xd>
    581e:	90 93 6d 03 	sts	0x036D, r25	; 0x80036d <pwm_out+0x1>
    5822:	80 93 6c 03 	sts	0x036C, r24	; 0x80036c <pwm_out>
    5826:	80 91 1b 05 	lds	r24, 0x051B	; 0x80051b <msg+0xe>
    582a:	90 91 1c 05 	lds	r25, 0x051C	; 0x80051c <msg+0xf>
    582e:	90 93 6f 03 	sts	0x036F, r25	; 0x80036f <pwm_out+0x3>
    5832:	80 93 6e 03 	sts	0x036E, r24	; 0x80036e <pwm_out+0x2>
    5836:	80 91 1d 05 	lds	r24, 0x051D	; 0x80051d <msg+0x10>
    583a:	90 91 1e 05 	lds	r25, 0x051E	; 0x80051e <msg+0x11>
    583e:	90 93 71 03 	sts	0x0371, r25	; 0x800371 <pwm_out+0x5>
    5842:	80 93 70 03 	sts	0x0370, r24	; 0x800370 <pwm_out+0x4>
    5846:	80 91 1f 05 	lds	r24, 0x051F	; 0x80051f <msg+0x12>
    584a:	90 91 20 05 	lds	r25, 0x0520	; 0x800520 <msg+0x13>
    584e:	90 93 73 03 	sts	0x0373, r25	; 0x800373 <pwm_out+0x7>
    5852:	80 93 72 03 	sts	0x0372, r24	; 0x800372 <pwm_out+0x6>
    5856:	c2 c3       	rjmp	.+1924   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5858:	82 3a       	cpi	r24, 0xA2	; 162
    585a:	09 f4       	brne	.+2      	; 0x585e <_Z16mavlink_one_bytec+0x358>
    585c:	0e c3       	rjmp	.+1564   	; 0x5e7a <_Z16mavlink_one_bytec+0x974>
    585e:	08 f0       	brcs	.+2      	; 0x5862 <_Z16mavlink_one_bytec+0x35c>
    5860:	55 c0       	rjmp	.+170    	; 0x590c <_Z16mavlink_one_bytec+0x406>
    5862:	8a 34       	cpi	r24, 0x4A	; 74
    5864:	09 f4       	brne	.+2      	; 0x5868 <_Z16mavlink_one_bytec+0x362>
    5866:	71 c1       	rjmp	.+738    	; 0x5b4a <_Z16mavlink_one_bytec+0x644>
    5868:	08 f0       	brcs	.+2      	; 0x586c <_Z16mavlink_one_bytec+0x366>
    586a:	49 c0       	rjmp	.+146    	; 0x58fe <_Z16mavlink_one_bytec+0x3f8>
    586c:	8e 33       	cpi	r24, 0x3E	; 62
    586e:	09 f4       	brne	.+2      	; 0x5872 <_Z16mavlink_one_bytec+0x36c>
    5870:	c6 c1       	rjmp	.+908    	; 0x5bfe <_Z16mavlink_one_bytec+0x6f8>
    5872:	81 34       	cpi	r24, 0x41	; 65
    5874:	09 f0       	breq	.+2      	; 0x5878 <_Z16mavlink_one_bytec+0x372>
    5876:	b2 c3       	rjmp	.+1892   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5878:	80 91 19 05 	lds	r24, 0x0519	; 0x800519 <msg+0xc>
    587c:	90 91 1a 05 	lds	r25, 0x051A	; 0x80051a <msg+0xd>
    5880:	90 93 c0 06 	sts	0x06C0, r25	; 0x8006c0 <_ZL8chan_raw+0x1>
    5884:	80 93 bf 06 	sts	0x06BF, r24	; 0x8006bf <_ZL8chan_raw>
    5888:	80 91 1b 05 	lds	r24, 0x051B	; 0x80051b <msg+0xe>
    588c:	90 91 1c 05 	lds	r25, 0x051C	; 0x80051c <msg+0xf>
    5890:	90 93 c2 06 	sts	0x06C2, r25	; 0x8006c2 <_ZL8chan_raw+0x3>
    5894:	80 93 c1 06 	sts	0x06C1, r24	; 0x8006c1 <_ZL8chan_raw+0x2>
    5898:	80 91 1d 05 	lds	r24, 0x051D	; 0x80051d <msg+0x10>
    589c:	90 91 1e 05 	lds	r25, 0x051E	; 0x80051e <msg+0x11>
    58a0:	90 93 c4 06 	sts	0x06C4, r25	; 0x8006c4 <_ZL8chan_raw+0x5>
    58a4:	80 93 c3 06 	sts	0x06C3, r24	; 0x8006c3 <_ZL8chan_raw+0x4>
    58a8:	80 91 1f 05 	lds	r24, 0x051F	; 0x80051f <msg+0x12>
    58ac:	90 91 20 05 	lds	r25, 0x0520	; 0x800520 <msg+0x13>
    58b0:	90 93 c6 06 	sts	0x06C6, r25	; 0x8006c6 <_ZL8chan_raw+0x7>
    58b4:	80 93 c5 06 	sts	0x06C5, r24	; 0x8006c5 <_ZL8chan_raw+0x6>
    58b8:	80 91 21 05 	lds	r24, 0x0521	; 0x800521 <msg+0x14>
    58bc:	90 91 22 05 	lds	r25, 0x0522	; 0x800522 <msg+0x15>
    58c0:	90 93 c8 06 	sts	0x06C8, r25	; 0x8006c8 <_ZL8chan_raw+0x9>
    58c4:	80 93 c7 06 	sts	0x06C7, r24	; 0x8006c7 <_ZL8chan_raw+0x8>
    58c8:	80 91 23 05 	lds	r24, 0x0523	; 0x800523 <msg+0x16>
    58cc:	90 91 24 05 	lds	r25, 0x0524	; 0x800524 <msg+0x17>
    58d0:	90 93 ca 06 	sts	0x06CA, r25	; 0x8006ca <_ZL8chan_raw+0xb>
    58d4:	80 93 c9 06 	sts	0x06C9, r24	; 0x8006c9 <_ZL8chan_raw+0xa>
    58d8:	80 91 25 05 	lds	r24, 0x0525	; 0x800525 <msg+0x18>
    58dc:	90 91 26 05 	lds	r25, 0x0526	; 0x800526 <msg+0x19>
    58e0:	90 93 cc 06 	sts	0x06CC, r25	; 0x8006cc <_ZL8chan_raw+0xd>
    58e4:	80 93 cb 06 	sts	0x06CB, r24	; 0x8006cb <_ZL8chan_raw+0xc>
    58e8:	80 91 27 05 	lds	r24, 0x0527	; 0x800527 <msg+0x1a>
    58ec:	90 91 28 05 	lds	r25, 0x0528	; 0x800528 <msg+0x1b>
    58f0:	90 93 ce 06 	sts	0x06CE, r25	; 0x8006ce <_ZL8chan_raw+0xf>
    58f4:	80 93 cd 06 	sts	0x06CD, r24	; 0x8006cd <_ZL8chan_raw+0xe>
    58f8:	80 91 3e 05 	lds	r24, 0x053E	; 0x80053e <msg+0x31>
    58fc:	31 c2       	rjmp	.+1122   	; 0x5d60 <_Z16mavlink_one_bytec+0x85a>
    58fe:	8d 36       	cpi	r24, 0x6D	; 109
    5900:	09 f4       	brne	.+2      	; 0x5904 <_Z16mavlink_one_bytec+0x3fe>
    5902:	c0 c2       	rjmp	.+1408   	; 0x5e84 <_Z16mavlink_one_bytec+0x97e>
    5904:	89 38       	cpi	r24, 0x89	; 137
    5906:	09 f4       	brne	.+2      	; 0x590a <_Z16mavlink_one_bytec+0x404>
    5908:	2e c2       	rjmp	.+1116   	; 0x5d66 <_Z16mavlink_one_bytec+0x860>
    590a:	68 c3       	rjmp	.+1744   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    590c:	85 3b       	cpi	r24, 0xB5	; 181
    590e:	09 f4       	brne	.+2      	; 0x5912 <_Z16mavlink_one_bytec+0x40c>
    5910:	aa c0       	rjmp	.+340    	; 0x5a66 <_Z16mavlink_one_bytec+0x560>
    5912:	28 f5       	brcc	.+74     	; 0x595e <_Z16mavlink_one_bytec+0x458>
    5914:	86 3a       	cpi	r24, 0xA6	; 166
    5916:	09 f4       	brne	.+2      	; 0x591a <_Z16mavlink_one_bytec+0x414>
    5918:	b5 c2       	rjmp	.+1386   	; 0x5e84 <_Z16mavlink_one_bytec+0x97e>
    591a:	88 3a       	cpi	r24, 0xA8	; 168
    591c:	09 f0       	breq	.+2      	; 0x5920 <_Z16mavlink_one_bytec+0x41a>
    591e:	5e c3       	rjmp	.+1724   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5920:	60 91 15 05 	lds	r22, 0x0515	; 0x800515 <msg+0x8>
    5924:	70 91 16 05 	lds	r23, 0x0516	; 0x800516 <msg+0x9>
    5928:	80 91 17 05 	lds	r24, 0x0517	; 0x800517 <msg+0xa>
    592c:	90 91 18 05 	lds	r25, 0x0518	; 0x800518 <msg+0xb>
    5930:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    5934:	70 93 6f 06 	sts	0x066F, r23	; 0x80066f <_ZL17osd_winddirection+0x1>
    5938:	60 93 6e 06 	sts	0x066E, r22	; 0x80066e <_ZL17osd_winddirection>
    593c:	80 91 19 05 	lds	r24, 0x0519	; 0x800519 <msg+0xc>
    5940:	90 91 1a 05 	lds	r25, 0x051A	; 0x80051a <msg+0xd>
    5944:	a0 91 1b 05 	lds	r26, 0x051B	; 0x80051b <msg+0xe>
    5948:	b0 91 1c 05 	lds	r27, 0x051C	; 0x80051c <msg+0xf>
    594c:	80 93 70 06 	sts	0x0670, r24	; 0x800670 <_ZL13osd_windspeed>
    5950:	90 93 71 06 	sts	0x0671, r25	; 0x800671 <_ZL13osd_windspeed+0x1>
    5954:	a0 93 72 06 	sts	0x0672, r26	; 0x800672 <_ZL13osd_windspeed+0x2>
    5958:	b0 93 73 06 	sts	0x0673, r27	; 0x800673 <_ZL13osd_windspeed+0x3>
    595c:	3f c3       	rjmp	.+1662   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    595e:	81 3f       	cpi	r24, 0xF1	; 241
    5960:	09 f4       	brne	.+2      	; 0x5964 <_Z16mavlink_one_bytec+0x45e>
    5962:	f1 c2       	rjmp	.+1506   	; 0x5f46 <_Z16mavlink_one_bytec+0xa40>
    5964:	8d 3f       	cpi	r24, 0xFD	; 253
    5966:	09 f4       	brne	.+2      	; 0x596a <_Z16mavlink_one_bytec+0x464>
    5968:	5e c2       	rjmp	.+1212   	; 0x5e26 <_Z16mavlink_one_bytec+0x920>
    596a:	38 c3       	rjmp	.+1648   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    596c:	80 91 19 05 	lds	r24, 0x0519	; 0x800519 <msg+0xc>
    5970:	86 30       	cpi	r24, 0x06	; 6
    5972:	49 f4       	brne	.+18     	; 0x5986 <_Z16mavlink_one_bytec+0x480>
    5974:	80 91 12 05 	lds	r24, 0x0512	; 0x800512 <msg+0x5>
    5978:	80 93 59 06 	sts	0x0659, r24	; 0x800659 <_ZL10mav_gcs_id>
    597c:	10 92 58 06 	sts	0x0658, r1	; 0x800658 <_ZL10last_seq_n+0x1>
    5980:	10 92 57 06 	sts	0x0657, r1	; 0x800657 <_ZL10last_seq_n>
    5984:	04 c0       	rjmp	.+8      	; 0x598e <_Z16mavlink_one_bytec+0x488>
    5986:	85 30       	cpi	r24, 0x05	; 5
    5988:	11 f0       	breq	.+4      	; 0x598e <_Z16mavlink_one_bytec+0x488>
    598a:	8a 31       	cpi	r24, 0x1A	; 26
    598c:	51 f4       	brne	.+20     	; 0x59a2 <_Z16mavlink_one_bytec+0x49c>
    598e:	80 91 e7 03 	lds	r24, 0x03E7	; 0x8003e7 <packets_skip>
    5992:	90 91 e8 03 	lds	r25, 0x03E8	; 0x8003e8 <packets_skip+0x1>
    5996:	01 96       	adiw	r24, 0x01	; 1
    5998:	90 93 e8 03 	sts	0x03E8, r25	; 0x8003e8 <packets_skip+0x1>
    599c:	80 93 e7 03 	sts	0x03E7, r24	; 0x8003e7 <packets_skip>
    59a0:	1d c3       	rjmp	.+1594   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    59a2:	80 91 1a 05 	lds	r24, 0x051A	; 0x80051a <msg+0xd>
    59a6:	80 93 5b 06 	sts	0x065B, r24	; 0x80065b <_ZL13osd_autopilot>
    59aa:	80 91 1b 05 	lds	r24, 0x051B	; 0x80051b <msg+0xe>
    59ae:	87 fb       	bst	r24, 7
    59b0:	88 27       	eor	r24, r24
    59b2:	80 f9       	bld	r24, 0
    59b4:	80 93 bb 03 	sts	0x03BB, r24	; 0x8003bb <lflags+0x7>
    59b8:	80 91 15 05 	lds	r24, 0x0515	; 0x800515 <msg+0x8>
    59bc:	80 93 ae 06 	sts	0x06AE, r24	; 0x8006ae <_ZL8osd_mode>
    59c0:	80 91 12 05 	lds	r24, 0x0512	; 0x800512 <msg+0x5>
    59c4:	80 93 5c 06 	sts	0x065C, r24	; 0x80065c <_ZL14apm_mav_system>
    59c8:	80 91 f0 03 	lds	r24, 0x03F0	; 0x8003f0 <mav_data_count>
    59cc:	81 11       	cpse	r24, r1
    59ce:	21 c0       	rjmp	.+66     	; 0x5a12 <_Z16mavlink_one_bytec+0x50c>
    59d0:	80 91 fe 06 	lds	r24, 0x06FE	; 0x8006fe <_ZL17mav_raw_imu_count>
    59d4:	88 23       	and	r24, r24
    59d6:	91 f0       	breq	.+36     	; 0x59fc <_Z16mavlink_one_bytec+0x4f6>
    59d8:	80 91 cd 03 	lds	r24, 0x03CD	; 0x8003cd <lflags+0x19>
    59dc:	8a 30       	cpi	r24, 0x0A	; 10
    59de:	20 f4       	brcc	.+8      	; 0x59e8 <_Z16mavlink_one_bytec+0x4e2>
    59e0:	8f 5f       	subi	r24, 0xFF	; 255
    59e2:	80 93 cd 03 	sts	0x03CD, r24	; 0x8003cd <lflags+0x19>
    59e6:	19 c0       	rjmp	.+50     	; 0x5a1a <_Z16mavlink_one_bytec+0x514>
    59e8:	10 92 cb 03 	sts	0x03CB, r1	; 0x8003cb <lflags+0x17>
    59ec:	80 91 ff 06 	lds	r24, 0x06FF	; 0x8006ff <_ZL11stream_rate>
    59f0:	8f 37       	cpi	r24, 0x7F	; 127
    59f2:	98 f4       	brcc	.+38     	; 0x5a1a <_Z16mavlink_one_bytec+0x514>
    59f4:	88 0f       	add	r24, r24
    59f6:	80 93 ff 06 	sts	0x06FF, r24	; 0x8006ff <_ZL11stream_rate>
    59fa:	0f c0       	rjmp	.+30     	; 0x5a1a <_Z16mavlink_one_bytec+0x514>
    59fc:	80 91 cc 03 	lds	r24, 0x03CC	; 0x8003cc <lflags+0x18>
    5a00:	8a 30       	cpi	r24, 0x0A	; 10
    5a02:	20 f4       	brcc	.+8      	; 0x5a0c <_Z16mavlink_one_bytec+0x506>
    5a04:	8f 5f       	subi	r24, 0xFF	; 255
    5a06:	80 93 cc 03 	sts	0x03CC, r24	; 0x8003cc <lflags+0x18>
    5a0a:	07 c0       	rjmp	.+14     	; 0x5a1a <_Z16mavlink_one_bytec+0x514>
    5a0c:	10 92 cb 03 	sts	0x03CB, r1	; 0x8003cb <lflags+0x17>
    5a10:	04 c0       	rjmp	.+8      	; 0x5a1a <_Z16mavlink_one_bytec+0x514>
    5a12:	10 92 cd 03 	sts	0x03CD, r1	; 0x8003cd <lflags+0x19>
    5a16:	10 92 cc 03 	sts	0x03CC, r1	; 0x8003cc <lflags+0x18>
    5a1a:	10 92 f0 03 	sts	0x03F0, r1	; 0x8003f0 <mav_data_count>
    5a1e:	10 92 fe 06 	sts	0x06FE, r1	; 0x8006fe <_ZL17mav_raw_imu_count>
    5a22:	dc c2       	rjmp	.+1464   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5a24:	80 91 fe 06 	lds	r24, 0x06FE	; 0x8006fe <_ZL17mav_raw_imu_count>
    5a28:	8f 5f       	subi	r24, 0xFF	; 255
    5a2a:	80 93 fe 06 	sts	0x06FE, r24	; 0x8006fe <_ZL17mav_raw_imu_count>
    5a2e:	d6 c2       	rjmp	.+1452   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5a30:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
    5a34:	84 fd       	sbrc	r24, 4
    5a36:	0c c0       	rjmp	.+24     	; 0x5a50 <_Z16mavlink_one_bytec+0x54a>
    5a38:	20 91 23 05 	lds	r18, 0x0523	; 0x800523 <msg+0x16>
    5a3c:	30 91 24 05 	lds	r19, 0x0524	; 0x800524 <msg+0x17>
    5a40:	30 93 bc 06 	sts	0x06BC, r19	; 0x8006bc <_ZL10osd_vbat_A+0x1>
    5a44:	20 93 bb 06 	sts	0x06BB, r18	; 0x8006bb <_ZL10osd_vbat_A>
    5a48:	90 91 33 05 	lds	r25, 0x0533	; 0x800533 <msg+0x26>
    5a4c:	90 93 b6 06 	sts	0x06B6, r25	; 0x8006b6 <_ZL23osd_battery_remaining_A>
    5a50:	86 fd       	sbrc	r24, 6
    5a52:	c4 c2       	rjmp	.+1416   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5a54:	80 91 25 05 	lds	r24, 0x0525	; 0x800525 <msg+0x18>
    5a58:	90 91 26 05 	lds	r25, 0x0526	; 0x800526 <msg+0x19>
    5a5c:	90 93 b8 06 	sts	0x06B8, r25	; 0x8006b8 <_ZL10osd_curr_A+0x1>
    5a60:	80 93 b7 06 	sts	0x06B7, r24	; 0x8006b7 <_ZL10osd_curr_A>
    5a64:	bb c2       	rjmp	.+1398   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5a66:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
    5a6a:	85 fd       	sbrc	r24, 5
    5a6c:	b7 c2       	rjmp	.+1390   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5a6e:	80 91 15 05 	lds	r24, 0x0515	; 0x800515 <msg+0x8>
    5a72:	90 91 16 05 	lds	r25, 0x0516	; 0x800516 <msg+0x9>
    5a76:	90 93 ba 06 	sts	0x06BA, r25	; 0x8006ba <_ZL10osd_vbat_B+0x1>
    5a7a:	80 93 b9 06 	sts	0x06B9, r24	; 0x8006b9 <_ZL10osd_vbat_B>
    5a7e:	ae c2       	rjmp	.+1372   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5a80:	40 91 1d 05 	lds	r20, 0x051D	; 0x80051d <msg+0x10>
    5a84:	50 91 1e 05 	lds	r21, 0x051E	; 0x80051e <msg+0x11>
    5a88:	60 91 1f 05 	lds	r22, 0x051F	; 0x80051f <msg+0x12>
    5a8c:	70 91 20 05 	lds	r23, 0x0520	; 0x800520 <msg+0x13>
    5a90:	85 e4       	ldi	r24, 0x45	; 69
    5a92:	94 e0       	ldi	r25, 0x04	; 4
    5a94:	0e 94 c3 1d 	call	0x3b86	; 0x3b86 <_Z8gps_normRfl>
    5a98:	40 91 21 05 	lds	r20, 0x0521	; 0x800521 <msg+0x14>
    5a9c:	50 91 22 05 	lds	r21, 0x0522	; 0x800522 <msg+0x15>
    5aa0:	60 91 23 05 	lds	r22, 0x0523	; 0x800523 <msg+0x16>
    5aa4:	70 91 24 05 	lds	r23, 0x0524	; 0x800524 <msg+0x17>
    5aa8:	89 e4       	ldi	r24, 0x49	; 73
    5aaa:	94 e0       	ldi	r25, 0x04	; 4
    5aac:	0e 94 c3 1d 	call	0x3b86	; 0x3b86 <_Z8gps_normRfl>
    5ab0:	80 91 31 05 	lds	r24, 0x0531	; 0x800531 <msg+0x24>
    5ab4:	80 93 8f 06 	sts	0x068F, r24	; 0x80068f <_ZL12osd_fix_type>
    5ab8:	90 91 32 05 	lds	r25, 0x0532	; 0x800532 <msg+0x25>
    5abc:	90 93 90 06 	sts	0x0690, r25	; 0x800690 <_ZL22osd_satellites_visible>
    5ac0:	88 23       	and	r24, r24
    5ac2:	89 f0       	breq	.+34     	; 0x5ae6 <_Z16mavlink_one_bytec+0x5e0>
    5ac4:	80 91 25 05 	lds	r24, 0x0525	; 0x800525 <msg+0x18>
    5ac8:	90 91 26 05 	lds	r25, 0x0526	; 0x800526 <msg+0x19>
    5acc:	a0 91 27 05 	lds	r26, 0x0527	; 0x800527 <msg+0x1a>
    5ad0:	b0 91 28 05 	lds	r27, 0x0528	; 0x800528 <msg+0x1b>
    5ad4:	80 93 4d 04 	sts	0x044D, r24	; 0x80044d <osd_pos+0x8>
    5ad8:	90 93 4e 04 	sts	0x044E, r25	; 0x80044e <osd_pos+0x9>
    5adc:	a0 93 4f 04 	sts	0x044F, r26	; 0x80044f <osd_pos+0xa>
    5ae0:	b0 93 50 04 	sts	0x0450, r27	; 0x800450 <osd_pos+0xb>
    5ae4:	18 c0       	rjmp	.+48     	; 0x5b16 <_Z16mavlink_one_bytec+0x610>
    5ae6:	20 e0       	ldi	r18, 0x00	; 0
    5ae8:	30 e0       	ldi	r19, 0x00	; 0
    5aea:	4a e7       	ldi	r20, 0x7A	; 122
    5aec:	54 e4       	ldi	r21, 0x44	; 68
    5aee:	60 91 7c 06 	lds	r22, 0x067C	; 0x80067c <_ZL11osd_alt_mav>
    5af2:	70 91 7d 06 	lds	r23, 0x067D	; 0x80067d <_ZL11osd_alt_mav+0x1>
    5af6:	80 91 7e 06 	lds	r24, 0x067E	; 0x80067e <_ZL11osd_alt_mav+0x2>
    5afa:	90 91 7f 06 	lds	r25, 0x067F	; 0x80067f <_ZL11osd_alt_mav+0x3>
    5afe:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    5b02:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    5b06:	60 93 4d 04 	sts	0x044D, r22	; 0x80044d <osd_pos+0x8>
    5b0a:	70 93 4e 04 	sts	0x044E, r23	; 0x80044e <osd_pos+0x9>
    5b0e:	80 93 4f 04 	sts	0x044F, r24	; 0x80044f <osd_pos+0xa>
    5b12:	90 93 50 04 	sts	0x0450, r25	; 0x800450 <osd_pos+0xb>
    5b16:	80 91 2f 05 	lds	r24, 0x052F	; 0x80052f <msg+0x22>
    5b1a:	90 91 30 05 	lds	r25, 0x0530	; 0x800530 <msg+0x23>
    5b1e:	90 93 8e 06 	sts	0x068E, r25	; 0x80068e <_ZL7osd_cog+0x1>
    5b22:	80 93 8d 06 	sts	0x068D, r24	; 0x80068d <_ZL7osd_cog>
    5b26:	80 91 29 05 	lds	r24, 0x0529	; 0x800529 <msg+0x1c>
    5b2a:	90 91 2a 05 	lds	r25, 0x052A	; 0x80052a <msg+0x1d>
    5b2e:	90 93 d0 06 	sts	0x06D0, r25	; 0x8006d0 <_ZL3eph+0x1>
    5b32:	80 93 cf 06 	sts	0x06CF, r24	; 0x8006cf <_ZL3eph>
    5b36:	80 91 f0 03 	lds	r24, 0x03F0	; 0x8003f0 <mav_data_count>
    5b3a:	8f 5f       	subi	r24, 0xFF	; 255
    5b3c:	80 93 f0 03 	sts	0x03F0, r24	; 0x8003f0 <mav_data_count>
    5b40:	10 92 cc 03 	sts	0x03CC, r1	; 0x8003cc <lflags+0x18>
    5b44:	10 92 cd 03 	sts	0x03CD, r1	; 0x8003cd <lflags+0x19>
    5b48:	49 c2       	rjmp	.+1170   	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5b4a:	80 91 15 05 	lds	r24, 0x0515	; 0x800515 <msg+0x8>
    5b4e:	90 91 16 05 	lds	r25, 0x0516	; 0x800516 <msg+0x9>
    5b52:	a0 91 17 05 	lds	r26, 0x0517	; 0x800517 <msg+0xa>
    5b56:	b0 91 18 05 	lds	r27, 0x0518	; 0x800518 <msg+0xb>
    5b5a:	80 93 74 06 	sts	0x0674, r24	; 0x800674 <_ZL12osd_airspeed>
    5b5e:	90 93 75 06 	sts	0x0675, r25	; 0x800675 <_ZL12osd_airspeed+0x1>
    5b62:	a0 93 76 06 	sts	0x0676, r26	; 0x800676 <_ZL12osd_airspeed+0x2>
    5b66:	b0 93 77 06 	sts	0x0677, r27	; 0x800677 <_ZL12osd_airspeed+0x3>
    5b6a:	80 91 8f 06 	lds	r24, 0x068F	; 0x80068f <_ZL12osd_fix_type>
    5b6e:	88 23       	and	r24, r24
    5b70:	49 f0       	breq	.+18     	; 0x5b84 <_Z16mavlink_one_bytec+0x67e>
    5b72:	80 91 19 05 	lds	r24, 0x0519	; 0x800519 <msg+0xc>
    5b76:	90 91 1a 05 	lds	r25, 0x051A	; 0x80051a <msg+0xd>
    5b7a:	a0 91 1b 05 	lds	r26, 0x051B	; 0x80051b <msg+0xe>
    5b7e:	b0 91 1c 05 	lds	r27, 0x051C	; 0x80051c <msg+0xf>
    5b82:	08 c0       	rjmp	.+16     	; 0x5b94 <_Z16mavlink_one_bytec+0x68e>
    5b84:	80 91 66 06 	lds	r24, 0x0666	; 0x800666 <_ZL9loc_speed>
    5b88:	90 91 67 06 	lds	r25, 0x0667	; 0x800667 <_ZL9loc_speed+0x1>
    5b8c:	a0 91 68 06 	lds	r26, 0x0668	; 0x800668 <_ZL9loc_speed+0x2>
    5b90:	b0 91 69 06 	lds	r27, 0x0669	; 0x800669 <_ZL9loc_speed+0x3>
    5b94:	80 93 6a 06 	sts	0x066A, r24	; 0x80066a <_ZL15osd_groundspeed>
    5b98:	90 93 6b 06 	sts	0x066B, r25	; 0x80066b <_ZL15osd_groundspeed+0x1>
    5b9c:	a0 93 6c 06 	sts	0x066C, r26	; 0x80066c <_ZL15osd_groundspeed+0x2>
    5ba0:	b0 93 6d 06 	sts	0x066D, r27	; 0x80066d <_ZL15osd_groundspeed+0x3>
    5ba4:	80 91 25 05 	lds	r24, 0x0525	; 0x800525 <msg+0x18>
    5ba8:	90 91 26 05 	lds	r25, 0x0526	; 0x800526 <msg+0x19>
    5bac:	90 93 81 06 	sts	0x0681, r25	; 0x800681 <_ZL11osd_heading+0x1>
    5bb0:	80 93 80 06 	sts	0x0680, r24	; 0x800680 <_ZL11osd_heading>
    5bb4:	80 91 27 05 	lds	r24, 0x0527	; 0x800527 <msg+0x1a>
    5bb8:	80 93 65 06 	sts	0x0665, r24	; 0x800665 <_ZL12osd_throttle>
    5bbc:	80 91 1d 05 	lds	r24, 0x051D	; 0x80051d <msg+0x10>
    5bc0:	90 91 1e 05 	lds	r25, 0x051E	; 0x80051e <msg+0x11>
    5bc4:	a0 91 1f 05 	lds	r26, 0x051F	; 0x80051f <msg+0x12>
    5bc8:	b0 91 20 05 	lds	r27, 0x0520	; 0x800520 <msg+0x13>
    5bcc:	80 93 7c 06 	sts	0x067C, r24	; 0x80067c <_ZL11osd_alt_mav>
    5bd0:	90 93 7d 06 	sts	0x067D, r25	; 0x80067d <_ZL11osd_alt_mav+0x1>
    5bd4:	a0 93 7e 06 	sts	0x067E, r26	; 0x80067e <_ZL11osd_alt_mav+0x2>
    5bd8:	b0 93 7f 06 	sts	0x067F, r27	; 0x80067f <_ZL11osd_alt_mav+0x3>
    5bdc:	80 91 21 05 	lds	r24, 0x0521	; 0x800521 <msg+0x14>
    5be0:	90 91 22 05 	lds	r25, 0x0522	; 0x800522 <msg+0x15>
    5be4:	a0 91 23 05 	lds	r26, 0x0523	; 0x800523 <msg+0x16>
    5be8:	b0 91 24 05 	lds	r27, 0x0524	; 0x800524 <msg+0x17>
    5bec:	80 93 91 06 	sts	0x0691, r24	; 0x800691 <_ZL9osd_climb>
    5bf0:	90 93 92 06 	sts	0x0692, r25	; 0x800692 <_ZL9osd_climb+0x1>
    5bf4:	a0 93 93 06 	sts	0x0693, r26	; 0x800693 <_ZL9osd_climb+0x2>
    5bf8:	b0 93 94 06 	sts	0x0694, r27	; 0x800694 <_ZL9osd_climb+0x3>
    5bfc:	ef c1       	rjmp	.+990    	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5bfe:	60 91 15 05 	lds	r22, 0x0515	; 0x800515 <msg+0x8>
    5c02:	70 91 16 05 	lds	r23, 0x0516	; 0x800516 <msg+0x9>
    5c06:	80 91 17 05 	lds	r24, 0x0517	; 0x800517 <msg+0xa>
    5c0a:	90 91 18 05 	lds	r25, 0x0518	; 0x800518 <msg+0xb>
    5c0e:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    5c12:	70 93 ed 06 	sts	0x06ED, r23	; 0x8006ed <_ZL8nav_roll+0x1>
    5c16:	60 93 ec 06 	sts	0x06EC, r22	; 0x8006ec <_ZL8nav_roll>
    5c1a:	60 91 19 05 	lds	r22, 0x0519	; 0x800519 <msg+0xc>
    5c1e:	70 91 1a 05 	lds	r23, 0x051A	; 0x80051a <msg+0xd>
    5c22:	80 91 1b 05 	lds	r24, 0x051B	; 0x80051b <msg+0xe>
    5c26:	90 91 1c 05 	lds	r25, 0x051C	; 0x80051c <msg+0xf>
    5c2a:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    5c2e:	70 93 eb 06 	sts	0x06EB, r23	; 0x8006eb <_ZL9nav_pitch+0x1>
    5c32:	60 93 ea 06 	sts	0x06EA, r22	; 0x8006ea <_ZL9nav_pitch>
    5c36:	80 91 29 05 	lds	r24, 0x0529	; 0x800529 <msg+0x1c>
    5c3a:	90 91 2a 05 	lds	r25, 0x052A	; 0x80052a <msg+0x1d>
    5c3e:	90 93 e9 06 	sts	0x06E9, r25	; 0x8006e9 <_ZL11nav_bearing+0x1>
    5c42:	80 93 e8 06 	sts	0x06E8, r24	; 0x8006e8 <_ZL11nav_bearing>
    5c46:	80 91 1d 05 	lds	r24, 0x051D	; 0x80051d <msg+0x10>
    5c4a:	90 91 1e 05 	lds	r25, 0x051E	; 0x80051e <msg+0x11>
    5c4e:	a0 91 1f 05 	lds	r26, 0x051F	; 0x80051f <msg+0x12>
    5c52:	b0 91 20 05 	lds	r27, 0x0520	; 0x800520 <msg+0x13>
    5c56:	80 93 df 06 	sts	0x06DF, r24	; 0x8006df <_ZL9alt_error>
    5c5a:	90 93 e0 06 	sts	0x06E0, r25	; 0x8006e0 <_ZL9alt_error+0x1>
    5c5e:	a0 93 e1 06 	sts	0x06E1, r26	; 0x8006e1 <_ZL9alt_error+0x2>
    5c62:	b0 93 e2 06 	sts	0x06E2, r27	; 0x8006e2 <_ZL9alt_error+0x3>
    5c66:	80 91 21 05 	lds	r24, 0x0521	; 0x800521 <msg+0x14>
    5c6a:	90 91 22 05 	lds	r25, 0x0522	; 0x800522 <msg+0x15>
    5c6e:	a0 91 23 05 	lds	r26, 0x0523	; 0x800523 <msg+0x16>
    5c72:	b0 91 24 05 	lds	r27, 0x0524	; 0x800524 <msg+0x17>
    5c76:	80 93 db 06 	sts	0x06DB, r24	; 0x8006db <_ZL10aspd_error>
    5c7a:	90 93 dc 06 	sts	0x06DC, r25	; 0x8006dc <_ZL10aspd_error+0x1>
    5c7e:	a0 93 dd 06 	sts	0x06DD, r26	; 0x8006dd <_ZL10aspd_error+0x2>
    5c82:	b0 93 de 06 	sts	0x06DE, r27	; 0x8006de <_ZL10aspd_error+0x3>
    5c86:	80 91 2b 05 	lds	r24, 0x052B	; 0x80052b <msg+0x1e>
    5c8a:	90 91 2c 05 	lds	r25, 0x052C	; 0x80052c <msg+0x1f>
    5c8e:	90 93 e7 06 	sts	0x06E7, r25	; 0x8006e7 <_ZL17wp_target_bearing+0x1>
    5c92:	80 93 e6 06 	sts	0x06E6, r24	; 0x8006e6 <_ZL17wp_target_bearing>
    5c96:	80 91 2d 05 	lds	r24, 0x052D	; 0x80052d <msg+0x20>
    5c9a:	90 91 2e 05 	lds	r25, 0x052E	; 0x80052e <msg+0x21>
    5c9e:	90 93 e5 06 	sts	0x06E5, r25	; 0x8006e5 <_ZL7wp_dist+0x1>
    5ca2:	80 93 e4 06 	sts	0x06E4, r24	; 0x8006e4 <_ZL7wp_dist>
    5ca6:	60 91 25 05 	lds	r22, 0x0525	; 0x800525 <msg+0x18>
    5caa:	70 91 26 05 	lds	r23, 0x0526	; 0x800526 <msg+0x19>
    5cae:	80 91 27 05 	lds	r24, 0x0527	; 0x800527 <msg+0x1a>
    5cb2:	90 91 28 05 	lds	r25, 0x0528	; 0x800528 <msg+0x1b>
    5cb6:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    5cba:	70 93 d2 06 	sts	0x06D2, r23	; 0x8006d2 <_ZL12xtrack_error+0x1>
    5cbe:	60 93 d1 06 	sts	0x06D1, r22	; 0x8006d1 <_ZL12xtrack_error>
    5cc2:	80 91 f0 03 	lds	r24, 0x03F0	; 0x8003f0 <mav_data_count>
    5cc6:	8f 5f       	subi	r24, 0xFF	; 255
    5cc8:	80 93 f0 03 	sts	0x03F0, r24	; 0x8003f0 <mav_data_count>
    5ccc:	10 92 cc 03 	sts	0x03CC, r1	; 0x8003cc <lflags+0x18>
    5cd0:	85 c1       	rjmp	.+778    	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5cd2:	80 91 15 05 	lds	r24, 0x0515	; 0x800515 <msg+0x8>
    5cd6:	80 93 e3 06 	sts	0x06E3, r24	; 0x8006e3 <_ZL9wp_number>
    5cda:	80 c1       	rjmp	.+768    	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5cdc:	80 91 19 05 	lds	r24, 0x0519	; 0x800519 <msg+0xc>
    5ce0:	90 91 1a 05 	lds	r25, 0x051A	; 0x80051a <msg+0xd>
    5ce4:	90 93 c0 06 	sts	0x06C0, r25	; 0x8006c0 <_ZL8chan_raw+0x1>
    5ce8:	80 93 bf 06 	sts	0x06BF, r24	; 0x8006bf <_ZL8chan_raw>
    5cec:	80 91 1b 05 	lds	r24, 0x051B	; 0x80051b <msg+0xe>
    5cf0:	90 91 1c 05 	lds	r25, 0x051C	; 0x80051c <msg+0xf>
    5cf4:	90 93 c2 06 	sts	0x06C2, r25	; 0x8006c2 <_ZL8chan_raw+0x3>
    5cf8:	80 93 c1 06 	sts	0x06C1, r24	; 0x8006c1 <_ZL8chan_raw+0x2>
    5cfc:	80 91 1d 05 	lds	r24, 0x051D	; 0x80051d <msg+0x10>
    5d00:	90 91 1e 05 	lds	r25, 0x051E	; 0x80051e <msg+0x11>
    5d04:	90 93 c4 06 	sts	0x06C4, r25	; 0x8006c4 <_ZL8chan_raw+0x5>
    5d08:	80 93 c3 06 	sts	0x06C3, r24	; 0x8006c3 <_ZL8chan_raw+0x4>
    5d0c:	80 91 1f 05 	lds	r24, 0x051F	; 0x80051f <msg+0x12>
    5d10:	90 91 20 05 	lds	r25, 0x0520	; 0x800520 <msg+0x13>
    5d14:	90 93 c6 06 	sts	0x06C6, r25	; 0x8006c6 <_ZL8chan_raw+0x7>
    5d18:	80 93 c5 06 	sts	0x06C5, r24	; 0x8006c5 <_ZL8chan_raw+0x6>
    5d1c:	80 91 21 05 	lds	r24, 0x0521	; 0x800521 <msg+0x14>
    5d20:	90 91 22 05 	lds	r25, 0x0522	; 0x800522 <msg+0x15>
    5d24:	90 93 c8 06 	sts	0x06C8, r25	; 0x8006c8 <_ZL8chan_raw+0x9>
    5d28:	80 93 c7 06 	sts	0x06C7, r24	; 0x8006c7 <_ZL8chan_raw+0x8>
    5d2c:	80 91 23 05 	lds	r24, 0x0523	; 0x800523 <msg+0x16>
    5d30:	90 91 24 05 	lds	r25, 0x0524	; 0x800524 <msg+0x17>
    5d34:	90 93 ca 06 	sts	0x06CA, r25	; 0x8006ca <_ZL8chan_raw+0xb>
    5d38:	80 93 c9 06 	sts	0x06C9, r24	; 0x8006c9 <_ZL8chan_raw+0xa>
    5d3c:	80 91 25 05 	lds	r24, 0x0525	; 0x800525 <msg+0x18>
    5d40:	90 91 26 05 	lds	r25, 0x0526	; 0x800526 <msg+0x19>
    5d44:	90 93 cc 06 	sts	0x06CC, r25	; 0x8006cc <_ZL8chan_raw+0xd>
    5d48:	80 93 cb 06 	sts	0x06CB, r24	; 0x8006cb <_ZL8chan_raw+0xc>
    5d4c:	80 91 27 05 	lds	r24, 0x0527	; 0x800527 <msg+0x1a>
    5d50:	90 91 28 05 	lds	r25, 0x0528	; 0x800528 <msg+0x1b>
    5d54:	90 93 ce 06 	sts	0x06CE, r25	; 0x8006ce <_ZL8chan_raw+0xf>
    5d58:	80 93 cd 06 	sts	0x06CD, r24	; 0x8006cd <_ZL8chan_raw+0xe>
    5d5c:	80 91 2a 05 	lds	r24, 0x052A	; 0x80052a <msg+0x1d>
    5d60:	80 93 30 04 	sts	0x0430, r24	; 0x800430 <osd_rssi>
    5d64:	3b c1       	rjmp	.+630    	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5d66:	80 91 21 05 	lds	r24, 0x0521	; 0x800521 <msg+0x14>
    5d6a:	90 91 22 05 	lds	r25, 0x0522	; 0x800522 <msg+0x15>
    5d6e:	90 93 b2 06 	sts	0x06B2, r25	; 0x8006b2 <_ZL11temperature+0x1>
    5d72:	80 93 b1 06 	sts	0x06B1, r24	; 0x8006b1 <_ZL11temperature>
    5d76:	32 c1       	rjmp	.+612    	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5d78:	60 91 25 05 	lds	r22, 0x0525	; 0x800525 <msg+0x18>
    5d7c:	70 91 26 05 	lds	r23, 0x0526	; 0x800526 <msg+0x19>
    5d80:	80 91 27 05 	lds	r24, 0x0527	; 0x800527 <msg+0x1a>
    5d84:	90 91 28 05 	lds	r25, 0x0528	; 0x800528 <msg+0x1b>
    5d88:	28 ee       	ldi	r18, 0xE8	; 232
    5d8a:	33 e0       	ldi	r19, 0x03	; 3
    5d8c:	40 e0       	ldi	r20, 0x00	; 0
    5d8e:	50 e0       	ldi	r21, 0x00	; 0
    5d90:	0e 94 d6 43 	call	0x87ac	; 0x87ac <__divmodsi4>
    5d94:	ca 01       	movw	r24, r20
    5d96:	b9 01       	movw	r22, r18
    5d98:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    5d9c:	60 93 d7 06 	sts	0x06D7, r22	; 0x8006d7 <_ZL15osd_alt_to_home>
    5da0:	70 93 d8 06 	sts	0x06D8, r23	; 0x8006d8 <_ZL15osd_alt_to_home+0x1>
    5da4:	80 93 d9 06 	sts	0x06D9, r24	; 0x8006d9 <_ZL15osd_alt_to_home+0x2>
    5da8:	90 93 da 06 	sts	0x06DA, r25	; 0x8006da <_ZL15osd_alt_to_home+0x3>
    5dac:	60 91 2b 05 	lds	r22, 0x052B	; 0x80052b <msg+0x1e>
    5db0:	70 91 2c 05 	lds	r23, 0x052C	; 0x80052c <msg+0x1f>
    5db4:	07 2e       	mov	r0, r23
    5db6:	00 0c       	add	r0, r0
    5db8:	88 0b       	sbc	r24, r24
    5dba:	99 0b       	sbc	r25, r25
    5dbc:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    5dc0:	4b 01       	movw	r8, r22
    5dc2:	5c 01       	movw	r10, r24
    5dc4:	80 91 29 05 	lds	r24, 0x0529	; 0x800529 <msg+0x1c>
    5dc8:	90 91 2a 05 	lds	r25, 0x052A	; 0x80052a <msg+0x1d>
    5dcc:	bc 01       	movw	r22, r24
    5dce:	99 0f       	add	r25, r25
    5dd0:	88 0b       	sbc	r24, r24
    5dd2:	99 0b       	sbc	r25, r25
    5dd4:	0e 94 4a 41 	call	0x8294	; 0x8294 <__floatsisf>
    5dd8:	6b 01       	movw	r12, r22
    5dda:	7c 01       	movw	r14, r24
    5ddc:	a5 01       	movw	r20, r10
    5dde:	94 01       	movw	r18, r8
    5de0:	c5 01       	movw	r24, r10
    5de2:	b4 01       	movw	r22, r8
    5de4:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    5de8:	4b 01       	movw	r8, r22
    5dea:	5c 01       	movw	r10, r24
    5dec:	a7 01       	movw	r20, r14
    5dee:	96 01       	movw	r18, r12
    5df0:	c7 01       	movw	r24, r14
    5df2:	b6 01       	movw	r22, r12
    5df4:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    5df8:	9b 01       	movw	r18, r22
    5dfa:	ac 01       	movw	r20, r24
    5dfc:	c5 01       	movw	r24, r10
    5dfe:	b4 01       	movw	r22, r8
    5e00:	0e 94 b8 3f 	call	0x7f70	; 0x7f70 <__addsf3>
    5e04:	0e 94 e0 42 	call	0x85c0	; 0x85c0 <sqrt>
    5e08:	2a e0       	ldi	r18, 0x0A	; 10
    5e0a:	37 ed       	ldi	r19, 0xD7	; 215
    5e0c:	43 e2       	ldi	r20, 0x23	; 35
    5e0e:	5c e3       	ldi	r21, 0x3C	; 60
    5e10:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    5e14:	60 93 66 06 	sts	0x0666, r22	; 0x800666 <_ZL9loc_speed>
    5e18:	70 93 67 06 	sts	0x0667, r23	; 0x800667 <_ZL9loc_speed+0x1>
    5e1c:	80 93 68 06 	sts	0x0668, r24	; 0x800668 <_ZL9loc_speed+0x2>
    5e20:	90 93 69 06 	sts	0x0669, r25	; 0x800669 <_ZL9loc_speed+0x3>
    5e24:	db c0       	rjmp	.+438    	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5e26:	80 91 15 05 	lds	r24, 0x0515	; 0x800515 <msg+0x8>
    5e2a:	80 93 f2 03 	sts	0x03F2, r24	; 0x8003f2 <mav_msg_severity>
    5e2e:	87 30       	cpi	r24, 0x07	; 7
    5e30:	08 f0       	brcs	.+2      	; 0x5e34 <_Z16mavlink_one_bytec+0x92e>
    5e32:	d4 c0       	rjmp	.+424    	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5e34:	82 e3       	ldi	r24, 0x32	; 50
    5e36:	e6 e1       	ldi	r30, 0x16	; 22
    5e38:	f5 e0       	ldi	r31, 0x05	; 5
    5e3a:	a6 ef       	ldi	r26, 0xF6	; 246
    5e3c:	b3 e0       	ldi	r27, 0x03	; 3
    5e3e:	01 90       	ld	r0, Z+
    5e40:	0d 92       	st	X+, r0
    5e42:	8a 95       	dec	r24
    5e44:	e1 f7       	brne	.-8      	; 0x5e3e <_Z16mavlink_one_bytec+0x938>
    5e46:	10 92 28 04 	sts	0x0428, r1	; 0x800428 <mav_message+0x32>
    5e4a:	e8 e2       	ldi	r30, 0x28	; 40
    5e4c:	f4 e0       	ldi	r31, 0x04	; 4
    5e4e:	22 e3       	ldi	r18, 0x32	; 50
    5e50:	2e 1b       	sub	r18, r30
    5e52:	c2 2f       	mov	r28, r18
    5e54:	ce 0f       	add	r28, r30
    5e56:	92 91       	ld	r25, -Z
    5e58:	9f 7d       	andi	r25, 0xDF	; 223
    5e5a:	d9 f3       	breq	.-10     	; 0x5e52 <_Z16mavlink_one_bytec+0x94c>
    5e5c:	11 82       	std	Z+1, r1	; 0x01
    5e5e:	86 e2       	ldi	r24, 0x26	; 38
    5e60:	0e 94 92 14 	call	0x2924	; 0x2924 <_Z9readPanelh>
    5e64:	0e 94 a3 13 	call	0x2746	; 0x2746 <_Z11get_alt_num5Point>
    5e68:	e8 2f       	mov	r30, r24
    5e6a:	f0 e0       	ldi	r31, 0x00	; 0
    5e6c:	eb 59       	subi	r30, 0x9B	; 155
    5e6e:	fa 4f       	sbci	r31, 0xFA	; 250
    5e70:	64 91       	lpm	r22, Z
    5e72:	8c 2f       	mov	r24, r28
    5e74:	0e 94 23 18 	call	0x3046	; 0x3046 <_Z17mav_message_starthh>
    5e78:	b1 c0       	rjmp	.+354    	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5e7a:	80 91 1c 05 	lds	r24, 0x051C	; 0x80051c <msg+0xf>
    5e7e:	80 93 5a 06 	sts	0x065A, r24	; 0x80065a <_ZL16mav_fence_status>
    5e82:	ac c0       	rjmp	.+344    	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5e84:	90 91 19 05 	lds	r25, 0x0519	; 0x800519 <msg+0xc>
    5e88:	80 91 1a 05 	lds	r24, 0x051A	; 0x80051a <msg+0xd>
    5e8c:	98 17       	cp	r25, r24
    5e8e:	08 f4       	brcc	.+2      	; 0x5e92 <_Z16mavlink_one_bytec+0x98c>
    5e90:	89 2f       	mov	r24, r25
    5e92:	80 93 2f 04 	sts	0x042F, r24	; 0x80042f <telem_rssi>
    5e96:	a2 c0       	rjmp	.+324    	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5e98:	80 91 64 04 	lds	r24, 0x0464	; 0x800464 <sets+0xb>
    5e9c:	08 2e       	mov	r0, r24
    5e9e:	00 0c       	add	r0, r0
    5ea0:	99 0b       	sbc	r25, r25
    5ea2:	44 97       	sbiw	r24, 0x14	; 20
    5ea4:	20 e1       	ldi	r18, 0x10	; 16
    5ea6:	3e e0       	ldi	r19, 0x0E	; 14
    5ea8:	82 9f       	mul	r24, r18
    5eaa:	20 01       	movw	r4, r0
    5eac:	83 9f       	mul	r24, r19
    5eae:	50 0c       	add	r5, r0
    5eb0:	92 9f       	mul	r25, r18
    5eb2:	50 0c       	add	r5, r0
    5eb4:	11 24       	eor	r1, r1
    5eb6:	05 2c       	mov	r0, r5
    5eb8:	00 0c       	add	r0, r0
    5eba:	66 08       	sbc	r6, r6
    5ebc:	77 08       	sbc	r7, r7
    5ebe:	20 91 15 05 	lds	r18, 0x0515	; 0x800515 <msg+0x8>
    5ec2:	30 91 16 05 	lds	r19, 0x0516	; 0x800516 <msg+0x9>
    5ec6:	40 91 17 05 	lds	r20, 0x0517	; 0x800517 <msg+0xa>
    5eca:	50 91 18 05 	lds	r21, 0x0518	; 0x800518 <msg+0xb>
    5ece:	60 91 19 05 	lds	r22, 0x0519	; 0x800519 <msg+0xc>
    5ed2:	70 91 1a 05 	lds	r23, 0x051A	; 0x80051a <msg+0xd>
    5ed6:	80 e4       	ldi	r24, 0x40	; 64
    5ed8:	a8 2e       	mov	r10, r24
    5eda:	92 e4       	ldi	r25, 0x42	; 66
    5edc:	b9 2e       	mov	r11, r25
    5ede:	ef e0       	ldi	r30, 0x0F	; 15
    5ee0:	ce 2e       	mov	r12, r30
    5ee2:	d1 2c       	mov	r13, r1
    5ee4:	e1 2c       	mov	r14, r1
    5ee6:	f1 2c       	mov	r15, r1
    5ee8:	00 e0       	ldi	r16, 0x00	; 0
    5eea:	10 e0       	ldi	r17, 0x00	; 0
    5eec:	80 91 1b 05 	lds	r24, 0x051B	; 0x80051b <msg+0xe>
    5ef0:	90 91 1c 05 	lds	r25, 0x051C	; 0x80051c <msg+0xf>
    5ef4:	0e 94 0c 44 	call	0x8818	; 0x8818 <__udivdi3>
    5ef8:	49 01       	movw	r8, r18
    5efa:	5a 01       	movw	r10, r20
    5efc:	c3 01       	movw	r24, r6
    5efe:	b2 01       	movw	r22, r4
    5f00:	68 0d       	add	r22, r8
    5f02:	79 1d       	adc	r23, r9
    5f04:	8a 1d       	adc	r24, r10
    5f06:	9b 1d       	adc	r25, r11
    5f08:	20 e8       	ldi	r18, 0x80	; 128
    5f0a:	31 e5       	ldi	r19, 0x51	; 81
    5f0c:	41 e0       	ldi	r20, 0x01	; 1
    5f0e:	50 e0       	ldi	r21, 0x00	; 0
    5f10:	0e 94 b4 43 	call	0x8768	; 0x8768 <__udivmodsi4>
    5f14:	20 93 8a 03 	sts	0x038A, r18	; 0x80038a <sys_days>
    5f18:	30 93 8b 03 	sts	0x038B, r19	; 0x80038b <sys_days+0x1>
    5f1c:	40 93 8c 03 	sts	0x038C, r20	; 0x80038c <sys_days+0x2>
    5f20:	50 93 8d 03 	sts	0x038D, r21	; 0x80038d <sys_days+0x3>
    5f24:	60 93 86 03 	sts	0x0386, r22	; 0x800386 <day_seconds>
    5f28:	70 93 87 03 	sts	0x0387, r23	; 0x800387 <day_seconds+0x1>
    5f2c:	80 93 88 03 	sts	0x0388, r24	; 0x800388 <day_seconds+0x2>
    5f30:	90 93 89 03 	sts	0x0389, r25	; 0x800389 <day_seconds+0x3>
    5f34:	81 e0       	ldi	r24, 0x01	; 1
    5f36:	23 2b       	or	r18, r19
    5f38:	24 2b       	or	r18, r20
    5f3a:	25 2b       	or	r18, r21
    5f3c:	09 f4       	brne	.+2      	; 0x5f40 <_Z16mavlink_one_bytec+0xa3a>
    5f3e:	80 e0       	ldi	r24, 0x00	; 0
    5f40:	80 93 cf 03 	sts	0x03CF, r24	; 0x8003cf <lflags+0x1b>
    5f44:	4b c0       	rjmp	.+150    	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5f46:	80 91 1d 05 	lds	r24, 0x051D	; 0x80051d <msg+0x10>
    5f4a:	90 91 1e 05 	lds	r25, 0x051E	; 0x80051e <msg+0x11>
    5f4e:	a0 91 1f 05 	lds	r26, 0x051F	; 0x80051f <msg+0x12>
    5f52:	b0 91 20 05 	lds	r27, 0x0520	; 0x800520 <msg+0x13>
    5f56:	80 93 7a 03 	sts	0x037A, r24	; 0x80037a <vibration>
    5f5a:	90 93 7b 03 	sts	0x037B, r25	; 0x80037b <vibration+0x1>
    5f5e:	a0 93 7c 03 	sts	0x037C, r26	; 0x80037c <vibration+0x2>
    5f62:	b0 93 7d 03 	sts	0x037D, r27	; 0x80037d <vibration+0x3>
    5f66:	80 91 21 05 	lds	r24, 0x0521	; 0x800521 <msg+0x14>
    5f6a:	90 91 22 05 	lds	r25, 0x0522	; 0x800522 <msg+0x15>
    5f6e:	a0 91 23 05 	lds	r26, 0x0523	; 0x800523 <msg+0x16>
    5f72:	b0 91 24 05 	lds	r27, 0x0524	; 0x800524 <msg+0x17>
    5f76:	80 93 7e 03 	sts	0x037E, r24	; 0x80037e <vibration+0x4>
    5f7a:	90 93 7f 03 	sts	0x037F, r25	; 0x80037f <vibration+0x5>
    5f7e:	a0 93 80 03 	sts	0x0380, r26	; 0x800380 <vibration+0x6>
    5f82:	b0 93 81 03 	sts	0x0381, r27	; 0x800381 <vibration+0x7>
    5f86:	80 91 25 05 	lds	r24, 0x0525	; 0x800525 <msg+0x18>
    5f8a:	90 91 26 05 	lds	r25, 0x0526	; 0x800526 <msg+0x19>
    5f8e:	a0 91 27 05 	lds	r26, 0x0527	; 0x800527 <msg+0x1a>
    5f92:	b0 91 28 05 	lds	r27, 0x0528	; 0x800528 <msg+0x1b>
    5f96:	80 93 82 03 	sts	0x0382, r24	; 0x800382 <vibration+0x8>
    5f9a:	90 93 83 03 	sts	0x0383, r25	; 0x800383 <vibration+0x9>
    5f9e:	a0 93 84 03 	sts	0x0384, r26	; 0x800384 <vibration+0xa>
    5fa2:	b0 93 85 03 	sts	0x0385, r27	; 0x800385 <vibration+0xb>
    5fa6:	80 91 29 05 	lds	r24, 0x0529	; 0x800529 <msg+0x1c>
    5faa:	90 91 2a 05 	lds	r25, 0x052A	; 0x80052a <msg+0x1d>
    5fae:	90 93 75 03 	sts	0x0375, r25	; 0x800375 <clipping+0x1>
    5fb2:	80 93 74 03 	sts	0x0374, r24	; 0x800374 <clipping>
    5fb6:	80 91 2d 05 	lds	r24, 0x052D	; 0x80052d <msg+0x20>
    5fba:	90 91 2e 05 	lds	r25, 0x052E	; 0x80052e <msg+0x21>
    5fbe:	90 93 77 03 	sts	0x0377, r25	; 0x800377 <clipping+0x3>
    5fc2:	80 93 76 03 	sts	0x0376, r24	; 0x800376 <clipping+0x2>
    5fc6:	80 91 31 05 	lds	r24, 0x0531	; 0x800531 <msg+0x24>
    5fca:	90 91 32 05 	lds	r25, 0x0532	; 0x800532 <msg+0x25>
    5fce:	90 93 79 03 	sts	0x0379, r25	; 0x800379 <clipping+0x5>
    5fd2:	80 93 78 03 	sts	0x0378, r24	; 0x800378 <clipping+0x4>
    5fd6:	02 c0       	rjmp	.+4      	; 0x5fdc <_Z16mavlink_one_bytec+0xad6>
    5fd8:	80 e0       	ldi	r24, 0x00	; 0
    5fda:	01 c0       	rjmp	.+2      	; 0x5fde <_Z16mavlink_one_bytec+0xad8>
    5fdc:	81 e0       	ldi	r24, 0x01	; 1
    5fde:	cf 91       	pop	r28
    5fe0:	1f 91       	pop	r17
    5fe2:	0f 91       	pop	r16
    5fe4:	ff 90       	pop	r15
    5fe6:	ef 90       	pop	r14
    5fe8:	df 90       	pop	r13
    5fea:	cf 90       	pop	r12
    5fec:	bf 90       	pop	r11
    5fee:	af 90       	pop	r10
    5ff0:	9f 90       	pop	r9
    5ff2:	8f 90       	pop	r8
    5ff4:	7f 90       	pop	r7
    5ff6:	6f 90       	pop	r6
    5ff8:	5f 90       	pop	r5
    5ffa:	4f 90       	pop	r4
    5ffc:	08 95       	ret

00005ffe <_Z12read_mavlinkv>:
    5ffe:	cf 92       	push	r12
    6000:	df 92       	push	r13
    6002:	ef 92       	push	r14
    6004:	ff 92       	push	r15
    6006:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    600a:	6b 01       	movw	r12, r22
    600c:	7c 01       	movw	r14, r24
    600e:	83 e5       	ldi	r24, 0x53	; 83
    6010:	93 e0       	ldi	r25, 0x03	; 3
    6012:	0e 94 85 38 	call	0x710a	; 0x710a <_ZN10FastSerial9availableEv>
    6016:	88 23       	and	r24, r24
    6018:	f9 f0       	breq	.+62     	; 0x6058 <_Z12read_mavlinkv+0x5a>
    601a:	83 e5       	ldi	r24, 0x53	; 83
    601c:	93 e0       	ldi	r25, 0x03	; 3
    601e:	0e 94 af 38 	call	0x715e	; 0x715e <_ZN10FastSerial4readEv>
    6022:	40 91 e1 03 	lds	r20, 0x03E1	; 0x8003e1 <bytes_comes>
    6026:	50 91 e2 03 	lds	r21, 0x03E2	; 0x8003e2 <bytes_comes+0x1>
    602a:	60 91 e3 03 	lds	r22, 0x03E3	; 0x8003e3 <bytes_comes+0x2>
    602e:	70 91 e4 03 	lds	r23, 0x03E4	; 0x8003e4 <bytes_comes+0x3>
    6032:	4f 5f       	subi	r20, 0xFF	; 255
    6034:	5f 4f       	sbci	r21, 0xFF	; 255
    6036:	6f 4f       	sbci	r22, 0xFF	; 255
    6038:	7f 4f       	sbci	r23, 0xFF	; 255
    603a:	40 93 e1 03 	sts	0x03E1, r20	; 0x8003e1 <bytes_comes>
    603e:	50 93 e2 03 	sts	0x03E2, r21	; 0x8003e2 <bytes_comes+0x1>
    6042:	60 93 e3 03 	sts	0x03E3, r22	; 0x8003e3 <bytes_comes+0x2>
    6046:	70 93 e4 03 	sts	0x03E4, r23	; 0x8003e4 <bytes_comes+0x3>
    604a:	0e 94 83 2a 	call	0x5506	; 0x5506 <_Z16mavlink_one_bytec>
    604e:	81 11       	cpse	r24, r1
    6050:	41 c0       	rjmp	.+130    	; 0x60d4 <_Z12read_mavlinkv+0xd6>
    6052:	0e 94 13 29 	call	0x5226	; 0x5226 <_Z10delay_bytev>
    6056:	db cf       	rjmp	.-74     	; 0x600e <_Z12read_mavlinkv+0x10>
    6058:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    605c:	dc 01       	movw	r26, r24
    605e:	cb 01       	movw	r24, r22
    6060:	8c 19       	sub	r24, r12
    6062:	9d 09       	sbc	r25, r13
    6064:	ae 09       	sbc	r26, r14
    6066:	bf 09       	sbc	r27, r15
    6068:	02 97       	sbiw	r24, 0x02	; 2
    606a:	a1 09       	sbc	r26, r1
    606c:	b1 09       	sbc	r27, r1
    606e:	18 16       	cp	r1, r24
    6070:	19 06       	cpc	r1, r25
    6072:	1a 06       	cpc	r1, r26
    6074:	1b 06       	cpc	r1, r27
    6076:	6c f5       	brge	.+90     	; 0x60d2 <_Z12read_mavlinkv+0xd4>
    6078:	40 91 d9 03 	lds	r20, 0x03D9	; 0x8003d9 <mavlink_time>
    607c:	50 91 da 03 	lds	r21, 0x03DA	; 0x8003da <mavlink_time+0x1>
    6080:	60 91 db 03 	lds	r22, 0x03DB	; 0x8003db <mavlink_time+0x2>
    6084:	70 91 dc 03 	lds	r23, 0x03DC	; 0x8003dc <mavlink_time+0x3>
    6088:	42 50       	subi	r20, 0x02	; 2
    608a:	51 09       	sbc	r21, r1
    608c:	61 09       	sbc	r22, r1
    608e:	71 09       	sbc	r23, r1
    6090:	48 0f       	add	r20, r24
    6092:	59 1f       	adc	r21, r25
    6094:	6a 1f       	adc	r22, r26
    6096:	7b 1f       	adc	r23, r27
    6098:	40 93 d9 03 	sts	0x03D9, r20	; 0x8003d9 <mavlink_time>
    609c:	50 93 da 03 	sts	0x03DA, r21	; 0x8003da <mavlink_time+0x1>
    60a0:	60 93 db 03 	sts	0x03DB, r22	; 0x8003db <mavlink_time+0x2>
    60a4:	70 93 dc 03 	sts	0x03DC, r23	; 0x8003dc <mavlink_time+0x3>
    60a8:	40 91 d5 03 	lds	r20, 0x03D5	; 0x8003d5 <mavlink_dt>
    60ac:	50 91 d6 03 	lds	r21, 0x03D6	; 0x8003d6 <mavlink_dt+0x1>
    60b0:	60 91 d7 03 	lds	r22, 0x03D7	; 0x8003d7 <mavlink_dt+0x2>
    60b4:	70 91 d8 03 	lds	r23, 0x03D8	; 0x8003d8 <mavlink_dt+0x3>
    60b8:	48 17       	cp	r20, r24
    60ba:	59 07       	cpc	r21, r25
    60bc:	6a 07       	cpc	r22, r26
    60be:	7b 07       	cpc	r23, r27
    60c0:	44 f4       	brge	.+16     	; 0x60d2 <_Z12read_mavlinkv+0xd4>
    60c2:	80 93 d5 03 	sts	0x03D5, r24	; 0x8003d5 <mavlink_dt>
    60c6:	90 93 d6 03 	sts	0x03D6, r25	; 0x8003d6 <mavlink_dt+0x1>
    60ca:	a0 93 d7 03 	sts	0x03D7, r26	; 0x8003d7 <mavlink_dt+0x2>
    60ce:	b0 93 d8 03 	sts	0x03D8, r27	; 0x8003d8 <mavlink_dt+0x3>
    60d2:	80 e0       	ldi	r24, 0x00	; 0
    60d4:	ff 90       	pop	r15
    60d6:	ef 90       	pop	r14
    60d8:	df 90       	pop	r13
    60da:	cf 90       	pop	r12
    60dc:	08 95       	ret

000060de <loop>:
    60de:	a4 e0       	ldi	r26, 0x04	; 4
    60e0:	b0 e0       	ldi	r27, 0x00	; 0
    60e2:	e5 e7       	ldi	r30, 0x75	; 117
    60e4:	f0 e3       	ldi	r31, 0x30	; 48
    60e6:	0c 94 69 44 	jmp	0x88d2	; 0x88d2 <__prologue_saves__>
    60ea:	a8 95       	wdr
    60ec:	78 94       	sei
    60ee:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    60f2:	6b 01       	movw	r12, r22
    60f4:	7c 01       	movw	r14, r24
    60f6:	28 ee       	ldi	r18, 0xE8	; 232
    60f8:	33 e0       	ldi	r19, 0x03	; 3
    60fa:	40 e0       	ldi	r20, 0x00	; 0
    60fc:	50 e0       	ldi	r21, 0x00	; 0
    60fe:	0e 94 b4 43 	call	0x8768	; 0x8768 <__udivmodsi4>
    6102:	30 93 64 06 	sts	0x0664, r19	; 0x800664 <_ZL7seconds+0x1>
    6106:	20 93 63 06 	sts	0x0663, r18	; 0x800663 <_ZL7seconds>
    610a:	2c ed       	ldi	r18, 0xDC	; 220
    610c:	c2 16       	cp	r12, r18
    610e:	25 e0       	ldi	r18, 0x05	; 5
    6110:	d2 06       	cpc	r13, r18
    6112:	e1 04       	cpc	r14, r1
    6114:	f1 04       	cpc	r15, r1
    6116:	28 f0       	brcs	.+10     	; 0x6122 <loop+0x44>
    6118:	80 91 ce 03 	lds	r24, 0x03CE	; 0x8003ce <lflags+0x1a>
    611c:	88 23       	and	r24, r24
    611e:	09 f4       	brne	.+2      	; 0x6122 <loop+0x44>
    6120:	91 c0       	rjmp	.+290    	; 0x6244 <loop+0x166>
    6122:	83 e5       	ldi	r24, 0x53	; 83
    6124:	93 e0       	ldi	r25, 0x03	; 3
    6126:	0e 94 85 38 	call	0x710a	; 0x710a <_ZN10FastSerial9availableEv>
    612a:	88 23       	and	r24, r24
    612c:	09 f4       	brne	.+2      	; 0x6130 <loop+0x52>
    612e:	7e c0       	rjmp	.+252    	; 0x622c <loop+0x14e>
    6130:	83 e5       	ldi	r24, 0x53	; 83
    6132:	93 e0       	ldi	r25, 0x03	; 3
    6134:	0e 94 af 38 	call	0x715e	; 0x715e <_ZN10FastSerial4readEv>
    6138:	8a 30       	cpi	r24, 0x0A	; 10
    613a:	31 f4       	brne	.+12     	; 0x6148 <loop+0x6a>
    613c:	80 91 2a 04 	lds	r24, 0x042A	; 0x80042a <crlf_count>
    6140:	8f 5f       	subi	r24, 0xFF	; 255
    6142:	80 93 2a 04 	sts	0x042A, r24	; 0x80042a <crlf_count>
    6146:	02 c0       	rjmp	.+4      	; 0x614c <loop+0x6e>
    6148:	10 92 2a 04 	sts	0x042A, r1	; 0x80042a <crlf_count>
    614c:	80 91 2a 04 	lds	r24, 0x042A	; 0x80042a <crlf_count>
    6150:	84 30       	cpi	r24, 0x04	; 4
    6152:	38 f3       	brcs	.-50     	; 0x6122 <loop+0x44>
    6154:	8c b5       	in	r24, 0x2c	; 44
    6156:	83 60       	ori	r24, 0x03	; 3
    6158:	8c bd       	out	0x2c, r24	; 44
    615a:	0e 94 4d 0f 	call	0x1e9a	; 0x1e9a <_ZL9print_rffv>
    615e:	65 e0       	ldi	r22, 0x05	; 5
    6160:	85 e0       	ldi	r24, 0x05	; 5
    6162:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    6166:	8b e3       	ldi	r24, 0x3B	; 59
    6168:	91 e0       	ldi	r25, 0x01	; 1
    616a:	0e 94 31 12 	call	0x2462	; 0x2462 <_Z11osd_print_SPKc>
    616e:	0e 94 d9 08 	call	0x11b2	; 0x11b2 <_ZN3OSD6updateEv>
    6172:	a1 2c       	mov	r10, r1
    6174:	c1 2c       	mov	r12, r1
    6176:	d1 2c       	mov	r13, r1
    6178:	00 e0       	ldi	r16, 0x00	; 0
    617a:	10 e0       	ldi	r17, 0x00	; 0
    617c:	e1 2c       	mov	r14, r1
    617e:	f1 2c       	mov	r15, r1
    6180:	0f 3f       	cpi	r16, 0xFF	; 255
    6182:	11 05       	cpc	r17, r1
    6184:	11 f0       	breq	.+4      	; 0x618a <loop+0xac>
    6186:	0c f0       	brlt	.+2      	; 0x618a <loop+0xac>
    6188:	4c c0       	rjmp	.+152    	; 0x6222 <loop+0x144>
    618a:	83 e5       	ldi	r24, 0x53	; 83
    618c:	93 e0       	ldi	r25, 0x03	; 3
    618e:	0e 94 85 38 	call	0x710a	; 0x710a <_ZN10FastSerial9availableEv>
    6192:	88 23       	and	r24, r24
    6194:	a9 f3       	breq	.-22     	; 0x6180 <loop+0xa2>
    6196:	83 e5       	ldi	r24, 0x53	; 83
    6198:	93 e0       	ldi	r25, 0x03	; 3
    619a:	0e 94 af 38 	call	0x715e	; 0x715e <_ZN10FastSerial4readEv>
    619e:	b8 2e       	mov	r11, r24
    61a0:	31 e3       	ldi	r19, 0x31	; 49
    61a2:	38 17       	cp	r19, r24
    61a4:	50 f0       	brcs	.+20     	; 0x61ba <loop+0xdc>
    61a6:	40 e3       	ldi	r20, 0x30	; 48
    61a8:	84 17       	cp	r24, r20
    61aa:	00 f5       	brcc	.+64     	; 0x61ec <loop+0x10e>
    61ac:	5a e0       	ldi	r21, 0x0A	; 10
    61ae:	85 17       	cp	r24, r21
    61b0:	51 f0       	breq	.+20     	; 0x61c6 <loop+0xe8>
    61b2:	8d e0       	ldi	r24, 0x0D	; 13
    61b4:	b8 16       	cp	r11, r24
    61b6:	51 f0       	breq	.+20     	; 0x61cc <loop+0xee>
    61b8:	23 c0       	rjmp	.+70     	; 0x6200 <loop+0x122>
    61ba:	92 e7       	ldi	r25, 0x72	; 114
    61bc:	89 13       	cpse	r24, r25
    61be:	20 c0       	rjmp	.+64     	; 0x6200 <loop+0x122>
    61c0:	01 50       	subi	r16, 0x01	; 1
    61c2:	11 09       	sbc	r17, r1
    61c4:	1d c0       	rjmp	.+58     	; 0x6200 <loop+0x122>
    61c6:	ed e0       	ldi	r30, 0x0D	; 13
    61c8:	ce 16       	cp	r12, r30
    61ca:	49 f1       	breq	.+82     	; 0x621e <loop+0x140>
    61cc:	d1 10       	cpse	r13, r1
    61ce:	03 c0       	rjmp	.+6      	; 0x61d6 <loop+0xf8>
    61d0:	0e 94 4d 0f 	call	0x1e9a	; 0x1e9a <_ZL9print_rffv>
    61d4:	24 c0       	rjmp	.+72     	; 0x621e <loop+0x140>
    61d6:	f8 e0       	ldi	r31, 0x08	; 8
    61d8:	ef 12       	cpse	r14, r31
    61da:	11 c0       	rjmp	.+34     	; 0x61fe <loop+0x120>
    61dc:	ef 2d       	mov	r30, r15
    61de:	f0 e0       	ldi	r31, 0x00	; 0
    61e0:	e3 5f       	subi	r30, 0xF3	; 243
    61e2:	fa 4f       	sbci	r31, 0xFA	; 250
    61e4:	a0 82       	st	Z, r10
    61e6:	f3 94       	inc	r15
    61e8:	a1 2c       	mov	r10, r1
    61ea:	09 c0       	rjmp	.+18     	; 0x61fe <loop+0x120>
    61ec:	aa 0c       	add	r10, r10
    61ee:	21 e3       	ldi	r18, 0x31	; 49
    61f0:	82 13       	cpse	r24, r18
    61f2:	01 c0       	rjmp	.+2      	; 0x61f6 <loop+0x118>
    61f4:	a3 94       	inc	r10
    61f6:	e3 94       	inc	r14
    61f8:	dd 24       	eor	r13, r13
    61fa:	d3 94       	inc	r13
    61fc:	01 c0       	rjmp	.+2      	; 0x6200 <loop+0x122>
    61fe:	e1 2c       	mov	r14, r1
    6200:	30 e4       	ldi	r19, 0x40	; 64
    6202:	f3 12       	cpse	r15, r19
    6204:	0c c0       	rjmp	.+24     	; 0x621e <loop+0x140>
    6206:	6d e0       	ldi	r22, 0x0D	; 13
    6208:	75 e0       	ldi	r23, 0x05	; 5
    620a:	c8 01       	movw	r24, r16
    620c:	0e 94 31 09 	call	0x1262	; 0x1262 <_ZN3OSD9write_NVMEjPh>
    6210:	0f 5f       	subi	r16, 0xFF	; 255
    6212:	1f 4f       	sbci	r17, 0xFF	; 255
    6214:	8e e4       	ldi	r24, 0x4E	; 78
    6216:	91 e0       	ldi	r25, 0x01	; 1
    6218:	0e 94 47 0f 	call	0x1e8e	; 0x1e8e <_ZL14serial_print_SPKc>
    621c:	f1 2c       	mov	r15, r1
    621e:	cb 2c       	mov	r12, r11
    6220:	af cf       	rjmp	.-162    	; 0x6180 <loop+0xa2>
    6222:	8b e4       	ldi	r24, 0x4B	; 75
    6224:	91 e0       	ldi	r25, 0x01	; 1
    6226:	0e 94 47 0f 	call	0x1e8e	; 0x1e8e <_ZL14serial_print_SPKc>
    622a:	aa c4       	rjmp	.+2388   	; 0x6b80 <loop+0xaa2>
    622c:	0e 94 4e 1e 	call	0x3c9c	; 0x3c9c <_Z4logov>
    6230:	8b e1       	ldi	r24, 0x1B	; 27
    6232:	0e 94 05 37 	call	0x6e0a	; 0x6e0a <digitalRead>
    6236:	61 e0       	ldi	r22, 0x01	; 1
    6238:	81 11       	cpse	r24, r1
    623a:	60 e0       	ldi	r22, 0x00	; 0
    623c:	8b e1       	ldi	r24, 0x1B	; 27
    623e:	0e 94 e5 36 	call	0x6dca	; 0x6dca <digitalWrite>
    6242:	9e c4       	rjmp	.+2364   	; 0x6b80 <loop+0xaa2>
    6244:	60 e0       	ldi	r22, 0x00	; 0
    6246:	8b e1       	ldi	r24, 0x1B	; 27
    6248:	0e 94 e5 36 	call	0x6dca	; 0x6dca <digitalWrite>
    624c:	80 91 5c 06 	lds	r24, 0x065C	; 0x80065c <_ZL14apm_mav_system>
    6250:	88 23       	and	r24, r24
    6252:	99 f0       	breq	.+38     	; 0x627a <loop+0x19c>
    6254:	80 91 cb 03 	lds	r24, 0x03CB	; 0x8003cb <lflags+0x17>
    6258:	81 11       	cpse	r24, r1
    625a:	0f c0       	rjmp	.+30     	; 0x627a <loop+0x19c>
    625c:	0e 94 b6 29 	call	0x536c	; 0x536c <_Z21request_mavlink_ratesv>
    6260:	0e 94 47 1e 	call	0x3c8e	; 0x3c8e <_Z9delay_150v>
    6264:	0e 94 b6 29 	call	0x536c	; 0x536c <_Z21request_mavlink_ratesv>
    6268:	0e 94 47 1e 	call	0x3c8e	; 0x3c8e <_Z9delay_150v>
    626c:	0e 94 b6 29 	call	0x536c	; 0x536c <_Z21request_mavlink_ratesv>
    6270:	0e 94 47 1e 	call	0x3c8e	; 0x3c8e <_Z9delay_150v>
    6274:	81 e0       	ldi	r24, 0x01	; 1
    6276:	80 93 cb 03 	sts	0x03CB, r24	; 0x8003cb <lflags+0x17>
    627a:	2d e0       	ldi	r18, 0x0D	; 13
    627c:	a2 2e       	mov	r10, r18
    627e:	25 e0       	ldi	r18, 0x05	; 5
    6280:	b2 2e       	mov	r11, r18
    6282:	30 e4       	ldi	r19, 0x40	; 64
    6284:	33 2e       	mov	r3, r19
    6286:	0e e1       	ldi	r16, 0x1E	; 30
    6288:	11 e0       	ldi	r17, 0x01	; 1
    628a:	48 e6       	ldi	r20, 0x68	; 104
    628c:	84 2e       	mov	r8, r20
    628e:	43 e0       	ldi	r20, 0x03	; 3
    6290:	94 2e       	mov	r9, r20
    6292:	80 91 b6 03 	lds	r24, 0x03B6	; 0x8003b6 <lflags+0x2>
    6296:	81 11       	cpse	r24, r1
    6298:	08 c0       	rjmp	.+16     	; 0x62aa <loop+0x1cc>
    629a:	80 91 b7 03 	lds	r24, 0x03B7	; 0x8003b7 <lflags+0x3>
    629e:	81 11       	cpse	r24, r1
    62a0:	04 c0       	rjmp	.+8      	; 0x62aa <loop+0x1cc>
    62a2:	80 91 c0 03 	lds	r24, 0x03C0	; 0x8003c0 <lflags+0xc>
    62a6:	88 23       	and	r24, r24
    62a8:	61 f0       	breq	.+24     	; 0x62c2 <loop+0x1e4>
    62aa:	0e 94 ff 2f 	call	0x5ffe	; 0x5ffe <_Z12read_mavlinkv>
    62ae:	80 91 b6 03 	lds	r24, 0x03B6	; 0x8003b6 <lflags+0x2>
    62b2:	80 93 b7 03 	sts	0x03B7, r24	; 0x8003b7 <lflags+0x3>
    62b6:	80 91 b4 03 	lds	r24, 0x03B4	; 0x8003b4 <lflags>
    62ba:	88 23       	and	r24, r24
    62bc:	09 f4       	brne	.+2      	; 0x62c0 <loop+0x1e2>
    62be:	35 c2       	rjmp	.+1130   	; 0x672a <loop+0x64c>
    62c0:	a3 c0       	rjmp	.+326    	; 0x6408 <loop+0x32a>
    62c2:	f5 01       	movw	r30, r10
    62c4:	23 2d       	mov	r18, r3
    62c6:	11 92       	st	Z+, r1
    62c8:	2a 95       	dec	r18
    62ca:	e9 f7       	brne	.-6      	; 0x62c6 <loop+0x1e8>
    62cc:	83 e5       	ldi	r24, 0x53	; 83
    62ce:	93 e0       	ldi	r25, 0x03	; 3
    62d0:	0e 94 91 3a 	call	0x7522	; 0x7522 <_ZN10FastSerial3endEv>
    62d4:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    62d8:	2b 01       	movw	r4, r22
    62da:	3c 01       	movw	r6, r24
    62dc:	34 e6       	ldi	r19, 0x64	; 100
    62de:	43 0e       	add	r4, r19
    62e0:	51 1c       	adc	r5, r1
    62e2:	61 1c       	adc	r6, r1
    62e4:	71 1c       	adc	r7, r1
    62e6:	4a ef       	ldi	r20, 0xFA	; 250
    62e8:	49 83       	std	Y+1, r20	; 0x01
    62ea:	22 24       	eor	r2, r2
    62ec:	2a 94       	dec	r2
    62ee:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    62f2:	46 16       	cp	r4, r22
    62f4:	57 06       	cpc	r5, r23
    62f6:	68 06       	cpc	r6, r24
    62f8:	79 06       	cpc	r7, r25
    62fa:	c0 f0       	brcs	.+48     	; 0x632c <loop+0x24e>
    62fc:	24 ec       	ldi	r18, 0xC4	; 196
    62fe:	39 e0       	ldi	r19, 0x09	; 9
    6300:	40 e0       	ldi	r20, 0x00	; 0
    6302:	50 e0       	ldi	r21, 0x00	; 0
    6304:	60 e0       	ldi	r22, 0x00	; 0
    6306:	80 e0       	ldi	r24, 0x00	; 0
    6308:	0e 94 1e 37 	call	0x6e3c	; 0x6e3c <pulseIn>
    630c:	6f 3f       	cpi	r22, 0xFF	; 255
    630e:	71 05       	cpc	r23, r1
    6310:	81 05       	cpc	r24, r1
    6312:	91 05       	cpc	r25, r1
    6314:	09 f0       	breq	.+2      	; 0x6318 <loop+0x23a>
    6316:	2c f4       	brge	.+10     	; 0x6322 <loop+0x244>
    6318:	66 23       	and	r22, r22
    631a:	19 f0       	breq	.+6      	; 0x6322 <loop+0x244>
    631c:	62 15       	cp	r22, r2
    631e:	08 f4       	brcc	.+2      	; 0x6322 <loop+0x244>
    6320:	26 2e       	mov	r2, r22
    6322:	59 81       	ldd	r21, Y+1	; 0x01
    6324:	51 50       	subi	r21, 0x01	; 1
    6326:	59 83       	std	Y+1, r21	; 0x01
    6328:	51 11       	cpse	r21, r1
    632a:	e1 cf       	rjmp	.-62     	; 0x62ee <loop+0x210>
    632c:	8f ef       	ldi	r24, 0xFF	; 255
    632e:	28 12       	cpse	r2, r24
    6330:	03 c0       	rjmp	.+6      	; 0x6338 <loop+0x25a>
    6332:	20 90 08 01 	lds	r2, 0x0108	; 0x800108 <_ZZL7getDatavE10last_pulse>
    6336:	02 c0       	rjmp	.+4      	; 0x633c <loop+0x25e>
    6338:	20 92 08 01 	sts	0x0108, r2	; 0x800108 <_ZZL7getDatavE10last_pulse>
    633c:	9a e0       	ldi	r25, 0x0A	; 10
    633e:	92 15       	cp	r25, r2
    6340:	98 f4       	brcc	.+38     	; 0x6368 <loop+0x28a>
    6342:	e2 e1       	ldi	r30, 0x12	; 18
    6344:	e2 15       	cp	r30, r2
    6346:	a0 f4       	brcc	.+40     	; 0x6370 <loop+0x292>
    6348:	fc e1       	ldi	r31, 0x1C	; 28
    634a:	f2 15       	cp	r31, r2
    634c:	a8 f4       	brcc	.+42     	; 0x6378 <loop+0x29a>
    634e:	27 e2       	ldi	r18, 0x27	; 39
    6350:	22 15       	cp	r18, r2
    6352:	b0 f4       	brcc	.+44     	; 0x6380 <loop+0x2a2>
    6354:	3b e3       	ldi	r19, 0x3B	; 59
    6356:	32 15       	cp	r19, r2
    6358:	b8 f4       	brcc	.+46     	; 0x6388 <loop+0x2aa>
    635a:	45 e9       	ldi	r20, 0x95	; 149
    635c:	42 15       	cp	r20, r2
    635e:	c0 f4       	brcc	.+48     	; 0x6390 <loop+0x2b2>
    6360:	51 e0       	ldi	r21, 0x01	; 1
    6362:	59 83       	std	Y+1, r21	; 0x01
    6364:	e0 e4       	ldi	r30, 0x40	; 64
    6366:	17 c0       	rjmp	.+46     	; 0x6396 <loop+0x2b8>
    6368:	88 e1       	ldi	r24, 0x18	; 24
    636a:	89 83       	std	Y+1, r24	; 0x01
    636c:	e2 e0       	ldi	r30, 0x02	; 2
    636e:	13 c0       	rjmp	.+38     	; 0x6396 <loop+0x2b8>
    6370:	9c e0       	ldi	r25, 0x0C	; 12
    6372:	99 83       	std	Y+1, r25	; 0x01
    6374:	e4 e0       	ldi	r30, 0x04	; 4
    6376:	0f c0       	rjmp	.+30     	; 0x6396 <loop+0x2b8>
    6378:	e8 e0       	ldi	r30, 0x08	; 8
    637a:	e9 83       	std	Y+1, r30	; 0x01
    637c:	e6 e0       	ldi	r30, 0x06	; 6
    637e:	0b c0       	rjmp	.+22     	; 0x6396 <loop+0x2b8>
    6380:	f6 e0       	ldi	r31, 0x06	; 6
    6382:	f9 83       	std	Y+1, r31	; 0x01
    6384:	e8 e0       	ldi	r30, 0x08	; 8
    6386:	07 c0       	rjmp	.+14     	; 0x6396 <loop+0x2b8>
    6388:	24 e0       	ldi	r18, 0x04	; 4
    638a:	29 83       	std	Y+1, r18	; 0x01
    638c:	e0 e1       	ldi	r30, 0x10	; 16
    638e:	03 c0       	rjmp	.+6      	; 0x6396 <loop+0x2b8>
    6390:	32 e0       	ldi	r19, 0x02	; 2
    6392:	39 83       	std	Y+1, r19	; 0x01
    6394:	e0 e2       	ldi	r30, 0x20	; 32
    6396:	49 81       	ldd	r20, Y+1	; 0x01
    6398:	24 2f       	mov	r18, r20
    639a:	30 e0       	ldi	r19, 0x00	; 0
    639c:	a0 ec       	ldi	r26, 0xC0	; 192
    639e:	b2 e1       	ldi	r27, 0x12	; 18
    63a0:	0e 94 fb 43 	call	0x87f6	; 0x87f6 <__umulhisi3>
    63a4:	2b 01       	movw	r4, r22
    63a6:	3c 01       	movw	r6, r24
    63a8:	e0 93 ff 06 	sts	0x06FF, r30	; 0x8006ff <_ZL11stream_rate>
    63ac:	62 e0       	ldi	r22, 0x02	; 2
    63ae:	83 e0       	ldi	r24, 0x03	; 3
    63b0:	0e 94 85 08 	call	0x110a	; 0x110a <_ZN3OSD8setPanelEhh>
    63b4:	7f 92       	push	r7
    63b6:	6f 92       	push	r6
    63b8:	5f 92       	push	r5
    63ba:	4f 92       	push	r4
    63bc:	1f 92       	push	r1
    63be:	59 81       	ldd	r21, Y+1	; 0x01
    63c0:	5f 93       	push	r21
    63c2:	1f 92       	push	r1
    63c4:	2f 92       	push	r2
    63c6:	1f 93       	push	r17
    63c8:	0f 93       	push	r16
    63ca:	9f 92       	push	r9
    63cc:	8f 92       	push	r8
    63ce:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    63d2:	40 92 eb 03 	sts	0x03EB, r4	; 0x8003eb <serial_speed>
    63d6:	50 92 ec 03 	sts	0x03EC, r5	; 0x8003ec <serial_speed+0x1>
    63da:	60 92 ed 03 	sts	0x03ED, r6	; 0x8003ed <serial_speed+0x2>
    63de:	70 92 ee 03 	sts	0x03EE, r7	; 0x8003ee <serial_speed+0x3>
    63e2:	83 e5       	ldi	r24, 0x53	; 83
    63e4:	93 e0       	ldi	r25, 0x03	; 3
    63e6:	0e 94 f0 38 	call	0x71e0	; 0x71e0 <_ZN10FastSerial5flushEv>
    63ea:	a2 01       	movw	r20, r4
    63ec:	b3 01       	movw	r22, r6
    63ee:	83 e5       	ldi	r24, 0x53	; 83
    63f0:	93 e0       	ldi	r25, 0x03	; 3
    63f2:	0e 94 75 38 	call	0x70ea	; 0x70ea <_ZN10FastSerial5beginEl>
    63f6:	81 e0       	ldi	r24, 0x01	; 1
    63f8:	80 93 b7 03 	sts	0x03B7, r24	; 0x8003b7 <lflags+0x3>
    63fc:	0f b6       	in	r0, 0x3f	; 63
    63fe:	f8 94       	cli
    6400:	de bf       	out	0x3e, r29	; 62
    6402:	0f be       	out	0x3f, r0	; 63
    6404:	cd bf       	out	0x3d, r28	; 61
    6406:	45 cf       	rjmp	.-374    	; 0x6292 <loop+0x1b4>
    6408:	70 90 56 06 	lds	r7, 0x0656	; 0x800656 <_ZL6panelN>
    640c:	80 91 5e 04 	lds	r24, 0x045E	; 0x80045e <sets+0x5>
    6410:	83 30       	cpi	r24, 0x03	; 3
    6412:	08 f4       	brcc	.+2      	; 0x6416 <loop+0x338>
    6414:	7f c1       	rjmp	.+766    	; 0x6714 <loop+0x636>
    6416:	9b ef       	ldi	r25, 0xFB	; 251
    6418:	98 0f       	add	r25, r24
    641a:	94 30       	cpi	r25, 0x04	; 4
    641c:	48 f4       	brcc	.+18     	; 0x6430 <loop+0x352>
    641e:	e8 2f       	mov	r30, r24
    6420:	f0 e0       	ldi	r31, 0x00	; 0
    6422:	ee 0f       	add	r30, r30
    6424:	ff 1f       	adc	r31, r31
    6426:	e3 54       	subi	r30, 0x43	; 67
    6428:	f9 4f       	sbci	r31, 0xF9	; 249
    642a:	a0 80       	ld	r10, Z
    642c:	b1 80       	ldd	r11, Z+1	; 0x01
    642e:	04 c0       	rjmp	.+8      	; 0x6438 <loop+0x35a>
    6430:	a0 90 cd 06 	lds	r10, 0x06CD	; 0x8006cd <_ZL8chan_raw+0xe>
    6434:	b0 90 ce 06 	lds	r11, 0x06CE	; 0x8006ce <_ZL8chan_raw+0xf>
    6438:	95 01       	movw	r18, r10
    643a:	20 52       	subi	r18, 0x20	; 32
    643c:	33 40       	sbci	r19, 0x03	; 3
    643e:	29 39       	cpi	r18, 0x99	; 153
    6440:	38 40       	sbci	r19, 0x08	; 8
    6442:	08 f0       	brcs	.+2      	; 0x6446 <loop+0x368>
    6444:	67 c1       	rjmp	.+718    	; 0x6714 <loop+0x636>
    6446:	20 91 06 01 	lds	r18, 0x0106	; 0x800106 <_ZZL10pan_togglevE6ch_min>
    644a:	30 91 07 01 	lds	r19, 0x0107	; 0x800107 <_ZZL10pan_togglevE6ch_min+0x1>
    644e:	a2 16       	cp	r10, r18
    6450:	b3 06       	cpc	r11, r19
    6452:	20 f4       	brcc	.+8      	; 0x645c <loop+0x37e>
    6454:	b0 92 07 01 	sts	0x0107, r11	; 0x800107 <_ZZL10pan_togglevE6ch_min+0x1>
    6458:	a0 92 06 01 	sts	0x0106, r10	; 0x800106 <_ZZL10pan_togglevE6ch_min>
    645c:	20 91 04 01 	lds	r18, 0x0104	; 0x800104 <_ZZL10pan_togglevE6ch_max>
    6460:	30 91 05 01 	lds	r19, 0x0105	; 0x800105 <_ZZL10pan_togglevE6ch_max+0x1>
    6464:	2a 15       	cp	r18, r10
    6466:	3b 05       	cpc	r19, r11
    6468:	20 f4       	brcc	.+8      	; 0x6472 <loop+0x394>
    646a:	b0 92 05 01 	sts	0x0105, r11	; 0x800105 <_ZZL10pan_togglevE6ch_max+0x1>
    646e:	a0 92 04 01 	sts	0x0104, r10	; 0x800104 <_ZZL10pan_togglevE6ch_max>
    6472:	84 30       	cpi	r24, 0x04	; 4
    6474:	49 f5       	brne	.+82     	; 0x64c8 <loop+0x3ea>
    6476:	80 91 ae 06 	lds	r24, 0x06AE	; 0x8006ae <_ZL8osd_mode>
    647a:	9a ef       	ldi	r25, 0xFA	; 250
    647c:	98 0f       	add	r25, r24
    647e:	92 30       	cpi	r25, 0x02	; 2
    6480:	08 f4       	brcc	.+2      	; 0x6484 <loop+0x3a6>
    6482:	c8 c0       	rjmp	.+400    	; 0x6614 <loop+0x536>
    6484:	90 91 9d 06 	lds	r25, 0x069D	; 0x80069d <_ZL14osd_off_switch>
    6488:	98 17       	cp	r25, r24
    648a:	89 f0       	breq	.+34     	; 0x64ae <loop+0x3d0>
    648c:	80 93 9d 06 	sts	0x069D, r24	; 0x80069d <_ZL14osd_off_switch>
    6490:	60 e0       	ldi	r22, 0x00	; 0
    6492:	70 e0       	ldi	r23, 0x00	; 0
    6494:	89 e9       	ldi	r24, 0x99	; 153
    6496:	96 e0       	ldi	r25, 0x06	; 6
    6498:	0e 94 af 14 	call	0x295e	; 0x295e <_Z11millis_plusPmj>
    649c:	90 91 9d 06 	lds	r25, 0x069D	; 0x80069d <_ZL14osd_off_switch>
    64a0:	80 91 13 01 	lds	r24, 0x0113	; 0x800113 <_ZL15osd_switch_last>
    64a4:	98 13       	cpse	r25, r24
    64a6:	03 c0       	rjmp	.+6      	; 0x64ae <loop+0x3d0>
    64a8:	81 e0       	ldi	r24, 0x01	; 1
    64aa:	80 93 b8 03 	sts	0x03B8, r24	; 0x8003b8 <lflags+0x4>
    64ae:	89 e9       	ldi	r24, 0x99	; 153
    64b0:	96 e0       	ldi	r25, 0x06	; 6
    64b2:	0e 94 40 18 	call	0x3080	; 0x3080 <_Z10time_sincePm>
    64b6:	81 3d       	cpi	r24, 0xD1	; 209
    64b8:	97 40       	sbci	r25, 0x07	; 7
    64ba:	08 f4       	brcc	.+2      	; 0x64be <loop+0x3e0>
    64bc:	ab c0       	rjmp	.+342    	; 0x6614 <loop+0x536>
    64be:	80 91 ae 06 	lds	r24, 0x06AE	; 0x8006ae <_ZL8osd_mode>
    64c2:	80 93 13 01 	sts	0x0113, r24	; 0x800113 <_ZL15osd_switch_last>
    64c6:	a6 c0       	rjmp	.+332    	; 0x6614 <loop+0x536>
    64c8:	80 91 63 04 	lds	r24, 0x0463	; 0x800463 <sets+0xa>
    64cc:	81 11       	cpse	r24, r1
    64ce:	21 c0       	rjmp	.+66     	; 0x6512 <loop+0x434>
    64d0:	20 91 04 01 	lds	r18, 0x0104	; 0x800104 <_ZZL10pan_togglevE6ch_max>
    64d4:	30 91 05 01 	lds	r19, 0x0105	; 0x800105 <_ZZL10pan_togglevE6ch_max+0x1>
    64d8:	80 91 06 01 	lds	r24, 0x0106	; 0x800106 <_ZZL10pan_togglevE6ch_min>
    64dc:	90 91 07 01 	lds	r25, 0x0107	; 0x800107 <_ZZL10pan_togglevE6ch_min+0x1>
    64e0:	60 91 a0 04 	lds	r22, 0x04A0	; 0x8004a0 <sets+0x47>
    64e4:	8a 15       	cp	r24, r10
    64e6:	9b 05       	cpc	r25, r11
    64e8:	68 f4       	brcc	.+26     	; 0x6504 <loop+0x426>
    64ea:	a8 1a       	sub	r10, r24
    64ec:	b9 0a       	sbc	r11, r25
    64ee:	a9 01       	movw	r20, r18
    64f0:	48 1b       	sub	r20, r24
    64f2:	59 0b       	sbc	r21, r25
    64f4:	ca 01       	movw	r24, r20
    64f6:	70 e0       	ldi	r23, 0x00	; 0
    64f8:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    64fc:	c5 01       	movw	r24, r10
    64fe:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    6502:	01 c0       	rjmp	.+2      	; 0x6506 <loop+0x428>
    6504:	60 e0       	ldi	r22, 0x00	; 0
    6506:	76 16       	cp	r7, r22
    6508:	09 f4       	brne	.+2      	; 0x650c <loop+0x42e>
    650a:	84 c0       	rjmp	.+264    	; 0x6614 <loop+0x536>
    650c:	60 93 56 06 	sts	0x0656, r22	; 0x800656 <_ZL6panelN>
    6510:	81 c0       	rjmp	.+258    	; 0x6614 <loop+0x536>
    6512:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
    6516:	82 ff       	sbrs	r24, 2
    6518:	3e c0       	rjmp	.+124    	; 0x6596 <loop+0x4b8>
    651a:	80 91 43 06 	lds	r24, 0x0643	; 0x800643 <_ZL12ch_raw_prev1>
    651e:	90 91 44 06 	lds	r25, 0x0644	; 0x800644 <_ZL12ch_raw_prev1+0x1>
    6522:	a8 16       	cp	r10, r24
    6524:	b9 06       	cpc	r11, r25
    6526:	09 f4       	brne	.+2      	; 0x652a <loop+0x44c>
    6528:	46 c0       	rjmp	.+140    	; 0x65b6 <loop+0x4d8>
    652a:	f5 01       	movw	r30, r10
    652c:	e8 1b       	sub	r30, r24
    652e:	f9 0b       	sbc	r31, r25
    6530:	e9 3c       	cpi	r30, 0xC9	; 201
    6532:	f1 05       	cpc	r31, r1
    6534:	08 f4       	brcc	.+2      	; 0x6538 <loop+0x45a>
    6536:	3f c0       	rjmp	.+126    	; 0x65b6 <loop+0x4d8>
    6538:	80 91 41 06 	lds	r24, 0x0641	; 0x800641 <_ZL12ch_raw_prev2>
    653c:	90 91 42 06 	lds	r25, 0x0642	; 0x800642 <_ZL12ch_raw_prev2+0x1>
    6540:	a8 16       	cp	r10, r24
    6542:	b9 06       	cpc	r11, r25
    6544:	31 f0       	breq	.+12     	; 0x6552 <loop+0x474>
    6546:	95 01       	movw	r18, r10
    6548:	28 1b       	sub	r18, r24
    654a:	39 0b       	sbc	r19, r25
    654c:	28 3c       	cpi	r18, 0xC8	; 200
    654e:	31 05       	cpc	r19, r1
    6550:	78 f4       	brcc	.+30     	; 0x6570 <loop+0x492>
    6552:	89 e9       	ldi	r24, 0x99	; 153
    6554:	96 e0       	ldi	r25, 0x06	; 6
    6556:	0e 94 40 18 	call	0x3080	; 0x3080 <_Z10time_sincePm>
    655a:	89 3e       	cpi	r24, 0xE9	; 233
    655c:	93 40       	sbci	r25, 0x03	; 3
    655e:	18 f0       	brcs	.+6      	; 0x6566 <loop+0x488>
    6560:	81 e0       	ldi	r24, 0x01	; 1
    6562:	80 93 b8 03 	sts	0x03B8, r24	; 0x8003b8 <lflags+0x4>
    6566:	10 92 42 06 	sts	0x0642, r1	; 0x800642 <_ZL12ch_raw_prev2+0x1>
    656a:	10 92 41 06 	sts	0x0641, r1	; 0x800641 <_ZL12ch_raw_prev2>
    656e:	23 c0       	rjmp	.+70     	; 0x65b6 <loop+0x4d8>
    6570:	60 e0       	ldi	r22, 0x00	; 0
    6572:	70 e0       	ldi	r23, 0x00	; 0
    6574:	89 e9       	ldi	r24, 0x99	; 153
    6576:	96 e0       	ldi	r25, 0x06	; 6
    6578:	0e 94 af 14 	call	0x295e	; 0x295e <_Z11millis_plusPmj>
    657c:	80 91 43 06 	lds	r24, 0x0643	; 0x800643 <_ZL12ch_raw_prev1>
    6580:	90 91 44 06 	lds	r25, 0x0644	; 0x800644 <_ZL12ch_raw_prev1+0x1>
    6584:	90 93 42 06 	sts	0x0642, r25	; 0x800642 <_ZL12ch_raw_prev2+0x1>
    6588:	80 93 41 06 	sts	0x0641, r24	; 0x800641 <_ZL12ch_raw_prev2>
    658c:	b0 92 44 06 	sts	0x0644, r11	; 0x800644 <_ZL12ch_raw_prev1+0x1>
    6590:	a0 92 43 06 	sts	0x0643, r10	; 0x800643 <_ZL12ch_raw_prev1>
    6594:	10 c0       	rjmp	.+32     	; 0x65b6 <loop+0x4d8>
    6596:	20 91 04 01 	lds	r18, 0x0104	; 0x800104 <_ZZL10pan_togglevE6ch_max>
    659a:	30 91 05 01 	lds	r19, 0x0105	; 0x800105 <_ZZL10pan_togglevE6ch_max+0x1>
    659e:	80 91 06 01 	lds	r24, 0x0106	; 0x800106 <_ZZL10pan_togglevE6ch_min>
    65a2:	90 91 07 01 	lds	r25, 0x0107	; 0x800107 <_ZZL10pan_togglevE6ch_min+0x1>
    65a6:	28 0f       	add	r18, r24
    65a8:	39 1f       	adc	r19, r25
    65aa:	36 95       	lsr	r19
    65ac:	27 95       	ror	r18
    65ae:	81 e0       	ldi	r24, 0x01	; 1
    65b0:	2a 15       	cp	r18, r10
    65b2:	3b 05       	cpc	r19, r11
    65b4:	08 f0       	brcs	.+2      	; 0x65b8 <loop+0x4da>
    65b6:	80 e0       	ldi	r24, 0x00	; 0
    65b8:	90 91 59 04 	lds	r25, 0x0459	; 0x800459 <sets>
    65bc:	90 ff       	sbrs	r25, 0
    65be:	10 c0       	rjmp	.+32     	; 0x65e0 <loop+0x502>
    65c0:	88 23       	and	r24, r24
    65c2:	21 f0       	breq	.+8      	; 0x65cc <loop+0x4ee>
    65c4:	81 e0       	ldi	r24, 0x01	; 1
    65c6:	80 93 b9 03 	sts	0x03B9, r24	; 0x8003b9 <lflags+0x5>
    65ca:	24 c0       	rjmp	.+72     	; 0x6614 <loop+0x536>
    65cc:	80 91 b9 03 	lds	r24, 0x03B9	; 0x8003b9 <lflags+0x5>
    65d0:	88 23       	and	r24, r24
    65d2:	19 f0       	breq	.+6      	; 0x65da <loop+0x4fc>
    65d4:	81 e0       	ldi	r24, 0x01	; 1
    65d6:	80 93 b8 03 	sts	0x03B8, r24	; 0x8003b8 <lflags+0x4>
    65da:	10 92 b9 03 	sts	0x03B9, r1	; 0x8003b9 <lflags+0x5>
    65de:	1a c0       	rjmp	.+52     	; 0x6614 <loop+0x536>
    65e0:	88 23       	and	r24, r24
    65e2:	c1 f0       	breq	.+48     	; 0x6614 <loop+0x536>
    65e4:	80 90 99 06 	lds	r8, 0x0699	; 0x800699 <_ZL15osd_switch_time>
    65e8:	90 90 9a 06 	lds	r9, 0x069A	; 0x80069a <_ZL15osd_switch_time+0x1>
    65ec:	a0 90 9b 06 	lds	r10, 0x069B	; 0x80069b <_ZL15osd_switch_time+0x2>
    65f0:	b0 90 9c 06 	lds	r11, 0x069C	; 0x80069c <_ZL15osd_switch_time+0x3>
    65f4:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    65f8:	86 16       	cp	r8, r22
    65fa:	97 06       	cpc	r9, r23
    65fc:	a8 06       	cpc	r10, r24
    65fe:	b9 06       	cpc	r11, r25
    6600:	48 f4       	brcc	.+18     	; 0x6614 <loop+0x536>
    6602:	81 e0       	ldi	r24, 0x01	; 1
    6604:	80 93 b8 03 	sts	0x03B8, r24	; 0x8003b8 <lflags+0x4>
    6608:	64 ef       	ldi	r22, 0xF4	; 244
    660a:	71 e0       	ldi	r23, 0x01	; 1
    660c:	89 e9       	ldi	r24, 0x99	; 153
    660e:	96 e0       	ldi	r25, 0x06	; 6
    6610:	0e 94 af 14 	call	0x295e	; 0x295e <_Z11millis_plusPmj>
    6614:	80 91 b8 03 	lds	r24, 0x03B8	; 0x8003b8 <lflags+0x4>
    6618:	88 23       	and	r24, r24
    661a:	71 f0       	breq	.+28     	; 0x6638 <loop+0x55a>
    661c:	10 92 b8 03 	sts	0x03B8, r1	; 0x8003b8 <lflags+0x4>
    6620:	80 91 56 06 	lds	r24, 0x0656	; 0x800656 <_ZL6panelN>
    6624:	8f 5f       	subi	r24, 0xFF	; 255
    6626:	80 93 56 06 	sts	0x0656, r24	; 0x800656 <_ZL6panelN>
    662a:	90 91 a0 04 	lds	r25, 0x04A0	; 0x8004a0 <sets+0x47>
    662e:	98 17       	cp	r25, r24
    6630:	20 f5       	brcc	.+72     	; 0x667a <loop+0x59c>
    6632:	10 92 56 06 	sts	0x0656, r1	; 0x800656 <_ZL6panelN>
    6636:	21 c0       	rjmp	.+66     	; 0x667a <loop+0x59c>
    6638:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
    663c:	87 ff       	sbrs	r24, 7
    663e:	1d c0       	rjmp	.+58     	; 0x667a <loop+0x59c>
    6640:	40 91 8e 03 	lds	r20, 0x038E	; 0x80038e <autoswitch_time>
    6644:	50 91 8f 03 	lds	r21, 0x038F	; 0x80038f <autoswitch_time+0x1>
    6648:	60 91 90 03 	lds	r22, 0x0390	; 0x800390 <autoswitch_time+0x2>
    664c:	70 91 91 03 	lds	r23, 0x0391	; 0x800391 <autoswitch_time+0x3>
    6650:	41 15       	cp	r20, r1
    6652:	51 05       	cpc	r21, r1
    6654:	61 05       	cpc	r22, r1
    6656:	71 05       	cpc	r23, r1
    6658:	81 f0       	breq	.+32     	; 0x667a <loop+0x59c>
    665a:	80 91 63 06 	lds	r24, 0x0663	; 0x800663 <_ZL7seconds>
    665e:	90 91 64 06 	lds	r25, 0x0664	; 0x800664 <_ZL7seconds+0x1>
    6662:	a0 e0       	ldi	r26, 0x00	; 0
    6664:	b0 e0       	ldi	r27, 0x00	; 0
    6666:	48 17       	cp	r20, r24
    6668:	59 07       	cpc	r21, r25
    666a:	6a 07       	cpc	r22, r26
    666c:	7b 07       	cpc	r23, r27
    666e:	28 f4       	brcc	.+10     	; 0x667a <loop+0x59c>
    6670:	81 e0       	ldi	r24, 0x01	; 1
    6672:	80 93 ca 03 	sts	0x03CA, r24	; 0x8003ca <lflags+0x16>
    6676:	80 93 b8 03 	sts	0x03B8, r24	; 0x8003b8 <lflags+0x4>
    667a:	00 91 56 06 	lds	r16, 0x0656	; 0x800656 <_ZL6panelN>
    667e:	70 16       	cp	r7, r16
    6680:	09 f4       	brne	.+2      	; 0x6684 <loop+0x5a6>
    6682:	48 c0       	rjmp	.+144    	; 0x6714 <loop+0x636>
    6684:	0e 94 5c 18 	call	0x30b8	; 0x30b8 <_Z14doScreenSwitchv>
    6688:	80 91 59 04 	lds	r24, 0x0459	; 0x800459 <sets>
    668c:	10 91 ca 03 	lds	r17, 0x03CA	; 0x8003ca <lflags+0x16>
    6690:	87 ff       	sbrs	r24, 7
    6692:	09 c0       	rjmp	.+18     	; 0x66a6 <loop+0x5c8>
    6694:	11 23       	and	r17, r17
    6696:	39 f0       	breq	.+14     	; 0x66a6 <loop+0x5c8>
    6698:	80 91 a0 04 	lds	r24, 0x04A0	; 0x8004a0 <sets+0x47>
    669c:	88 23       	and	r24, r24
    669e:	19 f0       	breq	.+6      	; 0x66a6 <loop+0x5c8>
    66a0:	08 17       	cp	r16, r24
    66a2:	09 f4       	brne	.+2      	; 0x66a6 <loop+0x5c8>
    66a4:	bb cf       	rjmp	.-138    	; 0x661c <loop+0x53e>
    66a6:	80 2f       	mov	r24, r16
    66a8:	0e 94 4d 18 	call	0x309a	; 0x309a <_Z15get_switch_timeh>
    66ac:	28 2f       	mov	r18, r24
    66ae:	88 23       	and	r24, r24
    66b0:	99 f0       	breq	.+38     	; 0x66d8 <loop+0x5fa>
    66b2:	80 91 63 06 	lds	r24, 0x0663	; 0x800663 <_ZL7seconds>
    66b6:	90 91 64 06 	lds	r25, 0x0664	; 0x800664 <_ZL7seconds+0x1>
    66ba:	82 0f       	add	r24, r18
    66bc:	91 1d       	adc	r25, r1
    66be:	a0 e0       	ldi	r26, 0x00	; 0
    66c0:	b0 e0       	ldi	r27, 0x00	; 0
    66c2:	80 93 8e 03 	sts	0x038E, r24	; 0x80038e <autoswitch_time>
    66c6:	90 93 8f 03 	sts	0x038F, r25	; 0x80038f <autoswitch_time+0x1>
    66ca:	a0 93 90 03 	sts	0x0390, r26	; 0x800390 <autoswitch_time+0x2>
    66ce:	b0 93 91 03 	sts	0x0391, r27	; 0x800391 <autoswitch_time+0x3>
    66d2:	11 11       	cpse	r17, r1
    66d4:	1d c0       	rjmp	.+58     	; 0x6710 <loop+0x632>
    66d6:	0a c0       	rjmp	.+20     	; 0x66ec <loop+0x60e>
    66d8:	11 11       	cpse	r17, r1
    66da:	a0 cf       	rjmp	.-192    	; 0x661c <loop+0x53e>
    66dc:	10 92 8e 03 	sts	0x038E, r1	; 0x80038e <autoswitch_time>
    66e0:	10 92 8f 03 	sts	0x038F, r1	; 0x80038f <autoswitch_time+0x1>
    66e4:	10 92 90 03 	sts	0x0390, r1	; 0x800390 <autoswitch_time+0x2>
    66e8:	10 92 91 03 	sts	0x0391, r1	; 0x800391 <autoswitch_time+0x3>
    66ec:	a6 ef       	ldi	r26, 0xF6	; 246
    66ee:	b3 e0       	ldi	r27, 0x03	; 3
    66f0:	e5 e1       	ldi	r30, 0x15	; 21
    66f2:	f1 e0       	ldi	r31, 0x01	; 1
    66f4:	84 91       	lpm	r24, Z
    66f6:	8d 93       	st	X+, r24
    66f8:	31 96       	adiw	r30, 0x01	; 1
    66fa:	81 11       	cpse	r24, r1
    66fc:	fb cf       	rjmp	.-10     	; 0x66f4 <loop+0x616>
    66fe:	80 91 fd 03 	lds	r24, 0x03FD	; 0x8003fd <mav_message+0x7>
    6702:	80 0f       	add	r24, r16
    6704:	80 93 fd 03 	sts	0x03FD, r24	; 0x8003fd <mav_message+0x7>
    6708:	63 e0       	ldi	r22, 0x03	; 3
    670a:	88 e0       	ldi	r24, 0x08	; 8
    670c:	0e 94 23 18 	call	0x3046	; 0x3046 <_Z17mav_message_starthh>
    6710:	10 92 ca 03 	sts	0x03CA, r1	; 0x8003ca <lflags+0x16>
    6714:	80 91 b5 03 	lds	r24, 0x03B5	; 0x8003b5 <lflags+0x1>
    6718:	81 11       	cpse	r24, r1
    671a:	05 c0       	rjmp	.+10     	; 0x6726 <loop+0x648>
    671c:	81 e0       	ldi	r24, 0x01	; 1
    671e:	80 93 b5 03 	sts	0x03B5, r24	; 0x8003b5 <lflags+0x1>
    6722:	80 93 b3 03 	sts	0x03B3, r24	; 0x8003b3 <vsync_wait>
    6726:	10 92 b4 03 	sts	0x03B4, r1	; 0x8003b4 <lflags>
    672a:	80 91 b5 03 	lds	r24, 0x03B5	; 0x8003b5 <lflags+0x1>
    672e:	88 23       	and	r24, r24
    6730:	09 f4       	brne	.+2      	; 0x6734 <loop+0x656>
    6732:	ca c0       	rjmp	.+404    	; 0x68c8 <loop+0x7ea>
    6734:	80 91 b3 03 	lds	r24, 0x03B3	; 0x8003b3 <vsync_wait>
    6738:	81 11       	cpse	r24, r1
    673a:	c6 c0       	rjmp	.+396    	; 0x68c8 <loop+0x7ea>
    673c:	10 92 b5 03 	sts	0x03B5, r1	; 0x8003b5 <lflags+0x1>
    6740:	90 91 8f 06 	lds	r25, 0x068F	; 0x80068f <_ZL12osd_fix_type>
    6744:	99 23       	and	r25, r25
    6746:	19 f0       	breq	.+6      	; 0x674e <loop+0x670>
    6748:	81 e0       	ldi	r24, 0x01	; 1
    674a:	80 93 c6 03 	sts	0x03C6, r24	; 0x8003c6 <lflags+0x12>
    674e:	80 91 5d 04 	lds	r24, 0x045D	; 0x80045d <sets+0x4>
    6752:	88 23       	and	r24, r24
    6754:	09 f4       	brne	.+2      	; 0x6758 <loop+0x67a>
    6756:	c7 c1       	rjmp	.+910    	; 0x6ae6 <loop+0xa08>
    6758:	20 91 bb 03 	lds	r18, 0x03BB	; 0x8003bb <lflags+0x7>
    675c:	80 91 bd 03 	lds	r24, 0x03BD	; 0x8003bd <lflags+0x9>
    6760:	22 23       	and	r18, r18
    6762:	09 f4       	brne	.+2      	; 0x6766 <loop+0x688>
    6764:	f6 c1       	rjmp	.+1004   	; 0x6b52 <loop+0xa74>
    6766:	80 fd       	sbrc	r24, 0
    6768:	0d c0       	rjmp	.+26     	; 0x6784 <loop+0x6a6>
    676a:	10 92 c2 03 	sts	0x03C2, r1	; 0x8003c2 <lflags+0xe>
    676e:	81 60       	ori	r24, 0x01	; 1
    6770:	80 93 bd 03 	sts	0x03BD, r24	; 0x8003bd <lflags+0x9>
    6774:	10 92 9e 06 	sts	0x069E, r1	; 0x80069e <_ZL23total_flight_time_milis>
    6778:	10 92 9f 06 	sts	0x069F, r1	; 0x80069f <_ZL23total_flight_time_milis+0x1>
    677c:	10 92 a0 06 	sts	0x06A0, r1	; 0x8006a0 <_ZL23total_flight_time_milis+0x2>
    6780:	10 92 a1 06 	sts	0x06A1, r1	; 0x8006a1 <_ZL23total_flight_time_milis+0x3>
    6784:	80 91 c2 03 	lds	r24, 0x03C2	; 0x8003c2 <lflags+0xe>
    6788:	88 23       	and	r24, r24
    678a:	09 f4       	brne	.+2      	; 0x678e <loop+0x6b0>
    678c:	c2 c1       	rjmp	.+900    	; 0x6b12 <loop+0xa34>
    678e:	80 91 c2 03 	lds	r24, 0x03C2	; 0x8003c2 <lflags+0xe>
    6792:	88 23       	and	r24, r24
    6794:	09 f4       	brne	.+2      	; 0x6798 <loop+0x6ba>
    6796:	8f c0       	rjmp	.+286    	; 0x68b6 <loop+0x7d8>
    6798:	80 90 39 04 	lds	r8, 0x0439	; 0x800439 <osd_home>
    679c:	90 90 3a 04 	lds	r9, 0x043A	; 0x80043a <osd_home+0x1>
    67a0:	a0 90 3b 04 	lds	r10, 0x043B	; 0x80043b <osd_home+0x2>
    67a4:	b0 90 3c 04 	lds	r11, 0x043C	; 0x80043c <osd_home+0x3>
    67a8:	c5 01       	movw	r24, r10
    67aa:	b4 01       	movw	r22, r8
    67ac:	9f 77       	andi	r25, 0x7F	; 127
    67ae:	25 e3       	ldi	r18, 0x35	; 53
    67b0:	3a ef       	ldi	r19, 0xFA	; 250
    67b2:	4e e8       	ldi	r20, 0x8E	; 142
    67b4:	5c e3       	ldi	r21, 0x3C	; 60
    67b6:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    67ba:	0e 94 9b 40 	call	0x8136	; 0x8136 <cos>
    67be:	2b 01       	movw	r4, r22
    67c0:	3c 01       	movw	r6, r24
    67c2:	20 91 45 04 	lds	r18, 0x0445	; 0x800445 <osd_pos>
    67c6:	30 91 46 04 	lds	r19, 0x0446	; 0x800446 <osd_pos+0x1>
    67ca:	40 91 47 04 	lds	r20, 0x0447	; 0x800447 <osd_pos+0x2>
    67ce:	50 91 48 04 	lds	r21, 0x0448	; 0x800448 <osd_pos+0x3>
    67d2:	c5 01       	movw	r24, r10
    67d4:	b4 01       	movw	r22, r8
    67d6:	0e 94 52 0f 	call	0x1ea4	; 0x1ea4 <_ZL10diff_coordRfS_.isra.6>
    67da:	4b 01       	movw	r8, r22
    67dc:	5c 01       	movw	r10, r24
    67de:	20 91 49 04 	lds	r18, 0x0449	; 0x800449 <osd_pos+0x4>
    67e2:	30 91 4a 04 	lds	r19, 0x044A	; 0x80044a <osd_pos+0x5>
    67e6:	40 91 4b 04 	lds	r20, 0x044B	; 0x80044b <osd_pos+0x6>
    67ea:	50 91 4c 04 	lds	r21, 0x044C	; 0x80044c <osd_pos+0x7>
    67ee:	60 91 3d 04 	lds	r22, 0x043D	; 0x80043d <osd_home+0x4>
    67f2:	70 91 3e 04 	lds	r23, 0x043E	; 0x80043e <osd_home+0x5>
    67f6:	80 91 3f 04 	lds	r24, 0x043F	; 0x80043f <osd_home+0x6>
    67fa:	90 91 40 04 	lds	r25, 0x0440	; 0x800440 <osd_home+0x7>
    67fe:	0e 94 52 0f 	call	0x1ea4	; 0x1ea4 <_ZL10diff_coordRfS_.isra.6>
    6802:	a3 01       	movw	r20, r6
    6804:	92 01       	movw	r18, r4
    6806:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    680a:	2b 01       	movw	r4, r22
    680c:	3c 01       	movw	r6, r24
    680e:	9b 01       	movw	r18, r22
    6810:	ac 01       	movw	r20, r24
    6812:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    6816:	69 83       	std	Y+1, r22	; 0x01
    6818:	7a 83       	std	Y+2, r23	; 0x02
    681a:	8b 83       	std	Y+3, r24	; 0x03
    681c:	9c 83       	std	Y+4, r25	; 0x04
    681e:	a5 01       	movw	r20, r10
    6820:	94 01       	movw	r18, r8
    6822:	c5 01       	movw	r24, r10
    6824:	b4 01       	movw	r22, r8
    6826:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    682a:	9b 01       	movw	r18, r22
    682c:	ac 01       	movw	r20, r24
    682e:	69 81       	ldd	r22, Y+1	; 0x01
    6830:	7a 81       	ldd	r23, Y+2	; 0x02
    6832:	8b 81       	ldd	r24, Y+3	; 0x03
    6834:	9c 81       	ldd	r25, Y+4	; 0x04
    6836:	0e 94 b8 3f 	call	0x7f70	; 0x7f70 <__addsf3>
    683a:	0e 94 e0 42 	call	0x85c0	; 0x85c0 <sqrt>
    683e:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    6842:	60 93 87 06 	sts	0x0687, r22	; 0x800687 <_ZL17osd_home_distance>
    6846:	70 93 88 06 	sts	0x0688, r23	; 0x800688 <_ZL17osd_home_distance+0x1>
    684a:	80 93 89 06 	sts	0x0689, r24	; 0x800689 <_ZL17osd_home_distance+0x2>
    684e:	90 93 8a 06 	sts	0x068A, r25	; 0x80068a <_ZL17osd_home_distance+0x3>
    6852:	c5 01       	movw	r24, r10
    6854:	b4 01       	movw	r22, r8
    6856:	9f 77       	andi	r25, 0x7F	; 127
    6858:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    685c:	70 93 85 06 	sts	0x0685, r23	; 0x800685 <_ZL5dst_x+0x1>
    6860:	60 93 84 06 	sts	0x0684, r22	; 0x800684 <_ZL5dst_x>
    6864:	c3 01       	movw	r24, r6
    6866:	b2 01       	movw	r22, r4
    6868:	9f 77       	andi	r25, 0x7F	; 127
    686a:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    686e:	70 93 83 06 	sts	0x0683, r23	; 0x800683 <_ZL5dst_y+0x1>
    6872:	60 93 82 06 	sts	0x0682, r22	; 0x800682 <_ZL5dst_y>
    6876:	a3 01       	movw	r20, r6
    6878:	92 01       	movw	r18, r4
    687a:	50 58       	subi	r21, 0x80	; 128
    687c:	c5 01       	movw	r24, r10
    687e:	b4 01       	movw	r22, r8
    6880:	0e 94 37 40 	call	0x806e	; 0x806e <atan2>
    6884:	20 91 80 06 	lds	r18, 0x0680	; 0x800680 <_ZL11osd_heading>
    6888:	30 91 81 06 	lds	r19, 0x0681	; 0x800681 <_ZL11osd_heading+0x1>
    688c:	06 ea       	ldi	r16, 0xA6	; 166
    688e:	1f ef       	ldi	r17, 0xFF	; 255
    6890:	02 1b       	sub	r16, r18
    6892:	13 0b       	sbc	r17, r19
    6894:	20 ee       	ldi	r18, 0xE0	; 224
    6896:	3e e2       	ldi	r19, 0x2E	; 46
    6898:	45 e6       	ldi	r20, 0x65	; 101
    689a:	52 e4       	ldi	r21, 0x42	; 66
    689c:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    68a0:	0e 94 12 41 	call	0x8224	; 0x8224 <__fixsfsi>
    68a4:	c8 01       	movw	r24, r16
    68a6:	86 0f       	add	r24, r22
    68a8:	97 1f       	adc	r25, r23
    68aa:	0e 94 34 18 	call	0x3068	; 0x3068 <_Z15normalize_anglei>
    68ae:	0e 94 6e 18 	call	0x30dc	; 0x30dc <_Z12grad_to_secti>
    68b2:	80 93 86 06 	sts	0x0686, r24	; 0x800686 <_ZL18osd_home_direction>
    68b6:	0e 94 24 1c 	call	0x3848	; 0x3848 <_Z12setFdataVarsv>
    68ba:	c7 01       	movw	r24, r14
    68bc:	b6 01       	movw	r22, r12
    68be:	0e 94 6a 20 	call	0x40d4	; 0x40d4 <_Z11writePanelsm>
    68c2:	81 e0       	ldi	r24, 0x01	; 1
    68c4:	80 93 ef 03 	sts	0x03EF, r24	; 0x8003ef <update_screen>
    68c8:	80 91 aa 06 	lds	r24, 0x06AA	; 0x8006aa <_ZL10timer_20ms>
    68cc:	90 91 ab 06 	lds	r25, 0x06AB	; 0x8006ab <_ZL10timer_20ms+0x1>
    68d0:	a0 91 ac 06 	lds	r26, 0x06AC	; 0x8006ac <_ZL10timer_20ms+0x2>
    68d4:	b0 91 ad 06 	lds	r27, 0x06AD	; 0x8006ad <_ZL10timer_20ms+0x3>
    68d8:	8c 15       	cp	r24, r12
    68da:	9d 05       	cpc	r25, r13
    68dc:	ae 05       	cpc	r26, r14
    68de:	bf 05       	cpc	r27, r15
    68e0:	b8 f4       	brcc	.+46     	; 0x6910 <loop+0x832>
    68e2:	64 e1       	ldi	r22, 0x14	; 20
    68e4:	70 e0       	ldi	r23, 0x00	; 0
    68e6:	8a ea       	ldi	r24, 0xAA	; 170
    68e8:	96 e0       	ldi	r25, 0x06	; 6
    68ea:	0e 94 c6 14 	call	0x298c	; 0x298c <_Z9long_plusPmj>
    68ee:	0e 94 65 27 	call	0x4eca	; 0x4eca <_Z6On20msv>
    68f2:	80 91 ef 03 	lds	r24, 0x03EF	; 0x8003ef <update_screen>
    68f6:	88 23       	and	r24, r24
    68f8:	59 f0       	breq	.+22     	; 0x6910 <loop+0x832>
    68fa:	80 91 b3 03 	lds	r24, 0x03B3	; 0x8003b3 <vsync_wait>
    68fe:	88 23       	and	r24, r24
    6900:	39 f0       	breq	.+14     	; 0x6910 <loop+0x832>
    6902:	8e ea       	ldi	r24, 0xAE	; 174
    6904:	93 e0       	ldi	r25, 0x03	; 3
    6906:	0e 94 40 18 	call	0x3080	; 0x3080 <_Z10time_sincePm>
    690a:	c3 97       	sbiw	r24, 0x33	; 51
    690c:	08 f0       	brcs	.+2      	; 0x6910 <loop+0x832>
    690e:	2e c1       	rjmp	.+604    	; 0x6b6c <loop+0xa8e>
    6910:	80 91 a6 06 	lds	r24, 0x06A6	; 0x8006a6 <_ZL11timer_100ms>
    6914:	90 91 a7 06 	lds	r25, 0x06A7	; 0x8006a7 <_ZL11timer_100ms+0x1>
    6918:	a0 91 a8 06 	lds	r26, 0x06A8	; 0x8006a8 <_ZL11timer_100ms+0x2>
    691c:	b0 91 a9 06 	lds	r27, 0x06A9	; 0x8006a9 <_ZL11timer_100ms+0x3>
    6920:	8c 15       	cp	r24, r12
    6922:	9d 05       	cpc	r25, r13
    6924:	ae 05       	cpc	r26, r14
    6926:	bf 05       	cpc	r27, r15
    6928:	30 f5       	brcc	.+76     	; 0x6976 <loop+0x898>
    692a:	64 e6       	ldi	r22, 0x64	; 100
    692c:	70 e0       	ldi	r23, 0x00	; 0
    692e:	86 ea       	ldi	r24, 0xA6	; 166
    6930:	96 e0       	ldi	r25, 0x06	; 6
    6932:	0e 94 c6 14 	call	0x298c	; 0x298c <_Z9long_plusPmj>
    6936:	0e 94 0e 25 	call	0x4a1c	; 0x4a1c <_Z7On100msv>
    693a:	90 91 c4 03 	lds	r25, 0x03C4	; 0x8003c4 <lflags+0x10>
    693e:	81 e0       	ldi	r24, 0x01	; 1
    6940:	89 27       	eor	r24, r25
    6942:	80 93 c4 03 	sts	0x03C4, r24	; 0x8003c4 <lflags+0x10>
    6946:	88 23       	and	r24, r24
    6948:	b1 f0       	breq	.+44     	; 0x6976 <loop+0x898>
    694a:	80 91 d2 03 	lds	r24, 0x03D2	; 0x8003d2 <skip_inc>
    694e:	88 23       	and	r24, r24
    6950:	69 f0       	breq	.+26     	; 0x696c <loop+0x88e>
    6952:	8f 5f       	subi	r24, 0xFF	; 255
    6954:	80 93 d2 03 	sts	0x03D2, r24	; 0x8003d2 <skip_inc>
    6958:	83 30       	cpi	r24, 0x03	; 3
    695a:	68 f0       	brcs	.+26     	; 0x6976 <loop+0x898>
    695c:	80 91 31 04 	lds	r24, 0x0431	; 0x800431 <count02s>
    6960:	8f 5f       	subi	r24, 0xFF	; 255
    6962:	80 93 31 04 	sts	0x0431, r24	; 0x800431 <count02s>
    6966:	10 92 d2 03 	sts	0x03D2, r1	; 0x8003d2 <skip_inc>
    696a:	05 c0       	rjmp	.+10     	; 0x6976 <loop+0x898>
    696c:	80 91 31 04 	lds	r24, 0x0431	; 0x800431 <count02s>
    6970:	8f 5f       	subi	r24, 0xFF	; 255
    6972:	80 93 31 04 	sts	0x0431, r24	; 0x800431 <count02s>
    6976:	80 91 a2 06 	lds	r24, 0x06A2	; 0x8006a2 <_ZL11timer_500ms>
    697a:	90 91 a3 06 	lds	r25, 0x06A3	; 0x8006a3 <_ZL11timer_500ms+0x1>
    697e:	a0 91 a4 06 	lds	r26, 0x06A4	; 0x8006a4 <_ZL11timer_500ms+0x2>
    6982:	b0 91 a5 06 	lds	r27, 0x06A5	; 0x8006a5 <_ZL11timer_500ms+0x3>
    6986:	8c 15       	cp	r24, r12
    6988:	9d 05       	cpc	r25, r13
    698a:	ae 05       	cpc	r26, r14
    698c:	bf 05       	cpc	r27, r15
    698e:	08 f0       	brcs	.+2      	; 0x6992 <loop+0x8b4>
    6990:	99 c0       	rjmp	.+306    	; 0x6ac4 <loop+0x9e6>
    6992:	64 ef       	ldi	r22, 0xF4	; 244
    6994:	71 e0       	ldi	r23, 0x01	; 1
    6996:	82 ea       	ldi	r24, 0xA2	; 162
    6998:	96 e0       	ldi	r25, 0x06	; 6
    699a:	0e 94 c6 14 	call	0x298c	; 0x298c <_Z9long_plusPmj>
    699e:	81 e0       	ldi	r24, 0x01	; 1
    69a0:	80 93 b4 03 	sts	0x03B4, r24	; 0x8003b4 <lflags>
    69a4:	80 93 c3 03 	sts	0x03C3, r24	; 0x8003c3 <lflags+0xf>
    69a8:	80 91 32 04 	lds	r24, 0x0432	; 0x800432 <count05s>
    69ac:	8f 5f       	subi	r24, 0xFF	; 255
    69ae:	80 93 32 04 	sts	0x0432, r24	; 0x800432 <count05s>
    69b2:	8b e1       	ldi	r24, 0x1B	; 27
    69b4:	0e 94 05 37 	call	0x6e0a	; 0x6e0a <digitalRead>
    69b8:	61 e0       	ldi	r22, 0x01	; 1
    69ba:	81 11       	cpse	r24, r1
    69bc:	60 e0       	ldi	r22, 0x00	; 0
    69be:	8b e1       	ldi	r24, 0x1B	; 27
    69c0:	0e 94 e5 36 	call	0x6dca	; 0x6dca <digitalWrite>
    69c4:	80 91 c0 03 	lds	r24, 0x03C0	; 0x8003c0 <lflags+0xc>
    69c8:	91 e0       	ldi	r25, 0x01	; 1
    69ca:	89 27       	eor	r24, r25
    69cc:	80 93 c0 03 	sts	0x03C0, r24	; 0x8003c0 <lflags+0xc>
    69d0:	88 23       	and	r24, r24
    69d2:	09 f4       	brne	.+2      	; 0x69d6 <loop+0x8f8>
    69d4:	77 c0       	rjmp	.+238    	; 0x6ac4 <loop+0x9e6>
    69d6:	90 93 ba 03 	sts	0x03BA, r25	; 0x8003ba <lflags+0x6>
    69da:	80 91 cf 03 	lds	r24, 0x03CF	; 0x8003cf <lflags+0x1b>
    69de:	88 23       	and	r24, r24
    69e0:	99 f0       	breq	.+38     	; 0x6a08 <loop+0x92a>
    69e2:	80 91 86 03 	lds	r24, 0x0386	; 0x800386 <day_seconds>
    69e6:	90 91 87 03 	lds	r25, 0x0387	; 0x800387 <day_seconds+0x1>
    69ea:	a0 91 88 03 	lds	r26, 0x0388	; 0x800388 <day_seconds+0x2>
    69ee:	b0 91 89 03 	lds	r27, 0x0389	; 0x800389 <day_seconds+0x3>
    69f2:	01 96       	adiw	r24, 0x01	; 1
    69f4:	a1 1d       	adc	r26, r1
    69f6:	b1 1d       	adc	r27, r1
    69f8:	80 93 86 03 	sts	0x0386, r24	; 0x800386 <day_seconds>
    69fc:	90 93 87 03 	sts	0x0387, r25	; 0x800387 <day_seconds+0x1>
    6a00:	a0 93 88 03 	sts	0x0388, r26	; 0x800388 <day_seconds+0x2>
    6a04:	b0 93 89 03 	sts	0x0389, r27	; 0x800389 <day_seconds+0x3>
    6a08:	80 91 3a 03 	lds	r24, 0x033A	; 0x80033a <vas_vsync>
    6a0c:	88 23       	and	r24, r24
    6a0e:	09 f4       	brne	.+2      	; 0x6a12 <loop+0x934>
    6a10:	b4 c0       	rjmp	.+360    	; 0x6b7a <loop+0xa9c>
    6a12:	80 91 b2 03 	lds	r24, 0x03B2	; 0x8003b2 <vsync_count>
    6a16:	85 30       	cpi	r24, 0x05	; 5
    6a18:	08 f0       	brcs	.+2      	; 0x6a1c <loop+0x93e>
    6a1a:	af c0       	rjmp	.+350    	; 0x6b7a <loop+0xa9c>
    6a1c:	80 91 00 07 	lds	r24, 0x0700	; 0x800700 <_ZL17max7456_err_count>
    6a20:	8f 5f       	subi	r24, 0xFF	; 255
    6a22:	80 93 00 07 	sts	0x0700, r24	; 0x800700 <_ZL17max7456_err_count>
    6a26:	84 30       	cpi	r24, 0x04	; 4
    6a28:	b0 f0       	brcs	.+44     	; 0x6a56 <loop+0x978>
    6a2a:	80 91 b2 03 	lds	r24, 0x03B2	; 0x8003b2 <vsync_count>
    6a2e:	1f 92       	push	r1
    6a30:	8f 93       	push	r24
    6a32:	84 e8       	ldi	r24, 0x84	; 132
    6a34:	91 e0       	ldi	r25, 0x01	; 1
    6a36:	9f 93       	push	r25
    6a38:	8f 93       	push	r24
    6a3a:	83 e5       	ldi	r24, 0x53	; 83
    6a3c:	93 e0       	ldi	r25, 0x03	; 3
    6a3e:	9f 93       	push	r25
    6a40:	8f 93       	push	r24
    6a42:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    6a46:	0e 94 3b 08 	call	0x1076	; 0x1076 <_ZN3OSD5resetEv>
    6a4a:	0f 90       	pop	r0
    6a4c:	0f 90       	pop	r0
    6a4e:	0f 90       	pop	r0
    6a50:	0f 90       	pop	r0
    6a52:	0f 90       	pop	r0
    6a54:	0f 90       	pop	r0
    6a56:	10 92 b2 03 	sts	0x03B2, r1	; 0x8003b2 <vsync_count>
    6a5a:	0e 94 8d 29 	call	0x531a	; 0x531a <_Z9heartBeatv>
    6a5e:	80 91 63 06 	lds	r24, 0x0663	; 0x800663 <_ZL7seconds>
    6a62:	90 91 64 06 	lds	r25, 0x0664	; 0x800664 <_ZL7seconds+0x1>
    6a66:	6e e1       	ldi	r22, 0x1E	; 30
    6a68:	70 e0       	ldi	r23, 0x00	; 0
    6a6a:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    6a6e:	89 2b       	or	r24, r25
    6a70:	49 f5       	brne	.+82     	; 0x6ac4 <loop+0x9e6>
    6a72:	80 91 dd 03 	lds	r24, 0x03DD	; 0x8003dd <lost_bytes>
    6a76:	90 91 de 03 	lds	r25, 0x03DE	; 0x8003de <lost_bytes+0x1>
    6a7a:	9f 93       	push	r25
    6a7c:	8f 93       	push	r24
    6a7e:	80 91 e0 03 	lds	r24, 0x03E0	; 0x8003e0 <max_dly+0x1>
    6a82:	8f 93       	push	r24
    6a84:	80 91 df 03 	lds	r24, 0x03DF	; 0x8003df <max_dly>
    6a88:	8f 93       	push	r24
    6a8a:	84 e6       	ldi	r24, 0x64	; 100
    6a8c:	91 e0       	ldi	r25, 0x01	; 1
    6a8e:	9f 93       	push	r25
    6a90:	8f 93       	push	r24
    6a92:	03 e5       	ldi	r16, 0x53	; 83
    6a94:	13 e0       	ldi	r17, 0x03	; 3
    6a96:	1f 93       	push	r17
    6a98:	0f 93       	push	r16
    6a9a:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    6a9e:	80 91 11 01 	lds	r24, 0x0111	; 0x800111 <stack_bottom>
    6aa2:	90 91 12 01 	lds	r25, 0x0112	; 0x800112 <stack_bottom+0x1>
    6aa6:	9f 93       	push	r25
    6aa8:	8f 93       	push	r24
    6aaa:	81 e5       	ldi	r24, 0x51	; 81
    6aac:	91 e0       	ldi	r25, 0x01	; 1
    6aae:	9f 93       	push	r25
    6ab0:	8f 93       	push	r24
    6ab2:	1f 93       	push	r17
    6ab4:	0f 93       	push	r16
    6ab6:	0e 94 e3 3a 	call	0x75c6	; 0x75c6 <_ZN12BetterStream9_printf_PEPKcz>
    6aba:	0f b6       	in	r0, 0x3f	; 63
    6abc:	f8 94       	cli
    6abe:	de bf       	out	0x3e, r29	; 62
    6ac0:	0f be       	out	0x3f, r0	; 63
    6ac2:	cd bf       	out	0x3d, r28	; 61
    6ac4:	0e 94 0e 36 	call	0x6c1c	; 0x6c1c <millis>
    6ac8:	6c 19       	sub	r22, r12
    6aca:	7d 09       	sbc	r23, r13
    6acc:	80 91 df 03 	lds	r24, 0x03DF	; 0x8003df <max_dly>
    6ad0:	90 91 e0 03 	lds	r25, 0x03E0	; 0x8003e0 <max_dly+0x1>
    6ad4:	86 17       	cp	r24, r22
    6ad6:	97 07       	cpc	r25, r23
    6ad8:	08 f0       	brcs	.+2      	; 0x6adc <loop+0x9fe>
    6ada:	52 c0       	rjmp	.+164    	; 0x6b80 <loop+0xaa2>
    6adc:	70 93 e0 03 	sts	0x03E0, r23	; 0x8003e0 <max_dly+0x1>
    6ae0:	60 93 df 03 	sts	0x03DF, r22	; 0x8003df <max_dly>
    6ae4:	4d c0       	rjmp	.+154    	; 0x6b80 <loop+0xaa2>
    6ae6:	80 91 65 06 	lds	r24, 0x0665	; 0x800665 <_ZL12osd_throttle>
    6aea:	83 33       	cpi	r24, 0x33	; 51
    6aec:	08 f4       	brcc	.+2      	; 0x6af0 <loop+0xa12>
    6aee:	34 ce       	rjmp	.-920    	; 0x6758 <loop+0x67a>
    6af0:	20 91 16 01 	lds	r18, 0x0116	; 0x800116 <_ZL15takeoff_heading>
    6af4:	30 91 17 01 	lds	r19, 0x0117	; 0x800117 <_ZL15takeoff_heading+0x1>
    6af8:	20 37       	cpi	r18, 0x70	; 112
    6afa:	3e 4f       	sbci	r19, 0xFE	; 254
    6afc:	09 f0       	breq	.+2      	; 0x6b00 <loop+0xa22>
    6afe:	2c ce       	rjmp	.-936    	; 0x6758 <loop+0x67a>
    6b00:	20 91 80 06 	lds	r18, 0x0680	; 0x800680 <_ZL11osd_heading>
    6b04:	30 91 81 06 	lds	r19, 0x0681	; 0x800681 <_ZL11osd_heading+0x1>
    6b08:	30 93 17 01 	sts	0x0117, r19	; 0x800117 <_ZL15takeoff_heading+0x1>
    6b0c:	20 93 16 01 	sts	0x0116, r18	; 0x800116 <_ZL15takeoff_heading>
    6b10:	23 ce       	rjmp	.-954    	; 0x6758 <loop+0x67a>
    6b12:	93 30       	cpi	r25, 0x03	; 3
    6b14:	08 f4       	brcc	.+2      	; 0x6b18 <loop+0xa3a>
    6b16:	3b ce       	rjmp	.-906    	; 0x678e <loop+0x6b0>
    6b18:	8c e0       	ldi	r24, 0x0C	; 12
    6b1a:	e5 e4       	ldi	r30, 0x45	; 69
    6b1c:	f4 e0       	ldi	r31, 0x04	; 4
    6b1e:	a9 e3       	ldi	r26, 0x39	; 57
    6b20:	b4 e0       	ldi	r27, 0x04	; 4
    6b22:	01 90       	ld	r0, Z+
    6b24:	0d 92       	st	X+, r0
    6b26:	8a 95       	dec	r24
    6b28:	e1 f7       	brne	.-8      	; 0x6b22 <loop+0xa44>
    6b2a:	81 e0       	ldi	r24, 0x01	; 1
    6b2c:	80 93 c2 03 	sts	0x03C2, r24	; 0x8003c2 <lflags+0xe>
    6b30:	80 91 7c 06 	lds	r24, 0x067C	; 0x80067c <_ZL11osd_alt_mav>
    6b34:	90 91 7d 06 	lds	r25, 0x067D	; 0x80067d <_ZL11osd_alt_mav+0x1>
    6b38:	a0 91 7e 06 	lds	r26, 0x067E	; 0x80067e <_ZL11osd_alt_mav+0x2>
    6b3c:	b0 91 7f 06 	lds	r27, 0x067F	; 0x80067f <_ZL11osd_alt_mav+0x3>
    6b40:	80 93 78 06 	sts	0x0678, r24	; 0x800678 <_ZL12home_alt_mav>
    6b44:	90 93 79 06 	sts	0x0679, r25	; 0x800679 <_ZL12home_alt_mav+0x1>
    6b48:	a0 93 7a 06 	sts	0x067A, r26	; 0x80067a <_ZL12home_alt_mav+0x2>
    6b4c:	b0 93 7b 06 	sts	0x067B, r27	; 0x80067b <_ZL12home_alt_mav+0x3>
    6b50:	1e ce       	rjmp	.-964    	; 0x678e <loop+0x6b0>
    6b52:	80 ff       	sbrs	r24, 0
    6b54:	17 ce       	rjmp	.-978    	; 0x6784 <loop+0x6a6>
    6b56:	20 91 d1 03 	lds	r18, 0x03D1	; 0x8003d1 <lflags+0x1d>
    6b5a:	22 23       	and	r18, r18
    6b5c:	09 f4       	brne	.+2      	; 0x6b60 <loop+0xa82>
    6b5e:	12 ce       	rjmp	.-988    	; 0x6784 <loop+0x6a6>
    6b60:	10 92 c2 03 	sts	0x03C2, r1	; 0x8003c2 <lflags+0xe>
    6b64:	8e 7f       	andi	r24, 0xFE	; 254
    6b66:	80 93 bd 03 	sts	0x03BD, r24	; 0x8003bd <lflags+0x9>
    6b6a:	0c ce       	rjmp	.-1000   	; 0x6784 <loop+0x6a6>
    6b6c:	10 92 b3 03 	sts	0x03B3, r1	; 0x8003b3 <vsync_wait>
    6b70:	0e 94 d9 08 	call	0x11b2	; 0x11b2 <_ZN3OSD6updateEv>
    6b74:	10 92 ef 03 	sts	0x03EF, r1	; 0x8003ef <update_screen>
    6b78:	cb ce       	rjmp	.-618    	; 0x6910 <loop+0x832>
    6b7a:	10 92 00 07 	sts	0x0700, r1	; 0x800700 <_ZL17max7456_err_count>
    6b7e:	6b cf       	rjmp	.-298    	; 0x6a56 <loop+0x978>
    6b80:	24 96       	adiw	r28, 0x04	; 4
    6b82:	e2 e1       	ldi	r30, 0x12	; 18
    6b84:	0c 94 85 44 	jmp	0x890a	; 0x890a <__epilogue_restores__>

00006b88 <__vector_18>:
    6b88:	1f 92       	push	r1
    6b8a:	0f 92       	push	r0
    6b8c:	0f b6       	in	r0, 0x3f	; 63
    6b8e:	0f 92       	push	r0
    6b90:	11 24       	eor	r1, r1
    6b92:	2f 93       	push	r18
    6b94:	3f 93       	push	r19
    6b96:	8f 93       	push	r24
    6b98:	9f 93       	push	r25
    6b9a:	af 93       	push	r26
    6b9c:	bf 93       	push	r27
    6b9e:	80 91 01 07 	lds	r24, 0x0701	; 0x800701 <timer0_millis>
    6ba2:	90 91 02 07 	lds	r25, 0x0702	; 0x800702 <timer0_millis+0x1>
    6ba6:	a0 91 03 07 	lds	r26, 0x0703	; 0x800703 <timer0_millis+0x2>
    6baa:	b0 91 04 07 	lds	r27, 0x0704	; 0x800704 <timer0_millis+0x3>
    6bae:	30 91 09 07 	lds	r19, 0x0709	; 0x800709 <timer0_fract>
    6bb2:	23 e0       	ldi	r18, 0x03	; 3
    6bb4:	23 0f       	add	r18, r19
    6bb6:	2d 37       	cpi	r18, 0x7D	; 125
    6bb8:	20 f4       	brcc	.+8      	; 0x6bc2 <__vector_18+0x3a>
    6bba:	01 96       	adiw	r24, 0x01	; 1
    6bbc:	a1 1d       	adc	r26, r1
    6bbe:	b1 1d       	adc	r27, r1
    6bc0:	05 c0       	rjmp	.+10     	; 0x6bcc <__vector_18+0x44>
    6bc2:	26 e8       	ldi	r18, 0x86	; 134
    6bc4:	23 0f       	add	r18, r19
    6bc6:	02 96       	adiw	r24, 0x02	; 2
    6bc8:	a1 1d       	adc	r26, r1
    6bca:	b1 1d       	adc	r27, r1
    6bcc:	20 93 09 07 	sts	0x0709, r18	; 0x800709 <timer0_fract>
    6bd0:	80 93 01 07 	sts	0x0701, r24	; 0x800701 <timer0_millis>
    6bd4:	90 93 02 07 	sts	0x0702, r25	; 0x800702 <timer0_millis+0x1>
    6bd8:	a0 93 03 07 	sts	0x0703, r26	; 0x800703 <timer0_millis+0x2>
    6bdc:	b0 93 04 07 	sts	0x0704, r27	; 0x800704 <timer0_millis+0x3>
    6be0:	80 91 05 07 	lds	r24, 0x0705	; 0x800705 <timer0_overflow_count>
    6be4:	90 91 06 07 	lds	r25, 0x0706	; 0x800706 <timer0_overflow_count+0x1>
    6be8:	a0 91 07 07 	lds	r26, 0x0707	; 0x800707 <timer0_overflow_count+0x2>
    6bec:	b0 91 08 07 	lds	r27, 0x0708	; 0x800708 <timer0_overflow_count+0x3>
    6bf0:	01 96       	adiw	r24, 0x01	; 1
    6bf2:	a1 1d       	adc	r26, r1
    6bf4:	b1 1d       	adc	r27, r1
    6bf6:	80 93 05 07 	sts	0x0705, r24	; 0x800705 <timer0_overflow_count>
    6bfa:	90 93 06 07 	sts	0x0706, r25	; 0x800706 <timer0_overflow_count+0x1>
    6bfe:	a0 93 07 07 	sts	0x0707, r26	; 0x800707 <timer0_overflow_count+0x2>
    6c02:	b0 93 08 07 	sts	0x0708, r27	; 0x800708 <timer0_overflow_count+0x3>
    6c06:	bf 91       	pop	r27
    6c08:	af 91       	pop	r26
    6c0a:	9f 91       	pop	r25
    6c0c:	8f 91       	pop	r24
    6c0e:	3f 91       	pop	r19
    6c10:	2f 91       	pop	r18
    6c12:	0f 90       	pop	r0
    6c14:	0f be       	out	0x3f, r0	; 63
    6c16:	0f 90       	pop	r0
    6c18:	1f 90       	pop	r1
    6c1a:	18 95       	reti

00006c1c <millis>:
    6c1c:	2f b7       	in	r18, 0x3f	; 63
    6c1e:	f8 94       	cli
    6c20:	60 91 01 07 	lds	r22, 0x0701	; 0x800701 <timer0_millis>
    6c24:	70 91 02 07 	lds	r23, 0x0702	; 0x800702 <timer0_millis+0x1>
    6c28:	80 91 03 07 	lds	r24, 0x0703	; 0x800703 <timer0_millis+0x2>
    6c2c:	90 91 04 07 	lds	r25, 0x0704	; 0x800704 <timer0_millis+0x3>
    6c30:	2f bf       	out	0x3f, r18	; 63
    6c32:	08 95       	ret

00006c34 <micros>:
    6c34:	3f b7       	in	r19, 0x3f	; 63
    6c36:	f8 94       	cli
    6c38:	80 91 05 07 	lds	r24, 0x0705	; 0x800705 <timer0_overflow_count>
    6c3c:	90 91 06 07 	lds	r25, 0x0706	; 0x800706 <timer0_overflow_count+0x1>
    6c40:	a0 91 07 07 	lds	r26, 0x0707	; 0x800707 <timer0_overflow_count+0x2>
    6c44:	b0 91 08 07 	lds	r27, 0x0708	; 0x800708 <timer0_overflow_count+0x3>
    6c48:	26 b5       	in	r18, 0x26	; 38
    6c4a:	a8 9b       	sbis	0x15, 0	; 21
    6c4c:	05 c0       	rjmp	.+10     	; 0x6c58 <micros+0x24>
    6c4e:	2f 3f       	cpi	r18, 0xFF	; 255
    6c50:	19 f0       	breq	.+6      	; 0x6c58 <micros+0x24>
    6c52:	01 96       	adiw	r24, 0x01	; 1
    6c54:	a1 1d       	adc	r26, r1
    6c56:	b1 1d       	adc	r27, r1
    6c58:	3f bf       	out	0x3f, r19	; 63
    6c5a:	ba 2f       	mov	r27, r26
    6c5c:	a9 2f       	mov	r26, r25
    6c5e:	98 2f       	mov	r25, r24
    6c60:	88 27       	eor	r24, r24
    6c62:	82 0f       	add	r24, r18
    6c64:	91 1d       	adc	r25, r1
    6c66:	a1 1d       	adc	r26, r1
    6c68:	b1 1d       	adc	r27, r1
    6c6a:	bc 01       	movw	r22, r24
    6c6c:	cd 01       	movw	r24, r26
    6c6e:	42 e0       	ldi	r20, 0x02	; 2
    6c70:	66 0f       	add	r22, r22
    6c72:	77 1f       	adc	r23, r23
    6c74:	88 1f       	adc	r24, r24
    6c76:	99 1f       	adc	r25, r25
    6c78:	4a 95       	dec	r20
    6c7a:	d1 f7       	brne	.-12     	; 0x6c70 <micros+0x3c>
    6c7c:	08 95       	ret

00006c7e <delay>:
    6c7e:	8f 92       	push	r8
    6c80:	9f 92       	push	r9
    6c82:	af 92       	push	r10
    6c84:	bf 92       	push	r11
    6c86:	cf 92       	push	r12
    6c88:	df 92       	push	r13
    6c8a:	ef 92       	push	r14
    6c8c:	ff 92       	push	r15
    6c8e:	6b 01       	movw	r12, r22
    6c90:	7c 01       	movw	r14, r24
    6c92:	0e 94 1a 36 	call	0x6c34	; 0x6c34 <micros>
    6c96:	4b 01       	movw	r8, r22
    6c98:	5c 01       	movw	r10, r24
    6c9a:	c1 14       	cp	r12, r1
    6c9c:	d1 04       	cpc	r13, r1
    6c9e:	e1 04       	cpc	r14, r1
    6ca0:	f1 04       	cpc	r15, r1
    6ca2:	01 f1       	breq	.+64     	; 0x6ce4 <delay+0x66>
    6ca4:	0e 94 1d 37 	call	0x6e3a	; 0x6e3a <yield>
    6ca8:	0e 94 1a 36 	call	0x6c34	; 0x6c34 <micros>
    6cac:	dc 01       	movw	r26, r24
    6cae:	cb 01       	movw	r24, r22
    6cb0:	88 19       	sub	r24, r8
    6cb2:	99 09       	sbc	r25, r9
    6cb4:	aa 09       	sbc	r26, r10
    6cb6:	bb 09       	sbc	r27, r11
    6cb8:	88 3e       	cpi	r24, 0xE8	; 232
    6cba:	93 40       	sbci	r25, 0x03	; 3
    6cbc:	a1 05       	cpc	r26, r1
    6cbe:	b1 05       	cpc	r27, r1
    6cc0:	60 f3       	brcs	.-40     	; 0x6c9a <delay+0x1c>
    6cc2:	21 e0       	ldi	r18, 0x01	; 1
    6cc4:	c2 1a       	sub	r12, r18
    6cc6:	d1 08       	sbc	r13, r1
    6cc8:	e1 08       	sbc	r14, r1
    6cca:	f1 08       	sbc	r15, r1
    6ccc:	88 ee       	ldi	r24, 0xE8	; 232
    6cce:	88 0e       	add	r8, r24
    6cd0:	83 e0       	ldi	r24, 0x03	; 3
    6cd2:	98 1e       	adc	r9, r24
    6cd4:	a1 1c       	adc	r10, r1
    6cd6:	b1 1c       	adc	r11, r1
    6cd8:	c1 14       	cp	r12, r1
    6cda:	d1 04       	cpc	r13, r1
    6cdc:	e1 04       	cpc	r14, r1
    6cde:	f1 04       	cpc	r15, r1
    6ce0:	19 f7       	brne	.-58     	; 0x6ca8 <delay+0x2a>
    6ce2:	db cf       	rjmp	.-74     	; 0x6c9a <delay+0x1c>
    6ce4:	ff 90       	pop	r15
    6ce6:	ef 90       	pop	r14
    6ce8:	df 90       	pop	r13
    6cea:	cf 90       	pop	r12
    6cec:	bf 90       	pop	r11
    6cee:	af 90       	pop	r10
    6cf0:	9f 90       	pop	r9
    6cf2:	8f 90       	pop	r8
    6cf4:	08 95       	ret

00006cf6 <delayMicroseconds>:
    6cf6:	82 30       	cpi	r24, 0x02	; 2
    6cf8:	91 05       	cpc	r25, r1
    6cfa:	38 f0       	brcs	.+14     	; 0x6d0a <delayMicroseconds+0x14>
    6cfc:	88 0f       	add	r24, r24
    6cfe:	99 1f       	adc	r25, r25
    6d00:	88 0f       	add	r24, r24
    6d02:	99 1f       	adc	r25, r25
    6d04:	05 97       	sbiw	r24, 0x05	; 5
    6d06:	01 97       	sbiw	r24, 0x01	; 1
    6d08:	f1 f7       	brne	.-4      	; 0x6d06 <delayMicroseconds+0x10>
    6d0a:	08 95       	ret

00006d0c <init>:
    6d0c:	78 94       	sei
    6d0e:	84 b5       	in	r24, 0x24	; 36
    6d10:	82 60       	ori	r24, 0x02	; 2
    6d12:	84 bd       	out	0x24, r24	; 36
    6d14:	84 b5       	in	r24, 0x24	; 36
    6d16:	81 60       	ori	r24, 0x01	; 1
    6d18:	84 bd       	out	0x24, r24	; 36
    6d1a:	85 b5       	in	r24, 0x25	; 37
    6d1c:	82 60       	ori	r24, 0x02	; 2
    6d1e:	85 bd       	out	0x25, r24	; 37
    6d20:	85 b5       	in	r24, 0x25	; 37
    6d22:	81 60       	ori	r24, 0x01	; 1
    6d24:	85 bd       	out	0x25, r24	; 37
    6d26:	ee e6       	ldi	r30, 0x6E	; 110
    6d28:	f0 e0       	ldi	r31, 0x00	; 0
    6d2a:	80 81       	ld	r24, Z
    6d2c:	81 60       	ori	r24, 0x01	; 1
    6d2e:	80 83       	st	Z, r24
    6d30:	ea e7       	ldi	r30, 0x7A	; 122
    6d32:	f0 e0       	ldi	r31, 0x00	; 0
    6d34:	80 81       	ld	r24, Z
    6d36:	84 60       	ori	r24, 0x04	; 4
    6d38:	80 83       	st	Z, r24
    6d3a:	80 81       	ld	r24, Z
    6d3c:	82 60       	ori	r24, 0x02	; 2
    6d3e:	80 83       	st	Z, r24
    6d40:	80 81       	ld	r24, Z
    6d42:	81 60       	ori	r24, 0x01	; 1
    6d44:	80 83       	st	Z, r24
    6d46:	80 81       	ld	r24, Z
    6d48:	80 68       	ori	r24, 0x80	; 128
    6d4a:	80 83       	st	Z, r24
    6d4c:	10 92 c1 00 	sts	0x00C1, r1	; 0x8000c1 <__data_load_end+0x7f76fd>
    6d50:	08 95       	ret

00006d52 <pinMode>:
    6d52:	cf 93       	push	r28
    6d54:	df 93       	push	r29
    6d56:	90 e0       	ldi	r25, 0x00	; 0
    6d58:	fc 01       	movw	r30, r24
    6d5a:	e6 54       	subi	r30, 0x46	; 70
    6d5c:	f5 4f       	sbci	r31, 0xF5	; 245
    6d5e:	24 91       	lpm	r18, Z
    6d60:	fc 01       	movw	r30, r24
    6d62:	e2 53       	subi	r30, 0x32	; 50
    6d64:	f5 4f       	sbci	r31, 0xF5	; 245
    6d66:	84 91       	lpm	r24, Z
    6d68:	88 23       	and	r24, r24
    6d6a:	61 f1       	breq	.+88     	; 0x6dc4 <pinMode+0x72>
    6d6c:	90 e0       	ldi	r25, 0x00	; 0
    6d6e:	88 0f       	add	r24, r24
    6d70:	99 1f       	adc	r25, r25
    6d72:	fc 01       	movw	r30, r24
    6d74:	ea 50       	subi	r30, 0x0A	; 10
    6d76:	f5 4f       	sbci	r31, 0xF5	; 245
    6d78:	c5 91       	lpm	r28, Z+
    6d7a:	d4 91       	lpm	r29, Z
    6d7c:	fc 01       	movw	r30, r24
    6d7e:	e4 51       	subi	r30, 0x14	; 20
    6d80:	f5 4f       	sbci	r31, 0xF5	; 245
    6d82:	a5 91       	lpm	r26, Z+
    6d84:	b4 91       	lpm	r27, Z
    6d86:	61 11       	cpse	r22, r1
    6d88:	09 c0       	rjmp	.+18     	; 0x6d9c <pinMode+0x4a>
    6d8a:	9f b7       	in	r25, 0x3f	; 63
    6d8c:	f8 94       	cli
    6d8e:	88 81       	ld	r24, Y
    6d90:	20 95       	com	r18
    6d92:	82 23       	and	r24, r18
    6d94:	88 83       	st	Y, r24
    6d96:	ec 91       	ld	r30, X
    6d98:	2e 23       	and	r18, r30
    6d9a:	0b c0       	rjmp	.+22     	; 0x6db2 <pinMode+0x60>
    6d9c:	62 30       	cpi	r22, 0x02	; 2
    6d9e:	61 f4       	brne	.+24     	; 0x6db8 <pinMode+0x66>
    6da0:	9f b7       	in	r25, 0x3f	; 63
    6da2:	f8 94       	cli
    6da4:	38 81       	ld	r19, Y
    6da6:	82 2f       	mov	r24, r18
    6da8:	80 95       	com	r24
    6daa:	83 23       	and	r24, r19
    6dac:	88 83       	st	Y, r24
    6dae:	ec 91       	ld	r30, X
    6db0:	2e 2b       	or	r18, r30
    6db2:	2c 93       	st	X, r18
    6db4:	9f bf       	out	0x3f, r25	; 63
    6db6:	06 c0       	rjmp	.+12     	; 0x6dc4 <pinMode+0x72>
    6db8:	8f b7       	in	r24, 0x3f	; 63
    6dba:	f8 94       	cli
    6dbc:	e8 81       	ld	r30, Y
    6dbe:	2e 2b       	or	r18, r30
    6dc0:	28 83       	st	Y, r18
    6dc2:	8f bf       	out	0x3f, r24	; 63
    6dc4:	df 91       	pop	r29
    6dc6:	cf 91       	pop	r28
    6dc8:	08 95       	ret

00006dca <digitalWrite>:
    6dca:	90 e0       	ldi	r25, 0x00	; 0
    6dcc:	fc 01       	movw	r30, r24
    6dce:	e6 54       	subi	r30, 0x46	; 70
    6dd0:	f5 4f       	sbci	r31, 0xF5	; 245
    6dd2:	24 91       	lpm	r18, Z
    6dd4:	fc 01       	movw	r30, r24
    6dd6:	e2 53       	subi	r30, 0x32	; 50
    6dd8:	f5 4f       	sbci	r31, 0xF5	; 245
    6dda:	e4 91       	lpm	r30, Z
    6ddc:	ee 23       	and	r30, r30
    6dde:	a1 f0       	breq	.+40     	; 0x6e08 <digitalWrite+0x3e>
    6de0:	f0 e0       	ldi	r31, 0x00	; 0
    6de2:	ee 0f       	add	r30, r30
    6de4:	ff 1f       	adc	r31, r31
    6de6:	e4 51       	subi	r30, 0x14	; 20
    6de8:	f5 4f       	sbci	r31, 0xF5	; 245
    6dea:	a5 91       	lpm	r26, Z+
    6dec:	b4 91       	lpm	r27, Z
    6dee:	8f b7       	in	r24, 0x3f	; 63
    6df0:	f8 94       	cli
    6df2:	61 11       	cpse	r22, r1
    6df4:	05 c0       	rjmp	.+10     	; 0x6e00 <digitalWrite+0x36>
    6df6:	9c 91       	ld	r25, X
    6df8:	e2 2f       	mov	r30, r18
    6dfa:	e0 95       	com	r30
    6dfc:	e9 23       	and	r30, r25
    6dfe:	02 c0       	rjmp	.+4      	; 0x6e04 <digitalWrite+0x3a>
    6e00:	ec 91       	ld	r30, X
    6e02:	e2 2b       	or	r30, r18
    6e04:	ec 93       	st	X, r30
    6e06:	8f bf       	out	0x3f, r24	; 63
    6e08:	08 95       	ret

00006e0a <digitalRead>:
    6e0a:	90 e0       	ldi	r25, 0x00	; 0
    6e0c:	fc 01       	movw	r30, r24
    6e0e:	e6 54       	subi	r30, 0x46	; 70
    6e10:	f5 4f       	sbci	r31, 0xF5	; 245
    6e12:	24 91       	lpm	r18, Z
    6e14:	fc 01       	movw	r30, r24
    6e16:	e2 53       	subi	r30, 0x32	; 50
    6e18:	f5 4f       	sbci	r31, 0xF5	; 245
    6e1a:	e4 91       	lpm	r30, Z
    6e1c:	ee 23       	and	r30, r30
    6e1e:	59 f0       	breq	.+22     	; 0x6e36 <digitalRead+0x2c>
    6e20:	f0 e0       	ldi	r31, 0x00	; 0
    6e22:	ee 0f       	add	r30, r30
    6e24:	ff 1f       	adc	r31, r31
    6e26:	ee 51       	subi	r30, 0x1E	; 30
    6e28:	f5 4f       	sbci	r31, 0xF5	; 245
    6e2a:	a5 91       	lpm	r26, Z+
    6e2c:	b4 91       	lpm	r27, Z
    6e2e:	ec 91       	ld	r30, X
    6e30:	e2 23       	and	r30, r18
    6e32:	81 e0       	ldi	r24, 0x01	; 1
    6e34:	09 f4       	brne	.+2      	; 0x6e38 <digitalRead+0x2e>
    6e36:	80 e0       	ldi	r24, 0x00	; 0
    6e38:	08 95       	ret

00006e3a <yield>:
    6e3a:	08 95       	ret

00006e3c <pulseIn>:
    6e3c:	0f 93       	push	r16
    6e3e:	1f 93       	push	r17
    6e40:	90 e0       	ldi	r25, 0x00	; 0
    6e42:	fc 01       	movw	r30, r24
    6e44:	e6 54       	subi	r30, 0x46	; 70
    6e46:	f5 4f       	sbci	r31, 0xF5	; 245
    6e48:	74 91       	lpm	r23, Z
    6e4a:	fc 01       	movw	r30, r24
    6e4c:	e2 53       	subi	r30, 0x32	; 50
    6e4e:	f5 4f       	sbci	r31, 0xF5	; 245
    6e50:	e4 91       	lpm	r30, Z
    6e52:	66 23       	and	r22, r22
    6e54:	11 f0       	breq	.+4      	; 0x6e5a <pulseIn+0x1e>
    6e56:	67 2f       	mov	r22, r23
    6e58:	01 c0       	rjmp	.+2      	; 0x6e5c <pulseIn+0x20>
    6e5a:	60 e0       	ldi	r22, 0x00	; 0
    6e5c:	f0 e0       	ldi	r31, 0x00	; 0
    6e5e:	ee 0f       	add	r30, r30
    6e60:	ff 1f       	adc	r31, r31
    6e62:	ee 51       	subi	r30, 0x1E	; 30
    6e64:	f5 4f       	sbci	r31, 0xF5	; 245
    6e66:	85 91       	lpm	r24, Z+
    6e68:	94 91       	lpm	r25, Z
    6e6a:	89 01       	movw	r16, r18
    6e6c:	9a 01       	movw	r18, r20
    6e6e:	3f 70       	andi	r19, 0x0F	; 15
    6e70:	46 2f       	mov	r20, r22
    6e72:	67 2f       	mov	r22, r23
    6e74:	0e 94 2c 06 	call	0xc58	; 0xc58 <countPulseASM>
    6e78:	61 15       	cp	r22, r1
    6e7a:	71 05       	cpc	r23, r1
    6e7c:	81 05       	cpc	r24, r1
    6e7e:	91 05       	cpc	r25, r1
    6e80:	49 f0       	breq	.+18     	; 0x6e94 <pulseIn+0x58>
    6e82:	dc 01       	movw	r26, r24
    6e84:	cb 01       	movw	r24, r22
    6e86:	01 96       	adiw	r24, 0x01	; 1
    6e88:	a1 1d       	adc	r26, r1
    6e8a:	b1 1d       	adc	r27, r1
    6e8c:	bc 01       	movw	r22, r24
    6e8e:	cd 01       	movw	r24, r26
    6e90:	9f 70       	andi	r25, 0x0F	; 15
    6e92:	03 c0       	rjmp	.+6      	; 0x6e9a <pulseIn+0x5e>
    6e94:	60 e0       	ldi	r22, 0x00	; 0
    6e96:	70 e0       	ldi	r23, 0x00	; 0
    6e98:	cb 01       	movw	r24, r22
    6e9a:	1f 91       	pop	r17
    6e9c:	0f 91       	pop	r16
    6e9e:	08 95       	ret

00006ea0 <analogReference>:
    6ea0:	80 93 19 01 	sts	0x0119, r24	; 0x800119 <analog_reference>
    6ea4:	08 95       	ret

00006ea6 <analogRead>:
    6ea6:	88 31       	cpi	r24, 0x18	; 24
    6ea8:	08 f0       	brcs	.+2      	; 0x6eac <analogRead+0x6>
    6eaa:	88 51       	subi	r24, 0x18	; 24
    6eac:	87 70       	andi	r24, 0x07	; 7
    6eae:	20 91 19 01 	lds	r18, 0x0119	; 0x800119 <analog_reference>
    6eb2:	90 e4       	ldi	r25, 0x40	; 64
    6eb4:	29 9f       	mul	r18, r25
    6eb6:	90 01       	movw	r18, r0
    6eb8:	11 24       	eor	r1, r1
    6eba:	82 2b       	or	r24, r18
    6ebc:	80 93 7c 00 	sts	0x007C, r24	; 0x80007c <__data_load_end+0x7f76b8>
    6ec0:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__data_load_end+0x7f76b6>
    6ec4:	80 64       	ori	r24, 0x40	; 64
    6ec6:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__data_load_end+0x7f76b6>
    6eca:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__data_load_end+0x7f76b6>
    6ece:	86 fd       	sbrc	r24, 6
    6ed0:	fc cf       	rjmp	.-8      	; 0x6eca <analogRead+0x24>
    6ed2:	80 91 78 00 	lds	r24, 0x0078	; 0x800078 <__data_load_end+0x7f76b4>
    6ed6:	20 91 79 00 	lds	r18, 0x0079	; 0x800079 <__data_load_end+0x7f76b5>
    6eda:	90 e0       	ldi	r25, 0x00	; 0
    6edc:	92 2b       	or	r25, r18
    6ede:	08 95       	ret

00006ee0 <_ZN5Print5writeEPKhj>:
    6ee0:	a0 e0       	ldi	r26, 0x00	; 0
    6ee2:	b0 e0       	ldi	r27, 0x00	; 0
    6ee4:	e6 e7       	ldi	r30, 0x76	; 118
    6ee6:	f7 e3       	ldi	r31, 0x37	; 55
    6ee8:	0c 94 73 44 	jmp	0x88e6	; 0x88e6 <__prologue_saves__+0x14>
    6eec:	6c 01       	movw	r12, r24
    6eee:	7a 01       	movw	r14, r20
    6ef0:	8b 01       	movw	r16, r22
    6ef2:	c0 e0       	ldi	r28, 0x00	; 0
    6ef4:	d0 e0       	ldi	r29, 0x00	; 0
    6ef6:	ce 15       	cp	r28, r14
    6ef8:	df 05       	cpc	r29, r15
    6efa:	89 f0       	breq	.+34     	; 0x6f1e <_ZN5Print5writeEPKhj+0x3e>
    6efc:	d8 01       	movw	r26, r16
    6efe:	6d 91       	ld	r22, X+
    6f00:	8d 01       	movw	r16, r26
    6f02:	d6 01       	movw	r26, r12
    6f04:	ed 91       	ld	r30, X+
    6f06:	fc 91       	ld	r31, X
    6f08:	01 90       	ld	r0, Z+
    6f0a:	f0 81       	ld	r31, Z
    6f0c:	e0 2d       	mov	r30, r0
    6f0e:	c6 01       	movw	r24, r12
    6f10:	09 95       	icall
    6f12:	89 2b       	or	r24, r25
    6f14:	11 f4       	brne	.+4      	; 0x6f1a <_ZN5Print5writeEPKhj+0x3a>
    6f16:	7e 01       	movw	r14, r28
    6f18:	02 c0       	rjmp	.+4      	; 0x6f1e <_ZN5Print5writeEPKhj+0x3e>
    6f1a:	21 96       	adiw	r28, 0x01	; 1
    6f1c:	ec cf       	rjmp	.-40     	; 0x6ef6 <_ZN5Print5writeEPKhj+0x16>
    6f1e:	c7 01       	movw	r24, r14
    6f20:	cd b7       	in	r28, 0x3d	; 61
    6f22:	de b7       	in	r29, 0x3e	; 62
    6f24:	e8 e0       	ldi	r30, 0x08	; 8
    6f26:	0c 94 8f 44 	jmp	0x891e	; 0x891e <__epilogue_restores__+0x14>

00006f2a <_ZN5Print5writeEPKc>:
    6f2a:	61 15       	cp	r22, r1
    6f2c:	71 05       	cpc	r23, r1
    6f2e:	81 f0       	breq	.+32     	; 0x6f50 <_ZN5Print5writeEPKc+0x26>
    6f30:	fb 01       	movw	r30, r22
    6f32:	01 90       	ld	r0, Z+
    6f34:	00 20       	and	r0, r0
    6f36:	e9 f7       	brne	.-6      	; 0x6f32 <_ZN5Print5writeEPKc+0x8>
    6f38:	31 97       	sbiw	r30, 0x01	; 1
    6f3a:	af 01       	movw	r20, r30
    6f3c:	46 1b       	sub	r20, r22
    6f3e:	57 0b       	sbc	r21, r23
    6f40:	dc 01       	movw	r26, r24
    6f42:	ed 91       	ld	r30, X+
    6f44:	fc 91       	ld	r31, X
    6f46:	02 80       	ldd	r0, Z+2	; 0x02
    6f48:	f3 81       	ldd	r31, Z+3	; 0x03
    6f4a:	e0 2d       	mov	r30, r0
    6f4c:	09 95       	icall
    6f4e:	08 95       	ret
    6f50:	80 e0       	ldi	r24, 0x00	; 0
    6f52:	90 e0       	ldi	r25, 0x00	; 0
    6f54:	08 95       	ret

00006f56 <_ZN5Print5printEPKc>:
    6f56:	0e 94 95 37 	call	0x6f2a	; 0x6f2a <_ZN5Print5writeEPKc>
    6f5a:	08 95       	ret

00006f5c <_ZN5Print5printEc>:
    6f5c:	dc 01       	movw	r26, r24
    6f5e:	ed 91       	ld	r30, X+
    6f60:	fc 91       	ld	r31, X
    6f62:	01 90       	ld	r0, Z+
    6f64:	f0 81       	ld	r31, Z
    6f66:	e0 2d       	mov	r30, r0
    6f68:	09 95       	icall
    6f6a:	08 95       	ret

00006f6c <_ZN5Print7printlnEv>:
    6f6c:	65 e3       	ldi	r22, 0x35	; 53
    6f6e:	71 e0       	ldi	r23, 0x01	; 1
    6f70:	0e 94 95 37 	call	0x6f2a	; 0x6f2a <_ZN5Print5writeEPKc>
    6f74:	08 95       	ret

00006f76 <_ZN5Print11printNumberEmh>:
    6f76:	4f 92       	push	r4
    6f78:	5f 92       	push	r5
    6f7a:	6f 92       	push	r6
    6f7c:	7f 92       	push	r7
    6f7e:	ef 92       	push	r14
    6f80:	ff 92       	push	r15
    6f82:	0f 93       	push	r16
    6f84:	1f 93       	push	r17
    6f86:	cf 93       	push	r28
    6f88:	df 93       	push	r29
    6f8a:	cd b7       	in	r28, 0x3d	; 61
    6f8c:	de b7       	in	r29, 0x3e	; 62
    6f8e:	a1 97       	sbiw	r28, 0x21	; 33
    6f90:	0f b6       	in	r0, 0x3f	; 63
    6f92:	f8 94       	cli
    6f94:	de bf       	out	0x3e, r29	; 62
    6f96:	0f be       	out	0x3f, r0	; 63
    6f98:	cd bf       	out	0x3d, r28	; 61
    6f9a:	7c 01       	movw	r14, r24
    6f9c:	fa 01       	movw	r30, r20
    6f9e:	cb 01       	movw	r24, r22
    6fa0:	19 a2       	std	Y+33, r1	; 0x21
    6fa2:	22 30       	cpi	r18, 0x02	; 2
    6fa4:	08 f4       	brcc	.+2      	; 0x6fa8 <_ZN5Print11printNumberEmh+0x32>
    6fa6:	2a e0       	ldi	r18, 0x0A	; 10
    6fa8:	8e 01       	movw	r16, r28
    6faa:	0f 5d       	subi	r16, 0xDF	; 223
    6fac:	1f 4f       	sbci	r17, 0xFF	; 255
    6fae:	42 2e       	mov	r4, r18
    6fb0:	51 2c       	mov	r5, r1
    6fb2:	61 2c       	mov	r6, r1
    6fb4:	71 2c       	mov	r7, r1
    6fb6:	bf 01       	movw	r22, r30
    6fb8:	a3 01       	movw	r20, r6
    6fba:	92 01       	movw	r18, r4
    6fbc:	0e 94 b4 43 	call	0x8768	; 0x8768 <__udivmodsi4>
    6fc0:	f9 01       	movw	r30, r18
    6fc2:	ca 01       	movw	r24, r20
    6fc4:	01 50       	subi	r16, 0x01	; 1
    6fc6:	11 09       	sbc	r17, r1
    6fc8:	6a 30       	cpi	r22, 0x0A	; 10
    6fca:	14 f4       	brge	.+4      	; 0x6fd0 <_ZN5Print11printNumberEmh+0x5a>
    6fcc:	60 5d       	subi	r22, 0xD0	; 208
    6fce:	01 c0       	rjmp	.+2      	; 0x6fd2 <_ZN5Print11printNumberEmh+0x5c>
    6fd0:	69 5c       	subi	r22, 0xC9	; 201
    6fd2:	d8 01       	movw	r26, r16
    6fd4:	6c 93       	st	X, r22
    6fd6:	23 2b       	or	r18, r19
    6fd8:	24 2b       	or	r18, r20
    6fda:	25 2b       	or	r18, r21
    6fdc:	61 f7       	brne	.-40     	; 0x6fb6 <_ZN5Print11printNumberEmh+0x40>
    6fde:	b8 01       	movw	r22, r16
    6fe0:	c7 01       	movw	r24, r14
    6fe2:	0e 94 95 37 	call	0x6f2a	; 0x6f2a <_ZN5Print5writeEPKc>
    6fe6:	a1 96       	adiw	r28, 0x21	; 33
    6fe8:	0f b6       	in	r0, 0x3f	; 63
    6fea:	f8 94       	cli
    6fec:	de bf       	out	0x3e, r29	; 62
    6fee:	0f be       	out	0x3f, r0	; 63
    6ff0:	cd bf       	out	0x3d, r28	; 61
    6ff2:	df 91       	pop	r29
    6ff4:	cf 91       	pop	r28
    6ff6:	1f 91       	pop	r17
    6ff8:	0f 91       	pop	r16
    6ffa:	ff 90       	pop	r15
    6ffc:	ef 90       	pop	r14
    6ffe:	7f 90       	pop	r7
    7000:	6f 90       	pop	r6
    7002:	5f 90       	pop	r5
    7004:	4f 90       	pop	r4
    7006:	08 95       	ret

00007008 <_ZN5Print5printEmi>:
    7008:	21 15       	cp	r18, r1
    700a:	31 05       	cpc	r19, r1
    700c:	49 f4       	brne	.+18     	; 0x7020 <_ZN5Print5printEmi+0x18>
    700e:	dc 01       	movw	r26, r24
    7010:	ed 91       	ld	r30, X+
    7012:	fc 91       	ld	r31, X
    7014:	01 90       	ld	r0, Z+
    7016:	f0 81       	ld	r31, Z
    7018:	e0 2d       	mov	r30, r0
    701a:	64 2f       	mov	r22, r20
    701c:	09 95       	icall
    701e:	08 95       	ret
    7020:	0e 94 bb 37 	call	0x6f76	; 0x6f76 <_ZN5Print11printNumberEmh>
    7024:	08 95       	ret

00007026 <_ZN5Print7printlnEmi>:
    7026:	0f 93       	push	r16
    7028:	1f 93       	push	r17
    702a:	cf 93       	push	r28
    702c:	df 93       	push	r29
    702e:	ec 01       	movw	r28, r24
    7030:	0e 94 04 38 	call	0x7008	; 0x7008 <_ZN5Print5printEmi>
    7034:	8c 01       	movw	r16, r24
    7036:	ce 01       	movw	r24, r28
    7038:	0e 94 b6 37 	call	0x6f6c	; 0x6f6c <_ZN5Print7printlnEv>
    703c:	80 0f       	add	r24, r16
    703e:	91 1f       	adc	r25, r17
    7040:	df 91       	pop	r29
    7042:	cf 91       	pop	r28
    7044:	1f 91       	pop	r17
    7046:	0f 91       	pop	r16
    7048:	08 95       	ret

0000704a <_ZN5Print5printEji>:
    704a:	9a 01       	movw	r18, r20
    704c:	ab 01       	movw	r20, r22
    704e:	60 e0       	ldi	r22, 0x00	; 0
    7050:	70 e0       	ldi	r23, 0x00	; 0
    7052:	0e 94 04 38 	call	0x7008	; 0x7008 <_ZN5Print5printEmi>
    7056:	08 95       	ret

00007058 <_ZN5Print5printEli>:
    7058:	a0 e0       	ldi	r26, 0x00	; 0
    705a:	b0 e0       	ldi	r27, 0x00	; 0
    705c:	e2 e3       	ldi	r30, 0x32	; 50
    705e:	f8 e3       	ldi	r31, 0x38	; 56
    7060:	0c 94 73 44 	jmp	0x88e6	; 0x88e6 <__prologue_saves__+0x14>
    7064:	8c 01       	movw	r16, r24
    7066:	6a 01       	movw	r12, r20
    7068:	7b 01       	movw	r14, r22
    706a:	21 15       	cp	r18, r1
    706c:	31 05       	cpc	r19, r1
    706e:	49 f4       	brne	.+18     	; 0x7082 <_ZN5Print5printEli+0x2a>
    7070:	dc 01       	movw	r26, r24
    7072:	ed 91       	ld	r30, X+
    7074:	fc 91       	ld	r31, X
    7076:	01 90       	ld	r0, Z+
    7078:	f0 81       	ld	r31, Z
    707a:	e0 2d       	mov	r30, r0
    707c:	64 2f       	mov	r22, r20
    707e:	09 95       	icall
    7080:	1d c0       	rjmp	.+58     	; 0x70bc <_ZN5Print5printEli+0x64>
    7082:	2a 30       	cpi	r18, 0x0A	; 10
    7084:	31 05       	cpc	r19, r1
    7086:	a9 f4       	brne	.+42     	; 0x70b2 <_ZN5Print5printEli+0x5a>
    7088:	77 ff       	sbrs	r23, 7
    708a:	12 c0       	rjmp	.+36     	; 0x70b0 <_ZN5Print5printEli+0x58>
    708c:	6d e2       	ldi	r22, 0x2D	; 45
    708e:	0e 94 ae 37 	call	0x6f5c	; 0x6f5c <_ZN5Print5printEc>
    7092:	ec 01       	movw	r28, r24
    7094:	44 27       	eor	r20, r20
    7096:	55 27       	eor	r21, r21
    7098:	ba 01       	movw	r22, r20
    709a:	4c 19       	sub	r20, r12
    709c:	5d 09       	sbc	r21, r13
    709e:	6e 09       	sbc	r22, r14
    70a0:	7f 09       	sbc	r23, r15
    70a2:	2a e0       	ldi	r18, 0x0A	; 10
    70a4:	c8 01       	movw	r24, r16
    70a6:	0e 94 bb 37 	call	0x6f76	; 0x6f76 <_ZN5Print11printNumberEmh>
    70aa:	8c 0f       	add	r24, r28
    70ac:	9d 1f       	adc	r25, r29
    70ae:	06 c0       	rjmp	.+12     	; 0x70bc <_ZN5Print5printEli+0x64>
    70b0:	2a e0       	ldi	r18, 0x0A	; 10
    70b2:	b7 01       	movw	r22, r14
    70b4:	a6 01       	movw	r20, r12
    70b6:	c8 01       	movw	r24, r16
    70b8:	0e 94 bb 37 	call	0x6f76	; 0x6f76 <_ZN5Print11printNumberEmh>
    70bc:	cd b7       	in	r28, 0x3d	; 61
    70be:	de b7       	in	r29, 0x3e	; 62
    70c0:	e8 e0       	ldi	r30, 0x08	; 8
    70c2:	0c 94 8f 44 	jmp	0x891e	; 0x891e <__epilogue_restores__+0x14>

000070c6 <_ZN5Print5printEii>:
    70c6:	9a 01       	movw	r18, r20
    70c8:	ab 01       	movw	r20, r22
    70ca:	77 0f       	add	r23, r23
    70cc:	66 0b       	sbc	r22, r22
    70ce:	77 0b       	sbc	r23, r23
    70d0:	0e 94 2c 38 	call	0x7058	; 0x7058 <_ZN5Print5printEli>
    70d4:	08 95       	ret

000070d6 <initVariant>:
    70d6:	08 95       	ret

000070d8 <main>:
    70d8:	0e 94 86 36 	call	0x6d0c	; 0x6d0c <init>
    70dc:	0e 94 6b 38 	call	0x70d6	; 0x70d6 <initVariant>
    70e0:	0e 94 bc 27 	call	0x4f78	; 0x4f78 <setup>
    70e4:	0e 94 6f 30 	call	0x60de	; 0x60de <loop>
    70e8:	fd cf       	rjmp	.-6      	; 0x70e4 <main+0xc>

000070ea <_ZN10FastSerial5beginEl>:
    70ea:	0f 93       	push	r16
    70ec:	1f 93       	push	r17
    70ee:	dc 01       	movw	r26, r24
    70f0:	ed 91       	ld	r30, X+
    70f2:	fc 91       	ld	r31, X
    70f4:	02 88       	ldd	r0, Z+18	; 0x12
    70f6:	f3 89       	ldd	r31, Z+19	; 0x13
    70f8:	e0 2d       	mov	r30, r0
    70fa:	00 e0       	ldi	r16, 0x00	; 0
    70fc:	10 e0       	ldi	r17, 0x00	; 0
    70fe:	20 e0       	ldi	r18, 0x00	; 0
    7100:	30 e0       	ldi	r19, 0x00	; 0
    7102:	09 95       	icall
    7104:	1f 91       	pop	r17
    7106:	0f 91       	pop	r16
    7108:	08 95       	ret

0000710a <_ZN10FastSerial9availableEv>:
    710a:	dc 01       	movw	r26, r24
    710c:	53 96       	adiw	r26, 0x13	; 19
    710e:	2c 91       	ld	r18, X
    7110:	53 97       	sbiw	r26, 0x13	; 19
    7112:	22 23       	and	r18, r18
    7114:	61 f0       	breq	.+24     	; 0x712e <_ZN10FastSerial9availableEv+0x24>
    7116:	1f 96       	adiw	r26, 0x0f	; 15
    7118:	ed 91       	ld	r30, X+
    711a:	fc 91       	ld	r31, X
    711c:	50 97       	sbiw	r26, 0x10	; 16
    711e:	80 81       	ld	r24, Z
    7120:	91 81       	ldd	r25, Z+1	; 0x01
    7122:	22 81       	ldd	r18, Z+2	; 0x02
    7124:	33 81       	ldd	r19, Z+3	; 0x03
    7126:	82 1b       	sub	r24, r18
    7128:	94 81       	ldd	r25, Z+4	; 0x04
    712a:	89 23       	and	r24, r25
    712c:	08 95       	ret
    712e:	80 e0       	ldi	r24, 0x00	; 0
    7130:	08 95       	ret

00007132 <_ZN10FastSerial7txspaceEv>:
    7132:	dc 01       	movw	r26, r24
    7134:	53 96       	adiw	r26, 0x13	; 19
    7136:	2c 91       	ld	r18, X
    7138:	53 97       	sbiw	r26, 0x13	; 19
    713a:	22 23       	and	r18, r18
    713c:	71 f0       	breq	.+28     	; 0x715a <_ZN10FastSerial7txspaceEv+0x28>
    713e:	51 96       	adiw	r26, 0x11	; 17
    7140:	ed 91       	ld	r30, X+
    7142:	fc 91       	ld	r31, X
    7144:	52 97       	sbiw	r26, 0x12	; 18
    7146:	80 81       	ld	r24, Z
    7148:	91 81       	ldd	r25, Z+1	; 0x01
    714a:	22 81       	ldd	r18, Z+2	; 0x02
    714c:	33 81       	ldd	r19, Z+3	; 0x03
    714e:	82 1b       	sub	r24, r18
    7150:	80 95       	com	r24
    7152:	94 81       	ldd	r25, Z+4	; 0x04
    7154:	89 23       	and	r24, r25
    7156:	8f 5f       	subi	r24, 0xFF	; 255
    7158:	08 95       	ret
    715a:	80 e0       	ldi	r24, 0x00	; 0
    715c:	08 95       	ret

0000715e <_ZN10FastSerial4readEv>:
    715e:	dc 01       	movw	r26, r24
    7160:	53 96       	adiw	r26, 0x13	; 19
    7162:	2c 91       	ld	r18, X
    7164:	53 97       	sbiw	r26, 0x13	; 19
    7166:	22 23       	and	r18, r18
    7168:	59 f0       	breq	.+22     	; 0x7180 <_ZN10FastSerial4readEv+0x22>
    716a:	1f 96       	adiw	r26, 0x0f	; 15
    716c:	ed 91       	ld	r30, X+
    716e:	fc 91       	ld	r31, X
    7170:	50 97       	sbiw	r26, 0x10	; 16
    7172:	20 81       	ld	r18, Z
    7174:	31 81       	ldd	r19, Z+1	; 0x01
    7176:	82 81       	ldd	r24, Z+2	; 0x02
    7178:	93 81       	ldd	r25, Z+3	; 0x03
    717a:	28 17       	cp	r18, r24
    717c:	39 07       	cpc	r19, r25
    717e:	11 f4       	brne	.+4      	; 0x7184 <_ZN10FastSerial4readEv+0x26>
    7180:	80 e0       	ldi	r24, 0x00	; 0
    7182:	08 95       	ret
    7184:	82 81       	ldd	r24, Z+2	; 0x02
    7186:	93 81       	ldd	r25, Z+3	; 0x03
    7188:	a6 81       	ldd	r26, Z+6	; 0x06
    718a:	b7 81       	ldd	r27, Z+7	; 0x07
    718c:	a8 0f       	add	r26, r24
    718e:	b9 1f       	adc	r27, r25
    7190:	8c 91       	ld	r24, X
    7192:	22 81       	ldd	r18, Z+2	; 0x02
    7194:	33 81       	ldd	r19, Z+3	; 0x03
    7196:	2f 5f       	subi	r18, 0xFF	; 255
    7198:	3f 4f       	sbci	r19, 0xFF	; 255
    719a:	44 81       	ldd	r20, Z+4	; 0x04
    719c:	55 81       	ldd	r21, Z+5	; 0x05
    719e:	24 23       	and	r18, r20
    71a0:	35 23       	and	r19, r21
    71a2:	33 83       	std	Z+3, r19	; 0x03
    71a4:	22 83       	std	Z+2, r18	; 0x02
    71a6:	08 95       	ret

000071a8 <_ZN10FastSerial4peekEv>:
    71a8:	dc 01       	movw	r26, r24
    71aa:	53 96       	adiw	r26, 0x13	; 19
    71ac:	2c 91       	ld	r18, X
    71ae:	53 97       	sbiw	r26, 0x13	; 19
    71b0:	22 23       	and	r18, r18
    71b2:	59 f0       	breq	.+22     	; 0x71ca <_ZN10FastSerial4peekEv+0x22>
    71b4:	1f 96       	adiw	r26, 0x0f	; 15
    71b6:	ed 91       	ld	r30, X+
    71b8:	fc 91       	ld	r31, X
    71ba:	50 97       	sbiw	r26, 0x10	; 16
    71bc:	20 81       	ld	r18, Z
    71be:	31 81       	ldd	r19, Z+1	; 0x01
    71c0:	82 81       	ldd	r24, Z+2	; 0x02
    71c2:	93 81       	ldd	r25, Z+3	; 0x03
    71c4:	28 17       	cp	r18, r24
    71c6:	39 07       	cpc	r19, r25
    71c8:	11 f4       	brne	.+4      	; 0x71ce <_ZN10FastSerial4peekEv+0x26>
    71ca:	80 e0       	ldi	r24, 0x00	; 0
    71cc:	08 95       	ret
    71ce:	82 81       	ldd	r24, Z+2	; 0x02
    71d0:	93 81       	ldd	r25, Z+3	; 0x03
    71d2:	06 80       	ldd	r0, Z+6	; 0x06
    71d4:	f7 81       	ldd	r31, Z+7	; 0x07
    71d6:	e0 2d       	mov	r30, r0
    71d8:	e8 0f       	add	r30, r24
    71da:	f9 1f       	adc	r31, r25
    71dc:	80 81       	ld	r24, Z
    71de:	08 95       	ret

000071e0 <_ZN10FastSerial5flushEv>:
    71e0:	dc 01       	movw	r26, r24
    71e2:	1f 96       	adiw	r26, 0x0f	; 15
    71e4:	ed 91       	ld	r30, X+
    71e6:	fc 91       	ld	r31, X
    71e8:	50 97       	sbiw	r26, 0x10	; 16
    71ea:	22 81       	ldd	r18, Z+2	; 0x02
    71ec:	33 81       	ldd	r19, Z+3	; 0x03
    71ee:	31 83       	std	Z+1, r19	; 0x01
    71f0:	20 83       	st	Z, r18
    71f2:	51 96       	adiw	r26, 0x11	; 17
    71f4:	ed 91       	ld	r30, X+
    71f6:	fc 91       	ld	r31, X
    71f8:	52 97       	sbiw	r26, 0x12	; 18
    71fa:	80 81       	ld	r24, Z
    71fc:	91 81       	ldd	r25, Z+1	; 0x01
    71fe:	93 83       	std	Z+3, r25	; 0x03
    7200:	82 83       	std	Z+2, r24	; 0x02
    7202:	08 95       	ret

00007204 <_ZN10FastSerial5writeEh>:
    7204:	fc 01       	movw	r30, r24
    7206:	83 89       	ldd	r24, Z+19	; 0x13
    7208:	88 23       	and	r24, r24
    720a:	a9 f1       	breq	.+106    	; 0x7276 <_ZN10FastSerial5writeEh+0x72>
    720c:	a1 89       	ldd	r26, Z+17	; 0x11
    720e:	b2 89       	ldd	r27, Z+18	; 0x12
    7210:	8d 91       	ld	r24, X+
    7212:	9c 91       	ld	r25, X
    7214:	11 97       	sbiw	r26, 0x01	; 1
    7216:	01 96       	adiw	r24, 0x01	; 1
    7218:	14 96       	adiw	r26, 0x04	; 4
    721a:	2d 91       	ld	r18, X+
    721c:	3c 91       	ld	r19, X
    721e:	15 97       	sbiw	r26, 0x05	; 5
    7220:	82 23       	and	r24, r18
    7222:	93 23       	and	r25, r19
    7224:	24 89       	ldd	r18, Z+20	; 0x14
    7226:	22 23       	and	r18, r18
    7228:	39 f0       	breq	.+14     	; 0x7238 <_ZN10FastSerial5writeEh+0x34>
    722a:	12 96       	adiw	r26, 0x02	; 2
    722c:	2d 91       	ld	r18, X+
    722e:	3c 91       	ld	r19, X
    7230:	13 97       	sbiw	r26, 0x03	; 3
    7232:	82 17       	cp	r24, r18
    7234:	93 07       	cpc	r25, r19
    7236:	f9 f0       	breq	.+62     	; 0x7276 <_ZN10FastSerial5writeEh+0x72>
    7238:	12 96       	adiw	r26, 0x02	; 2
    723a:	2d 91       	ld	r18, X+
    723c:	3c 91       	ld	r19, X
    723e:	13 97       	sbiw	r26, 0x03	; 3
    7240:	82 17       	cp	r24, r18
    7242:	93 07       	cpc	r25, r19
    7244:	c9 f3       	breq	.-14     	; 0x7238 <_ZN10FastSerial5writeEh+0x34>
    7246:	2d 91       	ld	r18, X+
    7248:	3c 91       	ld	r19, X
    724a:	11 97       	sbiw	r26, 0x01	; 1
    724c:	16 96       	adiw	r26, 0x06	; 6
    724e:	0d 90       	ld	r0, X+
    7250:	bc 91       	ld	r27, X
    7252:	a0 2d       	mov	r26, r0
    7254:	a2 0f       	add	r26, r18
    7256:	b3 1f       	adc	r27, r19
    7258:	6c 93       	st	X, r22
    725a:	a1 89       	ldd	r26, Z+17	; 0x11
    725c:	b2 89       	ldd	r27, Z+18	; 0x12
    725e:	11 96       	adiw	r26, 0x01	; 1
    7260:	9c 93       	st	X, r25
    7262:	8e 93       	st	-X, r24
    7264:	a2 85       	ldd	r26, Z+10	; 0x0a
    7266:	b3 85       	ldd	r27, Z+11	; 0x0b
    7268:	9c 91       	ld	r25, X
    726a:	86 85       	ldd	r24, Z+14	; 0x0e
    726c:	89 2b       	or	r24, r25
    726e:	8c 93       	st	X, r24
    7270:	81 e0       	ldi	r24, 0x01	; 1
    7272:	90 e0       	ldi	r25, 0x00	; 0
    7274:	08 95       	ret
    7276:	80 e0       	ldi	r24, 0x00	; 0
    7278:	90 e0       	ldi	r25, 0x00	; 0
    727a:	08 95       	ret

0000727c <_ZN10FastSerialC1EhPVhS1_S1_S1_hhh>:
    727c:	8f 92       	push	r8
    727e:	af 92       	push	r10
    7280:	cf 92       	push	r12
    7282:	ef 92       	push	r14
    7284:	ff 92       	push	r15
    7286:	0f 93       	push	r16
    7288:	1f 93       	push	r17
    728a:	cf 93       	push	r28
    728c:	df 93       	push	r29
    728e:	cd b7       	in	r28, 0x3d	; 61
    7290:	de b7       	in	r29, 0x3e	; 62
    7292:	fc 01       	movw	r30, r24
    7294:	13 82       	std	Z+3, r1	; 0x03
    7296:	12 82       	std	Z+2, r1	; 0x02
    7298:	80 e4       	ldi	r24, 0x40	; 64
    729a:	91 e0       	ldi	r25, 0x01	; 1
    729c:	91 83       	std	Z+1, r25	; 0x01
    729e:	80 83       	st	Z, r24
    72a0:	55 83       	std	Z+5, r21	; 0x05
    72a2:	44 83       	std	Z+4, r20	; 0x04
    72a4:	37 83       	std	Z+7, r19	; 0x07
    72a6:	26 83       	std	Z+6, r18	; 0x06
    72a8:	11 87       	std	Z+9, r17	; 0x09
    72aa:	00 87       	std	Z+8, r16	; 0x08
    72ac:	f3 86       	std	Z+11, r15	; 0x0b
    72ae:	e2 86       	std	Z+10, r14	; 0x0a
    72b0:	c4 86       	std	Z+12, r12	; 0x0c
    72b2:	a5 86       	std	Z+13, r10	; 0x0d
    72b4:	86 86       	std	Z+14, r8	; 0x0e
    72b6:	28 e0       	ldi	r18, 0x08	; 8
    72b8:	62 9f       	mul	r22, r18
    72ba:	c0 01       	movw	r24, r0
    72bc:	11 24       	eor	r1, r1
    72be:	9c 01       	movw	r18, r24
    72c0:	25 5e       	subi	r18, 0xE5	; 229
    72c2:	38 4f       	sbci	r19, 0xF8	; 248
    72c4:	30 8b       	std	Z+16, r19	; 0x10
    72c6:	27 87       	std	Z+15, r18	; 0x0f
    72c8:	85 5f       	subi	r24, 0xF5	; 245
    72ca:	98 4f       	sbci	r25, 0xF8	; 248
    72cc:	92 8b       	std	Z+18, r25	; 0x12
    72ce:	81 8b       	std	Z+17, r24	; 0x11
    72d0:	81 e0       	ldi	r24, 0x01	; 1
    72d2:	90 e0       	ldi	r25, 0x00	; 0
    72d4:	01 c0       	rjmp	.+2      	; 0x72d8 <_ZN10FastSerialC1EhPVhS1_S1_S1_hhh+0x5c>
    72d6:	88 0f       	add	r24, r24
    72d8:	6a 95       	dec	r22
    72da:	ea f7       	brpl	.-6      	; 0x72d6 <_ZN10FastSerialC1EhPVhS1_S1_S1_hhh+0x5a>
    72dc:	90 91 0a 07 	lds	r25, 0x070A	; 0x80070a <_ZN10FastSerial18_serialInitializedE>
    72e0:	89 2b       	or	r24, r25
    72e2:	80 93 0a 07 	sts	0x070A, r24	; 0x80070a <_ZN10FastSerial18_serialInitializedE>
    72e6:	40 e0       	ldi	r20, 0x00	; 0
    72e8:	51 ee       	ldi	r21, 0xE1	; 225
    72ea:	60 e0       	ldi	r22, 0x00	; 0
    72ec:	70 e0       	ldi	r23, 0x00	; 0
    72ee:	cf 01       	movw	r24, r30
    72f0:	0e 94 75 38 	call	0x70ea	; 0x70ea <_ZN10FastSerial5beginEl>
    72f4:	df 91       	pop	r29
    72f6:	cf 91       	pop	r28
    72f8:	1f 91       	pop	r17
    72fa:	0f 91       	pop	r16
    72fc:	ff 90       	pop	r15
    72fe:	ef 90       	pop	r14
    7300:	cf 90       	pop	r12
    7302:	af 90       	pop	r10
    7304:	8f 90       	pop	r8
    7306:	08 95       	ret

00007308 <_ZN10FastSerial4waitEv>:
    7308:	dc 01       	movw	r26, r24
    730a:	51 96       	adiw	r26, 0x11	; 17
    730c:	ed 91       	ld	r30, X+
    730e:	fc 91       	ld	r31, X
    7310:	52 97       	sbiw	r26, 0x12	; 18
    7312:	22 81       	ldd	r18, Z+2	; 0x02
    7314:	33 81       	ldd	r19, Z+3	; 0x03
    7316:	80 81       	ld	r24, Z
    7318:	91 81       	ldd	r25, Z+1	; 0x01
    731a:	28 17       	cp	r18, r24
    731c:	39 07       	cpc	r19, r25
    731e:	c9 f7       	brne	.-14     	; 0x7312 <_ZN10FastSerial4waitEv+0xa>
    7320:	08 95       	ret

00007322 <_ZN10FastSerial12_allocBufferEPNS_6BufferEj>:
    7322:	0f 93       	push	r16
    7324:	1f 93       	push	r17
    7326:	cf 93       	push	r28
    7328:	df 93       	push	r29
    732a:	8c 01       	movw	r16, r24
    732c:	fc 01       	movw	r30, r24
    732e:	13 82       	std	Z+3, r1	; 0x03
    7330:	12 82       	std	Z+2, r1	; 0x02
    7332:	11 82       	std	Z+1, r1	; 0x01
    7334:	10 82       	st	Z, r1
    7336:	81 e0       	ldi	r24, 0x01	; 1
    7338:	a1 e0       	ldi	r26, 0x01	; 1
    733a:	b0 e0       	ldi	r27, 0x00	; 0
    733c:	48 2f       	mov	r20, r24
    733e:	fd 01       	movw	r30, r26
    7340:	08 2e       	mov	r0, r24
    7342:	02 c0       	rjmp	.+4      	; 0x7348 <_ZN10FastSerial12_allocBufferEPNS_6BufferEj+0x26>
    7344:	ee 0f       	add	r30, r30
    7346:	ff 1f       	adc	r31, r31
    7348:	0a 94       	dec	r0
    734a:	e2 f7       	brpl	.-8      	; 0x7344 <_ZN10FastSerial12_allocBufferEPNS_6BufferEj+0x22>
    734c:	9b 01       	movw	r18, r22
    734e:	61 30       	cpi	r22, 0x01	; 1
    7350:	92 e0       	ldi	r25, 0x02	; 2
    7352:	79 07       	cpc	r23, r25
    7354:	10 f0       	brcs	.+4      	; 0x735a <_ZN10FastSerial12_allocBufferEPNS_6BufferEj+0x38>
    7356:	20 e0       	ldi	r18, 0x00	; 0
    7358:	32 e0       	ldi	r19, 0x02	; 2
    735a:	e2 17       	cp	r30, r18
    735c:	f3 07       	cpc	r31, r19
    735e:	10 f4       	brcc	.+4      	; 0x7364 <_ZN10FastSerial12_allocBufferEPNS_6BufferEj+0x42>
    7360:	8f 5f       	subi	r24, 0xFF	; 255
    7362:	ec cf       	rjmp	.-40     	; 0x733c <_ZN10FastSerial12_allocBufferEPNS_6BufferEj+0x1a>
    7364:	c1 e0       	ldi	r28, 0x01	; 1
    7366:	d0 e0       	ldi	r29, 0x00	; 0
    7368:	02 c0       	rjmp	.+4      	; 0x736e <_ZN10FastSerial12_allocBufferEPNS_6BufferEj+0x4c>
    736a:	cc 0f       	add	r28, r28
    736c:	dd 1f       	adc	r29, r29
    736e:	4a 95       	dec	r20
    7370:	e2 f7       	brpl	.-8      	; 0x736a <_ZN10FastSerial12_allocBufferEPNS_6BufferEj+0x48>
    7372:	21 97       	sbiw	r28, 0x01	; 1
    7374:	f8 01       	movw	r30, r16
    7376:	86 81       	ldd	r24, Z+6	; 0x06
    7378:	97 81       	ldd	r25, Z+7	; 0x07
    737a:	00 97       	sbiw	r24, 0x00	; 0
    737c:	39 f0       	breq	.+14     	; 0x738c <_ZN10FastSerial12_allocBufferEPNS_6BufferEj+0x6a>
    737e:	24 81       	ldd	r18, Z+4	; 0x04
    7380:	35 81       	ldd	r19, Z+5	; 0x05
    7382:	2c 17       	cp	r18, r28
    7384:	3d 07       	cpc	r19, r29
    7386:	91 f0       	breq	.+36     	; 0x73ac <_ZN10FastSerial12_allocBufferEPNS_6BufferEj+0x8a>
    7388:	0e 94 06 3f 	call	0x7e0c	; 0x7e0c <free>
    738c:	f8 01       	movw	r30, r16
    738e:	d5 83       	std	Z+5, r29	; 0x05
    7390:	c4 83       	std	Z+4, r28	; 0x04
    7392:	ce 01       	movw	r24, r28
    7394:	01 96       	adiw	r24, 0x01	; 1
    7396:	0e 94 71 3e 	call	0x7ce2	; 0x7ce2 <malloc>
    739a:	9c 01       	movw	r18, r24
    739c:	f8 01       	movw	r30, r16
    739e:	97 83       	std	Z+7, r25	; 0x07
    73a0:	86 83       	std	Z+6, r24	; 0x06
    73a2:	81 e0       	ldi	r24, 0x01	; 1
    73a4:	23 2b       	or	r18, r19
    73a6:	19 f4       	brne	.+6      	; 0x73ae <_ZN10FastSerial12_allocBufferEPNS_6BufferEj+0x8c>
    73a8:	80 e0       	ldi	r24, 0x00	; 0
    73aa:	01 c0       	rjmp	.+2      	; 0x73ae <_ZN10FastSerial12_allocBufferEPNS_6BufferEj+0x8c>
    73ac:	81 e0       	ldi	r24, 0x01	; 1
    73ae:	df 91       	pop	r29
    73b0:	cf 91       	pop	r28
    73b2:	1f 91       	pop	r17
    73b4:	0f 91       	pop	r16
    73b6:	08 95       	ret

000073b8 <_ZN10FastSerial5beginEljj>:
    73b8:	8f 92       	push	r8
    73ba:	9f 92       	push	r9
    73bc:	af 92       	push	r10
    73be:	bf 92       	push	r11
    73c0:	ef 92       	push	r14
    73c2:	ff 92       	push	r15
    73c4:	0f 93       	push	r16
    73c6:	1f 93       	push	r17
    73c8:	cf 93       	push	r28
    73ca:	df 93       	push	r29
    73cc:	ec 01       	movw	r28, r24
    73ce:	4a 01       	movw	r8, r20
    73d0:	5b 01       	movw	r10, r22
    73d2:	79 01       	movw	r14, r18
    73d4:	8b 89       	ldd	r24, Y+19	; 0x13
    73d6:	88 23       	and	r24, r24
    73d8:	c9 f0       	breq	.+50     	; 0x740c <_ZN10FastSerial5beginEljj+0x54>
    73da:	23 2b       	or	r18, r19
    73dc:	39 f4       	brne	.+14     	; 0x73ec <_ZN10FastSerial5beginEljj+0x34>
    73de:	ef 85       	ldd	r30, Y+15	; 0x0f
    73e0:	f8 89       	ldd	r31, Y+16	; 0x10
    73e2:	e4 80       	ldd	r14, Z+4	; 0x04
    73e4:	f5 80       	ldd	r15, Z+5	; 0x05
    73e6:	8f ef       	ldi	r24, 0xFF	; 255
    73e8:	e8 1a       	sub	r14, r24
    73ea:	f8 0a       	sbc	r15, r24
    73ec:	01 15       	cp	r16, r1
    73ee:	11 05       	cpc	r17, r1
    73f0:	31 f4       	brne	.+12     	; 0x73fe <_ZN10FastSerial5beginEljj+0x46>
    73f2:	e9 89       	ldd	r30, Y+17	; 0x11
    73f4:	fa 89       	ldd	r31, Y+18	; 0x12
    73f6:	04 81       	ldd	r16, Z+4	; 0x04
    73f8:	15 81       	ldd	r17, Z+5	; 0x05
    73fa:	0f 5f       	subi	r16, 0xFF	; 255
    73fc:	1f 4f       	sbci	r17, 0xFF	; 255
    73fe:	e8 81       	ld	r30, Y
    7400:	f9 81       	ldd	r31, Y+1	; 0x01
    7402:	00 88       	ldd	r0, Z+16	; 0x10
    7404:	f1 89       	ldd	r31, Z+17	; 0x11
    7406:	e0 2d       	mov	r30, r0
    7408:	ce 01       	movw	r24, r28
    740a:	09 95       	icall
    740c:	e1 14       	cp	r14, r1
    740e:	f1 04       	cpc	r15, r1
    7410:	11 f0       	breq	.+4      	; 0x7416 <_ZN10FastSerial5beginEljj+0x5e>
    7412:	b7 01       	movw	r22, r14
    7414:	02 c0       	rjmp	.+4      	; 0x741a <_ZN10FastSerial5beginEljj+0x62>
    7416:	60 e8       	ldi	r22, 0x80	; 128
    7418:	70 e0       	ldi	r23, 0x00	; 0
    741a:	8f 85       	ldd	r24, Y+15	; 0x0f
    741c:	98 89       	ldd	r25, Y+16	; 0x10
    741e:	0e 94 91 39 	call	0x7322	; 0x7322 <_ZN10FastSerial12_allocBufferEPNS_6BufferEj>
    7422:	88 23       	and	r24, r24
    7424:	69 f0       	breq	.+26     	; 0x7440 <_ZN10FastSerial5beginEljj+0x88>
    7426:	01 15       	cp	r16, r1
    7428:	11 05       	cpc	r17, r1
    742a:	11 f0       	breq	.+4      	; 0x7430 <_ZN10FastSerial5beginEljj+0x78>
    742c:	b8 01       	movw	r22, r16
    742e:	02 c0       	rjmp	.+4      	; 0x7434 <_ZN10FastSerial5beginEljj+0x7c>
    7430:	60 e1       	ldi	r22, 0x10	; 16
    7432:	70 e0       	ldi	r23, 0x00	; 0
    7434:	89 89       	ldd	r24, Y+17	; 0x11
    7436:	9a 89       	ldd	r25, Y+18	; 0x12
    7438:	0e 94 91 39 	call	0x7322	; 0x7322 <_ZN10FastSerial12_allocBufferEPNS_6BufferEj>
    743c:	81 11       	cpse	r24, r1
    743e:	08 c0       	rjmp	.+16     	; 0x7450 <_ZN10FastSerial5beginEljj+0x98>
    7440:	e8 81       	ld	r30, Y
    7442:	f9 81       	ldd	r31, Y+1	; 0x01
    7444:	00 88       	ldd	r0, Z+16	; 0x10
    7446:	f1 89       	ldd	r31, Z+17	; 0x11
    7448:	e0 2d       	mov	r30, r0
    744a:	ce 01       	movw	r24, r28
    744c:	09 95       	icall
    744e:	49 c0       	rjmp	.+146    	; 0x74e2 <_ZN10FastSerial5beginEljj+0x12a>
    7450:	e9 89       	ldd	r30, Y+17	; 0x11
    7452:	fa 89       	ldd	r31, Y+18	; 0x12
    7454:	13 82       	std	Z+3, r1	; 0x03
    7456:	12 82       	std	Z+2, r1	; 0x02
    7458:	11 82       	std	Z+1, r1	; 0x01
    745a:	10 82       	st	Z, r1
    745c:	ef 85       	ldd	r30, Y+15	; 0x0f
    745e:	f8 89       	ldd	r31, Y+16	; 0x10
    7460:	13 82       	std	Z+3, r1	; 0x03
    7462:	12 82       	std	Z+2, r1	; 0x02
    7464:	11 82       	std	Z+1, r1	; 0x01
    7466:	10 82       	st	Z, r1
    7468:	81 e0       	ldi	r24, 0x01	; 1
    746a:	8b 8b       	std	Y+19, r24	; 0x13
    746c:	18 14       	cp	r1, r8
    746e:	19 04       	cpc	r1, r9
    7470:	1a 04       	cpc	r1, r10
    7472:	1b 04       	cpc	r1, r11
    7474:	5c f5       	brge	.+86     	; 0x74cc <_ZN10FastSerial5beginEljj+0x114>
    7476:	e8 85       	ldd	r30, Y+8	; 0x08
    7478:	f9 85       	ldd	r31, Y+9	; 0x09
    747a:	81 14       	cp	r8, r1
    747c:	81 ee       	ldi	r24, 0xE1	; 225
    747e:	98 06       	cpc	r9, r24
    7480:	a1 04       	cpc	r10, r1
    7482:	b1 04       	cpc	r11, r1
    7484:	51 f1       	breq	.+84     	; 0x74da <_ZN10FastSerial5beginEljj+0x122>
    7486:	81 e0       	ldi	r24, 0x01	; 1
    7488:	90 e0       	ldi	r25, 0x00	; 0
    748a:	0c 84       	ldd	r0, Y+12	; 0x0c
    748c:	02 c0       	rjmp	.+4      	; 0x7492 <_ZN10FastSerial5beginEljj+0xda>
    748e:	88 0f       	add	r24, r24
    7490:	99 1f       	adc	r25, r25
    7492:	0a 94       	dec	r0
    7494:	e2 f7       	brpl	.-8      	; 0x748e <_ZN10FastSerial5beginEljj+0xd6>
    7496:	80 83       	st	Z, r24
    7498:	60 e0       	ldi	r22, 0x00	; 0
    749a:	79 e0       	ldi	r23, 0x09	; 9
    749c:	8d e3       	ldi	r24, 0x3D	; 61
    749e:	90 e0       	ldi	r25, 0x00	; 0
    74a0:	a5 01       	movw	r20, r10
    74a2:	94 01       	movw	r18, r8
    74a4:	0e 94 d6 43 	call	0x87ac	; 0x87ac <__divmodsi4>
    74a8:	ca 01       	movw	r24, r20
    74aa:	b9 01       	movw	r22, r18
    74ac:	61 50       	subi	r22, 0x01	; 1
    74ae:	71 09       	sbc	r23, r1
    74b0:	81 09       	sbc	r24, r1
    74b2:	91 09       	sbc	r25, r1
    74b4:	22 e0       	ldi	r18, 0x02	; 2
    74b6:	30 e0       	ldi	r19, 0x00	; 0
    74b8:	40 e0       	ldi	r20, 0x00	; 0
    74ba:	50 e0       	ldi	r21, 0x00	; 0
    74bc:	0e 94 d6 43 	call	0x87ac	; 0x87ac <__divmodsi4>
    74c0:	ec 81       	ldd	r30, Y+4	; 0x04
    74c2:	fd 81       	ldd	r31, Y+5	; 0x05
    74c4:	30 83       	st	Z, r19
    74c6:	ee 81       	ldd	r30, Y+6	; 0x06
    74c8:	ff 81       	ldd	r31, Y+7	; 0x07
    74ca:	20 83       	st	Z, r18
    74cc:	ea 85       	ldd	r30, Y+10	; 0x0a
    74ce:	fb 85       	ldd	r31, Y+11	; 0x0b
    74d0:	90 81       	ld	r25, Z
    74d2:	8d 85       	ldd	r24, Y+13	; 0x0d
    74d4:	89 2b       	or	r24, r25
    74d6:	80 83       	st	Z, r24
    74d8:	04 c0       	rjmp	.+8      	; 0x74e2 <_ZN10FastSerial5beginEljj+0x12a>
    74da:	10 82       	st	Z, r1
    74dc:	20 e1       	ldi	r18, 0x10	; 16
    74de:	30 e0       	ldi	r19, 0x00	; 0
    74e0:	ef cf       	rjmp	.-34     	; 0x74c0 <_ZN10FastSerial5beginEljj+0x108>
    74e2:	df 91       	pop	r29
    74e4:	cf 91       	pop	r28
    74e6:	1f 91       	pop	r17
    74e8:	0f 91       	pop	r16
    74ea:	ff 90       	pop	r15
    74ec:	ef 90       	pop	r14
    74ee:	bf 90       	pop	r11
    74f0:	af 90       	pop	r10
    74f2:	9f 90       	pop	r9
    74f4:	8f 90       	pop	r8
    74f6:	08 95       	ret

000074f8 <_ZN10FastSerial11_freeBufferEPNS_6BufferE>:
    74f8:	cf 93       	push	r28
    74fa:	df 93       	push	r29
    74fc:	fc 01       	movw	r30, r24
    74fe:	13 82       	std	Z+3, r1	; 0x03
    7500:	12 82       	std	Z+2, r1	; 0x02
    7502:	11 82       	std	Z+1, r1	; 0x01
    7504:	10 82       	st	Z, r1
    7506:	15 82       	std	Z+5, r1	; 0x05
    7508:	14 82       	std	Z+4, r1	; 0x04
    750a:	86 81       	ldd	r24, Z+6	; 0x06
    750c:	97 81       	ldd	r25, Z+7	; 0x07
    750e:	00 97       	sbiw	r24, 0x00	; 0
    7510:	29 f0       	breq	.+10     	; 0x751c <_ZN10FastSerial11_freeBufferEPNS_6BufferE+0x24>
    7512:	ef 01       	movw	r28, r30
    7514:	0e 94 06 3f 	call	0x7e0c	; 0x7e0c <free>
    7518:	1f 82       	std	Y+7, r1	; 0x07
    751a:	1e 82       	std	Y+6, r1	; 0x06
    751c:	df 91       	pop	r29
    751e:	cf 91       	pop	r28
    7520:	08 95       	ret

00007522 <_ZN10FastSerial3endEv>:
    7522:	cf 93       	push	r28
    7524:	df 93       	push	r29
    7526:	ec 01       	movw	r28, r24
    7528:	ea 85       	ldd	r30, Y+10	; 0x0a
    752a:	fb 85       	ldd	r31, Y+11	; 0x0b
    752c:	20 81       	ld	r18, Z
    752e:	8e 85       	ldd	r24, Y+14	; 0x0e
    7530:	9d 85       	ldd	r25, Y+13	; 0x0d
    7532:	89 2b       	or	r24, r25
    7534:	80 95       	com	r24
    7536:	82 23       	and	r24, r18
    7538:	80 83       	st	Z, r24
    753a:	8f 85       	ldd	r24, Y+15	; 0x0f
    753c:	98 89       	ldd	r25, Y+16	; 0x10
    753e:	0e 94 7c 3a 	call	0x74f8	; 0x74f8 <_ZN10FastSerial11_freeBufferEPNS_6BufferE>
    7542:	89 89       	ldd	r24, Y+17	; 0x11
    7544:	9a 89       	ldd	r25, Y+18	; 0x12
    7546:	0e 94 7c 3a 	call	0x74f8	; 0x74f8 <_ZN10FastSerial11_freeBufferEPNS_6BufferE>
    754a:	1b 8a       	std	Y+19, r1	; 0x13
    754c:	df 91       	pop	r29
    754e:	cf 91       	pop	r28
    7550:	08 95       	ret

00007552 <_ZN12BetterStream7txspaceEv>:
    7552:	8f ef       	ldi	r24, 0xFF	; 255
    7554:	08 95       	ret

00007556 <_ZN12BetterStream7print_PEPKc>:
    7556:	0f 93       	push	r16
    7558:	1f 93       	push	r17
    755a:	cf 93       	push	r28
    755c:	df 93       	push	r29
    755e:	8c 01       	movw	r16, r24
    7560:	fb 01       	movw	r30, r22
    7562:	64 91       	lpm	r22, Z
    7564:	ef 01       	movw	r28, r30
    7566:	21 96       	adiw	r28, 0x01	; 1
    7568:	66 23       	and	r22, r22
    756a:	51 f0       	breq	.+20     	; 0x7580 <_ZN12BetterStream7print_PEPKc+0x2a>
    756c:	d8 01       	movw	r26, r16
    756e:	ed 91       	ld	r30, X+
    7570:	fc 91       	ld	r31, X
    7572:	01 90       	ld	r0, Z+
    7574:	f0 81       	ld	r31, Z
    7576:	e0 2d       	mov	r30, r0
    7578:	c8 01       	movw	r24, r16
    757a:	09 95       	icall
    757c:	fe 01       	movw	r30, r28
    757e:	f1 cf       	rjmp	.-30     	; 0x7562 <_ZN12BetterStream7print_PEPKc+0xc>
    7580:	df 91       	pop	r29
    7582:	cf 91       	pop	r28
    7584:	1f 91       	pop	r17
    7586:	0f 91       	pop	r16
    7588:	08 95       	ret

0000758a <_ZN12BetterStream9println_PEPKc>:
    758a:	cf 93       	push	r28
    758c:	df 93       	push	r29
    758e:	ec 01       	movw	r28, r24
    7590:	0e 94 ab 3a 	call	0x7556	; 0x7556 <_ZN12BetterStream7print_PEPKc>
    7594:	ce 01       	movw	r24, r28
    7596:	0e 94 b6 37 	call	0x6f6c	; 0x6f6c <_ZN5Print7printlnEv>
    759a:	df 91       	pop	r29
    759c:	cf 91       	pop	r28
    759e:	08 95       	ret

000075a0 <_ZN12BetterStream6printfEPKcz>:
    75a0:	a0 e0       	ldi	r26, 0x00	; 0
    75a2:	b0 e0       	ldi	r27, 0x00	; 0
    75a4:	e6 ed       	ldi	r30, 0xD6	; 214
    75a6:	fa e3       	ldi	r31, 0x3A	; 58
    75a8:	0c 94 79 44 	jmp	0x88f2	; 0x88f2 <__prologue_saves__+0x20>
    75ac:	9e 01       	movw	r18, r28
    75ae:	27 5f       	subi	r18, 0xF7	; 247
    75b0:	3f 4f       	sbci	r19, 0xFF	; 255
    75b2:	4f 81       	ldd	r20, Y+7	; 0x07
    75b4:	58 85       	ldd	r21, Y+8	; 0x08
    75b6:	60 e0       	ldi	r22, 0x00	; 0
    75b8:	8d 81       	ldd	r24, Y+5	; 0x05
    75ba:	9e 81       	ldd	r25, Y+6	; 0x06
    75bc:	0e 94 fe 3a 	call	0x75fc	; 0x75fc <_ZN12BetterStream8_vprintfEhPKcPv>
    75c0:	e2 e0       	ldi	r30, 0x02	; 2
    75c2:	0c 94 95 44 	jmp	0x892a	; 0x892a <__epilogue_restores__+0x20>

000075c6 <_ZN12BetterStream9_printf_PEPKcz>:
    75c6:	a0 e0       	ldi	r26, 0x00	; 0
    75c8:	b0 e0       	ldi	r27, 0x00	; 0
    75ca:	e9 ee       	ldi	r30, 0xE9	; 233
    75cc:	fa e3       	ldi	r31, 0x3A	; 58
    75ce:	0c 94 79 44 	jmp	0x88f2	; 0x88f2 <__prologue_saves__+0x20>
    75d2:	9e 01       	movw	r18, r28
    75d4:	27 5f       	subi	r18, 0xF7	; 247
    75d6:	3f 4f       	sbci	r19, 0xFF	; 255
    75d8:	4f 81       	ldd	r20, Y+7	; 0x07
    75da:	58 85       	ldd	r21, Y+8	; 0x08
    75dc:	61 e0       	ldi	r22, 0x01	; 1
    75de:	8d 81       	ldd	r24, Y+5	; 0x05
    75e0:	9e 81       	ldd	r25, Y+6	; 0x06
    75e2:	0e 94 fe 3a 	call	0x75fc	; 0x75fc <_ZN12BetterStream8_vprintfEhPKcPv>
    75e6:	e2 e0       	ldi	r30, 0x02	; 2
    75e8:	0c 94 95 44 	jmp	0x892a	; 0x892a <__epilogue_restores__+0x20>

000075ec <_ZN8MyStream6_writeEh>:
    75ec:	dc 01       	movw	r26, r24
    75ee:	ed 91       	ld	r30, X+
    75f0:	fc 91       	ld	r31, X
    75f2:	01 90       	ld	r0, Z+
    75f4:	f0 81       	ld	r31, Z
    75f6:	e0 2d       	mov	r30, r0
    75f8:	09 95       	icall
    75fa:	08 95       	ret

000075fc <_ZN12BetterStream8_vprintfEhPKcPv>:
    75fc:	a4 e1       	ldi	r26, 0x14	; 20
    75fe:	b0 e0       	ldi	r27, 0x00	; 0
    7600:	e4 e0       	ldi	r30, 0x04	; 4
    7602:	fb e3       	ldi	r31, 0x3B	; 59
    7604:	0c 94 69 44 	jmp	0x88d2	; 0x88d2 <__prologue_saves__>
    7608:	7c 01       	movw	r14, r24
    760a:	6c 87       	std	Y+12, r22	; 0x0c
    760c:	1a 01       	movw	r2, r20
    760e:	69 01       	movw	r12, r18
    7610:	ce 01       	movw	r24, r28
    7612:	01 96       	adiw	r24, 0x01	; 1
    7614:	4c 01       	movw	r8, r24
    7616:	f1 01       	movw	r30, r2
    7618:	2c 85       	ldd	r18, Y+12	; 0x0c
    761a:	20 fd       	sbrc	r18, 0
    761c:	05 91       	lpm	r16, Z+
    761e:	20 ff       	sbrs	r18, 0
    7620:	01 91       	ld	r16, Z+
    7622:	1f 01       	movw	r2, r30
    7624:	00 23       	and	r16, r16
    7626:	09 f4       	brne	.+2      	; 0x762a <_ZN12BetterStream8_vprintfEhPKcPv+0x2e>
    7628:	58 c3       	rjmp	.+1712   	; 0x7cda <_ZN12BetterStream8_vprintfEhPKcPv+0x6de>
    762a:	05 32       	cpi	r16, 0x25	; 37
    762c:	41 f4       	brne	.+16     	; 0x763e <_ZN12BetterStream8_vprintfEhPKcPv+0x42>
    762e:	20 fd       	sbrc	r18, 0
    7630:	05 91       	lpm	r16, Z+
    7632:	20 ff       	sbrs	r18, 0
    7634:	01 91       	ld	r16, Z+
    7636:	1f 01       	movw	r2, r30
    7638:	05 32       	cpi	r16, 0x25	; 37
    763a:	71 f4       	brne	.+28     	; 0x7658 <_ZN12BetterStream8_vprintfEhPKcPv+0x5c>
    763c:	06 c0       	rjmp	.+12     	; 0x764a <_ZN12BetterStream8_vprintfEhPKcPv+0x4e>
    763e:	0a 30       	cpi	r16, 0x0A	; 10
    7640:	21 f4       	brne	.+8      	; 0x764a <_ZN12BetterStream8_vprintfEhPKcPv+0x4e>
    7642:	6d e0       	ldi	r22, 0x0D	; 13
    7644:	c7 01       	movw	r24, r14
    7646:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    764a:	60 2f       	mov	r22, r16
    764c:	c7 01       	movw	r24, r14
    764e:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7652:	56 01       	movw	r10, r12
    7654:	65 01       	movw	r12, r10
    7656:	df cf       	rjmp	.-66     	; 0x7616 <_ZN12BetterStream8_vprintfEhPKcPv+0x1a>
    7658:	10 e0       	ldi	r17, 0x00	; 0
    765a:	51 2c       	mov	r5, r1
    765c:	71 2c       	mov	r7, r1
    765e:	ff e1       	ldi	r31, 0x1F	; 31
    7660:	f7 15       	cp	r31, r7
    7662:	d8 f0       	brcs	.+54     	; 0x769a <_ZN12BetterStream8_vprintfEhPKcPv+0x9e>
    7664:	0b 32       	cpi	r16, 0x2B	; 43
    7666:	79 f0       	breq	.+30     	; 0x7686 <_ZN12BetterStream8_vprintfEhPKcPv+0x8a>
    7668:	38 f4       	brcc	.+14     	; 0x7678 <_ZN12BetterStream8_vprintfEhPKcPv+0x7c>
    766a:	00 32       	cpi	r16, 0x20	; 32
    766c:	79 f0       	breq	.+30     	; 0x768c <_ZN12BetterStream8_vprintfEhPKcPv+0x90>
    766e:	03 32       	cpi	r16, 0x23	; 35
    7670:	a1 f4       	brne	.+40     	; 0x769a <_ZN12BetterStream8_vprintfEhPKcPv+0x9e>
    7672:	f7 2d       	mov	r31, r7
    7674:	f0 61       	ori	r31, 0x10	; 16
    7676:	2e c0       	rjmp	.+92     	; 0x76d4 <_ZN12BetterStream8_vprintfEhPKcPv+0xd8>
    7678:	0d 32       	cpi	r16, 0x2D	; 45
    767a:	61 f0       	breq	.+24     	; 0x7694 <_ZN12BetterStream8_vprintfEhPKcPv+0x98>
    767c:	00 33       	cpi	r16, 0x30	; 48
    767e:	69 f4       	brne	.+26     	; 0x769a <_ZN12BetterStream8_vprintfEhPKcPv+0x9e>
    7680:	27 2d       	mov	r18, r7
    7682:	21 60       	ori	r18, 0x01	; 1
    7684:	2d c0       	rjmp	.+90     	; 0x76e0 <_ZN12BetterStream8_vprintfEhPKcPv+0xe4>
    7686:	87 2d       	mov	r24, r7
    7688:	82 60       	ori	r24, 0x02	; 2
    768a:	78 2e       	mov	r7, r24
    768c:	97 2d       	mov	r25, r7
    768e:	94 60       	ori	r25, 0x04	; 4
    7690:	79 2e       	mov	r7, r25
    7692:	2a c0       	rjmp	.+84     	; 0x76e8 <_ZN12BetterStream8_vprintfEhPKcPv+0xec>
    7694:	e7 2d       	mov	r30, r7
    7696:	e8 60       	ori	r30, 0x08	; 8
    7698:	15 c0       	rjmp	.+42     	; 0x76c4 <_ZN12BetterStream8_vprintfEhPKcPv+0xc8>
    769a:	77 fc       	sbrc	r7, 7
    769c:	2e c0       	rjmp	.+92     	; 0x76fa <_ZN12BetterStream8_vprintfEhPKcPv+0xfe>
    769e:	80 ed       	ldi	r24, 0xD0	; 208
    76a0:	80 0f       	add	r24, r16
    76a2:	8a 30       	cpi	r24, 0x0A	; 10
    76a4:	88 f4       	brcc	.+34     	; 0x76c8 <_ZN12BetterStream8_vprintfEhPKcPv+0xcc>
    76a6:	76 fe       	sbrs	r7, 6
    76a8:	06 c0       	rjmp	.+12     	; 0x76b6 <_ZN12BetterStream8_vprintfEhPKcPv+0xba>
    76aa:	2a e0       	ldi	r18, 0x0A	; 10
    76ac:	12 9f       	mul	r17, r18
    76ae:	80 0d       	add	r24, r0
    76b0:	11 24       	eor	r1, r1
    76b2:	18 2f       	mov	r17, r24
    76b4:	19 c0       	rjmp	.+50     	; 0x76e8 <_ZN12BetterStream8_vprintfEhPKcPv+0xec>
    76b6:	9a e0       	ldi	r25, 0x0A	; 10
    76b8:	59 9e       	mul	r5, r25
    76ba:	80 0d       	add	r24, r0
    76bc:	11 24       	eor	r1, r1
    76be:	58 2e       	mov	r5, r24
    76c0:	e7 2d       	mov	r30, r7
    76c2:	e0 62       	ori	r30, 0x20	; 32
    76c4:	7e 2e       	mov	r7, r30
    76c6:	10 c0       	rjmp	.+32     	; 0x76e8 <_ZN12BetterStream8_vprintfEhPKcPv+0xec>
    76c8:	0e 32       	cpi	r16, 0x2E	; 46
    76ca:	31 f4       	brne	.+12     	; 0x76d8 <_ZN12BetterStream8_vprintfEhPKcPv+0xdc>
    76cc:	76 fc       	sbrc	r7, 6
    76ce:	05 c3       	rjmp	.+1546   	; 0x7cda <_ZN12BetterStream8_vprintfEhPKcPv+0x6de>
    76d0:	f7 2d       	mov	r31, r7
    76d2:	f0 64       	ori	r31, 0x40	; 64
    76d4:	7f 2e       	mov	r7, r31
    76d6:	08 c0       	rjmp	.+16     	; 0x76e8 <_ZN12BetterStream8_vprintfEhPKcPv+0xec>
    76d8:	0c 36       	cpi	r16, 0x6C	; 108
    76da:	21 f4       	brne	.+8      	; 0x76e4 <_ZN12BetterStream8_vprintfEhPKcPv+0xe8>
    76dc:	27 2d       	mov	r18, r7
    76de:	20 68       	ori	r18, 0x80	; 128
    76e0:	72 2e       	mov	r7, r18
    76e2:	02 c0       	rjmp	.+4      	; 0x76e8 <_ZN12BetterStream8_vprintfEhPKcPv+0xec>
    76e4:	08 36       	cpi	r16, 0x68	; 104
    76e6:	49 f4       	brne	.+18     	; 0x76fa <_ZN12BetterStream8_vprintfEhPKcPv+0xfe>
    76e8:	f1 01       	movw	r30, r2
    76ea:	2c 85       	ldd	r18, Y+12	; 0x0c
    76ec:	20 fd       	sbrc	r18, 0
    76ee:	05 91       	lpm	r16, Z+
    76f0:	20 ff       	sbrs	r18, 0
    76f2:	01 91       	ld	r16, Z+
    76f4:	1f 01       	movw	r2, r30
    76f6:	01 11       	cpse	r16, r1
    76f8:	b2 cf       	rjmp	.-156    	; 0x765e <_ZN12BetterStream8_vprintfEhPKcPv+0x62>
    76fa:	8b eb       	ldi	r24, 0xBB	; 187
    76fc:	80 0f       	add	r24, r16
    76fe:	83 30       	cpi	r24, 0x03	; 3
    7700:	20 f4       	brcc	.+8      	; 0x770a <_ZN12BetterStream8_vprintfEhPKcPv+0x10e>
    7702:	87 2d       	mov	r24, r7
    7704:	80 61       	ori	r24, 0x10	; 16
    7706:	00 5e       	subi	r16, 0xE0	; 224
    7708:	07 c0       	rjmp	.+14     	; 0x7718 <_ZN12BetterStream8_vprintfEhPKcPv+0x11c>
    770a:	8b e9       	ldi	r24, 0x9B	; 155
    770c:	80 0f       	add	r24, r16
    770e:	83 30       	cpi	r24, 0x03	; 3
    7710:	08 f0       	brcs	.+2      	; 0x7714 <_ZN12BetterStream8_vprintfEhPKcPv+0x118>
    7712:	62 c1       	rjmp	.+708    	; 0x79d8 <_ZN12BetterStream8_vprintfEhPKcPv+0x3dc>
    7714:	87 2d       	mov	r24, r7
    7716:	8f 7e       	andi	r24, 0xEF	; 239
    7718:	86 ff       	sbrs	r24, 6
    771a:	16 e0       	ldi	r17, 0x06	; 6
    771c:	8f 73       	andi	r24, 0x3F	; 63
    771e:	78 2e       	mov	r7, r24
    7720:	05 36       	cpi	r16, 0x65	; 101
    7722:	11 f4       	brne	.+4      	; 0x7728 <_ZN12BetterStream8_vprintfEhPKcPv+0x12c>
    7724:	80 64       	ori	r24, 0x40	; 64
    7726:	03 c0       	rjmp	.+6      	; 0x772e <_ZN12BetterStream8_vprintfEhPKcPv+0x132>
    7728:	06 36       	cpi	r16, 0x66	; 102
    772a:	19 f4       	brne	.+6      	; 0x7732 <_ZN12BetterStream8_vprintfEhPKcPv+0x136>
    772c:	80 68       	ori	r24, 0x80	; 128
    772e:	78 2e       	mov	r7, r24
    7730:	02 c0       	rjmp	.+4      	; 0x7736 <_ZN12BetterStream8_vprintfEhPKcPv+0x13a>
    7732:	11 11       	cpse	r17, r1
    7734:	11 50       	subi	r17, 0x01	; 1
    7736:	77 fe       	sbrs	r7, 7
    7738:	06 c0       	rjmp	.+12     	; 0x7746 <_ZN12BetterStream8_vprintfEhPKcPv+0x14a>
    773a:	1c 33       	cpi	r17, 0x3C	; 60
    773c:	50 f4       	brcc	.+20     	; 0x7752 <_ZN12BetterStream8_vprintfEhPKcPv+0x156>
    773e:	44 24       	eor	r4, r4
    7740:	43 94       	inc	r4
    7742:	41 0e       	add	r4, r17
    7744:	08 c0       	rjmp	.+16     	; 0x7756 <_ZN12BetterStream8_vprintfEhPKcPv+0x15a>
    7746:	18 30       	cpi	r17, 0x08	; 8
    7748:	40 f0       	brcs	.+16     	; 0x775a <_ZN12BetterStream8_vprintfEhPKcPv+0x15e>
    774a:	41 2c       	mov	r4, r1
    774c:	27 e0       	ldi	r18, 0x07	; 7
    774e:	17 e0       	ldi	r17, 0x07	; 7
    7750:	06 c0       	rjmp	.+12     	; 0x775e <_ZN12BetterStream8_vprintfEhPKcPv+0x162>
    7752:	4c e3       	ldi	r20, 0x3C	; 60
    7754:	44 2e       	mov	r4, r20
    7756:	27 e0       	ldi	r18, 0x07	; 7
    7758:	02 c0       	rjmp	.+4      	; 0x775e <_ZN12BetterStream8_vprintfEhPKcPv+0x162>
    775a:	21 2f       	mov	r18, r17
    775c:	41 2c       	mov	r4, r1
    775e:	56 01       	movw	r10, r12
    7760:	94 e0       	ldi	r25, 0x04	; 4
    7762:	a9 0e       	add	r10, r25
    7764:	b1 1c       	adc	r11, r1
    7766:	f6 01       	movw	r30, r12
    7768:	60 81       	ld	r22, Z
    776a:	71 81       	ldd	r23, Z+1	; 0x01
    776c:	82 81       	ldd	r24, Z+2	; 0x02
    776e:	93 81       	ldd	r25, Z+3	; 0x03
    7770:	04 2d       	mov	r16, r4
    7772:	a4 01       	movw	r20, r8
    7774:	0e 94 cf 06 	call	0xd9e	; 0xd9e <__ftoa_engine>
    7778:	6c 01       	movw	r12, r24
    777a:	09 81       	ldd	r16, Y+1	; 0x01
    777c:	00 ff       	sbrs	r16, 0
    777e:	02 c0       	rjmp	.+4      	; 0x7784 <_ZN12BetterStream8_vprintfEhPKcPv+0x188>
    7780:	03 ff       	sbrs	r16, 3
    7782:	07 c0       	rjmp	.+14     	; 0x7792 <_ZN12BetterStream8_vprintfEhPKcPv+0x196>
    7784:	71 fc       	sbrc	r7, 1
    7786:	08 c0       	rjmp	.+16     	; 0x7798 <_ZN12BetterStream8_vprintfEhPKcPv+0x19c>
    7788:	72 fe       	sbrs	r7, 2
    778a:	09 c0       	rjmp	.+18     	; 0x779e <_ZN12BetterStream8_vprintfEhPKcPv+0x1a2>
    778c:	30 e2       	ldi	r19, 0x20	; 32
    778e:	63 2e       	mov	r6, r19
    7790:	07 c0       	rjmp	.+14     	; 0x77a0 <_ZN12BetterStream8_vprintfEhPKcPv+0x1a4>
    7792:	2d e2       	ldi	r18, 0x2D	; 45
    7794:	62 2e       	mov	r6, r18
    7796:	04 c0       	rjmp	.+8      	; 0x77a0 <_ZN12BetterStream8_vprintfEhPKcPv+0x1a4>
    7798:	9b e2       	ldi	r25, 0x2B	; 43
    779a:	69 2e       	mov	r6, r25
    779c:	01 c0       	rjmp	.+2      	; 0x77a0 <_ZN12BetterStream8_vprintfEhPKcPv+0x1a4>
    779e:	61 2c       	mov	r6, r1
    77a0:	80 2f       	mov	r24, r16
    77a2:	8c 70       	andi	r24, 0x0C	; 12
    77a4:	19 f0       	breq	.+6      	; 0x77ac <_ZN12BetterStream8_vprintfEhPKcPv+0x1b0>
    77a6:	61 10       	cpse	r6, r1
    77a8:	5b c2       	rjmp	.+1206   	; 0x7c60 <_ZN12BetterStream8_vprintfEhPKcPv+0x664>
    77aa:	90 c2       	rjmp	.+1312   	; 0x7ccc <_ZN12BetterStream8_vprintfEhPKcPv+0x6d0>
    77ac:	77 fe       	sbrs	r7, 7
    77ae:	0f c0       	rjmp	.+30     	; 0x77ce <_ZN12BetterStream8_vprintfEhPKcPv+0x1d2>
    77b0:	4c 0c       	add	r4, r12
    77b2:	04 ff       	sbrs	r16, 4
    77b4:	04 c0       	rjmp	.+8      	; 0x77be <_ZN12BetterStream8_vprintfEhPKcPv+0x1c2>
    77b6:	8a 81       	ldd	r24, Y+2	; 0x02
    77b8:	81 33       	cpi	r24, 0x31	; 49
    77ba:	09 f4       	brne	.+2      	; 0x77be <_ZN12BetterStream8_vprintfEhPKcPv+0x1c2>
    77bc:	4a 94       	dec	r4
    77be:	14 14       	cp	r1, r4
    77c0:	74 f5       	brge	.+92     	; 0x781e <_ZN12BetterStream8_vprintfEhPKcPv+0x222>
    77c2:	f8 e0       	ldi	r31, 0x08	; 8
    77c4:	f4 15       	cp	r31, r4
    77c6:	78 f5       	brcc	.+94     	; 0x7826 <_ZN12BetterStream8_vprintfEhPKcPv+0x22a>
    77c8:	88 e0       	ldi	r24, 0x08	; 8
    77ca:	48 2e       	mov	r4, r24
    77cc:	2c c0       	rjmp	.+88     	; 0x7826 <_ZN12BetterStream8_vprintfEhPKcPv+0x22a>
    77ce:	76 fc       	sbrc	r7, 6
    77d0:	2a c0       	rjmp	.+84     	; 0x7826 <_ZN12BetterStream8_vprintfEhPKcPv+0x22a>
    77d2:	81 2f       	mov	r24, r17
    77d4:	90 e0       	ldi	r25, 0x00	; 0
    77d6:	8c 15       	cp	r24, r12
    77d8:	9d 05       	cpc	r25, r13
    77da:	9c f0       	brlt	.+38     	; 0x7802 <_ZN12BetterStream8_vprintfEhPKcPv+0x206>
    77dc:	2c ef       	ldi	r18, 0xFC	; 252
    77de:	c2 16       	cp	r12, r18
    77e0:	2f ef       	ldi	r18, 0xFF	; 255
    77e2:	d2 06       	cpc	r13, r18
    77e4:	74 f0       	brlt	.+28     	; 0x7802 <_ZN12BetterStream8_vprintfEhPKcPv+0x206>
    77e6:	87 2d       	mov	r24, r7
    77e8:	80 68       	ori	r24, 0x80	; 128
    77ea:	78 2e       	mov	r7, r24
    77ec:	0a c0       	rjmp	.+20     	; 0x7802 <_ZN12BetterStream8_vprintfEhPKcPv+0x206>
    77ee:	e2 e0       	ldi	r30, 0x02	; 2
    77f0:	f0 e0       	ldi	r31, 0x00	; 0
    77f2:	ec 0f       	add	r30, r28
    77f4:	fd 1f       	adc	r31, r29
    77f6:	e1 0f       	add	r30, r17
    77f8:	f1 1d       	adc	r31, r1
    77fa:	80 81       	ld	r24, Z
    77fc:	80 33       	cpi	r24, 0x30	; 48
    77fe:	19 f4       	brne	.+6      	; 0x7806 <_ZN12BetterStream8_vprintfEhPKcPv+0x20a>
    7800:	11 50       	subi	r17, 0x01	; 1
    7802:	11 11       	cpse	r17, r1
    7804:	f4 cf       	rjmp	.-24     	; 0x77ee <_ZN12BetterStream8_vprintfEhPKcPv+0x1f2>
    7806:	77 fe       	sbrs	r7, 7
    7808:	0e c0       	rjmp	.+28     	; 0x7826 <_ZN12BetterStream8_vprintfEhPKcPv+0x22a>
    780a:	44 24       	eor	r4, r4
    780c:	43 94       	inc	r4
    780e:	41 0e       	add	r4, r17
    7810:	81 2f       	mov	r24, r17
    7812:	90 e0       	ldi	r25, 0x00	; 0
    7814:	c8 16       	cp	r12, r24
    7816:	d9 06       	cpc	r13, r25
    7818:	2c f4       	brge	.+10     	; 0x7824 <_ZN12BetterStream8_vprintfEhPKcPv+0x228>
    781a:	1c 19       	sub	r17, r12
    781c:	04 c0       	rjmp	.+8      	; 0x7826 <_ZN12BetterStream8_vprintfEhPKcPv+0x22a>
    781e:	44 24       	eor	r4, r4
    7820:	43 94       	inc	r4
    7822:	01 c0       	rjmp	.+2      	; 0x7826 <_ZN12BetterStream8_vprintfEhPKcPv+0x22a>
    7824:	10 e0       	ldi	r17, 0x00	; 0
    7826:	77 fe       	sbrs	r7, 7
    7828:	06 c0       	rjmp	.+12     	; 0x7836 <_ZN12BetterStream8_vprintfEhPKcPv+0x23a>
    782a:	1c 14       	cp	r1, r12
    782c:	1d 04       	cpc	r1, r13
    782e:	34 f4       	brge	.+12     	; 0x783c <_ZN12BetterStream8_vprintfEhPKcPv+0x240>
    7830:	c6 01       	movw	r24, r12
    7832:	01 96       	adiw	r24, 0x01	; 1
    7834:	05 c0       	rjmp	.+10     	; 0x7840 <_ZN12BetterStream8_vprintfEhPKcPv+0x244>
    7836:	85 e0       	ldi	r24, 0x05	; 5
    7838:	90 e0       	ldi	r25, 0x00	; 0
    783a:	02 c0       	rjmp	.+4      	; 0x7840 <_ZN12BetterStream8_vprintfEhPKcPv+0x244>
    783c:	81 e0       	ldi	r24, 0x01	; 1
    783e:	90 e0       	ldi	r25, 0x00	; 0
    7840:	61 10       	cpse	r6, r1
    7842:	01 96       	adiw	r24, 0x01	; 1
    7844:	11 23       	and	r17, r17
    7846:	31 f0       	breq	.+12     	; 0x7854 <_ZN12BetterStream8_vprintfEhPKcPv+0x258>
    7848:	21 2f       	mov	r18, r17
    784a:	30 e0       	ldi	r19, 0x00	; 0
    784c:	2f 5f       	subi	r18, 0xFF	; 255
    784e:	3f 4f       	sbci	r19, 0xFF	; 255
    7850:	82 0f       	add	r24, r18
    7852:	93 1f       	adc	r25, r19
    7854:	25 2d       	mov	r18, r5
    7856:	30 e0       	ldi	r19, 0x00	; 0
    7858:	82 17       	cp	r24, r18
    785a:	93 07       	cpc	r25, r19
    785c:	14 f4       	brge	.+4      	; 0x7862 <_ZN12BetterStream8_vprintfEhPKcPv+0x266>
    785e:	58 1a       	sub	r5, r24
    7860:	01 c0       	rjmp	.+2      	; 0x7864 <_ZN12BetterStream8_vprintfEhPKcPv+0x268>
    7862:	51 2c       	mov	r5, r1
    7864:	87 2d       	mov	r24, r7
    7866:	89 70       	andi	r24, 0x09	; 9
    7868:	41 f4       	brne	.+16     	; 0x787a <_ZN12BetterStream8_vprintfEhPKcPv+0x27e>
    786a:	55 20       	and	r5, r5
    786c:	31 f0       	breq	.+12     	; 0x787a <_ZN12BetterStream8_vprintfEhPKcPv+0x27e>
    786e:	60 e2       	ldi	r22, 0x20	; 32
    7870:	c7 01       	movw	r24, r14
    7872:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7876:	5a 94       	dec	r5
    7878:	f8 cf       	rjmp	.-16     	; 0x786a <_ZN12BetterStream8_vprintfEhPKcPv+0x26e>
    787a:	66 20       	and	r6, r6
    787c:	21 f0       	breq	.+8      	; 0x7886 <_ZN12BetterStream8_vprintfEhPKcPv+0x28a>
    787e:	66 2d       	mov	r22, r6
    7880:	c7 01       	movw	r24, r14
    7882:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7886:	73 fc       	sbrc	r7, 3
    7888:	08 c0       	rjmp	.+16     	; 0x789a <_ZN12BetterStream8_vprintfEhPKcPv+0x29e>
    788a:	55 20       	and	r5, r5
    788c:	31 f0       	breq	.+12     	; 0x789a <_ZN12BetterStream8_vprintfEhPKcPv+0x29e>
    788e:	60 e3       	ldi	r22, 0x30	; 48
    7890:	c7 01       	movw	r24, r14
    7892:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7896:	5a 94       	dec	r5
    7898:	f8 cf       	rjmp	.-16     	; 0x788a <_ZN12BetterStream8_vprintfEhPKcPv+0x28e>
    789a:	77 fe       	sbrs	r7, 7
    789c:	56 c0       	rjmp	.+172    	; 0x794a <_ZN12BetterStream8_vprintfEhPKcPv+0x34e>
    789e:	9c 2d       	mov	r25, r12
    78a0:	8d 2d       	mov	r24, r13
    78a2:	d7 fe       	sbrs	r13, 7
    78a4:	02 c0       	rjmp	.+4      	; 0x78aa <_ZN12BetterStream8_vprintfEhPKcPv+0x2ae>
    78a6:	90 e0       	ldi	r25, 0x00	; 0
    78a8:	80 e0       	ldi	r24, 0x00	; 0
    78aa:	69 2e       	mov	r6, r25
    78ac:	78 2e       	mov	r7, r24
    78ae:	1e 86       	std	Y+14, r1	; 0x0e
    78b0:	1d 86       	std	Y+13, r1	; 0x0d
    78b2:	f6 01       	movw	r30, r12
    78b4:	e4 19       	sub	r30, r4
    78b6:	f1 09       	sbc	r31, r1
    78b8:	f8 8b       	std	Y+16, r31	; 0x10
    78ba:	ef 87       	std	Y+15, r30	; 0x0f
    78bc:	c6 01       	movw	r24, r12
    78be:	86 19       	sub	r24, r6
    78c0:	97 09       	sbc	r25, r7
    78c2:	9a 8b       	std	Y+18, r25	; 0x12
    78c4:	89 8b       	std	Y+17, r24	; 0x11
    78c6:	61 2f       	mov	r22, r17
    78c8:	70 e0       	ldi	r23, 0x00	; 0
    78ca:	ee 27       	eor	r30, r30
    78cc:	ff 27       	eor	r31, r31
    78ce:	e6 1b       	sub	r30, r22
    78d0:	f7 0b       	sbc	r31, r23
    78d2:	fc 8b       	std	Y+20, r31	; 0x14
    78d4:	eb 8b       	std	Y+19, r30	; 0x13
    78d6:	ff ef       	ldi	r31, 0xFF	; 255
    78d8:	6f 16       	cp	r6, r31
    78da:	7f 06       	cpc	r7, r31
    78dc:	21 f4       	brne	.+8      	; 0x78e6 <_ZN12BetterStream8_vprintfEhPKcPv+0x2ea>
    78de:	6e e2       	ldi	r22, 0x2E	; 46
    78e0:	c7 01       	movw	r24, r14
    78e2:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    78e6:	c6 14       	cp	r12, r6
    78e8:	d7 04       	cpc	r13, r7
    78ea:	7c f0       	brlt	.+30     	; 0x790a <_ZN12BetterStream8_vprintfEhPKcPv+0x30e>
    78ec:	8f 85       	ldd	r24, Y+15	; 0x0f
    78ee:	98 89       	ldd	r25, Y+16	; 0x10
    78f0:	86 15       	cp	r24, r6
    78f2:	97 05       	cpc	r25, r7
    78f4:	54 f4       	brge	.+20     	; 0x790a <_ZN12BetterStream8_vprintfEhPKcPv+0x30e>
    78f6:	ed 85       	ldd	r30, Y+13	; 0x0d
    78f8:	fe 85       	ldd	r31, Y+14	; 0x0e
    78fa:	89 89       	ldd	r24, Y+17	; 0x11
    78fc:	9a 89       	ldd	r25, Y+18	; 0x12
    78fe:	e8 0f       	add	r30, r24
    7900:	f9 1f       	adc	r31, r25
    7902:	e8 0d       	add	r30, r8
    7904:	f9 1d       	adc	r31, r9
    7906:	61 81       	ldd	r22, Z+1	; 0x01
    7908:	01 c0       	rjmp	.+2      	; 0x790c <_ZN12BetterStream8_vprintfEhPKcPv+0x310>
    790a:	60 e3       	ldi	r22, 0x30	; 48
    790c:	91 e0       	ldi	r25, 0x01	; 1
    790e:	69 1a       	sub	r6, r25
    7910:	71 08       	sbc	r7, r1
    7912:	ed 85       	ldd	r30, Y+13	; 0x0d
    7914:	fe 85       	ldd	r31, Y+14	; 0x0e
    7916:	31 96       	adiw	r30, 0x01	; 1
    7918:	fe 87       	std	Y+14, r31	; 0x0e
    791a:	ed 87       	std	Y+13, r30	; 0x0d
    791c:	8b 89       	ldd	r24, Y+19	; 0x13
    791e:	9c 89       	ldd	r25, Y+20	; 0x14
    7920:	68 16       	cp	r6, r24
    7922:	79 06       	cpc	r7, r25
    7924:	24 f0       	brlt	.+8      	; 0x792e <_ZN12BetterStream8_vprintfEhPKcPv+0x332>
    7926:	c7 01       	movw	r24, r14
    7928:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    792c:	d4 cf       	rjmp	.-88     	; 0x78d6 <_ZN12BetterStream8_vprintfEhPKcPv+0x2da>
    792e:	6c 14       	cp	r6, r12
    7930:	7d 04       	cpc	r7, r13
    7932:	09 f0       	breq	.+2      	; 0x7936 <_ZN12BetterStream8_vprintfEhPKcPv+0x33a>
    7934:	4d c0       	rjmp	.+154    	; 0x79d0 <_ZN12BetterStream8_vprintfEhPKcPv+0x3d4>
    7936:	8a 81       	ldd	r24, Y+2	; 0x02
    7938:	86 33       	cpi	r24, 0x36	; 54
    793a:	28 f4       	brcc	.+10     	; 0x7946 <_ZN12BetterStream8_vprintfEhPKcPv+0x34a>
    793c:	85 33       	cpi	r24, 0x35	; 53
    793e:	09 f0       	breq	.+2      	; 0x7942 <_ZN12BetterStream8_vprintfEhPKcPv+0x346>
    7940:	47 c0       	rjmp	.+142    	; 0x79d0 <_ZN12BetterStream8_vprintfEhPKcPv+0x3d4>
    7942:	04 fd       	sbrc	r16, 4
    7944:	45 c0       	rjmp	.+138    	; 0x79d0 <_ZN12BetterStream8_vprintfEhPKcPv+0x3d4>
    7946:	61 e3       	ldi	r22, 0x31	; 49
    7948:	43 c0       	rjmp	.+134    	; 0x79d0 <_ZN12BetterStream8_vprintfEhPKcPv+0x3d4>
    794a:	6a 81       	ldd	r22, Y+2	; 0x02
    794c:	61 33       	cpi	r22, 0x31	; 49
    794e:	09 f0       	breq	.+2      	; 0x7952 <_ZN12BetterStream8_vprintfEhPKcPv+0x356>
    7950:	0f 7e       	andi	r16, 0xEF	; 239
    7952:	c7 01       	movw	r24, r14
    7954:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7958:	11 11       	cpse	r17, r1
    795a:	04 c0       	rjmp	.+8      	; 0x7964 <_ZN12BetterStream8_vprintfEhPKcPv+0x368>
    795c:	74 fc       	sbrc	r7, 4
    795e:	15 c0       	rjmp	.+42     	; 0x798a <_ZN12BetterStream8_vprintfEhPKcPv+0x38e>
    7960:	65 e6       	ldi	r22, 0x65	; 101
    7962:	14 c0       	rjmp	.+40     	; 0x798c <_ZN12BetterStream8_vprintfEhPKcPv+0x390>
    7964:	6e e2       	ldi	r22, 0x2E	; 46
    7966:	c7 01       	movw	r24, r14
    7968:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    796c:	82 e0       	ldi	r24, 0x02	; 2
    796e:	66 24       	eor	r6, r6
    7970:	63 94       	inc	r6
    7972:	68 0e       	add	r6, r24
    7974:	f4 01       	movw	r30, r8
    7976:	e8 0f       	add	r30, r24
    7978:	f1 1d       	adc	r31, r1
    797a:	60 81       	ld	r22, Z
    797c:	c7 01       	movw	r24, r14
    797e:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7982:	11 50       	subi	r17, 0x01	; 1
    7984:	86 2d       	mov	r24, r6
    7986:	99 f7       	brne	.-26     	; 0x796e <_ZN12BetterStream8_vprintfEhPKcPv+0x372>
    7988:	e9 cf       	rjmp	.-46     	; 0x795c <_ZN12BetterStream8_vprintfEhPKcPv+0x360>
    798a:	65 e4       	ldi	r22, 0x45	; 69
    798c:	c7 01       	movw	r24, r14
    798e:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7992:	d7 fc       	sbrc	r13, 7
    7994:	05 c0       	rjmp	.+10     	; 0x79a0 <_ZN12BetterStream8_vprintfEhPKcPv+0x3a4>
    7996:	c1 14       	cp	r12, r1
    7998:	d1 04       	cpc	r13, r1
    799a:	39 f4       	brne	.+14     	; 0x79aa <_ZN12BetterStream8_vprintfEhPKcPv+0x3ae>
    799c:	04 ff       	sbrs	r16, 4
    799e:	05 c0       	rjmp	.+10     	; 0x79aa <_ZN12BetterStream8_vprintfEhPKcPv+0x3ae>
    79a0:	d1 94       	neg	r13
    79a2:	c1 94       	neg	r12
    79a4:	d1 08       	sbc	r13, r1
    79a6:	6d e2       	ldi	r22, 0x2D	; 45
    79a8:	01 c0       	rjmp	.+2      	; 0x79ac <_ZN12BetterStream8_vprintfEhPKcPv+0x3b0>
    79aa:	6b e2       	ldi	r22, 0x2B	; 43
    79ac:	c7 01       	movw	r24, r14
    79ae:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    79b2:	60 e3       	ldi	r22, 0x30	; 48
    79b4:	ea e0       	ldi	r30, 0x0A	; 10
    79b6:	ce 16       	cp	r12, r30
    79b8:	d1 04       	cpc	r13, r1
    79ba:	2c f0       	brlt	.+10     	; 0x79c6 <_ZN12BetterStream8_vprintfEhPKcPv+0x3ca>
    79bc:	6f 5f       	subi	r22, 0xFF	; 255
    79be:	9a e0       	ldi	r25, 0x0A	; 10
    79c0:	c9 1a       	sub	r12, r25
    79c2:	d1 08       	sbc	r13, r1
    79c4:	f7 cf       	rjmp	.-18     	; 0x79b4 <_ZN12BetterStream8_vprintfEhPKcPv+0x3b8>
    79c6:	c7 01       	movw	r24, r14
    79c8:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    79cc:	60 e3       	ldi	r22, 0x30	; 48
    79ce:	6c 0d       	add	r22, r12
    79d0:	c7 01       	movw	r24, r14
    79d2:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    79d6:	58 c1       	rjmp	.+688    	; 0x7c88 <_ZN12BetterStream8_vprintfEhPKcPv+0x68c>
    79d8:	03 36       	cpi	r16, 0x63	; 99
    79da:	31 f0       	breq	.+12     	; 0x79e8 <_ZN12BetterStream8_vprintfEhPKcPv+0x3ec>
    79dc:	03 37       	cpi	r16, 0x73	; 115
    79de:	79 f0       	breq	.+30     	; 0x79fe <_ZN12BetterStream8_vprintfEhPKcPv+0x402>
    79e0:	03 35       	cpi	r16, 0x53	; 83
    79e2:	09 f0       	breq	.+2      	; 0x79e6 <_ZN12BetterStream8_vprintfEhPKcPv+0x3ea>
    79e4:	54 c0       	rjmp	.+168    	; 0x7a8e <_ZN12BetterStream8_vprintfEhPKcPv+0x492>
    79e6:	20 c0       	rjmp	.+64     	; 0x7a28 <_ZN12BetterStream8_vprintfEhPKcPv+0x42c>
    79e8:	56 01       	movw	r10, r12
    79ea:	f2 e0       	ldi	r31, 0x02	; 2
    79ec:	af 0e       	add	r10, r31
    79ee:	b1 1c       	adc	r11, r1
    79f0:	f6 01       	movw	r30, r12
    79f2:	80 81       	ld	r24, Z
    79f4:	89 83       	std	Y+1, r24	; 0x01
    79f6:	01 e0       	ldi	r16, 0x01	; 1
    79f8:	10 e0       	ldi	r17, 0x00	; 0
    79fa:	64 01       	movw	r12, r8
    79fc:	12 c0       	rjmp	.+36     	; 0x7a22 <_ZN12BetterStream8_vprintfEhPKcPv+0x426>
    79fe:	56 01       	movw	r10, r12
    7a00:	f2 e0       	ldi	r31, 0x02	; 2
    7a02:	af 0e       	add	r10, r31
    7a04:	b1 1c       	adc	r11, r1
    7a06:	f6 01       	movw	r30, r12
    7a08:	c0 80       	ld	r12, Z
    7a0a:	d1 80       	ldd	r13, Z+1	; 0x01
    7a0c:	76 fe       	sbrs	r7, 6
    7a0e:	03 c0       	rjmp	.+6      	; 0x7a16 <_ZN12BetterStream8_vprintfEhPKcPv+0x41a>
    7a10:	61 2f       	mov	r22, r17
    7a12:	70 e0       	ldi	r23, 0x00	; 0
    7a14:	02 c0       	rjmp	.+4      	; 0x7a1a <_ZN12BetterStream8_vprintfEhPKcPv+0x41e>
    7a16:	6f ef       	ldi	r22, 0xFF	; 255
    7a18:	7f ef       	ldi	r23, 0xFF	; 255
    7a1a:	c6 01       	movw	r24, r12
    7a1c:	0e 94 ac 3f 	call	0x7f58	; 0x7f58 <strnlen>
    7a20:	8c 01       	movw	r16, r24
    7a22:	f7 2d       	mov	r31, r7
    7a24:	ff 77       	andi	r31, 0x7F	; 127
    7a26:	14 c0       	rjmp	.+40     	; 0x7a50 <_ZN12BetterStream8_vprintfEhPKcPv+0x454>
    7a28:	56 01       	movw	r10, r12
    7a2a:	22 e0       	ldi	r18, 0x02	; 2
    7a2c:	a2 0e       	add	r10, r18
    7a2e:	b1 1c       	adc	r11, r1
    7a30:	f6 01       	movw	r30, r12
    7a32:	c0 80       	ld	r12, Z
    7a34:	d1 80       	ldd	r13, Z+1	; 0x01
    7a36:	76 fe       	sbrs	r7, 6
    7a38:	03 c0       	rjmp	.+6      	; 0x7a40 <_ZN12BetterStream8_vprintfEhPKcPv+0x444>
    7a3a:	61 2f       	mov	r22, r17
    7a3c:	70 e0       	ldi	r23, 0x00	; 0
    7a3e:	02 c0       	rjmp	.+4      	; 0x7a44 <_ZN12BetterStream8_vprintfEhPKcPv+0x448>
    7a40:	6f ef       	ldi	r22, 0xFF	; 255
    7a42:	7f ef       	ldi	r23, 0xFF	; 255
    7a44:	c6 01       	movw	r24, r12
    7a46:	0e 94 a1 3f 	call	0x7f42	; 0x7f42 <strnlen_P>
    7a4a:	8c 01       	movw	r16, r24
    7a4c:	f7 2d       	mov	r31, r7
    7a4e:	f0 68       	ori	r31, 0x80	; 128
    7a50:	7f 2e       	mov	r7, r31
    7a52:	f3 fd       	sbrc	r31, 3
    7a54:	18 c0       	rjmp	.+48     	; 0x7a86 <_ZN12BetterStream8_vprintfEhPKcPv+0x48a>
    7a56:	85 2d       	mov	r24, r5
    7a58:	90 e0       	ldi	r25, 0x00	; 0
    7a5a:	08 17       	cp	r16, r24
    7a5c:	19 07       	cpc	r17, r25
    7a5e:	98 f4       	brcc	.+38     	; 0x7a86 <_ZN12BetterStream8_vprintfEhPKcPv+0x48a>
    7a60:	60 e2       	ldi	r22, 0x20	; 32
    7a62:	c7 01       	movw	r24, r14
    7a64:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7a68:	5a 94       	dec	r5
    7a6a:	f5 cf       	rjmp	.-22     	; 0x7a56 <_ZN12BetterStream8_vprintfEhPKcPv+0x45a>
    7a6c:	f6 01       	movw	r30, r12
    7a6e:	77 fc       	sbrc	r7, 7
    7a70:	65 91       	lpm	r22, Z+
    7a72:	77 fe       	sbrs	r7, 7
    7a74:	61 91       	ld	r22, Z+
    7a76:	6f 01       	movw	r12, r30
    7a78:	c7 01       	movw	r24, r14
    7a7a:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7a7e:	51 10       	cpse	r5, r1
    7a80:	5a 94       	dec	r5
    7a82:	01 50       	subi	r16, 0x01	; 1
    7a84:	11 09       	sbc	r17, r1
    7a86:	01 15       	cp	r16, r1
    7a88:	11 05       	cpc	r17, r1
    7a8a:	81 f7       	brne	.-32     	; 0x7a6c <_ZN12BetterStream8_vprintfEhPKcPv+0x470>
    7a8c:	fd c0       	rjmp	.+506    	; 0x7c88 <_ZN12BetterStream8_vprintfEhPKcPv+0x68c>
    7a8e:	04 36       	cpi	r16, 0x64	; 100
    7a90:	11 f0       	breq	.+4      	; 0x7a96 <_ZN12BetterStream8_vprintfEhPKcPv+0x49a>
    7a92:	09 36       	cpi	r16, 0x69	; 105
    7a94:	61 f5       	brne	.+88     	; 0x7aee <_ZN12BetterStream8_vprintfEhPKcPv+0x4f2>
    7a96:	56 01       	movw	r10, r12
    7a98:	77 fe       	sbrs	r7, 7
    7a9a:	09 c0       	rjmp	.+18     	; 0x7aae <_ZN12BetterStream8_vprintfEhPKcPv+0x4b2>
    7a9c:	f4 e0       	ldi	r31, 0x04	; 4
    7a9e:	af 0e       	add	r10, r31
    7aa0:	b1 1c       	adc	r11, r1
    7aa2:	f6 01       	movw	r30, r12
    7aa4:	60 81       	ld	r22, Z
    7aa6:	71 81       	ldd	r23, Z+1	; 0x01
    7aa8:	82 81       	ldd	r24, Z+2	; 0x02
    7aaa:	93 81       	ldd	r25, Z+3	; 0x03
    7aac:	0a c0       	rjmp	.+20     	; 0x7ac2 <_ZN12BetterStream8_vprintfEhPKcPv+0x4c6>
    7aae:	f2 e0       	ldi	r31, 0x02	; 2
    7ab0:	af 0e       	add	r10, r31
    7ab2:	b1 1c       	adc	r11, r1
    7ab4:	f6 01       	movw	r30, r12
    7ab6:	60 81       	ld	r22, Z
    7ab8:	71 81       	ldd	r23, Z+1	; 0x01
    7aba:	07 2e       	mov	r0, r23
    7abc:	00 0c       	add	r0, r0
    7abe:	88 0b       	sbc	r24, r24
    7ac0:	99 0b       	sbc	r25, r25
    7ac2:	f7 2d       	mov	r31, r7
    7ac4:	ff 76       	andi	r31, 0x6F	; 111
    7ac6:	7f 2e       	mov	r7, r31
    7ac8:	97 ff       	sbrs	r25, 7
    7aca:	09 c0       	rjmp	.+18     	; 0x7ade <_ZN12BetterStream8_vprintfEhPKcPv+0x4e2>
    7acc:	90 95       	com	r25
    7ace:	80 95       	com	r24
    7ad0:	70 95       	com	r23
    7ad2:	61 95       	neg	r22
    7ad4:	7f 4f       	sbci	r23, 0xFF	; 255
    7ad6:	8f 4f       	sbci	r24, 0xFF	; 255
    7ad8:	9f 4f       	sbci	r25, 0xFF	; 255
    7ada:	f0 68       	ori	r31, 0x80	; 128
    7adc:	7f 2e       	mov	r7, r31
    7ade:	2a e0       	ldi	r18, 0x0A	; 10
    7ae0:	30 e0       	ldi	r19, 0x00	; 0
    7ae2:	a4 01       	movw	r20, r8
    7ae4:	0e 94 71 06 	call	0xce2	; 0xce2 <__ultoa_invert>
    7ae8:	c8 2e       	mov	r12, r24
    7aea:	c8 18       	sub	r12, r8
    7aec:	49 c0       	rjmp	.+146    	; 0x7b80 <_ZN12BetterStream8_vprintfEhPKcPv+0x584>
    7aee:	05 37       	cpi	r16, 0x75	; 117
    7af0:	31 f4       	brne	.+12     	; 0x7afe <_ZN12BetterStream8_vprintfEhPKcPv+0x502>
    7af2:	27 2d       	mov	r18, r7
    7af4:	2f 7e       	andi	r18, 0xEF	; 239
    7af6:	62 2e       	mov	r6, r18
    7af8:	2a e0       	ldi	r18, 0x0A	; 10
    7afa:	30 e0       	ldi	r19, 0x00	; 0
    7afc:	25 c0       	rjmp	.+74     	; 0x7b48 <_ZN12BetterStream8_vprintfEhPKcPv+0x54c>
    7afe:	87 2d       	mov	r24, r7
    7b00:	89 7f       	andi	r24, 0xF9	; 249
    7b02:	68 2e       	mov	r6, r24
    7b04:	0f 36       	cpi	r16, 0x6F	; 111
    7b06:	c1 f0       	breq	.+48     	; 0x7b38 <_ZN12BetterStream8_vprintfEhPKcPv+0x53c>
    7b08:	18 f4       	brcc	.+6      	; 0x7b10 <_ZN12BetterStream8_vprintfEhPKcPv+0x514>
    7b0a:	08 35       	cpi	r16, 0x58	; 88
    7b0c:	79 f0       	breq	.+30     	; 0x7b2c <_ZN12BetterStream8_vprintfEhPKcPv+0x530>
    7b0e:	e5 c0       	rjmp	.+458    	; 0x7cda <_ZN12BetterStream8_vprintfEhPKcPv+0x6de>
    7b10:	00 37       	cpi	r16, 0x70	; 112
    7b12:	19 f0       	breq	.+6      	; 0x7b1a <_ZN12BetterStream8_vprintfEhPKcPv+0x51e>
    7b14:	08 37       	cpi	r16, 0x78	; 120
    7b16:	21 f0       	breq	.+8      	; 0x7b20 <_ZN12BetterStream8_vprintfEhPKcPv+0x524>
    7b18:	e0 c0       	rjmp	.+448    	; 0x7cda <_ZN12BetterStream8_vprintfEhPKcPv+0x6de>
    7b1a:	98 2f       	mov	r25, r24
    7b1c:	90 61       	ori	r25, 0x10	; 16
    7b1e:	69 2e       	mov	r6, r25
    7b20:	64 fe       	sbrs	r6, 4
    7b22:	0d c0       	rjmp	.+26     	; 0x7b3e <_ZN12BetterStream8_vprintfEhPKcPv+0x542>
    7b24:	e6 2d       	mov	r30, r6
    7b26:	e4 60       	ori	r30, 0x04	; 4
    7b28:	6e 2e       	mov	r6, r30
    7b2a:	09 c0       	rjmp	.+18     	; 0x7b3e <_ZN12BetterStream8_vprintfEhPKcPv+0x542>
    7b2c:	74 fe       	sbrs	r7, 4
    7b2e:	0a c0       	rjmp	.+20     	; 0x7b44 <_ZN12BetterStream8_vprintfEhPKcPv+0x548>
    7b30:	f8 2f       	mov	r31, r24
    7b32:	f6 60       	ori	r31, 0x06	; 6
    7b34:	6f 2e       	mov	r6, r31
    7b36:	06 c0       	rjmp	.+12     	; 0x7b44 <_ZN12BetterStream8_vprintfEhPKcPv+0x548>
    7b38:	28 e0       	ldi	r18, 0x08	; 8
    7b3a:	30 e0       	ldi	r19, 0x00	; 0
    7b3c:	05 c0       	rjmp	.+10     	; 0x7b48 <_ZN12BetterStream8_vprintfEhPKcPv+0x54c>
    7b3e:	20 e1       	ldi	r18, 0x10	; 16
    7b40:	30 e0       	ldi	r19, 0x00	; 0
    7b42:	02 c0       	rjmp	.+4      	; 0x7b48 <_ZN12BetterStream8_vprintfEhPKcPv+0x54c>
    7b44:	20 e1       	ldi	r18, 0x10	; 16
    7b46:	32 e0       	ldi	r19, 0x02	; 2
    7b48:	56 01       	movw	r10, r12
    7b4a:	67 fe       	sbrs	r6, 7
    7b4c:	09 c0       	rjmp	.+18     	; 0x7b60 <_ZN12BetterStream8_vprintfEhPKcPv+0x564>
    7b4e:	84 e0       	ldi	r24, 0x04	; 4
    7b50:	a8 0e       	add	r10, r24
    7b52:	b1 1c       	adc	r11, r1
    7b54:	f6 01       	movw	r30, r12
    7b56:	60 81       	ld	r22, Z
    7b58:	71 81       	ldd	r23, Z+1	; 0x01
    7b5a:	82 81       	ldd	r24, Z+2	; 0x02
    7b5c:	93 81       	ldd	r25, Z+3	; 0x03
    7b5e:	08 c0       	rjmp	.+16     	; 0x7b70 <_ZN12BetterStream8_vprintfEhPKcPv+0x574>
    7b60:	f2 e0       	ldi	r31, 0x02	; 2
    7b62:	af 0e       	add	r10, r31
    7b64:	b1 1c       	adc	r11, r1
    7b66:	f6 01       	movw	r30, r12
    7b68:	60 81       	ld	r22, Z
    7b6a:	71 81       	ldd	r23, Z+1	; 0x01
    7b6c:	80 e0       	ldi	r24, 0x00	; 0
    7b6e:	90 e0       	ldi	r25, 0x00	; 0
    7b70:	a4 01       	movw	r20, r8
    7b72:	0e 94 71 06 	call	0xce2	; 0xce2 <__ultoa_invert>
    7b76:	c8 2e       	mov	r12, r24
    7b78:	c8 18       	sub	r12, r8
    7b7a:	f6 2d       	mov	r31, r6
    7b7c:	ff 77       	andi	r31, 0x7F	; 127
    7b7e:	7f 2e       	mov	r7, r31
    7b80:	76 fe       	sbrs	r7, 6
    7b82:	0d c0       	rjmp	.+26     	; 0x7b9e <_ZN12BetterStream8_vprintfEhPKcPv+0x5a2>
    7b84:	27 2d       	mov	r18, r7
    7b86:	2e 7f       	andi	r18, 0xFE	; 254
    7b88:	d2 2e       	mov	r13, r18
    7b8a:	c1 16       	cp	r12, r17
    7b8c:	58 f4       	brcc	.+22     	; 0x7ba4 <_ZN12BetterStream8_vprintfEhPKcPv+0x5a8>
    7b8e:	74 fe       	sbrs	r7, 4
    7b90:	0b c0       	rjmp	.+22     	; 0x7ba8 <_ZN12BetterStream8_vprintfEhPKcPv+0x5ac>
    7b92:	72 fc       	sbrc	r7, 2
    7b94:	09 c0       	rjmp	.+18     	; 0x7ba8 <_ZN12BetterStream8_vprintfEhPKcPv+0x5ac>
    7b96:	87 2d       	mov	r24, r7
    7b98:	8e 7e       	andi	r24, 0xEE	; 238
    7b9a:	d8 2e       	mov	r13, r24
    7b9c:	05 c0       	rjmp	.+10     	; 0x7ba8 <_ZN12BetterStream8_vprintfEhPKcPv+0x5ac>
    7b9e:	0c 2d       	mov	r16, r12
    7ba0:	d7 2c       	mov	r13, r7
    7ba2:	03 c0       	rjmp	.+6      	; 0x7baa <_ZN12BetterStream8_vprintfEhPKcPv+0x5ae>
    7ba4:	0c 2d       	mov	r16, r12
    7ba6:	01 c0       	rjmp	.+2      	; 0x7baa <_ZN12BetterStream8_vprintfEhPKcPv+0x5ae>
    7ba8:	01 2f       	mov	r16, r17
    7baa:	d4 fe       	sbrs	r13, 4
    7bac:	0e c0       	rjmp	.+28     	; 0x7bca <_ZN12BetterStream8_vprintfEhPKcPv+0x5ce>
    7bae:	fe 01       	movw	r30, r28
    7bb0:	ec 0d       	add	r30, r12
    7bb2:	f1 1d       	adc	r31, r1
    7bb4:	80 81       	ld	r24, Z
    7bb6:	80 33       	cpi	r24, 0x30	; 48
    7bb8:	21 f4       	brne	.+8      	; 0x7bc2 <_ZN12BetterStream8_vprintfEhPKcPv+0x5c6>
    7bba:	9d 2d       	mov	r25, r13
    7bbc:	99 7e       	andi	r25, 0xE9	; 233
    7bbe:	d9 2e       	mov	r13, r25
    7bc0:	08 c0       	rjmp	.+16     	; 0x7bd2 <_ZN12BetterStream8_vprintfEhPKcPv+0x5d6>
    7bc2:	d2 fe       	sbrs	r13, 2
    7bc4:	05 c0       	rjmp	.+10     	; 0x7bd0 <_ZN12BetterStream8_vprintfEhPKcPv+0x5d4>
    7bc6:	0e 5f       	subi	r16, 0xFE	; 254
    7bc8:	04 c0       	rjmp	.+8      	; 0x7bd2 <_ZN12BetterStream8_vprintfEhPKcPv+0x5d6>
    7bca:	8d 2d       	mov	r24, r13
    7bcc:	86 78       	andi	r24, 0x86	; 134
    7bce:	09 f0       	breq	.+2      	; 0x7bd2 <_ZN12BetterStream8_vprintfEhPKcPv+0x5d6>
    7bd0:	0f 5f       	subi	r16, 0xFF	; 255
    7bd2:	d3 fc       	sbrc	r13, 3
    7bd4:	12 c0       	rjmp	.+36     	; 0x7bfa <_ZN12BetterStream8_vprintfEhPKcPv+0x5fe>
    7bd6:	d0 fe       	sbrs	r13, 0
    7bd8:	08 c0       	rjmp	.+16     	; 0x7bea <_ZN12BetterStream8_vprintfEhPKcPv+0x5ee>
    7bda:	05 15       	cp	r16, r5
    7bdc:	28 f4       	brcc	.+10     	; 0x7be8 <_ZN12BetterStream8_vprintfEhPKcPv+0x5ec>
    7bde:	15 2d       	mov	r17, r5
    7be0:	10 1b       	sub	r17, r16
    7be2:	1c 0d       	add	r17, r12
    7be4:	05 2d       	mov	r16, r5
    7be6:	01 c0       	rjmp	.+2      	; 0x7bea <_ZN12BetterStream8_vprintfEhPKcPv+0x5ee>
    7be8:	1c 2d       	mov	r17, r12
    7bea:	05 15       	cp	r16, r5
    7bec:	50 f4       	brcc	.+20     	; 0x7c02 <_ZN12BetterStream8_vprintfEhPKcPv+0x606>
    7bee:	60 e2       	ldi	r22, 0x20	; 32
    7bf0:	c7 01       	movw	r24, r14
    7bf2:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7bf6:	0f 5f       	subi	r16, 0xFF	; 255
    7bf8:	f8 cf       	rjmp	.-16     	; 0x7bea <_ZN12BetterStream8_vprintfEhPKcPv+0x5ee>
    7bfa:	05 15       	cp	r16, r5
    7bfc:	10 f4       	brcc	.+4      	; 0x7c02 <_ZN12BetterStream8_vprintfEhPKcPv+0x606>
    7bfe:	50 1a       	sub	r5, r16
    7c00:	01 c0       	rjmp	.+2      	; 0x7c04 <_ZN12BetterStream8_vprintfEhPKcPv+0x608>
    7c02:	51 2c       	mov	r5, r1
    7c04:	d4 fe       	sbrs	r13, 4
    7c06:	0c c0       	rjmp	.+24     	; 0x7c20 <_ZN12BetterStream8_vprintfEhPKcPv+0x624>
    7c08:	60 e3       	ldi	r22, 0x30	; 48
    7c0a:	c7 01       	movw	r24, r14
    7c0c:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7c10:	d2 fe       	sbrs	r13, 2
    7c12:	13 c0       	rjmp	.+38     	; 0x7c3a <_ZN12BetterStream8_vprintfEhPKcPv+0x63e>
    7c14:	d1 fc       	sbrc	r13, 1
    7c16:	02 c0       	rjmp	.+4      	; 0x7c1c <_ZN12BetterStream8_vprintfEhPKcPv+0x620>
    7c18:	68 e7       	ldi	r22, 0x78	; 120
    7c1a:	0c c0       	rjmp	.+24     	; 0x7c34 <_ZN12BetterStream8_vprintfEhPKcPv+0x638>
    7c1c:	68 e5       	ldi	r22, 0x58	; 88
    7c1e:	0a c0       	rjmp	.+20     	; 0x7c34 <_ZN12BetterStream8_vprintfEhPKcPv+0x638>
    7c20:	8d 2d       	mov	r24, r13
    7c22:	86 78       	andi	r24, 0x86	; 134
    7c24:	51 f0       	breq	.+20     	; 0x7c3a <_ZN12BetterStream8_vprintfEhPKcPv+0x63e>
    7c26:	d1 fe       	sbrs	r13, 1
    7c28:	02 c0       	rjmp	.+4      	; 0x7c2e <_ZN12BetterStream8_vprintfEhPKcPv+0x632>
    7c2a:	6b e2       	ldi	r22, 0x2B	; 43
    7c2c:	01 c0       	rjmp	.+2      	; 0x7c30 <_ZN12BetterStream8_vprintfEhPKcPv+0x634>
    7c2e:	60 e2       	ldi	r22, 0x20	; 32
    7c30:	d7 fc       	sbrc	r13, 7
    7c32:	6d e2       	ldi	r22, 0x2D	; 45
    7c34:	c7 01       	movw	r24, r14
    7c36:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7c3a:	c1 16       	cp	r12, r17
    7c3c:	30 f4       	brcc	.+12     	; 0x7c4a <_ZN12BetterStream8_vprintfEhPKcPv+0x64e>
    7c3e:	60 e3       	ldi	r22, 0x30	; 48
    7c40:	c7 01       	movw	r24, r14
    7c42:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7c46:	11 50       	subi	r17, 0x01	; 1
    7c48:	f8 cf       	rjmp	.-16     	; 0x7c3a <_ZN12BetterStream8_vprintfEhPKcPv+0x63e>
    7c4a:	ca 94       	dec	r12
    7c4c:	f4 01       	movw	r30, r8
    7c4e:	ec 0d       	add	r30, r12
    7c50:	f1 1d       	adc	r31, r1
    7c52:	60 81       	ld	r22, Z
    7c54:	c7 01       	movw	r24, r14
    7c56:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7c5a:	c1 10       	cpse	r12, r1
    7c5c:	f6 cf       	rjmp	.-20     	; 0x7c4a <_ZN12BetterStream8_vprintfEhPKcPv+0x64e>
    7c5e:	14 c0       	rjmp	.+40     	; 0x7c88 <_ZN12BetterStream8_vprintfEhPKcPv+0x68c>
    7c60:	e4 e0       	ldi	r30, 0x04	; 4
    7c62:	e5 15       	cp	r30, r5
    7c64:	10 f5       	brcc	.+68     	; 0x7caa <_ZN12BetterStream8_vprintfEhPKcPv+0x6ae>
    7c66:	84 e0       	ldi	r24, 0x04	; 4
    7c68:	58 1a       	sub	r5, r24
    7c6a:	73 fe       	sbrs	r7, 3
    7c6c:	16 c0       	rjmp	.+44     	; 0x7c9a <_ZN12BetterStream8_vprintfEhPKcPv+0x69e>
    7c6e:	61 10       	cpse	r6, r1
    7c70:	1d c0       	rjmp	.+58     	; 0x7cac <_ZN12BetterStream8_vprintfEhPKcPv+0x6b0>
    7c72:	03 ff       	sbrs	r16, 3
    7c74:	20 c0       	rjmp	.+64     	; 0x7cb6 <_ZN12BetterStream8_vprintfEhPKcPv+0x6ba>
    7c76:	00 e0       	ldi	r16, 0x00	; 0
    7c78:	1b e0       	ldi	r17, 0x0B	; 11
    7c7a:	f7 2d       	mov	r31, r7
    7c7c:	f0 71       	andi	r31, 0x10	; 16
    7c7e:	7f 2e       	mov	r7, r31
    7c80:	f8 01       	movw	r30, r16
    7c82:	64 91       	lpm	r22, Z
    7c84:	61 11       	cpse	r22, r1
    7c86:	1a c0       	rjmp	.+52     	; 0x7cbc <_ZN12BetterStream8_vprintfEhPKcPv+0x6c0>
    7c88:	55 20       	and	r5, r5
    7c8a:	09 f4       	brne	.+2      	; 0x7c8e <_ZN12BetterStream8_vprintfEhPKcPv+0x692>
    7c8c:	e3 cc       	rjmp	.-1594   	; 0x7654 <_ZN12BetterStream8_vprintfEhPKcPv+0x58>
    7c8e:	60 e2       	ldi	r22, 0x20	; 32
    7c90:	c7 01       	movw	r24, r14
    7c92:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7c96:	5a 94       	dec	r5
    7c98:	f7 cf       	rjmp	.-18     	; 0x7c88 <_ZN12BetterStream8_vprintfEhPKcPv+0x68c>
    7c9a:	60 e2       	ldi	r22, 0x20	; 32
    7c9c:	c7 01       	movw	r24, r14
    7c9e:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7ca2:	5a 94       	dec	r5
    7ca4:	51 10       	cpse	r5, r1
    7ca6:	f9 cf       	rjmp	.-14     	; 0x7c9a <_ZN12BetterStream8_vprintfEhPKcPv+0x69e>
    7ca8:	e2 cf       	rjmp	.-60     	; 0x7c6e <_ZN12BetterStream8_vprintfEhPKcPv+0x672>
    7caa:	51 2c       	mov	r5, r1
    7cac:	66 2d       	mov	r22, r6
    7cae:	c7 01       	movw	r24, r14
    7cb0:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7cb4:	de cf       	rjmp	.-68     	; 0x7c72 <_ZN12BetterStream8_vprintfEhPKcPv+0x676>
    7cb6:	04 e0       	ldi	r16, 0x04	; 4
    7cb8:	1b e0       	ldi	r17, 0x0B	; 11
    7cba:	df cf       	rjmp	.-66     	; 0x7c7a <_ZN12BetterStream8_vprintfEhPKcPv+0x67e>
    7cbc:	71 10       	cpse	r7, r1
    7cbe:	60 52       	subi	r22, 0x20	; 32
    7cc0:	c7 01       	movw	r24, r14
    7cc2:	0e 94 f6 3a 	call	0x75ec	; 0x75ec <_ZN8MyStream6_writeEh>
    7cc6:	0f 5f       	subi	r16, 0xFF	; 255
    7cc8:	1f 4f       	sbci	r17, 0xFF	; 255
    7cca:	da cf       	rjmp	.-76     	; 0x7c80 <_ZN12BetterStream8_vprintfEhPKcPv+0x684>
    7ccc:	f3 e0       	ldi	r31, 0x03	; 3
    7cce:	f5 15       	cp	r31, r5
    7cd0:	10 f4       	brcc	.+4      	; 0x7cd6 <_ZN12BetterStream8_vprintfEhPKcPv+0x6da>
    7cd2:	83 e0       	ldi	r24, 0x03	; 3
    7cd4:	c9 cf       	rjmp	.-110    	; 0x7c68 <_ZN12BetterStream8_vprintfEhPKcPv+0x66c>
    7cd6:	51 2c       	mov	r5, r1
    7cd8:	cc cf       	rjmp	.-104    	; 0x7c72 <_ZN12BetterStream8_vprintfEhPKcPv+0x676>
    7cda:	64 96       	adiw	r28, 0x14	; 20
    7cdc:	e2 e1       	ldi	r30, 0x12	; 18
    7cde:	0c 94 85 44 	jmp	0x890a	; 0x890a <__epilogue_restores__>

00007ce2 <malloc>:
    7ce2:	cf 93       	push	r28
    7ce4:	df 93       	push	r29
    7ce6:	82 30       	cpi	r24, 0x02	; 2
    7ce8:	91 05       	cpc	r25, r1
    7cea:	10 f4       	brcc	.+4      	; 0x7cf0 <malloc+0xe>
    7cec:	82 e0       	ldi	r24, 0x02	; 2
    7cee:	90 e0       	ldi	r25, 0x00	; 0
    7cf0:	e0 91 2d 07 	lds	r30, 0x072D	; 0x80072d <__flp>
    7cf4:	f0 91 2e 07 	lds	r31, 0x072E	; 0x80072e <__flp+0x1>
    7cf8:	20 e0       	ldi	r18, 0x00	; 0
    7cfa:	30 e0       	ldi	r19, 0x00	; 0
    7cfc:	c0 e0       	ldi	r28, 0x00	; 0
    7cfe:	d0 e0       	ldi	r29, 0x00	; 0
    7d00:	30 97       	sbiw	r30, 0x00	; 0
    7d02:	11 f1       	breq	.+68     	; 0x7d48 <malloc+0x66>
    7d04:	40 81       	ld	r20, Z
    7d06:	51 81       	ldd	r21, Z+1	; 0x01
    7d08:	48 17       	cp	r20, r24
    7d0a:	59 07       	cpc	r21, r25
    7d0c:	c0 f0       	brcs	.+48     	; 0x7d3e <malloc+0x5c>
    7d0e:	48 17       	cp	r20, r24
    7d10:	59 07       	cpc	r21, r25
    7d12:	61 f4       	brne	.+24     	; 0x7d2c <malloc+0x4a>
    7d14:	82 81       	ldd	r24, Z+2	; 0x02
    7d16:	93 81       	ldd	r25, Z+3	; 0x03
    7d18:	20 97       	sbiw	r28, 0x00	; 0
    7d1a:	19 f0       	breq	.+6      	; 0x7d22 <malloc+0x40>
    7d1c:	9b 83       	std	Y+3, r25	; 0x03
    7d1e:	8a 83       	std	Y+2, r24	; 0x02
    7d20:	2b c0       	rjmp	.+86     	; 0x7d78 <malloc+0x96>
    7d22:	90 93 2e 07 	sts	0x072E, r25	; 0x80072e <__flp+0x1>
    7d26:	80 93 2d 07 	sts	0x072D, r24	; 0x80072d <__flp>
    7d2a:	26 c0       	rjmp	.+76     	; 0x7d78 <malloc+0x96>
    7d2c:	21 15       	cp	r18, r1
    7d2e:	31 05       	cpc	r19, r1
    7d30:	19 f0       	breq	.+6      	; 0x7d38 <malloc+0x56>
    7d32:	42 17       	cp	r20, r18
    7d34:	53 07       	cpc	r21, r19
    7d36:	18 f4       	brcc	.+6      	; 0x7d3e <malloc+0x5c>
    7d38:	9a 01       	movw	r18, r20
    7d3a:	be 01       	movw	r22, r28
    7d3c:	df 01       	movw	r26, r30
    7d3e:	ef 01       	movw	r28, r30
    7d40:	02 80       	ldd	r0, Z+2	; 0x02
    7d42:	f3 81       	ldd	r31, Z+3	; 0x03
    7d44:	e0 2d       	mov	r30, r0
    7d46:	dc cf       	rjmp	.-72     	; 0x7d00 <malloc+0x1e>
    7d48:	21 15       	cp	r18, r1
    7d4a:	31 05       	cpc	r19, r1
    7d4c:	09 f1       	breq	.+66     	; 0x7d90 <malloc+0xae>
    7d4e:	28 1b       	sub	r18, r24
    7d50:	39 0b       	sbc	r19, r25
    7d52:	24 30       	cpi	r18, 0x04	; 4
    7d54:	31 05       	cpc	r19, r1
    7d56:	90 f4       	brcc	.+36     	; 0x7d7c <malloc+0x9a>
    7d58:	12 96       	adiw	r26, 0x02	; 2
    7d5a:	8d 91       	ld	r24, X+
    7d5c:	9c 91       	ld	r25, X
    7d5e:	13 97       	sbiw	r26, 0x03	; 3
    7d60:	61 15       	cp	r22, r1
    7d62:	71 05       	cpc	r23, r1
    7d64:	21 f0       	breq	.+8      	; 0x7d6e <malloc+0x8c>
    7d66:	fb 01       	movw	r30, r22
    7d68:	93 83       	std	Z+3, r25	; 0x03
    7d6a:	82 83       	std	Z+2, r24	; 0x02
    7d6c:	04 c0       	rjmp	.+8      	; 0x7d76 <malloc+0x94>
    7d6e:	90 93 2e 07 	sts	0x072E, r25	; 0x80072e <__flp+0x1>
    7d72:	80 93 2d 07 	sts	0x072D, r24	; 0x80072d <__flp>
    7d76:	fd 01       	movw	r30, r26
    7d78:	32 96       	adiw	r30, 0x02	; 2
    7d7a:	44 c0       	rjmp	.+136    	; 0x7e04 <malloc+0x122>
    7d7c:	fd 01       	movw	r30, r26
    7d7e:	e2 0f       	add	r30, r18
    7d80:	f3 1f       	adc	r31, r19
    7d82:	81 93       	st	Z+, r24
    7d84:	91 93       	st	Z+, r25
    7d86:	22 50       	subi	r18, 0x02	; 2
    7d88:	31 09       	sbc	r19, r1
    7d8a:	2d 93       	st	X+, r18
    7d8c:	3c 93       	st	X, r19
    7d8e:	3a c0       	rjmp	.+116    	; 0x7e04 <malloc+0x122>
    7d90:	20 91 2b 07 	lds	r18, 0x072B	; 0x80072b <__brkval>
    7d94:	30 91 2c 07 	lds	r19, 0x072C	; 0x80072c <__brkval+0x1>
    7d98:	23 2b       	or	r18, r19
    7d9a:	41 f4       	brne	.+16     	; 0x7dac <malloc+0xca>
    7d9c:	20 91 1c 01 	lds	r18, 0x011C	; 0x80011c <__malloc_heap_start>
    7da0:	30 91 1d 01 	lds	r19, 0x011D	; 0x80011d <__malloc_heap_start+0x1>
    7da4:	30 93 2c 07 	sts	0x072C, r19	; 0x80072c <__brkval+0x1>
    7da8:	20 93 2b 07 	sts	0x072B, r18	; 0x80072b <__brkval>
    7dac:	20 91 1a 01 	lds	r18, 0x011A	; 0x80011a <__malloc_heap_end>
    7db0:	30 91 1b 01 	lds	r19, 0x011B	; 0x80011b <__malloc_heap_end+0x1>
    7db4:	21 15       	cp	r18, r1
    7db6:	31 05       	cpc	r19, r1
    7db8:	41 f4       	brne	.+16     	; 0x7dca <malloc+0xe8>
    7dba:	2d b7       	in	r18, 0x3d	; 61
    7dbc:	3e b7       	in	r19, 0x3e	; 62
    7dbe:	40 91 1e 01 	lds	r20, 0x011E	; 0x80011e <__malloc_margin>
    7dc2:	50 91 1f 01 	lds	r21, 0x011F	; 0x80011f <__malloc_margin+0x1>
    7dc6:	24 1b       	sub	r18, r20
    7dc8:	35 0b       	sbc	r19, r21
    7dca:	e0 91 2b 07 	lds	r30, 0x072B	; 0x80072b <__brkval>
    7dce:	f0 91 2c 07 	lds	r31, 0x072C	; 0x80072c <__brkval+0x1>
    7dd2:	e2 17       	cp	r30, r18
    7dd4:	f3 07       	cpc	r31, r19
    7dd6:	a0 f4       	brcc	.+40     	; 0x7e00 <malloc+0x11e>
    7dd8:	2e 1b       	sub	r18, r30
    7dda:	3f 0b       	sbc	r19, r31
    7ddc:	28 17       	cp	r18, r24
    7dde:	39 07       	cpc	r19, r25
    7de0:	78 f0       	brcs	.+30     	; 0x7e00 <malloc+0x11e>
    7de2:	ac 01       	movw	r20, r24
    7de4:	4e 5f       	subi	r20, 0xFE	; 254
    7de6:	5f 4f       	sbci	r21, 0xFF	; 255
    7de8:	24 17       	cp	r18, r20
    7dea:	35 07       	cpc	r19, r21
    7dec:	48 f0       	brcs	.+18     	; 0x7e00 <malloc+0x11e>
    7dee:	4e 0f       	add	r20, r30
    7df0:	5f 1f       	adc	r21, r31
    7df2:	50 93 2c 07 	sts	0x072C, r21	; 0x80072c <__brkval+0x1>
    7df6:	40 93 2b 07 	sts	0x072B, r20	; 0x80072b <__brkval>
    7dfa:	81 93       	st	Z+, r24
    7dfc:	91 93       	st	Z+, r25
    7dfe:	02 c0       	rjmp	.+4      	; 0x7e04 <malloc+0x122>
    7e00:	e0 e0       	ldi	r30, 0x00	; 0
    7e02:	f0 e0       	ldi	r31, 0x00	; 0
    7e04:	cf 01       	movw	r24, r30
    7e06:	df 91       	pop	r29
    7e08:	cf 91       	pop	r28
    7e0a:	08 95       	ret

00007e0c <free>:
    7e0c:	0f 93       	push	r16
    7e0e:	1f 93       	push	r17
    7e10:	cf 93       	push	r28
    7e12:	df 93       	push	r29
    7e14:	00 97       	sbiw	r24, 0x00	; 0
    7e16:	09 f4       	brne	.+2      	; 0x7e1a <free+0xe>
    7e18:	8c c0       	rjmp	.+280    	; 0x7f32 <free+0x126>
    7e1a:	fc 01       	movw	r30, r24
    7e1c:	32 97       	sbiw	r30, 0x02	; 2
    7e1e:	13 82       	std	Z+3, r1	; 0x03
    7e20:	12 82       	std	Z+2, r1	; 0x02
    7e22:	00 91 2d 07 	lds	r16, 0x072D	; 0x80072d <__flp>
    7e26:	10 91 2e 07 	lds	r17, 0x072E	; 0x80072e <__flp+0x1>
    7e2a:	01 15       	cp	r16, r1
    7e2c:	11 05       	cpc	r17, r1
    7e2e:	81 f4       	brne	.+32     	; 0x7e50 <free+0x44>
    7e30:	20 81       	ld	r18, Z
    7e32:	31 81       	ldd	r19, Z+1	; 0x01
    7e34:	82 0f       	add	r24, r18
    7e36:	93 1f       	adc	r25, r19
    7e38:	20 91 2b 07 	lds	r18, 0x072B	; 0x80072b <__brkval>
    7e3c:	30 91 2c 07 	lds	r19, 0x072C	; 0x80072c <__brkval+0x1>
    7e40:	28 17       	cp	r18, r24
    7e42:	39 07       	cpc	r19, r25
    7e44:	79 f5       	brne	.+94     	; 0x7ea4 <free+0x98>
    7e46:	f0 93 2c 07 	sts	0x072C, r31	; 0x80072c <__brkval+0x1>
    7e4a:	e0 93 2b 07 	sts	0x072B, r30	; 0x80072b <__brkval>
    7e4e:	71 c0       	rjmp	.+226    	; 0x7f32 <free+0x126>
    7e50:	d8 01       	movw	r26, r16
    7e52:	40 e0       	ldi	r20, 0x00	; 0
    7e54:	50 e0       	ldi	r21, 0x00	; 0
    7e56:	ae 17       	cp	r26, r30
    7e58:	bf 07       	cpc	r27, r31
    7e5a:	50 f4       	brcc	.+20     	; 0x7e70 <free+0x64>
    7e5c:	12 96       	adiw	r26, 0x02	; 2
    7e5e:	2d 91       	ld	r18, X+
    7e60:	3c 91       	ld	r19, X
    7e62:	13 97       	sbiw	r26, 0x03	; 3
    7e64:	ad 01       	movw	r20, r26
    7e66:	21 15       	cp	r18, r1
    7e68:	31 05       	cpc	r19, r1
    7e6a:	09 f1       	breq	.+66     	; 0x7eae <free+0xa2>
    7e6c:	d9 01       	movw	r26, r18
    7e6e:	f3 cf       	rjmp	.-26     	; 0x7e56 <free+0x4a>
    7e70:	9d 01       	movw	r18, r26
    7e72:	da 01       	movw	r26, r20
    7e74:	33 83       	std	Z+3, r19	; 0x03
    7e76:	22 83       	std	Z+2, r18	; 0x02
    7e78:	60 81       	ld	r22, Z
    7e7a:	71 81       	ldd	r23, Z+1	; 0x01
    7e7c:	86 0f       	add	r24, r22
    7e7e:	97 1f       	adc	r25, r23
    7e80:	82 17       	cp	r24, r18
    7e82:	93 07       	cpc	r25, r19
    7e84:	69 f4       	brne	.+26     	; 0x7ea0 <free+0x94>
    7e86:	ec 01       	movw	r28, r24
    7e88:	28 81       	ld	r18, Y
    7e8a:	39 81       	ldd	r19, Y+1	; 0x01
    7e8c:	26 0f       	add	r18, r22
    7e8e:	37 1f       	adc	r19, r23
    7e90:	2e 5f       	subi	r18, 0xFE	; 254
    7e92:	3f 4f       	sbci	r19, 0xFF	; 255
    7e94:	31 83       	std	Z+1, r19	; 0x01
    7e96:	20 83       	st	Z, r18
    7e98:	8a 81       	ldd	r24, Y+2	; 0x02
    7e9a:	9b 81       	ldd	r25, Y+3	; 0x03
    7e9c:	93 83       	std	Z+3, r25	; 0x03
    7e9e:	82 83       	std	Z+2, r24	; 0x02
    7ea0:	45 2b       	or	r20, r21
    7ea2:	29 f4       	brne	.+10     	; 0x7eae <free+0xa2>
    7ea4:	f0 93 2e 07 	sts	0x072E, r31	; 0x80072e <__flp+0x1>
    7ea8:	e0 93 2d 07 	sts	0x072D, r30	; 0x80072d <__flp>
    7eac:	42 c0       	rjmp	.+132    	; 0x7f32 <free+0x126>
    7eae:	13 96       	adiw	r26, 0x03	; 3
    7eb0:	fc 93       	st	X, r31
    7eb2:	ee 93       	st	-X, r30
    7eb4:	12 97       	sbiw	r26, 0x02	; 2
    7eb6:	ed 01       	movw	r28, r26
    7eb8:	49 91       	ld	r20, Y+
    7eba:	59 91       	ld	r21, Y+
    7ebc:	9e 01       	movw	r18, r28
    7ebe:	24 0f       	add	r18, r20
    7ec0:	35 1f       	adc	r19, r21
    7ec2:	e2 17       	cp	r30, r18
    7ec4:	f3 07       	cpc	r31, r19
    7ec6:	71 f4       	brne	.+28     	; 0x7ee4 <free+0xd8>
    7ec8:	80 81       	ld	r24, Z
    7eca:	91 81       	ldd	r25, Z+1	; 0x01
    7ecc:	84 0f       	add	r24, r20
    7ece:	95 1f       	adc	r25, r21
    7ed0:	02 96       	adiw	r24, 0x02	; 2
    7ed2:	11 96       	adiw	r26, 0x01	; 1
    7ed4:	9c 93       	st	X, r25
    7ed6:	8e 93       	st	-X, r24
    7ed8:	82 81       	ldd	r24, Z+2	; 0x02
    7eda:	93 81       	ldd	r25, Z+3	; 0x03
    7edc:	13 96       	adiw	r26, 0x03	; 3
    7ede:	9c 93       	st	X, r25
    7ee0:	8e 93       	st	-X, r24
    7ee2:	12 97       	sbiw	r26, 0x02	; 2
    7ee4:	e0 e0       	ldi	r30, 0x00	; 0
    7ee6:	f0 e0       	ldi	r31, 0x00	; 0
    7ee8:	d8 01       	movw	r26, r16
    7eea:	12 96       	adiw	r26, 0x02	; 2
    7eec:	8d 91       	ld	r24, X+
    7eee:	9c 91       	ld	r25, X
    7ef0:	13 97       	sbiw	r26, 0x03	; 3
    7ef2:	00 97       	sbiw	r24, 0x00	; 0
    7ef4:	19 f0       	breq	.+6      	; 0x7efc <free+0xf0>
    7ef6:	f8 01       	movw	r30, r16
    7ef8:	8c 01       	movw	r16, r24
    7efa:	f6 cf       	rjmp	.-20     	; 0x7ee8 <free+0xdc>
    7efc:	8d 91       	ld	r24, X+
    7efe:	9c 91       	ld	r25, X
    7f00:	98 01       	movw	r18, r16
    7f02:	2e 5f       	subi	r18, 0xFE	; 254
    7f04:	3f 4f       	sbci	r19, 0xFF	; 255
    7f06:	82 0f       	add	r24, r18
    7f08:	93 1f       	adc	r25, r19
    7f0a:	20 91 2b 07 	lds	r18, 0x072B	; 0x80072b <__brkval>
    7f0e:	30 91 2c 07 	lds	r19, 0x072C	; 0x80072c <__brkval+0x1>
    7f12:	28 17       	cp	r18, r24
    7f14:	39 07       	cpc	r19, r25
    7f16:	69 f4       	brne	.+26     	; 0x7f32 <free+0x126>
    7f18:	30 97       	sbiw	r30, 0x00	; 0
    7f1a:	29 f4       	brne	.+10     	; 0x7f26 <free+0x11a>
    7f1c:	10 92 2e 07 	sts	0x072E, r1	; 0x80072e <__flp+0x1>
    7f20:	10 92 2d 07 	sts	0x072D, r1	; 0x80072d <__flp>
    7f24:	02 c0       	rjmp	.+4      	; 0x7f2a <free+0x11e>
    7f26:	13 82       	std	Z+3, r1	; 0x03
    7f28:	12 82       	std	Z+2, r1	; 0x02
    7f2a:	10 93 2c 07 	sts	0x072C, r17	; 0x80072c <__brkval+0x1>
    7f2e:	00 93 2b 07 	sts	0x072B, r16	; 0x80072b <__brkval>
    7f32:	df 91       	pop	r29
    7f34:	cf 91       	pop	r28
    7f36:	1f 91       	pop	r17
    7f38:	0f 91       	pop	r16
    7f3a:	08 95       	ret

00007f3c <exit>:
    7f3c:	f8 94       	cli
    7f3e:	0c 94 b6 44 	jmp	0x896c	; 0x896c <_exit>

00007f42 <strnlen_P>:
    7f42:	fc 01       	movw	r30, r24
    7f44:	05 90       	lpm	r0, Z+
    7f46:	61 50       	subi	r22, 0x01	; 1
    7f48:	70 40       	sbci	r23, 0x00	; 0
    7f4a:	01 10       	cpse	r0, r1
    7f4c:	d8 f7       	brcc	.-10     	; 0x7f44 <strnlen_P+0x2>
    7f4e:	80 95       	com	r24
    7f50:	90 95       	com	r25
    7f52:	8e 0f       	add	r24, r30
    7f54:	9f 1f       	adc	r25, r31
    7f56:	08 95       	ret

00007f58 <strnlen>:
    7f58:	fc 01       	movw	r30, r24
    7f5a:	61 50       	subi	r22, 0x01	; 1
    7f5c:	70 40       	sbci	r23, 0x00	; 0
    7f5e:	01 90       	ld	r0, Z+
    7f60:	01 10       	cpse	r0, r1
    7f62:	d8 f7       	brcc	.-10     	; 0x7f5a <strnlen+0x2>
    7f64:	80 95       	com	r24
    7f66:	90 95       	com	r25
    7f68:	8e 0f       	add	r24, r30
    7f6a:	9f 1f       	adc	r25, r31
    7f6c:	08 95       	ret

00007f6e <__subsf3>:
    7f6e:	50 58       	subi	r21, 0x80	; 128

00007f70 <__addsf3>:
    7f70:	bb 27       	eor	r27, r27
    7f72:	aa 27       	eor	r26, r26
    7f74:	0e 94 cf 3f 	call	0x7f9e	; 0x7f9e <__addsf3x>
    7f78:	0c 94 12 42 	jmp	0x8424	; 0x8424 <__fp_round>
    7f7c:	0e 94 d9 41 	call	0x83b2	; 0x83b2 <__fp_pscA>
    7f80:	38 f0       	brcs	.+14     	; 0x7f90 <__addsf3+0x20>
    7f82:	0e 94 e0 41 	call	0x83c0	; 0x83c0 <__fp_pscB>
    7f86:	20 f0       	brcs	.+8      	; 0x7f90 <__addsf3+0x20>
    7f88:	39 f4       	brne	.+14     	; 0x7f98 <__addsf3+0x28>
    7f8a:	9f 3f       	cpi	r25, 0xFF	; 255
    7f8c:	19 f4       	brne	.+6      	; 0x7f94 <__addsf3+0x24>
    7f8e:	26 f4       	brtc	.+8      	; 0x7f98 <__addsf3+0x28>
    7f90:	0c 94 af 41 	jmp	0x835e	; 0x835e <__fp_nan>
    7f94:	0e f4       	brtc	.+2      	; 0x7f98 <__addsf3+0x28>
    7f96:	e0 95       	com	r30
    7f98:	e7 fb       	bst	r30, 7
    7f9a:	0c 94 a9 41 	jmp	0x8352	; 0x8352 <__fp_inf>

00007f9e <__addsf3x>:
    7f9e:	e9 2f       	mov	r30, r25
    7fa0:	0e 94 37 42 	call	0x846e	; 0x846e <__fp_split3>
    7fa4:	58 f3       	brcs	.-42     	; 0x7f7c <__addsf3+0xc>
    7fa6:	ba 17       	cp	r27, r26
    7fa8:	62 07       	cpc	r22, r18
    7faa:	73 07       	cpc	r23, r19
    7fac:	84 07       	cpc	r24, r20
    7fae:	95 07       	cpc	r25, r21
    7fb0:	20 f0       	brcs	.+8      	; 0x7fba <__addsf3x+0x1c>
    7fb2:	79 f4       	brne	.+30     	; 0x7fd2 <__addsf3x+0x34>
    7fb4:	a6 f5       	brtc	.+104    	; 0x801e <__addsf3x+0x80>
    7fb6:	0c 94 59 42 	jmp	0x84b2	; 0x84b2 <__fp_zero>
    7fba:	0e f4       	brtc	.+2      	; 0x7fbe <__addsf3x+0x20>
    7fbc:	e0 95       	com	r30
    7fbe:	0b 2e       	mov	r0, r27
    7fc0:	ba 2f       	mov	r27, r26
    7fc2:	a0 2d       	mov	r26, r0
    7fc4:	0b 01       	movw	r0, r22
    7fc6:	b9 01       	movw	r22, r18
    7fc8:	90 01       	movw	r18, r0
    7fca:	0c 01       	movw	r0, r24
    7fcc:	ca 01       	movw	r24, r20
    7fce:	a0 01       	movw	r20, r0
    7fd0:	11 24       	eor	r1, r1
    7fd2:	ff 27       	eor	r31, r31
    7fd4:	59 1b       	sub	r21, r25
    7fd6:	99 f0       	breq	.+38     	; 0x7ffe <__addsf3x+0x60>
    7fd8:	59 3f       	cpi	r21, 0xF9	; 249
    7fda:	50 f4       	brcc	.+20     	; 0x7ff0 <__addsf3x+0x52>
    7fdc:	50 3e       	cpi	r21, 0xE0	; 224
    7fde:	68 f1       	brcs	.+90     	; 0x803a <__addsf3x+0x9c>
    7fe0:	1a 16       	cp	r1, r26
    7fe2:	f0 40       	sbci	r31, 0x00	; 0
    7fe4:	a2 2f       	mov	r26, r18
    7fe6:	23 2f       	mov	r18, r19
    7fe8:	34 2f       	mov	r19, r20
    7fea:	44 27       	eor	r20, r20
    7fec:	58 5f       	subi	r21, 0xF8	; 248
    7fee:	f3 cf       	rjmp	.-26     	; 0x7fd6 <__addsf3x+0x38>
    7ff0:	46 95       	lsr	r20
    7ff2:	37 95       	ror	r19
    7ff4:	27 95       	ror	r18
    7ff6:	a7 95       	ror	r26
    7ff8:	f0 40       	sbci	r31, 0x00	; 0
    7ffa:	53 95       	inc	r21
    7ffc:	c9 f7       	brne	.-14     	; 0x7ff0 <__addsf3x+0x52>
    7ffe:	7e f4       	brtc	.+30     	; 0x801e <__addsf3x+0x80>
    8000:	1f 16       	cp	r1, r31
    8002:	ba 0b       	sbc	r27, r26
    8004:	62 0b       	sbc	r22, r18
    8006:	73 0b       	sbc	r23, r19
    8008:	84 0b       	sbc	r24, r20
    800a:	ba f0       	brmi	.+46     	; 0x803a <__addsf3x+0x9c>
    800c:	91 50       	subi	r25, 0x01	; 1
    800e:	a1 f0       	breq	.+40     	; 0x8038 <__addsf3x+0x9a>
    8010:	ff 0f       	add	r31, r31
    8012:	bb 1f       	adc	r27, r27
    8014:	66 1f       	adc	r22, r22
    8016:	77 1f       	adc	r23, r23
    8018:	88 1f       	adc	r24, r24
    801a:	c2 f7       	brpl	.-16     	; 0x800c <__addsf3x+0x6e>
    801c:	0e c0       	rjmp	.+28     	; 0x803a <__addsf3x+0x9c>
    801e:	ba 0f       	add	r27, r26
    8020:	62 1f       	adc	r22, r18
    8022:	73 1f       	adc	r23, r19
    8024:	84 1f       	adc	r24, r20
    8026:	48 f4       	brcc	.+18     	; 0x803a <__addsf3x+0x9c>
    8028:	87 95       	ror	r24
    802a:	77 95       	ror	r23
    802c:	67 95       	ror	r22
    802e:	b7 95       	ror	r27
    8030:	f7 95       	ror	r31
    8032:	9e 3f       	cpi	r25, 0xFE	; 254
    8034:	08 f0       	brcs	.+2      	; 0x8038 <__addsf3x+0x9a>
    8036:	b0 cf       	rjmp	.-160    	; 0x7f98 <__addsf3+0x28>
    8038:	93 95       	inc	r25
    803a:	88 0f       	add	r24, r24
    803c:	08 f0       	brcs	.+2      	; 0x8040 <__addsf3x+0xa2>
    803e:	99 27       	eor	r25, r25
    8040:	ee 0f       	add	r30, r30
    8042:	97 95       	ror	r25
    8044:	87 95       	ror	r24
    8046:	08 95       	ret
    8048:	0e 94 d9 41 	call	0x83b2	; 0x83b2 <__fp_pscA>
    804c:	60 f0       	brcs	.+24     	; 0x8066 <__addsf3x+0xc8>
    804e:	80 e8       	ldi	r24, 0x80	; 128
    8050:	91 e0       	ldi	r25, 0x01	; 1
    8052:	09 f4       	brne	.+2      	; 0x8056 <__addsf3x+0xb8>
    8054:	9e ef       	ldi	r25, 0xFE	; 254
    8056:	0e 94 e0 41 	call	0x83c0	; 0x83c0 <__fp_pscB>
    805a:	28 f0       	brcs	.+10     	; 0x8066 <__addsf3x+0xc8>
    805c:	40 e8       	ldi	r20, 0x80	; 128
    805e:	51 e0       	ldi	r21, 0x01	; 1
    8060:	71 f4       	brne	.+28     	; 0x807e <atan2+0x10>
    8062:	5e ef       	ldi	r21, 0xFE	; 254
    8064:	0c c0       	rjmp	.+24     	; 0x807e <atan2+0x10>
    8066:	0c 94 af 41 	jmp	0x835e	; 0x835e <__fp_nan>
    806a:	0c 94 59 42 	jmp	0x84b2	; 0x84b2 <__fp_zero>

0000806e <atan2>:
    806e:	e9 2f       	mov	r30, r25
    8070:	e0 78       	andi	r30, 0x80	; 128
    8072:	0e 94 37 42 	call	0x846e	; 0x846e <__fp_split3>
    8076:	40 f3       	brcs	.-48     	; 0x8048 <__addsf3x+0xaa>
    8078:	09 2e       	mov	r0, r25
    807a:	05 2a       	or	r0, r21
    807c:	b1 f3       	breq	.-20     	; 0x806a <__addsf3x+0xcc>
    807e:	26 17       	cp	r18, r22
    8080:	37 07       	cpc	r19, r23
    8082:	48 07       	cpc	r20, r24
    8084:	59 07       	cpc	r21, r25
    8086:	38 f0       	brcs	.+14     	; 0x8096 <atan2+0x28>
    8088:	0e 2e       	mov	r0, r30
    808a:	07 f8       	bld	r0, 7
    808c:	e0 25       	eor	r30, r0
    808e:	69 f0       	breq	.+26     	; 0x80aa <atan2+0x3c>
    8090:	e0 25       	eor	r30, r0
    8092:	e0 64       	ori	r30, 0x40	; 64
    8094:	0a c0       	rjmp	.+20     	; 0x80aa <atan2+0x3c>
    8096:	ef 63       	ori	r30, 0x3F	; 63
    8098:	07 f8       	bld	r0, 7
    809a:	00 94       	com	r0
    809c:	07 fa       	bst	r0, 7
    809e:	db 01       	movw	r26, r22
    80a0:	b9 01       	movw	r22, r18
    80a2:	9d 01       	movw	r18, r26
    80a4:	dc 01       	movw	r26, r24
    80a6:	ca 01       	movw	r24, r20
    80a8:	ad 01       	movw	r20, r26
    80aa:	ef 93       	push	r30
    80ac:	0e 94 b7 40 	call	0x816e	; 0x816e <__divsf3_pse>
    80b0:	0e 94 12 42 	call	0x8424	; 0x8424 <__fp_round>
    80b4:	0e 94 67 40 	call	0x80ce	; 0x80ce <atan>
    80b8:	5f 91       	pop	r21
    80ba:	55 23       	and	r21, r21
    80bc:	39 f0       	breq	.+14     	; 0x80cc <atan2+0x5e>
    80be:	2b ed       	ldi	r18, 0xDB	; 219
    80c0:	3f e0       	ldi	r19, 0x0F	; 15
    80c2:	49 e4       	ldi	r20, 0x49	; 73
    80c4:	50 fd       	sbrc	r21, 0
    80c6:	49 ec       	ldi	r20, 0xC9	; 201
    80c8:	0c 94 b8 3f 	jmp	0x7f70	; 0x7f70 <__addsf3>
    80cc:	08 95       	ret

000080ce <atan>:
    80ce:	df 93       	push	r29
    80d0:	dd 27       	eor	r29, r29
    80d2:	b9 2f       	mov	r27, r25
    80d4:	bf 77       	andi	r27, 0x7F	; 127
    80d6:	40 e8       	ldi	r20, 0x80	; 128
    80d8:	5f e3       	ldi	r21, 0x3F	; 63
    80da:	16 16       	cp	r1, r22
    80dc:	17 06       	cpc	r1, r23
    80de:	48 07       	cpc	r20, r24
    80e0:	5b 07       	cpc	r21, r27
    80e2:	18 f4       	brcc	.+6      	; 0x80ea <atan+0x1c>
    80e4:	d9 2f       	mov	r29, r25
    80e6:	0e 94 65 42 	call	0x84ca	; 0x84ca <inverse>
    80ea:	9f 93       	push	r25
    80ec:	8f 93       	push	r24
    80ee:	7f 93       	push	r23
    80f0:	6f 93       	push	r22
    80f2:	0e 94 20 43 	call	0x8640	; 0x8640 <square>
    80f6:	e2 e9       	ldi	r30, 0x92	; 146
    80f8:	f0 e0       	ldi	r31, 0x00	; 0
    80fa:	0e 94 b2 41 	call	0x8364	; 0x8364 <__fp_powser>
    80fe:	0e 94 12 42 	call	0x8424	; 0x8424 <__fp_round>
    8102:	2f 91       	pop	r18
    8104:	3f 91       	pop	r19
    8106:	4f 91       	pop	r20
    8108:	5f 91       	pop	r21
    810a:	0e 94 80 42 	call	0x8500	; 0x8500 <__mulsf3x>
    810e:	dd 23       	and	r29, r29
    8110:	51 f0       	breq	.+20     	; 0x8126 <atan+0x58>
    8112:	90 58       	subi	r25, 0x80	; 128
    8114:	a2 ea       	ldi	r26, 0xA2	; 162
    8116:	2a ed       	ldi	r18, 0xDA	; 218
    8118:	3f e0       	ldi	r19, 0x0F	; 15
    811a:	49 ec       	ldi	r20, 0xC9	; 201
    811c:	5f e3       	ldi	r21, 0x3F	; 63
    811e:	d0 78       	andi	r29, 0x80	; 128
    8120:	5d 27       	eor	r21, r29
    8122:	0e 94 cf 3f 	call	0x7f9e	; 0x7f9e <__addsf3x>
    8126:	df 91       	pop	r29
    8128:	0c 94 12 42 	jmp	0x8424	; 0x8424 <__fp_round>

0000812c <__cmpsf2>:
    812c:	0e 94 85 41 	call	0x830a	; 0x830a <__fp_cmp>
    8130:	08 f4       	brcc	.+2      	; 0x8134 <__cmpsf2+0x8>
    8132:	81 e0       	ldi	r24, 0x01	; 1
    8134:	08 95       	ret

00008136 <cos>:
    8136:	0e 94 e9 41 	call	0x83d2	; 0x83d2 <__fp_rempio2>
    813a:	e3 95       	inc	r30
    813c:	0c 94 23 42 	jmp	0x8446	; 0x8446 <__fp_sinus>

00008140 <__divsf3>:
    8140:	0e 94 b4 40 	call	0x8168	; 0x8168 <__divsf3x>
    8144:	0c 94 12 42 	jmp	0x8424	; 0x8424 <__fp_round>
    8148:	0e 94 e0 41 	call	0x83c0	; 0x83c0 <__fp_pscB>
    814c:	58 f0       	brcs	.+22     	; 0x8164 <__divsf3+0x24>
    814e:	0e 94 d9 41 	call	0x83b2	; 0x83b2 <__fp_pscA>
    8152:	40 f0       	brcs	.+16     	; 0x8164 <__divsf3+0x24>
    8154:	29 f4       	brne	.+10     	; 0x8160 <__divsf3+0x20>
    8156:	5f 3f       	cpi	r21, 0xFF	; 255
    8158:	29 f0       	breq	.+10     	; 0x8164 <__divsf3+0x24>
    815a:	0c 94 a9 41 	jmp	0x8352	; 0x8352 <__fp_inf>
    815e:	51 11       	cpse	r21, r1
    8160:	0c 94 5a 42 	jmp	0x84b4	; 0x84b4 <__fp_szero>
    8164:	0c 94 af 41 	jmp	0x835e	; 0x835e <__fp_nan>

00008168 <__divsf3x>:
    8168:	0e 94 37 42 	call	0x846e	; 0x846e <__fp_split3>
    816c:	68 f3       	brcs	.-38     	; 0x8148 <__divsf3+0x8>

0000816e <__divsf3_pse>:
    816e:	99 23       	and	r25, r25
    8170:	b1 f3       	breq	.-20     	; 0x815e <__divsf3+0x1e>
    8172:	55 23       	and	r21, r21
    8174:	91 f3       	breq	.-28     	; 0x815a <__divsf3+0x1a>
    8176:	95 1b       	sub	r25, r21
    8178:	55 0b       	sbc	r21, r21
    817a:	bb 27       	eor	r27, r27
    817c:	aa 27       	eor	r26, r26
    817e:	62 17       	cp	r22, r18
    8180:	73 07       	cpc	r23, r19
    8182:	84 07       	cpc	r24, r20
    8184:	38 f0       	brcs	.+14     	; 0x8194 <__divsf3_pse+0x26>
    8186:	9f 5f       	subi	r25, 0xFF	; 255
    8188:	5f 4f       	sbci	r21, 0xFF	; 255
    818a:	22 0f       	add	r18, r18
    818c:	33 1f       	adc	r19, r19
    818e:	44 1f       	adc	r20, r20
    8190:	aa 1f       	adc	r26, r26
    8192:	a9 f3       	breq	.-22     	; 0x817e <__divsf3_pse+0x10>
    8194:	35 d0       	rcall	.+106    	; 0x8200 <__divsf3_pse+0x92>
    8196:	0e 2e       	mov	r0, r30
    8198:	3a f0       	brmi	.+14     	; 0x81a8 <__divsf3_pse+0x3a>
    819a:	e0 e8       	ldi	r30, 0x80	; 128
    819c:	32 d0       	rcall	.+100    	; 0x8202 <__divsf3_pse+0x94>
    819e:	91 50       	subi	r25, 0x01	; 1
    81a0:	50 40       	sbci	r21, 0x00	; 0
    81a2:	e6 95       	lsr	r30
    81a4:	00 1c       	adc	r0, r0
    81a6:	ca f7       	brpl	.-14     	; 0x819a <__divsf3_pse+0x2c>
    81a8:	2b d0       	rcall	.+86     	; 0x8200 <__divsf3_pse+0x92>
    81aa:	fe 2f       	mov	r31, r30
    81ac:	29 d0       	rcall	.+82     	; 0x8200 <__divsf3_pse+0x92>
    81ae:	66 0f       	add	r22, r22
    81b0:	77 1f       	adc	r23, r23
    81b2:	88 1f       	adc	r24, r24
    81b4:	bb 1f       	adc	r27, r27
    81b6:	26 17       	cp	r18, r22
    81b8:	37 07       	cpc	r19, r23
    81ba:	48 07       	cpc	r20, r24
    81bc:	ab 07       	cpc	r26, r27
    81be:	b0 e8       	ldi	r27, 0x80	; 128
    81c0:	09 f0       	breq	.+2      	; 0x81c4 <__divsf3_pse+0x56>
    81c2:	bb 0b       	sbc	r27, r27
    81c4:	80 2d       	mov	r24, r0
    81c6:	bf 01       	movw	r22, r30
    81c8:	ff 27       	eor	r31, r31
    81ca:	93 58       	subi	r25, 0x83	; 131
    81cc:	5f 4f       	sbci	r21, 0xFF	; 255
    81ce:	3a f0       	brmi	.+14     	; 0x81de <__divsf3_pse+0x70>
    81d0:	9e 3f       	cpi	r25, 0xFE	; 254
    81d2:	51 05       	cpc	r21, r1
    81d4:	78 f0       	brcs	.+30     	; 0x81f4 <__divsf3_pse+0x86>
    81d6:	0c 94 a9 41 	jmp	0x8352	; 0x8352 <__fp_inf>
    81da:	0c 94 5a 42 	jmp	0x84b4	; 0x84b4 <__fp_szero>
    81de:	5f 3f       	cpi	r21, 0xFF	; 255
    81e0:	e4 f3       	brlt	.-8      	; 0x81da <__divsf3_pse+0x6c>
    81e2:	98 3e       	cpi	r25, 0xE8	; 232
    81e4:	d4 f3       	brlt	.-12     	; 0x81da <__divsf3_pse+0x6c>
    81e6:	86 95       	lsr	r24
    81e8:	77 95       	ror	r23
    81ea:	67 95       	ror	r22
    81ec:	b7 95       	ror	r27
    81ee:	f7 95       	ror	r31
    81f0:	9f 5f       	subi	r25, 0xFF	; 255
    81f2:	c9 f7       	brne	.-14     	; 0x81e6 <__divsf3_pse+0x78>
    81f4:	88 0f       	add	r24, r24
    81f6:	91 1d       	adc	r25, r1
    81f8:	96 95       	lsr	r25
    81fa:	87 95       	ror	r24
    81fc:	97 f9       	bld	r25, 7
    81fe:	08 95       	ret
    8200:	e1 e0       	ldi	r30, 0x01	; 1
    8202:	66 0f       	add	r22, r22
    8204:	77 1f       	adc	r23, r23
    8206:	88 1f       	adc	r24, r24
    8208:	bb 1f       	adc	r27, r27
    820a:	62 17       	cp	r22, r18
    820c:	73 07       	cpc	r23, r19
    820e:	84 07       	cpc	r24, r20
    8210:	ba 07       	cpc	r27, r26
    8212:	20 f0       	brcs	.+8      	; 0x821c <__divsf3_pse+0xae>
    8214:	62 1b       	sub	r22, r18
    8216:	73 0b       	sbc	r23, r19
    8218:	84 0b       	sbc	r24, r20
    821a:	ba 0b       	sbc	r27, r26
    821c:	ee 1f       	adc	r30, r30
    821e:	88 f7       	brcc	.-30     	; 0x8202 <__divsf3_pse+0x94>
    8220:	e0 95       	com	r30
    8222:	08 95       	ret

00008224 <__fixsfsi>:
    8224:	0e 94 19 41 	call	0x8232	; 0x8232 <__fixunssfsi>
    8228:	68 94       	set
    822a:	b1 11       	cpse	r27, r1
    822c:	0c 94 5a 42 	jmp	0x84b4	; 0x84b4 <__fp_szero>
    8230:	08 95       	ret

00008232 <__fixunssfsi>:
    8232:	0e 94 3f 42 	call	0x847e	; 0x847e <__fp_splitA>
    8236:	88 f0       	brcs	.+34     	; 0x825a <__fixunssfsi+0x28>
    8238:	9f 57       	subi	r25, 0x7F	; 127
    823a:	98 f0       	brcs	.+38     	; 0x8262 <__fixunssfsi+0x30>
    823c:	b9 2f       	mov	r27, r25
    823e:	99 27       	eor	r25, r25
    8240:	b7 51       	subi	r27, 0x17	; 23
    8242:	b0 f0       	brcs	.+44     	; 0x8270 <__fixunssfsi+0x3e>
    8244:	e1 f0       	breq	.+56     	; 0x827e <__fixunssfsi+0x4c>
    8246:	66 0f       	add	r22, r22
    8248:	77 1f       	adc	r23, r23
    824a:	88 1f       	adc	r24, r24
    824c:	99 1f       	adc	r25, r25
    824e:	1a f0       	brmi	.+6      	; 0x8256 <__fixunssfsi+0x24>
    8250:	ba 95       	dec	r27
    8252:	c9 f7       	brne	.-14     	; 0x8246 <__fixunssfsi+0x14>
    8254:	14 c0       	rjmp	.+40     	; 0x827e <__fixunssfsi+0x4c>
    8256:	b1 30       	cpi	r27, 0x01	; 1
    8258:	91 f0       	breq	.+36     	; 0x827e <__fixunssfsi+0x4c>
    825a:	0e 94 59 42 	call	0x84b2	; 0x84b2 <__fp_zero>
    825e:	b1 e0       	ldi	r27, 0x01	; 1
    8260:	08 95       	ret
    8262:	0c 94 59 42 	jmp	0x84b2	; 0x84b2 <__fp_zero>
    8266:	67 2f       	mov	r22, r23
    8268:	78 2f       	mov	r23, r24
    826a:	88 27       	eor	r24, r24
    826c:	b8 5f       	subi	r27, 0xF8	; 248
    826e:	39 f0       	breq	.+14     	; 0x827e <__fixunssfsi+0x4c>
    8270:	b9 3f       	cpi	r27, 0xF9	; 249
    8272:	cc f3       	brlt	.-14     	; 0x8266 <__fixunssfsi+0x34>
    8274:	86 95       	lsr	r24
    8276:	77 95       	ror	r23
    8278:	67 95       	ror	r22
    827a:	b3 95       	inc	r27
    827c:	d9 f7       	brne	.-10     	; 0x8274 <__fixunssfsi+0x42>
    827e:	3e f4       	brtc	.+14     	; 0x828e <__fixunssfsi+0x5c>
    8280:	90 95       	com	r25
    8282:	80 95       	com	r24
    8284:	70 95       	com	r23
    8286:	61 95       	neg	r22
    8288:	7f 4f       	sbci	r23, 0xFF	; 255
    828a:	8f 4f       	sbci	r24, 0xFF	; 255
    828c:	9f 4f       	sbci	r25, 0xFF	; 255
    828e:	08 95       	ret

00008290 <__floatunsisf>:
    8290:	e8 94       	clt
    8292:	09 c0       	rjmp	.+18     	; 0x82a6 <__floatsisf+0x12>

00008294 <__floatsisf>:
    8294:	97 fb       	bst	r25, 7
    8296:	3e f4       	brtc	.+14     	; 0x82a6 <__floatsisf+0x12>
    8298:	90 95       	com	r25
    829a:	80 95       	com	r24
    829c:	70 95       	com	r23
    829e:	61 95       	neg	r22
    82a0:	7f 4f       	sbci	r23, 0xFF	; 255
    82a2:	8f 4f       	sbci	r24, 0xFF	; 255
    82a4:	9f 4f       	sbci	r25, 0xFF	; 255
    82a6:	99 23       	and	r25, r25
    82a8:	a9 f0       	breq	.+42     	; 0x82d4 <__floatsisf+0x40>
    82aa:	f9 2f       	mov	r31, r25
    82ac:	96 e9       	ldi	r25, 0x96	; 150
    82ae:	bb 27       	eor	r27, r27
    82b0:	93 95       	inc	r25
    82b2:	f6 95       	lsr	r31
    82b4:	87 95       	ror	r24
    82b6:	77 95       	ror	r23
    82b8:	67 95       	ror	r22
    82ba:	b7 95       	ror	r27
    82bc:	f1 11       	cpse	r31, r1
    82be:	f8 cf       	rjmp	.-16     	; 0x82b0 <__floatsisf+0x1c>
    82c0:	fa f4       	brpl	.+62     	; 0x8300 <__floatsisf+0x6c>
    82c2:	bb 0f       	add	r27, r27
    82c4:	11 f4       	brne	.+4      	; 0x82ca <__floatsisf+0x36>
    82c6:	60 ff       	sbrs	r22, 0
    82c8:	1b c0       	rjmp	.+54     	; 0x8300 <__floatsisf+0x6c>
    82ca:	6f 5f       	subi	r22, 0xFF	; 255
    82cc:	7f 4f       	sbci	r23, 0xFF	; 255
    82ce:	8f 4f       	sbci	r24, 0xFF	; 255
    82d0:	9f 4f       	sbci	r25, 0xFF	; 255
    82d2:	16 c0       	rjmp	.+44     	; 0x8300 <__floatsisf+0x6c>
    82d4:	88 23       	and	r24, r24
    82d6:	11 f0       	breq	.+4      	; 0x82dc <__floatsisf+0x48>
    82d8:	96 e9       	ldi	r25, 0x96	; 150
    82da:	11 c0       	rjmp	.+34     	; 0x82fe <__floatsisf+0x6a>
    82dc:	77 23       	and	r23, r23
    82de:	21 f0       	breq	.+8      	; 0x82e8 <__floatsisf+0x54>
    82e0:	9e e8       	ldi	r25, 0x8E	; 142
    82e2:	87 2f       	mov	r24, r23
    82e4:	76 2f       	mov	r23, r22
    82e6:	05 c0       	rjmp	.+10     	; 0x82f2 <__floatsisf+0x5e>
    82e8:	66 23       	and	r22, r22
    82ea:	71 f0       	breq	.+28     	; 0x8308 <__floatsisf+0x74>
    82ec:	96 e8       	ldi	r25, 0x86	; 134
    82ee:	86 2f       	mov	r24, r22
    82f0:	70 e0       	ldi	r23, 0x00	; 0
    82f2:	60 e0       	ldi	r22, 0x00	; 0
    82f4:	2a f0       	brmi	.+10     	; 0x8300 <__floatsisf+0x6c>
    82f6:	9a 95       	dec	r25
    82f8:	66 0f       	add	r22, r22
    82fa:	77 1f       	adc	r23, r23
    82fc:	88 1f       	adc	r24, r24
    82fe:	da f7       	brpl	.-10     	; 0x82f6 <__floatsisf+0x62>
    8300:	88 0f       	add	r24, r24
    8302:	96 95       	lsr	r25
    8304:	87 95       	ror	r24
    8306:	97 f9       	bld	r25, 7
    8308:	08 95       	ret

0000830a <__fp_cmp>:
    830a:	99 0f       	add	r25, r25
    830c:	00 08       	sbc	r0, r0
    830e:	55 0f       	add	r21, r21
    8310:	aa 0b       	sbc	r26, r26
    8312:	e0 e8       	ldi	r30, 0x80	; 128
    8314:	fe ef       	ldi	r31, 0xFE	; 254
    8316:	16 16       	cp	r1, r22
    8318:	17 06       	cpc	r1, r23
    831a:	e8 07       	cpc	r30, r24
    831c:	f9 07       	cpc	r31, r25
    831e:	c0 f0       	brcs	.+48     	; 0x8350 <__fp_cmp+0x46>
    8320:	12 16       	cp	r1, r18
    8322:	13 06       	cpc	r1, r19
    8324:	e4 07       	cpc	r30, r20
    8326:	f5 07       	cpc	r31, r21
    8328:	98 f0       	brcs	.+38     	; 0x8350 <__fp_cmp+0x46>
    832a:	62 1b       	sub	r22, r18
    832c:	73 0b       	sbc	r23, r19
    832e:	84 0b       	sbc	r24, r20
    8330:	95 0b       	sbc	r25, r21
    8332:	39 f4       	brne	.+14     	; 0x8342 <__fp_cmp+0x38>
    8334:	0a 26       	eor	r0, r26
    8336:	61 f0       	breq	.+24     	; 0x8350 <__fp_cmp+0x46>
    8338:	23 2b       	or	r18, r19
    833a:	24 2b       	or	r18, r20
    833c:	25 2b       	or	r18, r21
    833e:	21 f4       	brne	.+8      	; 0x8348 <__fp_cmp+0x3e>
    8340:	08 95       	ret
    8342:	0a 26       	eor	r0, r26
    8344:	09 f4       	brne	.+2      	; 0x8348 <__fp_cmp+0x3e>
    8346:	a1 40       	sbci	r26, 0x01	; 1
    8348:	a6 95       	lsr	r26
    834a:	8f ef       	ldi	r24, 0xFF	; 255
    834c:	81 1d       	adc	r24, r1
    834e:	81 1d       	adc	r24, r1
    8350:	08 95       	ret

00008352 <__fp_inf>:
    8352:	97 f9       	bld	r25, 7
    8354:	9f 67       	ori	r25, 0x7F	; 127
    8356:	80 e8       	ldi	r24, 0x80	; 128
    8358:	70 e0       	ldi	r23, 0x00	; 0
    835a:	60 e0       	ldi	r22, 0x00	; 0
    835c:	08 95       	ret

0000835e <__fp_nan>:
    835e:	9f ef       	ldi	r25, 0xFF	; 255
    8360:	80 ec       	ldi	r24, 0xC0	; 192
    8362:	08 95       	ret

00008364 <__fp_powser>:
    8364:	df 93       	push	r29
    8366:	cf 93       	push	r28
    8368:	1f 93       	push	r17
    836a:	0f 93       	push	r16
    836c:	ff 92       	push	r15
    836e:	ef 92       	push	r14
    8370:	df 92       	push	r13
    8372:	7b 01       	movw	r14, r22
    8374:	8c 01       	movw	r16, r24
    8376:	68 94       	set
    8378:	06 c0       	rjmp	.+12     	; 0x8386 <__fp_powser+0x22>
    837a:	da 2e       	mov	r13, r26
    837c:	ef 01       	movw	r28, r30
    837e:	0e 94 80 42 	call	0x8500	; 0x8500 <__mulsf3x>
    8382:	fe 01       	movw	r30, r28
    8384:	e8 94       	clt
    8386:	a5 91       	lpm	r26, Z+
    8388:	25 91       	lpm	r18, Z+
    838a:	35 91       	lpm	r19, Z+
    838c:	45 91       	lpm	r20, Z+
    838e:	55 91       	lpm	r21, Z+
    8390:	a6 f3       	brts	.-24     	; 0x837a <__fp_powser+0x16>
    8392:	ef 01       	movw	r28, r30
    8394:	0e 94 cf 3f 	call	0x7f9e	; 0x7f9e <__addsf3x>
    8398:	fe 01       	movw	r30, r28
    839a:	97 01       	movw	r18, r14
    839c:	a8 01       	movw	r20, r16
    839e:	da 94       	dec	r13
    83a0:	69 f7       	brne	.-38     	; 0x837c <__fp_powser+0x18>
    83a2:	df 90       	pop	r13
    83a4:	ef 90       	pop	r14
    83a6:	ff 90       	pop	r15
    83a8:	0f 91       	pop	r16
    83aa:	1f 91       	pop	r17
    83ac:	cf 91       	pop	r28
    83ae:	df 91       	pop	r29
    83b0:	08 95       	ret

000083b2 <__fp_pscA>:
    83b2:	00 24       	eor	r0, r0
    83b4:	0a 94       	dec	r0
    83b6:	16 16       	cp	r1, r22
    83b8:	17 06       	cpc	r1, r23
    83ba:	18 06       	cpc	r1, r24
    83bc:	09 06       	cpc	r0, r25
    83be:	08 95       	ret

000083c0 <__fp_pscB>:
    83c0:	00 24       	eor	r0, r0
    83c2:	0a 94       	dec	r0
    83c4:	12 16       	cp	r1, r18
    83c6:	13 06       	cpc	r1, r19
    83c8:	14 06       	cpc	r1, r20
    83ca:	05 06       	cpc	r0, r21
    83cc:	08 95       	ret
    83ce:	0c 94 af 41 	jmp	0x835e	; 0x835e <__fp_nan>

000083d2 <__fp_rempio2>:
    83d2:	0e 94 3f 42 	call	0x847e	; 0x847e <__fp_splitA>
    83d6:	d8 f3       	brcs	.-10     	; 0x83ce <__fp_pscB+0xe>
    83d8:	e8 94       	clt
    83da:	e0 e0       	ldi	r30, 0x00	; 0
    83dc:	bb 27       	eor	r27, r27
    83de:	9f 57       	subi	r25, 0x7F	; 127
    83e0:	f0 f0       	brcs	.+60     	; 0x841e <__fp_rempio2+0x4c>
    83e2:	2a ed       	ldi	r18, 0xDA	; 218
    83e4:	3f e0       	ldi	r19, 0x0F	; 15
    83e6:	49 ec       	ldi	r20, 0xC9	; 201
    83e8:	06 c0       	rjmp	.+12     	; 0x83f6 <__fp_rempio2+0x24>
    83ea:	ee 0f       	add	r30, r30
    83ec:	bb 0f       	add	r27, r27
    83ee:	66 1f       	adc	r22, r22
    83f0:	77 1f       	adc	r23, r23
    83f2:	88 1f       	adc	r24, r24
    83f4:	28 f0       	brcs	.+10     	; 0x8400 <__fp_rempio2+0x2e>
    83f6:	b2 3a       	cpi	r27, 0xA2	; 162
    83f8:	62 07       	cpc	r22, r18
    83fa:	73 07       	cpc	r23, r19
    83fc:	84 07       	cpc	r24, r20
    83fe:	28 f0       	brcs	.+10     	; 0x840a <__fp_rempio2+0x38>
    8400:	b2 5a       	subi	r27, 0xA2	; 162
    8402:	62 0b       	sbc	r22, r18
    8404:	73 0b       	sbc	r23, r19
    8406:	84 0b       	sbc	r24, r20
    8408:	e3 95       	inc	r30
    840a:	9a 95       	dec	r25
    840c:	72 f7       	brpl	.-36     	; 0x83ea <__fp_rempio2+0x18>
    840e:	80 38       	cpi	r24, 0x80	; 128
    8410:	30 f4       	brcc	.+12     	; 0x841e <__fp_rempio2+0x4c>
    8412:	9a 95       	dec	r25
    8414:	bb 0f       	add	r27, r27
    8416:	66 1f       	adc	r22, r22
    8418:	77 1f       	adc	r23, r23
    841a:	88 1f       	adc	r24, r24
    841c:	d2 f7       	brpl	.-12     	; 0x8412 <__fp_rempio2+0x40>
    841e:	90 48       	sbci	r25, 0x80	; 128
    8420:	0c 94 4b 43 	jmp	0x8696	; 0x8696 <__fp_mpack_finite>

00008424 <__fp_round>:
    8424:	09 2e       	mov	r0, r25
    8426:	03 94       	inc	r0
    8428:	00 0c       	add	r0, r0
    842a:	11 f4       	brne	.+4      	; 0x8430 <__fp_round+0xc>
    842c:	88 23       	and	r24, r24
    842e:	52 f0       	brmi	.+20     	; 0x8444 <__fp_round+0x20>
    8430:	bb 0f       	add	r27, r27
    8432:	40 f4       	brcc	.+16     	; 0x8444 <__fp_round+0x20>
    8434:	bf 2b       	or	r27, r31
    8436:	11 f4       	brne	.+4      	; 0x843c <__fp_round+0x18>
    8438:	60 ff       	sbrs	r22, 0
    843a:	04 c0       	rjmp	.+8      	; 0x8444 <__fp_round+0x20>
    843c:	6f 5f       	subi	r22, 0xFF	; 255
    843e:	7f 4f       	sbci	r23, 0xFF	; 255
    8440:	8f 4f       	sbci	r24, 0xFF	; 255
    8442:	9f 4f       	sbci	r25, 0xFF	; 255
    8444:	08 95       	ret

00008446 <__fp_sinus>:
    8446:	ef 93       	push	r30
    8448:	e0 ff       	sbrs	r30, 0
    844a:	07 c0       	rjmp	.+14     	; 0x845a <__fp_sinus+0x14>
    844c:	a2 ea       	ldi	r26, 0xA2	; 162
    844e:	2a ed       	ldi	r18, 0xDA	; 218
    8450:	3f e0       	ldi	r19, 0x0F	; 15
    8452:	49 ec       	ldi	r20, 0xC9	; 201
    8454:	5f eb       	ldi	r21, 0xBF	; 191
    8456:	0e 94 cf 3f 	call	0x7f9e	; 0x7f9e <__addsf3x>
    845a:	0e 94 12 42 	call	0x8424	; 0x8424 <__fp_round>
    845e:	0f 90       	pop	r0
    8460:	03 94       	inc	r0
    8462:	01 fc       	sbrc	r0, 1
    8464:	90 58       	subi	r25, 0x80	; 128
    8466:	ef eb       	ldi	r30, 0xBF	; 191
    8468:	f0 e0       	ldi	r31, 0x00	; 0
    846a:	0c 94 5e 43 	jmp	0x86bc	; 0x86bc <__fp_powsodd>

0000846e <__fp_split3>:
    846e:	57 fd       	sbrc	r21, 7
    8470:	90 58       	subi	r25, 0x80	; 128
    8472:	44 0f       	add	r20, r20
    8474:	55 1f       	adc	r21, r21
    8476:	59 f0       	breq	.+22     	; 0x848e <__fp_splitA+0x10>
    8478:	5f 3f       	cpi	r21, 0xFF	; 255
    847a:	71 f0       	breq	.+28     	; 0x8498 <__fp_splitA+0x1a>
    847c:	47 95       	ror	r20

0000847e <__fp_splitA>:
    847e:	88 0f       	add	r24, r24
    8480:	97 fb       	bst	r25, 7
    8482:	99 1f       	adc	r25, r25
    8484:	61 f0       	breq	.+24     	; 0x849e <__fp_splitA+0x20>
    8486:	9f 3f       	cpi	r25, 0xFF	; 255
    8488:	79 f0       	breq	.+30     	; 0x84a8 <__fp_splitA+0x2a>
    848a:	87 95       	ror	r24
    848c:	08 95       	ret
    848e:	12 16       	cp	r1, r18
    8490:	13 06       	cpc	r1, r19
    8492:	14 06       	cpc	r1, r20
    8494:	55 1f       	adc	r21, r21
    8496:	f2 cf       	rjmp	.-28     	; 0x847c <__fp_split3+0xe>
    8498:	46 95       	lsr	r20
    849a:	f1 df       	rcall	.-30     	; 0x847e <__fp_splitA>
    849c:	08 c0       	rjmp	.+16     	; 0x84ae <__fp_splitA+0x30>
    849e:	16 16       	cp	r1, r22
    84a0:	17 06       	cpc	r1, r23
    84a2:	18 06       	cpc	r1, r24
    84a4:	99 1f       	adc	r25, r25
    84a6:	f1 cf       	rjmp	.-30     	; 0x848a <__fp_splitA+0xc>
    84a8:	86 95       	lsr	r24
    84aa:	71 05       	cpc	r23, r1
    84ac:	61 05       	cpc	r22, r1
    84ae:	08 94       	sec
    84b0:	08 95       	ret

000084b2 <__fp_zero>:
    84b2:	e8 94       	clt

000084b4 <__fp_szero>:
    84b4:	bb 27       	eor	r27, r27
    84b6:	66 27       	eor	r22, r22
    84b8:	77 27       	eor	r23, r23
    84ba:	cb 01       	movw	r24, r22
    84bc:	97 f9       	bld	r25, 7
    84be:	08 95       	ret

000084c0 <__gesf2>:
    84c0:	0e 94 85 41 	call	0x830a	; 0x830a <__fp_cmp>
    84c4:	08 f4       	brcc	.+2      	; 0x84c8 <__gesf2+0x8>
    84c6:	8f ef       	ldi	r24, 0xFF	; 255
    84c8:	08 95       	ret

000084ca <inverse>:
    84ca:	9b 01       	movw	r18, r22
    84cc:	ac 01       	movw	r20, r24
    84ce:	60 e0       	ldi	r22, 0x00	; 0
    84d0:	70 e0       	ldi	r23, 0x00	; 0
    84d2:	80 e8       	ldi	r24, 0x80	; 128
    84d4:	9f e3       	ldi	r25, 0x3F	; 63
    84d6:	0c 94 a0 40 	jmp	0x8140	; 0x8140 <__divsf3>

000084da <__mulsf3>:
    84da:	0e 94 80 42 	call	0x8500	; 0x8500 <__mulsf3x>
    84de:	0c 94 12 42 	jmp	0x8424	; 0x8424 <__fp_round>
    84e2:	0e 94 d9 41 	call	0x83b2	; 0x83b2 <__fp_pscA>
    84e6:	38 f0       	brcs	.+14     	; 0x84f6 <__mulsf3+0x1c>
    84e8:	0e 94 e0 41 	call	0x83c0	; 0x83c0 <__fp_pscB>
    84ec:	20 f0       	brcs	.+8      	; 0x84f6 <__mulsf3+0x1c>
    84ee:	95 23       	and	r25, r21
    84f0:	11 f0       	breq	.+4      	; 0x84f6 <__mulsf3+0x1c>
    84f2:	0c 94 a9 41 	jmp	0x8352	; 0x8352 <__fp_inf>
    84f6:	0c 94 af 41 	jmp	0x835e	; 0x835e <__fp_nan>
    84fa:	11 24       	eor	r1, r1
    84fc:	0c 94 5a 42 	jmp	0x84b4	; 0x84b4 <__fp_szero>

00008500 <__mulsf3x>:
    8500:	0e 94 37 42 	call	0x846e	; 0x846e <__fp_split3>
    8504:	70 f3       	brcs	.-36     	; 0x84e2 <__mulsf3+0x8>

00008506 <__mulsf3_pse>:
    8506:	95 9f       	mul	r25, r21
    8508:	c1 f3       	breq	.-16     	; 0x84fa <__mulsf3+0x20>
    850a:	95 0f       	add	r25, r21
    850c:	50 e0       	ldi	r21, 0x00	; 0
    850e:	55 1f       	adc	r21, r21
    8510:	62 9f       	mul	r22, r18
    8512:	f0 01       	movw	r30, r0
    8514:	72 9f       	mul	r23, r18
    8516:	bb 27       	eor	r27, r27
    8518:	f0 0d       	add	r31, r0
    851a:	b1 1d       	adc	r27, r1
    851c:	63 9f       	mul	r22, r19
    851e:	aa 27       	eor	r26, r26
    8520:	f0 0d       	add	r31, r0
    8522:	b1 1d       	adc	r27, r1
    8524:	aa 1f       	adc	r26, r26
    8526:	64 9f       	mul	r22, r20
    8528:	66 27       	eor	r22, r22
    852a:	b0 0d       	add	r27, r0
    852c:	a1 1d       	adc	r26, r1
    852e:	66 1f       	adc	r22, r22
    8530:	82 9f       	mul	r24, r18
    8532:	22 27       	eor	r18, r18
    8534:	b0 0d       	add	r27, r0
    8536:	a1 1d       	adc	r26, r1
    8538:	62 1f       	adc	r22, r18
    853a:	73 9f       	mul	r23, r19
    853c:	b0 0d       	add	r27, r0
    853e:	a1 1d       	adc	r26, r1
    8540:	62 1f       	adc	r22, r18
    8542:	83 9f       	mul	r24, r19
    8544:	a0 0d       	add	r26, r0
    8546:	61 1d       	adc	r22, r1
    8548:	22 1f       	adc	r18, r18
    854a:	74 9f       	mul	r23, r20
    854c:	33 27       	eor	r19, r19
    854e:	a0 0d       	add	r26, r0
    8550:	61 1d       	adc	r22, r1
    8552:	23 1f       	adc	r18, r19
    8554:	84 9f       	mul	r24, r20
    8556:	60 0d       	add	r22, r0
    8558:	21 1d       	adc	r18, r1
    855a:	82 2f       	mov	r24, r18
    855c:	76 2f       	mov	r23, r22
    855e:	6a 2f       	mov	r22, r26
    8560:	11 24       	eor	r1, r1
    8562:	9f 57       	subi	r25, 0x7F	; 127
    8564:	50 40       	sbci	r21, 0x00	; 0
    8566:	9a f0       	brmi	.+38     	; 0x858e <__mulsf3_pse+0x88>
    8568:	f1 f0       	breq	.+60     	; 0x85a6 <__mulsf3_pse+0xa0>
    856a:	88 23       	and	r24, r24
    856c:	4a f0       	brmi	.+18     	; 0x8580 <__mulsf3_pse+0x7a>
    856e:	ee 0f       	add	r30, r30
    8570:	ff 1f       	adc	r31, r31
    8572:	bb 1f       	adc	r27, r27
    8574:	66 1f       	adc	r22, r22
    8576:	77 1f       	adc	r23, r23
    8578:	88 1f       	adc	r24, r24
    857a:	91 50       	subi	r25, 0x01	; 1
    857c:	50 40       	sbci	r21, 0x00	; 0
    857e:	a9 f7       	brne	.-22     	; 0x856a <__mulsf3_pse+0x64>
    8580:	9e 3f       	cpi	r25, 0xFE	; 254
    8582:	51 05       	cpc	r21, r1
    8584:	80 f0       	brcs	.+32     	; 0x85a6 <__mulsf3_pse+0xa0>
    8586:	0c 94 a9 41 	jmp	0x8352	; 0x8352 <__fp_inf>
    858a:	0c 94 5a 42 	jmp	0x84b4	; 0x84b4 <__fp_szero>
    858e:	5f 3f       	cpi	r21, 0xFF	; 255
    8590:	e4 f3       	brlt	.-8      	; 0x858a <__mulsf3_pse+0x84>
    8592:	98 3e       	cpi	r25, 0xE8	; 232
    8594:	d4 f3       	brlt	.-12     	; 0x858a <__mulsf3_pse+0x84>
    8596:	86 95       	lsr	r24
    8598:	77 95       	ror	r23
    859a:	67 95       	ror	r22
    859c:	b7 95       	ror	r27
    859e:	f7 95       	ror	r31
    85a0:	e7 95       	ror	r30
    85a2:	9f 5f       	subi	r25, 0xFF	; 255
    85a4:	c1 f7       	brne	.-16     	; 0x8596 <__mulsf3_pse+0x90>
    85a6:	fe 2b       	or	r31, r30
    85a8:	88 0f       	add	r24, r24
    85aa:	91 1d       	adc	r25, r1
    85ac:	96 95       	lsr	r25
    85ae:	87 95       	ror	r24
    85b0:	97 f9       	bld	r25, 7
    85b2:	08 95       	ret
    85b4:	19 f4       	brne	.+6      	; 0x85bc <__mulsf3_pse+0xb6>
    85b6:	16 f4       	brtc	.+4      	; 0x85bc <__mulsf3_pse+0xb6>
    85b8:	0c 94 af 41 	jmp	0x835e	; 0x835e <__fp_nan>
    85bc:	0c 94 49 43 	jmp	0x8692	; 0x8692 <__fp_mpack>

000085c0 <sqrt>:
    85c0:	0e 94 3f 42 	call	0x847e	; 0x847e <__fp_splitA>
    85c4:	b8 f3       	brcs	.-18     	; 0x85b4 <__mulsf3_pse+0xae>
    85c6:	99 23       	and	r25, r25
    85c8:	c9 f3       	breq	.-14     	; 0x85bc <__mulsf3_pse+0xb6>
    85ca:	b6 f3       	brts	.-20     	; 0x85b8 <__mulsf3_pse+0xb2>
    85cc:	9f 57       	subi	r25, 0x7F	; 127
    85ce:	55 0b       	sbc	r21, r21
    85d0:	87 ff       	sbrs	r24, 7
    85d2:	0e 94 57 43 	call	0x86ae	; 0x86ae <__fp_norm2>
    85d6:	00 24       	eor	r0, r0
    85d8:	a0 e6       	ldi	r26, 0x60	; 96
    85da:	40 ea       	ldi	r20, 0xA0	; 160
    85dc:	90 01       	movw	r18, r0
    85de:	80 58       	subi	r24, 0x80	; 128
    85e0:	56 95       	lsr	r21
    85e2:	97 95       	ror	r25
    85e4:	28 f4       	brcc	.+10     	; 0x85f0 <sqrt+0x30>
    85e6:	80 5c       	subi	r24, 0xC0	; 192
    85e8:	66 0f       	add	r22, r22
    85ea:	77 1f       	adc	r23, r23
    85ec:	88 1f       	adc	r24, r24
    85ee:	20 f0       	brcs	.+8      	; 0x85f8 <sqrt+0x38>
    85f0:	26 17       	cp	r18, r22
    85f2:	37 07       	cpc	r19, r23
    85f4:	48 07       	cpc	r20, r24
    85f6:	30 f4       	brcc	.+12     	; 0x8604 <sqrt+0x44>
    85f8:	62 1b       	sub	r22, r18
    85fa:	73 0b       	sbc	r23, r19
    85fc:	84 0b       	sbc	r24, r20
    85fe:	20 29       	or	r18, r0
    8600:	31 29       	or	r19, r1
    8602:	4a 2b       	or	r20, r26
    8604:	a6 95       	lsr	r26
    8606:	17 94       	ror	r1
    8608:	07 94       	ror	r0
    860a:	20 25       	eor	r18, r0
    860c:	31 25       	eor	r19, r1
    860e:	4a 27       	eor	r20, r26
    8610:	58 f7       	brcc	.-42     	; 0x85e8 <sqrt+0x28>
    8612:	66 0f       	add	r22, r22
    8614:	77 1f       	adc	r23, r23
    8616:	88 1f       	adc	r24, r24
    8618:	20 f0       	brcs	.+8      	; 0x8622 <sqrt+0x62>
    861a:	26 17       	cp	r18, r22
    861c:	37 07       	cpc	r19, r23
    861e:	48 07       	cpc	r20, r24
    8620:	30 f4       	brcc	.+12     	; 0x862e <sqrt+0x6e>
    8622:	62 0b       	sbc	r22, r18
    8624:	73 0b       	sbc	r23, r19
    8626:	84 0b       	sbc	r24, r20
    8628:	20 0d       	add	r18, r0
    862a:	31 1d       	adc	r19, r1
    862c:	41 1d       	adc	r20, r1
    862e:	a0 95       	com	r26
    8630:	81 f7       	brne	.-32     	; 0x8612 <sqrt+0x52>
    8632:	b9 01       	movw	r22, r18
    8634:	84 2f       	mov	r24, r20
    8636:	91 58       	subi	r25, 0x81	; 129
    8638:	88 0f       	add	r24, r24
    863a:	96 95       	lsr	r25
    863c:	87 95       	ror	r24
    863e:	08 95       	ret

00008640 <square>:
    8640:	9b 01       	movw	r18, r22
    8642:	ac 01       	movw	r20, r24
    8644:	0c 94 6d 42 	jmp	0x84da	; 0x84da <__mulsf3>

00008648 <tan>:
    8648:	df 93       	push	r29
    864a:	d9 2f       	mov	r29, r25
    864c:	0e 94 e9 41 	call	0x83d2	; 0x83d2 <__fp_rempio2>
    8650:	e6 95       	lsr	r30
    8652:	d7 95       	ror	r29
    8654:	2a ed       	ldi	r18, 0xDA	; 218
    8656:	3f e0       	ldi	r19, 0x0F	; 15
    8658:	49 e4       	ldi	r20, 0x49	; 73
    865a:	5f e3       	ldi	r21, 0x3F	; 63
    865c:	b3 3a       	cpi	r27, 0xA3	; 163
    865e:	62 07       	cpc	r22, r18
    8660:	73 07       	cpc	r23, r19
    8662:	84 07       	cpc	r24, r20
    8664:	95 07       	cpc	r25, r21
    8666:	d7 95       	ror	r29
    8668:	3a f0       	brmi	.+14     	; 0x8678 <tan+0x30>
    866a:	a2 ea       	ldi	r26, 0xA2	; 162
    866c:	49 ec       	ldi	r20, 0xC9	; 201
    866e:	90 68       	ori	r25, 0x80	; 128
    8670:	0e 94 cf 3f 	call	0x7f9e	; 0x7f9e <__addsf3x>
    8674:	0e 94 12 42 	call	0x8424	; 0x8424 <__fp_round>
    8678:	ed ed       	ldi	r30, 0xDD	; 221
    867a:	f0 e0       	ldi	r31, 0x00	; 0
    867c:	0e 94 5e 43 	call	0x86bc	; 0x86bc <__fp_powsodd>
    8680:	dd 0f       	add	r29, r29
    8682:	13 f0       	brvs	.+4      	; 0x8688 <tan+0x40>
    8684:	0e 94 65 42 	call	0x84ca	; 0x84ca <inverse>
    8688:	dd 0f       	add	r29, r29
    868a:	0b f4       	brvc	.+2      	; 0x868e <tan+0x46>
    868c:	90 58       	subi	r25, 0x80	; 128
    868e:	df 91       	pop	r29
    8690:	08 95       	ret

00008692 <__fp_mpack>:
    8692:	9f 3f       	cpi	r25, 0xFF	; 255
    8694:	31 f0       	breq	.+12     	; 0x86a2 <__fp_mpack_finite+0xc>

00008696 <__fp_mpack_finite>:
    8696:	91 50       	subi	r25, 0x01	; 1
    8698:	20 f4       	brcc	.+8      	; 0x86a2 <__fp_mpack_finite+0xc>
    869a:	87 95       	ror	r24
    869c:	77 95       	ror	r23
    869e:	67 95       	ror	r22
    86a0:	b7 95       	ror	r27
    86a2:	88 0f       	add	r24, r24
    86a4:	91 1d       	adc	r25, r1
    86a6:	96 95       	lsr	r25
    86a8:	87 95       	ror	r24
    86aa:	97 f9       	bld	r25, 7
    86ac:	08 95       	ret

000086ae <__fp_norm2>:
    86ae:	91 50       	subi	r25, 0x01	; 1
    86b0:	50 40       	sbci	r21, 0x00	; 0
    86b2:	66 0f       	add	r22, r22
    86b4:	77 1f       	adc	r23, r23
    86b6:	88 1f       	adc	r24, r24
    86b8:	d2 f7       	brpl	.-12     	; 0x86ae <__fp_norm2>
    86ba:	08 95       	ret

000086bc <__fp_powsodd>:
    86bc:	9f 93       	push	r25
    86be:	8f 93       	push	r24
    86c0:	7f 93       	push	r23
    86c2:	6f 93       	push	r22
    86c4:	ff 93       	push	r31
    86c6:	ef 93       	push	r30
    86c8:	9b 01       	movw	r18, r22
    86ca:	ac 01       	movw	r20, r24
    86cc:	0e 94 6d 42 	call	0x84da	; 0x84da <__mulsf3>
    86d0:	ef 91       	pop	r30
    86d2:	ff 91       	pop	r31
    86d4:	0e 94 b2 41 	call	0x8364	; 0x8364 <__fp_powser>
    86d8:	2f 91       	pop	r18
    86da:	3f 91       	pop	r19
    86dc:	4f 91       	pop	r20
    86de:	5f 91       	pop	r21
    86e0:	0c 94 6d 42 	jmp	0x84da	; 0x84da <__mulsf3>

000086e4 <__udivmodqi4>:
    86e4:	99 1b       	sub	r25, r25
    86e6:	79 e0       	ldi	r23, 0x09	; 9
    86e8:	04 c0       	rjmp	.+8      	; 0x86f2 <__udivmodqi4_ep>

000086ea <__udivmodqi4_loop>:
    86ea:	99 1f       	adc	r25, r25
    86ec:	96 17       	cp	r25, r22
    86ee:	08 f0       	brcs	.+2      	; 0x86f2 <__udivmodqi4_ep>
    86f0:	96 1b       	sub	r25, r22

000086f2 <__udivmodqi4_ep>:
    86f2:	88 1f       	adc	r24, r24
    86f4:	7a 95       	dec	r23
    86f6:	c9 f7       	brne	.-14     	; 0x86ea <__udivmodqi4_loop>
    86f8:	80 95       	com	r24
    86fa:	08 95       	ret

000086fc <__divmodqi4>:
    86fc:	87 fb       	bst	r24, 7
    86fe:	08 2e       	mov	r0, r24
    8700:	06 26       	eor	r0, r22
    8702:	87 fd       	sbrc	r24, 7
    8704:	81 95       	neg	r24
    8706:	67 fd       	sbrc	r22, 7
    8708:	61 95       	neg	r22
    870a:	0e 94 72 43 	call	0x86e4	; 0x86e4 <__udivmodqi4>
    870e:	0e f4       	brtc	.+2      	; 0x8712 <__divmodqi4_1>
    8710:	91 95       	neg	r25

00008712 <__divmodqi4_1>:
    8712:	07 fc       	sbrc	r0, 7
    8714:	81 95       	neg	r24

00008716 <__divmodqi4_exit>:
    8716:	08 95       	ret

00008718 <__udivmodhi4>:
    8718:	aa 1b       	sub	r26, r26
    871a:	bb 1b       	sub	r27, r27
    871c:	51 e1       	ldi	r21, 0x11	; 17
    871e:	07 c0       	rjmp	.+14     	; 0x872e <__udivmodhi4_ep>

00008720 <__udivmodhi4_loop>:
    8720:	aa 1f       	adc	r26, r26
    8722:	bb 1f       	adc	r27, r27
    8724:	a6 17       	cp	r26, r22
    8726:	b7 07       	cpc	r27, r23
    8728:	10 f0       	brcs	.+4      	; 0x872e <__udivmodhi4_ep>
    872a:	a6 1b       	sub	r26, r22
    872c:	b7 0b       	sbc	r27, r23

0000872e <__udivmodhi4_ep>:
    872e:	88 1f       	adc	r24, r24
    8730:	99 1f       	adc	r25, r25
    8732:	5a 95       	dec	r21
    8734:	a9 f7       	brne	.-22     	; 0x8720 <__udivmodhi4_loop>
    8736:	80 95       	com	r24
    8738:	90 95       	com	r25
    873a:	bc 01       	movw	r22, r24
    873c:	cd 01       	movw	r24, r26
    873e:	08 95       	ret

00008740 <__divmodhi4>:
    8740:	97 fb       	bst	r25, 7
    8742:	07 2e       	mov	r0, r23
    8744:	16 f4       	brtc	.+4      	; 0x874a <__divmodhi4+0xa>
    8746:	00 94       	com	r0
    8748:	07 d0       	rcall	.+14     	; 0x8758 <__divmodhi4_neg1>
    874a:	77 fd       	sbrc	r23, 7
    874c:	09 d0       	rcall	.+18     	; 0x8760 <__divmodhi4_neg2>
    874e:	0e 94 8c 43 	call	0x8718	; 0x8718 <__udivmodhi4>
    8752:	07 fc       	sbrc	r0, 7
    8754:	05 d0       	rcall	.+10     	; 0x8760 <__divmodhi4_neg2>
    8756:	3e f4       	brtc	.+14     	; 0x8766 <__divmodhi4_exit>

00008758 <__divmodhi4_neg1>:
    8758:	90 95       	com	r25
    875a:	81 95       	neg	r24
    875c:	9f 4f       	sbci	r25, 0xFF	; 255
    875e:	08 95       	ret

00008760 <__divmodhi4_neg2>:
    8760:	70 95       	com	r23
    8762:	61 95       	neg	r22
    8764:	7f 4f       	sbci	r23, 0xFF	; 255

00008766 <__divmodhi4_exit>:
    8766:	08 95       	ret

00008768 <__udivmodsi4>:
    8768:	a1 e2       	ldi	r26, 0x21	; 33
    876a:	1a 2e       	mov	r1, r26
    876c:	aa 1b       	sub	r26, r26
    876e:	bb 1b       	sub	r27, r27
    8770:	fd 01       	movw	r30, r26
    8772:	0d c0       	rjmp	.+26     	; 0x878e <__udivmodsi4_ep>

00008774 <__udivmodsi4_loop>:
    8774:	aa 1f       	adc	r26, r26
    8776:	bb 1f       	adc	r27, r27
    8778:	ee 1f       	adc	r30, r30
    877a:	ff 1f       	adc	r31, r31
    877c:	a2 17       	cp	r26, r18
    877e:	b3 07       	cpc	r27, r19
    8780:	e4 07       	cpc	r30, r20
    8782:	f5 07       	cpc	r31, r21
    8784:	20 f0       	brcs	.+8      	; 0x878e <__udivmodsi4_ep>
    8786:	a2 1b       	sub	r26, r18
    8788:	b3 0b       	sbc	r27, r19
    878a:	e4 0b       	sbc	r30, r20
    878c:	f5 0b       	sbc	r31, r21

0000878e <__udivmodsi4_ep>:
    878e:	66 1f       	adc	r22, r22
    8790:	77 1f       	adc	r23, r23
    8792:	88 1f       	adc	r24, r24
    8794:	99 1f       	adc	r25, r25
    8796:	1a 94       	dec	r1
    8798:	69 f7       	brne	.-38     	; 0x8774 <__udivmodsi4_loop>
    879a:	60 95       	com	r22
    879c:	70 95       	com	r23
    879e:	80 95       	com	r24
    87a0:	90 95       	com	r25
    87a2:	9b 01       	movw	r18, r22
    87a4:	ac 01       	movw	r20, r24
    87a6:	bd 01       	movw	r22, r26
    87a8:	cf 01       	movw	r24, r30
    87aa:	08 95       	ret

000087ac <__divmodsi4>:
    87ac:	05 2e       	mov	r0, r21
    87ae:	97 fb       	bst	r25, 7
    87b0:	1e f4       	brtc	.+6      	; 0x87b8 <__divmodsi4+0xc>
    87b2:	00 94       	com	r0
    87b4:	0e 94 ed 43 	call	0x87da	; 0x87da <__negsi2>
    87b8:	57 fd       	sbrc	r21, 7
    87ba:	07 d0       	rcall	.+14     	; 0x87ca <__divmodsi4_neg2>
    87bc:	0e 94 b4 43 	call	0x8768	; 0x8768 <__udivmodsi4>
    87c0:	07 fc       	sbrc	r0, 7
    87c2:	03 d0       	rcall	.+6      	; 0x87ca <__divmodsi4_neg2>
    87c4:	4e f4       	brtc	.+18     	; 0x87d8 <__divmodsi4_exit>
    87c6:	0c 94 ed 43 	jmp	0x87da	; 0x87da <__negsi2>

000087ca <__divmodsi4_neg2>:
    87ca:	50 95       	com	r21
    87cc:	40 95       	com	r20
    87ce:	30 95       	com	r19
    87d0:	21 95       	neg	r18
    87d2:	3f 4f       	sbci	r19, 0xFF	; 255
    87d4:	4f 4f       	sbci	r20, 0xFF	; 255
    87d6:	5f 4f       	sbci	r21, 0xFF	; 255

000087d8 <__divmodsi4_exit>:
    87d8:	08 95       	ret

000087da <__negsi2>:
    87da:	90 95       	com	r25
    87dc:	80 95       	com	r24
    87de:	70 95       	com	r23
    87e0:	61 95       	neg	r22
    87e2:	7f 4f       	sbci	r23, 0xFF	; 255
    87e4:	8f 4f       	sbci	r24, 0xFF	; 255
    87e6:	9f 4f       	sbci	r25, 0xFF	; 255
    87e8:	08 95       	ret

000087ea <__tablejump2__>:
    87ea:	ee 0f       	add	r30, r30
    87ec:	ff 1f       	adc	r31, r31
    87ee:	05 90       	lpm	r0, Z+
    87f0:	f4 91       	lpm	r31, Z
    87f2:	e0 2d       	mov	r30, r0
    87f4:	09 94       	ijmp

000087f6 <__umulhisi3>:
    87f6:	a2 9f       	mul	r26, r18
    87f8:	b0 01       	movw	r22, r0
    87fa:	b3 9f       	mul	r27, r19
    87fc:	c0 01       	movw	r24, r0
    87fe:	a3 9f       	mul	r26, r19
    8800:	70 0d       	add	r23, r0
    8802:	81 1d       	adc	r24, r1
    8804:	11 24       	eor	r1, r1
    8806:	91 1d       	adc	r25, r1
    8808:	b2 9f       	mul	r27, r18
    880a:	70 0d       	add	r23, r0
    880c:	81 1d       	adc	r24, r1
    880e:	11 24       	eor	r1, r1
    8810:	91 1d       	adc	r25, r1
    8812:	08 95       	ret

00008814 <__umoddi3>:
    8814:	68 94       	set
    8816:	01 c0       	rjmp	.+2      	; 0x881a <__udivdi3_umoddi3>

00008818 <__udivdi3>:
    8818:	e8 94       	clt

0000881a <__udivdi3_umoddi3>:
    881a:	8f 92       	push	r8
    881c:	9f 92       	push	r9
    881e:	cf 93       	push	r28
    8820:	df 93       	push	r29
    8822:	0e 94 18 44 	call	0x8830	; 0x8830 <__udivmod64>
    8826:	df 91       	pop	r29
    8828:	cf 91       	pop	r28
    882a:	9f 90       	pop	r9
    882c:	8f 90       	pop	r8
    882e:	08 95       	ret

00008830 <__udivmod64>:
    8830:	88 24       	eor	r8, r8
    8832:	99 24       	eor	r9, r9
    8834:	f4 01       	movw	r30, r8
    8836:	e4 01       	movw	r28, r8
    8838:	b0 e4       	ldi	r27, 0x40	; 64
    883a:	9f 93       	push	r25
    883c:	aa 27       	eor	r26, r26
    883e:	9a 15       	cp	r25, r10
    8840:	8b 04       	cpc	r8, r11
    8842:	9c 04       	cpc	r9, r12
    8844:	ed 05       	cpc	r30, r13
    8846:	fe 05       	cpc	r31, r14
    8848:	cf 05       	cpc	r28, r15
    884a:	d0 07       	cpc	r29, r16
    884c:	a1 07       	cpc	r26, r17
    884e:	98 f4       	brcc	.+38     	; 0x8876 <__udivmod64+0x46>
    8850:	ad 2f       	mov	r26, r29
    8852:	dc 2f       	mov	r29, r28
    8854:	cf 2f       	mov	r28, r31
    8856:	fe 2f       	mov	r31, r30
    8858:	e9 2d       	mov	r30, r9
    885a:	98 2c       	mov	r9, r8
    885c:	89 2e       	mov	r8, r25
    885e:	98 2f       	mov	r25, r24
    8860:	87 2f       	mov	r24, r23
    8862:	76 2f       	mov	r23, r22
    8864:	65 2f       	mov	r22, r21
    8866:	54 2f       	mov	r21, r20
    8868:	43 2f       	mov	r20, r19
    886a:	32 2f       	mov	r19, r18
    886c:	22 27       	eor	r18, r18
    886e:	b8 50       	subi	r27, 0x08	; 8
    8870:	31 f7       	brne	.-52     	; 0x883e <__udivmod64+0xe>
    8872:	bf 91       	pop	r27
    8874:	27 c0       	rjmp	.+78     	; 0x88c4 <__udivmod64+0x94>
    8876:	1b 2e       	mov	r1, r27
    8878:	bf 91       	pop	r27
    887a:	bb 27       	eor	r27, r27
    887c:	22 0f       	add	r18, r18
    887e:	33 1f       	adc	r19, r19
    8880:	44 1f       	adc	r20, r20
    8882:	55 1f       	adc	r21, r21
    8884:	66 1f       	adc	r22, r22
    8886:	77 1f       	adc	r23, r23
    8888:	88 1f       	adc	r24, r24
    888a:	99 1f       	adc	r25, r25
    888c:	88 1c       	adc	r8, r8
    888e:	99 1c       	adc	r9, r9
    8890:	ee 1f       	adc	r30, r30
    8892:	ff 1f       	adc	r31, r31
    8894:	cc 1f       	adc	r28, r28
    8896:	dd 1f       	adc	r29, r29
    8898:	aa 1f       	adc	r26, r26
    889a:	bb 1f       	adc	r27, r27
    889c:	8a 14       	cp	r8, r10
    889e:	9b 04       	cpc	r9, r11
    88a0:	ec 05       	cpc	r30, r12
    88a2:	fd 05       	cpc	r31, r13
    88a4:	ce 05       	cpc	r28, r14
    88a6:	df 05       	cpc	r29, r15
    88a8:	a0 07       	cpc	r26, r16
    88aa:	b1 07       	cpc	r27, r17
    88ac:	48 f0       	brcs	.+18     	; 0x88c0 <__udivmod64+0x90>
    88ae:	8a 18       	sub	r8, r10
    88b0:	9b 08       	sbc	r9, r11
    88b2:	ec 09       	sbc	r30, r12
    88b4:	fd 09       	sbc	r31, r13
    88b6:	ce 09       	sbc	r28, r14
    88b8:	df 09       	sbc	r29, r15
    88ba:	a0 0b       	sbc	r26, r16
    88bc:	b1 0b       	sbc	r27, r17
    88be:	21 60       	ori	r18, 0x01	; 1
    88c0:	1a 94       	dec	r1
    88c2:	e1 f6       	brne	.-72     	; 0x887c <__udivmod64+0x4c>
    88c4:	2e f4       	brtc	.+10     	; 0x88d0 <__udivmod64+0xa0>
    88c6:	94 01       	movw	r18, r8
    88c8:	af 01       	movw	r20, r30
    88ca:	be 01       	movw	r22, r28
    88cc:	cd 01       	movw	r24, r26
    88ce:	00 0c       	add	r0, r0
    88d0:	08 95       	ret

000088d2 <__prologue_saves__>:
    88d2:	2f 92       	push	r2
    88d4:	3f 92       	push	r3
    88d6:	4f 92       	push	r4
    88d8:	5f 92       	push	r5
    88da:	6f 92       	push	r6
    88dc:	7f 92       	push	r7
    88de:	8f 92       	push	r8
    88e0:	9f 92       	push	r9
    88e2:	af 92       	push	r10
    88e4:	bf 92       	push	r11
    88e6:	cf 92       	push	r12
    88e8:	df 92       	push	r13
    88ea:	ef 92       	push	r14
    88ec:	ff 92       	push	r15
    88ee:	0f 93       	push	r16
    88f0:	1f 93       	push	r17
    88f2:	cf 93       	push	r28
    88f4:	df 93       	push	r29
    88f6:	cd b7       	in	r28, 0x3d	; 61
    88f8:	de b7       	in	r29, 0x3e	; 62
    88fa:	ca 1b       	sub	r28, r26
    88fc:	db 0b       	sbc	r29, r27
    88fe:	0f b6       	in	r0, 0x3f	; 63
    8900:	f8 94       	cli
    8902:	de bf       	out	0x3e, r29	; 62
    8904:	0f be       	out	0x3f, r0	; 63
    8906:	cd bf       	out	0x3d, r28	; 61
    8908:	09 94       	ijmp

0000890a <__epilogue_restores__>:
    890a:	2a 88       	ldd	r2, Y+18	; 0x12
    890c:	39 88       	ldd	r3, Y+17	; 0x11
    890e:	48 88       	ldd	r4, Y+16	; 0x10
    8910:	5f 84       	ldd	r5, Y+15	; 0x0f
    8912:	6e 84       	ldd	r6, Y+14	; 0x0e
    8914:	7d 84       	ldd	r7, Y+13	; 0x0d
    8916:	8c 84       	ldd	r8, Y+12	; 0x0c
    8918:	9b 84       	ldd	r9, Y+11	; 0x0b
    891a:	aa 84       	ldd	r10, Y+10	; 0x0a
    891c:	b9 84       	ldd	r11, Y+9	; 0x09
    891e:	c8 84       	ldd	r12, Y+8	; 0x08
    8920:	df 80       	ldd	r13, Y+7	; 0x07
    8922:	ee 80       	ldd	r14, Y+6	; 0x06
    8924:	fd 80       	ldd	r15, Y+5	; 0x05
    8926:	0c 81       	ldd	r16, Y+4	; 0x04
    8928:	1b 81       	ldd	r17, Y+3	; 0x03
    892a:	aa 81       	ldd	r26, Y+2	; 0x02
    892c:	b9 81       	ldd	r27, Y+1	; 0x01
    892e:	ce 0f       	add	r28, r30
    8930:	d1 1d       	adc	r29, r1
    8932:	0f b6       	in	r0, 0x3f	; 63
    8934:	f8 94       	cli
    8936:	de bf       	out	0x3e, r29	; 62
    8938:	0f be       	out	0x3f, r0	; 63
    893a:	cd bf       	out	0x3d, r28	; 61
    893c:	ed 01       	movw	r28, r26
    893e:	08 95       	ret

00008940 <eeprom_read_byte>:
    8940:	f9 99       	sbic	0x1f, 1	; 31
    8942:	fe cf       	rjmp	.-4      	; 0x8940 <eeprom_read_byte>
    8944:	92 bd       	out	0x22, r25	; 34
    8946:	81 bd       	out	0x21, r24	; 33
    8948:	f8 9a       	sbi	0x1f, 0	; 31
    894a:	99 27       	eor	r25, r25
    894c:	80 b5       	in	r24, 0x20	; 32
    894e:	08 95       	ret

00008950 <eeprom_write_byte>:
    8950:	26 2f       	mov	r18, r22

00008952 <eeprom_write_r18>:
    8952:	f9 99       	sbic	0x1f, 1	; 31
    8954:	fe cf       	rjmp	.-4      	; 0x8952 <eeprom_write_r18>
    8956:	1f ba       	out	0x1f, r1	; 31
    8958:	92 bd       	out	0x22, r25	; 34
    895a:	81 bd       	out	0x21, r24	; 33
    895c:	20 bd       	out	0x20, r18	; 32
    895e:	0f b6       	in	r0, 0x3f	; 63
    8960:	f8 94       	cli
    8962:	fa 9a       	sbi	0x1f, 2	; 31
    8964:	f9 9a       	sbi	0x1f, 1	; 31
    8966:	0f be       	out	0x3f, r0	; 63
    8968:	01 96       	adiw	r24, 0x01	; 1
    896a:	08 95       	ret

0000896c <_exit>:
    896c:	f8 94       	cli

0000896e <__stop_program>:
    896e:	ff cf       	rjmp	.-2      	; 0x896e <__stop_program>
