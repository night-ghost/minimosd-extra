	.file	"MinimOsd_Extra.ino"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
 ;  GNU C++11 (GCC) version 5.3.0 (avr)
 ; 	compiled by GNU C version 4.8.3 20140911 (Red Hat 4.8.3-7), GMP version 5.1.3, MPFR version 3.1.3, MPC version 1.0.3
 ;  GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ;  options passed: 
 ;  -I /usr/share/arduino/hardware/arduino/avr/cores/arduino
 ;  -I /usr/share/arduino/hardware/arduino/avr/variants/standard
 ;  -I ../libraries/GCS_MAVLink -I ../libraries/SingleSerial
 ;  -I ../libraries/TimerSerial -imultilib avr5
 ;  -iprefix /usr/share/arduino-1.6.6/hardware/tools/pkg-i686-pc-linux-gnu.5.3/bin/../lib/gcc/avr/5.3.0/
 ;  -MMD build-atmega328/MinimOsd_Extra.d
 ;  -MQ build-atmega328/MinimOsd_Extra.s -D__AVR_ATmega328P__
 ;  -D__AVR_DEVICE_NAME__=atmega328p -D F_CPU=16000000 -D ARDUINO=166
 ;  -D ARDUINO_ARCH_AVR -D __PROG_TYPES_COMPAT__ -include dummy_header.h
 ;  MinimOsd_Extra.ino -mn-flash=1 -mmcu=avr5
 ;  -auxbase-strip build-atmega328/MinimOsd_Extra.s -Os -Wall
 ;  -Wno-deprecated-declarations -std=gnu++11 -fverbose-asm
 ;  -ffunction-sections -fdata-sections -mn-flash=1 -mno-skip-bug -fno-rtti
 ;  -fno-enforce-eh-specs -fno-exceptions
 ;  options enabled:  -faggressive-loop-optimizations -falign-functions
 ;  -falign-jumps -falign-labels -falign-loops -fauto-inc-dec
 ;  -fbranch-count-reg -fcaller-saves -fchkp-check-incomplete-type
 ;  -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
 ;  -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
 ;  -fchkp-use-static-bounds -fchkp-use-static-const-bounds
 ;  -fchkp-use-wrappers -fcombine-stack-adjustments -fcommon -fcompare-elim
 ;  -fcprop-registers -fcrossjumping -fcse-follow-jumps -fdata-sections
 ;  -fdefer-pop -fdevirtualize -fdevirtualize-speculatively
 ;  -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
 ;  -fexpensive-optimizations -fforward-propagate -ffunction-cse
 ;  -ffunction-sections -fgcse -fgcse-lm -fgnu-runtime -fgnu-unique
 ;  -fguess-branch-probability -fhoist-adjacent-loads -fident
 ;  -fif-conversion -fif-conversion2 -findirect-inlining -finline
 ;  -finline-atomics -finline-functions -finline-functions-called-once
 ;  -finline-small-functions -fipa-cp -fipa-cp-alignment -fipa-icf
 ;  -fipa-icf-functions -fipa-icf-variables -fipa-profile -fipa-pure-const
 ;  -fipa-ra -fipa-reference -fipa-sra -fira-hoist-pressure
 ;  -fira-share-save-slots -fira-share-spill-slots
 ;  -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
 ;  -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
 ;  -fmath-errno -fmerge-constants -fmerge-debug-strings
 ;  -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
 ;  -fpartial-inlining -fpeephole -fpeephole2 -fprefetch-loop-arrays
 ;  -freg-struct-return -freorder-blocks -freorder-functions
 ;  -frerun-cse-after-loop -fsched-critical-path-heuristic
 ;  -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
 ;  -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
 ;  -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
 ;  -fsemantic-interposition -fshow-column -fshrink-wrap -fsigned-zeros
 ;  -fsplit-ivs-in-unroller -fsplit-wide-types -fssa-phiopt -fstdarg-opt
 ;  -fstrict-aliasing -fstrict-overflow -fstrict-volatile-bitfields
 ;  -fsync-libcalls -fthread-jumps -ftoplevel-reorder -ftrapping-math
 ;  -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp -ftree-ch
 ;  -ftree-coalesce-vars -ftree-copy-prop -ftree-copyrename -ftree-dce
 ;  -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
 ;  -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
 ;  -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop
 ;  -ftree-pre -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink
 ;  -ftree-slsr -ftree-sra -ftree-switch-conversion -ftree-tail-merge
 ;  -ftree-ter -ftree-vrp -funit-at-a-time -fverbose-asm
 ;  -fzero-initialized-in-bss

	.section	.text.crc_accumulate,"ax",@progbits
	.type	crc_accumulate, @function
crc_accumulate:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r22	 ;  crcAccum, crcAccum
	ld r18,Z	 ;  D.29253, *crcAccum_2(D)
	eor r24,r18	 ;  D.29254, D.29253
	ldi r25,lo8(16)	 ; ,
	mul r24,r25	 ;  D.29254,
	movw r18,r0	 ;  D.29255
	clr __zero_reg__
	eor r18,r24	 ;  D.29254, D.29254
	mov r24,r18	 ;  D.29255, D.29254
	ldi r25,0	 ;  D.29255
	mov r21,r24	 ;  D.29255, D.29255
	clr r20	 ;  D.29255
	movw r18,r24	 ;  D.29255, D.29255
	ldi r22,3	 ; ,
	1:
	lsl r18	 ;  D.29255
	rol r19	 ;  D.29255
	dec r22	 ; 
	brne 1b
	eor r20,r18	 ;  D.29253, D.29255
	eor r21,r19	 ;  D.29253, D.29255
	ldd r18,Z+1	 ;  D.29253, *crcAccum_2(D)
	ldi r19,0	 ;  D.29253
	eor r18,r20	 ;  D.29253, D.29253
	eor r19,r21	 ;  D.29253, D.29253
	ldi r23,4	 ; ,
	1:
	asr r25	 ;  D.29255
	ror r24	 ;  D.29255
	dec r23	 ; 
	brne 1b
	eor r24,r18	 ;  D.29253, D.29253
	eor r25,r19	 ;  D.29253, D.29253
	std Z+1,r25	 ;  *crcAccum_2(D), D.29253
	st Z,r24	 ;  *crcAccum_2(D), D.29253
	ret
	.size	crc_accumulate, .-crc_accumulate
	.section	.text._Z9isr_VSYNCv,"ax",@progbits
.global	_Z9isr_VSYNCv
	.type	_Z9isr_VSYNCv, @function
_Z9isr_VSYNCv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sts vsync_wait,__zero_reg__	 ;  vsync_wait,
	ret
	.size	_Z9isr_VSYNCv, .-_Z9isr_VSYNCv
	.section	.text._Z5panCh5Point,"ax",@progbits
.global	_Z5panCh5Point
	.type	_Z5panCh5Point, @function
_Z5panCh5Point:
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 8 */
.L__stack_usage = 8
	ldi r16,lo8(_ZL8chan_raw)	 ;  ivtmp.677,
	ldi r17,hi8(_ZL8chan_raw)	 ;  ivtmp.677,
	ldi r28,lo8(1)	 ;  ivtmp.680,
	ldi r29,0	 ;  ivtmp.680
	ldi r24,lo8(_ZZ5panCh5PointE3__c)	 ; ,
	mov r12,r24	 ;  tmp85,
	ldi r24,hi8(_ZZ5panCh5PointE3__c)	 ; ,
	mov r13,r24	 ; ,
	ldi r25,lo8(osd)	 ; ,
	mov r14,r25	 ;  tmp86,
	ldi r25,hi8(osd)	 ; ,
	mov r15,r25	 ; ,
.L4:
	movw r30,r16	 ; , ivtmp.677
	ld r24,Z	 ;  D.29272, MEM[base: _16, offset: 0B]
	ldd r25,Z+1	 ;  D.29272, MEM[base: _16, offset: 0B]
	subi r16,-2	 ;  ivtmp.677,
	sbci r17,-1	 ;  ivtmp.677,
	push r25	 ;  D.29272
	push r24	 ;  D.29272
	push r29	 ;  tmp31
	push r28	 ;  tmp24
	push r13	 ; 
	push r12	 ;  tmp85
	push r15	 ; 
	push r14	 ;  tmp86
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	adiw r28,1	 ;  ivtmp.680,
	in r30,__SP_L__	 ; 
	in r31,__SP_H__	 ; 
	adiw r30,8	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r31	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r30	 ; 
	cpi r28,9	 ;  ivtmp.680,
	cpc r29,__zero_reg__	 ;  ivtmp.680
	brne .L4	 ; ,
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	ret
	.size	_Z5panCh5Point, .-_Z5panCh5Point
	.section	.rodata
.LC0:
	.byte	-126
	.byte	-128
	.byte	-127
	.byte	-128
	.byte	-127
	.byte	-128
	.byte	-124
	.byte	-128
	.byte	-127
	.byte	-128
	.byte	-127
	.byte	-128
	.byte	-125
	.byte	-128
	.byte	-127
	.byte	-128
	.byte	-127
	.byte	-128
	.byte	-123
	.byte	-128
	.byte	-127
	.byte	-128
	.byte	-127
	.byte	-128
	.section	.text._Z7panRose5Point,"ax",@progbits
.global	_Z7panRose5Point
	.type	_Z7panRose5Point, @function
_Z7panRose5Point:
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
	sbiw r28,38	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
/* prologue: function */
/* frame size = 38 */
/* stack size = 42 */
.L__stack_usage = 42
	mov r18,r24	 ;  p, p
	ldi r24,lo8(24)	 ;  tmp87,
	ldi r30,lo8(.LC0)	 ; ,
	ldi r31,hi8(.LC0)	 ; ,
	movw r26,r28	 ; ,
	adiw r26,1	 ; ,
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r24	 ;  tmp87
	brne 0b
	lds r20,_ZL11osd_heading	 ;  osd_heading, osd_heading
	lds r21,_ZL11osd_heading+1	 ;  osd_heading, osd_heading
	ldi r19,lo8(24)	 ;  tmp90,
	mul r19,r20	 ;  tmp90, osd_heading
	movw r24,r0	 ;  D.29286
	mul r19,r21	 ;  tmp90, osd_heading
	add r25,r0	 ;  D.29286
	clr __zero_reg__
	adiw r24,12	 ;  D.29286,
	ldi r22,lo8(104)	 ; ,
	ldi r23,lo8(1)	 ; ,
	call __divmodhi4
	movw r24,r22	 ;  start, tmp92
	sbiw r24,4	 ;  start,
	sbrc r25,7	 ;  start,
	adiw r24,24	 ;  start,
.L8:
	movw r30,r28	 ;  ivtmp.690,
	adiw r30,25	 ;  ivtmp.690,
	movw r20,r28	 ;  D.29285,
	subi r20,-34	 ;  D.29285,
	sbci r21,-1	 ;  D.29285,
	mov r17,r30	 ;  ivtmp.690, ivtmp.690
	mov r16,r31	 ;  ivtmp.690, ivtmp.690
.L10:
	ldi r26,lo8(1)	 ;  tmp96,
	ldi r27,0	 ; 
	add r26,r28	 ;  tmp96,
	adc r27,r29	 ; ,
	add r26,r24	 ;  tmp96, start
	adc r27,r25	 ; , start
	ld r19,X	 ;  tmp97, buf_Rule
	st Z+,r19	 ;  MEM[base: _36, offset: 0B], tmp97
	adiw r24,1	 ;  start,
	cpi r24,24	 ;  start,
	cpc r25,__zero_reg__	 ;  start
	brlt .L9	 ; ,
	ldi r24,0	 ;  start
	ldi r25,0	 ;  start
.L9:
	cp r20,r30	 ;  D.29285, ivtmp.690
	cpc r21,r31	 ;  D.29285, ivtmp.690
	brne .L10	 ; ,
	std Y+34,__zero_reg__	 ;  MEM[(char *)&buf_show + 9B],
	sbrc r18,7	 ;  p,
	rjmp .L11	 ; 
	ldi r22,lo8(_ZZ7panRose5PointE3__c)	 ; ,
	ldi r23,hi8(_ZZ7panRose5PointE3__c)	 ; ,
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	call _ZN12BetterStream7print_PEPKc	 ; 
.L11:
	push r16	 ;  ivtmp.690
	push r17	 ;  ivtmp.690
	ldi r24,lo8(_ZZ7panRose5PointE3__c_0)	 ;  tmp101,
	ldi r25,hi8(_ZZ7panRose5PointE3__c_0)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp101
	ldi r24,lo8(osd)	 ;  tmp105,
	ldi r25,hi8(osd)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp105
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	 ; SP += 6	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
/* epilogue start */
	adiw r28,38	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	ret
	.size	_Z7panRose5Point, .-_Z7panRose5Point
	.section	.text._Z13panFlightMode5Point,"ax",@progbits
.global	_Z13panFlightMode5Point
	.type	_Z13panFlightMode5Point, @function
_Z13panFlightMode5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbrc r24,7	 ;  p,
	rjmp .L14	 ; 
	ldi r24,lo8(127)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L14:
	lds r24,lflags+1	 ;  lflags, lflags
	lds r30,_ZL8osd_mode	 ;  osd_mode, osd_mode
	sbrs r24,3	 ;  lflags,
	rjmp .L15	 ; 
	ldi r31,0	 ;  D.29304
	lsl r30	 ;  tmp84
	rol r31	 ;  tmp84
	subi r30,lo8(-(_ZL14mode_u_strings))	 ;  ptr,
	sbci r31,hi8(-(_ZL14mode_u_strings))	 ;  ptr,
	rjmp .L16	 ; 
.L15:
	sbrs r24,4	 ;  lflags,
	rjmp .L17	 ; 
	ldi r31,0	 ;  D.29304
	lsl r30	 ;  tmp92
	rol r31	 ;  tmp92
	subi r30,lo8(-(_ZL15mode_mw_strings))	 ;  ptr,
	sbci r31,hi8(-(_ZL15mode_mw_strings))	 ;  ptr,
	rjmp .L16	 ; 
.L17:
	lds r24,_ZL13osd_autopilot	 ;  osd_autopilot, osd_autopilot
	cpi r24,lo8(14)	 ;  osd_autopilot,
	brne .L18	 ; ,
	mov r18,r30	 ;  D.29304, osd_mode
	ldi r19,0	 ;  D.29304
	ldi r24,lo8(7)	 ;  ivtmp.699,
	ldi r25,0	 ;  ivtmp.699
.L20:
	mov r30,r24	 ;  bc, ivtmp.699
	movw r20,r18	 ;  D.29304, D.29304
	mov r0,r24	 ; , ivtmp.699
	rjmp 2f
	1:
	asr r21	 ;  D.29304
	ror r20	 ;  D.29304
	2:
	dec r0	 ; 
	brpl 1b
	sbrc r20,0	 ;  D.29304,
	rjmp .L19	 ; 
	sbiw r24,1	 ;  ivtmp.699
	brcc .L20	 ; ,
	ldi r30,lo8(8)	 ;  bc,
.L19:
	lsl r30	 ;  tmp98
	sbc r31,r31	 ;  tmp98
	subi r30,lo8(-(_ZL15mode_aq_strings))	 ;  ptr,
	sbci r31,hi8(-(_ZL15mode_aq_strings))	 ;  ptr,
	rjmp .L16	 ; 
.L18:
	lds r24,sets	 ;  sets.model_type, sets.model_type
	ldi r31,0	 ;  D.29304
	lsl r30	 ;  tmp103
	rol r31	 ;  tmp103
	cpse r24,__zero_reg__	 ;  sets.model_type,
	rjmp .L21	 ; 
	subi r30,lo8(-(_ZL14mode_p_strings))	 ;  ptr,
	sbci r31,hi8(-(_ZL14mode_p_strings))	 ;  ptr,
	rjmp .L16	 ; 
.L21:
	subi r30,lo8(-(_ZL14mode_c_strings))	 ;  ptr,
	sbci r31,hi8(-(_ZL14mode_c_strings))	 ;  ptr,
.L16:
/* #APP */
 ;  1360 "Panels.h" 1
	lpm r22, Z+	 ;  __result
	lpm r23, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	call _ZN12BetterStream7print_PEPKc	 ; 
	lds r24,lflags	 ;  lflags, lflags
	sbrs r24,6	 ;  lflags,
	rjmp .L13	 ; 
	ldi r24,lo8(-122)	 ; ,
	jmp _ZN3OSD6writebEh	 ; 
.L13:
	ret
	.size	_Z13panFlightMode5Point, .-_Z13panFlightMode5Point
	.section	.text._Z5renewv,"ax",@progbits
.global	_Z5renewv
	.type	_Z5renewv, @function
_Z5renewv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp _ZN3OSD6adjustEv	 ; 
	.size	_Z5renewv, .-_Z5renewv
	.section	.text._Z11ReadINT_PINv,"ax",@progbits
.global	_Z11ReadINT_PINv
	.type	_Z11ReadINT_PINv, @function
_Z11ReadINT_PINv:
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	call micros	 ; 
	movw r12,r22	 ;  time,
	movw r14,r24	 ;  time,
	ldi r24,lo8(3)	 ; ,
	call digitalRead	 ; 
	cpi r24,lo8(1)	 ; ,
	brne .L26	 ; ,
	sts int_Timer,r12	 ;  int_Timer, time
	sts int_Timer+1,r13	 ;  int_Timer, time
	sts int_Timer+2,r14	 ;  int_Timer, time
	sts int_Timer+3,r15	 ;  int_Timer, time
	rjmp .L25	 ; 
.L26:
	lds r24,int_Timer	 ;  t, int_Timer
	lds r25,int_Timer+1	 ;  t, int_Timer
	lds r26,int_Timer+2	 ;  t, int_Timer
	lds r27,int_Timer+3	 ;  t, int_Timer
	sbiw r24,0	 ;  t,
	cpc r26,__zero_reg__	 ;  t
	cpc r27,__zero_reg__	 ;  t
	breq .L25	 ; ,
	sub r12,r24	 ;  time, t
	sbc r13,r25	 ;  time, t
	sbc r14,r26	 ;  time, t
	sbc r15,r27	 ;  time, t
	sts PWM_IN+1,r13	 ;  PWM_IN, time
	sts PWM_IN,r12	 ;  PWM_IN, time
	sts int_Timer,__zero_reg__	 ;  int_Timer,
	sts int_Timer+1,__zero_reg__	 ;  int_Timer,
	sts int_Timer+2,__zero_reg__	 ;  int_Timer,
	sts int_Timer+3,__zero_reg__	 ;  int_Timer,
	ldi r24,lo8(1)	 ;  tmp48,
	sts New_PWM_Frame,r24	 ;  New_PWM_Frame, tmp48
.L25:
/* epilogue start */
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	ret
	.size	_Z11ReadINT_PINv, .-_Z11ReadINT_PINv
	.section	.text._Z11panCALLSIGN5Point,"ax",@progbits
.global	_Z11panCALLSIGN5Point
	.type	_Z11panCALLSIGN5Point, @function
_Z11panCALLSIGN5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,_ZL7seconds	 ;  seconds, seconds
	andi r24,lo8(63)	 ;  D.29319,
	cpi r24,lo8(2)	 ;  D.29319,
	brsh .L31	 ; ,
	ldi r22,lo8(sets+13)	 ; ,
	ldi r23,hi8(sets+13)	 ; ,
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	jmp _ZN5Print5printEPKc	 ; 
.L31:
	ret
	.size	_Z11panCALLSIGN5Point, .-_Z11panCALLSIGN5Point
	.section	.text.__vector_18,"ax",@progbits
.global	__vector_18
	.type	__vector_18, @function
__vector_18:
	push r1	 ; 
	push r0	 ; 
	in r0,__SREG__	 ; ,
	push r0	 ; 
	clr __zero_reg__	 ; 
	push r18	 ; 
	push r24	 ; 
	push r25	 ; 
	push r30	 ; 
	push r31	 ; 
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 8 */
.L__stack_usage = 8
	lds r25,198	 ;  c, MEM[(volatile uint8_t *)198B]
	lds r24,_ZN12SingleSerial9_rxBufferE	 ;  D.29322, _rxBuffer.head
	subi r24,lo8(-(1))	 ;  D.29323,
	andi r24,lo8(127)	 ;  i,
	lds r18,_ZN12SingleSerial9_rxBufferE+1	 ;  D.29322, _rxBuffer.tail
	cp r24,r18	 ;  i, D.29322
	breq .L33	 ; ,
	lds r30,_ZN12SingleSerial9_rxBufferE	 ;  D.29322, _rxBuffer.head
	ldi r31,0	 ;  D.29324
	subi r30,lo8(-(_ZN12SingleSerial8_rxBytesE))	 ;  tmp56,
	sbci r31,hi8(-(_ZN12SingleSerial8_rxBytesE))	 ;  tmp56,
	st Z,r25	 ;  _rxBytes, c
	sts _ZN12SingleSerial9_rxBufferE,r24	 ;  _rxBuffer.head, i
.L33:
/* epilogue start */
	pop r31	 ; 
	pop r30	 ; 
	pop r25	 ; 
	pop r24	 ; 
	pop r18	 ; 
	pop r0	 ; 
	out __SREG__,r0	 ; ,
	pop r0	 ; 
	pop r1	 ; 
	reti
	.size	__vector_18, .-__vector_18
	.section	.text.__vector_19,"ax",@progbits
.global	__vector_19
	.type	__vector_19, @function
__vector_19:
	push r1	 ; 
	push r0	 ; 
	in r0,__SREG__	 ; ,
	push r0	 ; 
	clr __zero_reg__	 ; 
	push r24	 ; 
	push r25	 ; 
	push r30	 ; 
	push r31	 ; 
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	lds r25,_ZN12SingleSerial9_txBufferE+1	 ;  D.29327, _txBuffer.tail
	lds r24,_ZN12SingleSerial9_txBufferE	 ;  D.29327, _txBuffer.head
	cp r25,r24	 ;  D.29327, D.29327
	breq .L36	 ; ,
	lds r30,_ZN12SingleSerial9_txBufferE+1	 ;  D.29327, _txBuffer.tail
	ldi r31,0	 ;  D.29328
	subi r30,lo8(-(_ZN12SingleSerial8_txBytesE))	 ;  tmp57,
	sbci r31,hi8(-(_ZN12SingleSerial8_txBytesE))	 ;  tmp57,
	ld r24,Z	 ;  D.29327, _txBytes
	sts 198,r24	 ;  MEM[(volatile uint8_t *)198B], D.29327
	lds r24,_ZN12SingleSerial9_txBufferE+1	 ;  D.29327, _txBuffer.tail
	subi r24,lo8(-(1))	 ;  D.29329,
	andi r24,lo8(3)	 ;  D.29327,
	sts _ZN12SingleSerial9_txBufferE+1,r24	 ;  _txBuffer.tail, D.29327
	rjmp .L35	 ; 
.L36:
	lds r24,193	 ;  D.29327, MEM[(volatile uint8_t *)193B]
	andi r24,lo8(-33)	 ;  D.29327,
	sts 193,r24	 ;  MEM[(volatile uint8_t *)193B], D.29327
.L35:
/* epilogue start */
	pop r31	 ; 
	pop r30	 ; 
	pop r25	 ; 
	pop r24	 ; 
	pop r0	 ; 
	out __SREG__,r0	 ; ,
	pop r0	 ; 
	pop r1	 ; 
	reti
	.size	__vector_19, .-__vector_19
	.section	.text._Z11millis_plusPmj,"ax",@progbits
.global	_Z11millis_plusPmj
	.type	_Z11millis_plusPmj, @function
_Z11millis_plusPmj:
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r24	 ;  dst, dst
	movw r16,r22	 ;  inc, inc
	call millis	 ; 
	movw r26,r24	 ;  D.29332, D.29332
	movw r24,r22	 ;  D.29332, D.29332
	add r24,r16	 ;  D.29332, inc
	adc r25,r17	 ;  D.29332, inc
	adc r26,__zero_reg__	 ;  D.29332
	adc r27,__zero_reg__	 ;  D.29332
	st Y,r24	 ;  *dst_7(D), D.29332
	std Y+1,r25	 ;  *dst_7(D), D.29332
	std Y+2,r26	 ;  *dst_7(D), D.29332
	std Y+3,r27	 ;  *dst_7(D), D.29332
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	ret
	.size	_Z11millis_plusPmj, .-_Z11millis_plusPmj
	.section	.text._Z13setBatteryPicjPh,"ax",@progbits
.global	_Z13setBatteryPicjPh
	.type	_Z13setBatteryPicjPh, @function
_Z13setBatteryPicjPh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r22	 ;  bp, bp
	cpi r24,-127	 ;  bat_level,
	cpc r25,__zero_reg__	 ;  bat_level
	brlo .L40	 ; ,
	ldi r18,lo8(-119)	 ;  tmp48,
	st Z,r18	 ;  *bp_7(D), tmp48
	subi r24,-128	 ;  bat_level,
	sbc r25,__zero_reg__	 ;  bat_level
	adiw r30,1	 ;  bp,
	rjmp .L41	 ; 
.L40:
	ldi r18,lo8(-115)	 ;  tmp49,
	std Z+1,r18	 ;  MEM[(byte *)bp_7(D) + 1B], tmp49
	cpi r24,18	 ;  bat_level,
	cpc r25,__zero_reg__	 ;  bat_level
	brsh .L41	 ; ,
	lds r24,lflags+1	 ;  lflags, lflags
	sbrs r24,2	 ;  lflags,
	rjmp .L42	 ; 
	ldi r24,lo8(32)	 ;  tmp55,
	st Z,r24	 ;  *bp_7(D), tmp55
	std Z+1,r24	 ;  MEM[(byte *)bp_7(D) + 1B], tmp55
	ldi r24,lo8(1)	 ;  D.29335,
	ret
.L41:
	cpi r24,27	 ;  bat_level,
	cpc r25,__zero_reg__	 ;  bat_level
	brsh .L44	 ; ,
.L42:
	ldi r24,lo8(-115)	 ;  tmp57,
	rjmp .L51	 ; 
.L44:
	cpi r24,52	 ;  bat_level,
	cpc r25,__zero_reg__	 ;  bat_level
	brsh .L45	 ; ,
	ldi r24,lo8(-116)	 ;  tmp58,
	rjmp .L51	 ; 
.L45:
	cpi r24,78	 ;  bat_level,
	cpc r25,__zero_reg__	 ;  bat_level
	brsh .L46	 ; ,
	ldi r24,lo8(-117)	 ;  tmp59,
	rjmp .L51	 ; 
.L46:
	cpi r24,104	 ;  bat_level,
	cpc r25,__zero_reg__	 ;  bat_level
	brsh .L47	 ; ,
	ldi r24,lo8(-118)	 ;  tmp60,
	rjmp .L51	 ; 
.L47:
	ldi r24,lo8(-119)	 ;  tmp61,
.L51:
	st Z,r24	 ; * bp, tmp61
	ldi r24,0	 ;  D.29335
	ret
	.size	_Z13setBatteryPicjPh, .-_Z13setBatteryPicjPh
	.section	.text._Z12grad_to_secti,"ax",@progbits
.global	_Z12grad_to_secti
	.type	_Z12grad_to_secti, @function
_Z12grad_to_secti:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r18,4	 ; ,
	1:
	lsl r24	 ;  D.29339
	rol r25	 ;  D.29339
	dec r18	 ; 
	brne 1b
	subi r24,76	 ;  D.29339,
	sbci r25,-1	 ;  D.29339,
	ldi r22,lo8(104)	 ; ,
	ldi r23,lo8(1)	 ; ,
	call __divmodhi4
	movw r24,r22	 ; , D.29339
	adiw r24,1	 ; ,
	ret
	.size	_Z12grad_to_secti, .-_Z12grad_to_secti
	.section	.text._Z14grad_to_sect_pi,"ax",@progbits
.global	_Z14grad_to_sect_pi
	.type	_Z14grad_to_sect_pi, @function
_Z14grad_to_sect_pi:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L55:
	sbrs r25,7	 ;  grad,
	rjmp .L54	 ; 
	subi r24,-104	 ;  grad,
	sbci r25,-2	 ;  grad,
	rjmp .L55	 ; 
.L54:
	jmp _Z12grad_to_secti	 ; 
	.size	_Z14grad_to_sect_pi, .-_Z14grad_to_sect_pi
.global	__gtsf2
.global	__mulsf3
.global	__subsf3
.global	__addsf3
.global	__fixsfsi
	.section	.text._Z11setHomeVarsv,"ax",@progbits
.global	_Z11setHomeVarsv
	.type	_Z11setHomeVarsv, @function
_Z11setHomeVarsv:
	push r4	 ; 
	push r5	 ; 
	push r6	 ; 
	push r7	 ; 
	push r8	 ; 
	push r9	 ; 
	push r10	 ; 
	push r11	 ; 
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 12 */
.L__stack_usage = 12
	lds r24,sets	 ;  sets.model_type, sets.model_type
	cpse r24,__zero_reg__	 ;  sets.model_type,
	rjmp .L81	 ; 
	lds r24,_ZL12osd_throttle	 ;  osd_throttle, osd_throttle
	cpi r24,lo8(4)	 ;  osd_throttle,
	brlo .L59	 ; ,
	lds r24,_ZL15takeoff_heading	 ;  takeoff_heading, takeoff_heading
	lds r25,_ZL15takeoff_heading+1	 ;  takeoff_heading, takeoff_heading
	cpi r24,112	 ;  takeoff_heading,
	sbci r25,-2	 ;  takeoff_heading,
	brne .L59	 ; ,
	lds r24,_ZL11osd_heading	 ;  osd_heading, osd_heading
	lds r25,_ZL11osd_heading+1	 ;  osd_heading, osd_heading
	sts _ZL15takeoff_heading+1,r25	 ;  takeoff_heading, osd_heading
	sts _ZL15takeoff_heading,r24	 ;  takeoff_heading, osd_heading
.L59:
	lds r24,lflags+1	 ;  lflags, lflags
	sbrc r24,7	 ;  lflags,
	rjmp .L81	 ; 
	ldi r24,lo8(1)	 ;  en,
	lds r25,_ZL12osd_fix_type	 ;  osd_fix_type, osd_fix_type
	cpi r25,lo8(3)	 ;  osd_fix_type,
	breq .L58	 ; ,
.L81:
	ldi r24,0	 ;  en
.L58:
	lds r25,lflags	 ;  lflags, lflags
	bst r25,6	 ;  lflags,
	clr r18	 ;  D.29360
	bld r18,0	 ;  D.29360
	sbrs r25,6	 ;  lflags,
	rjmp .L62	 ; 
	sbrc r25,7	 ;  lflags,
	rjmp .L62	 ; 
	lds r25,lflags+1	 ;  lflags.osd_got_home, lflags.osd_got_home
	andi r25,lo8(~(1<<7))	 ;  lflags.osd_got_home,
	sts lflags+1,r25	 ;  lflags.osd_got_home, lflags.osd_got_home
.L62:
	lds r25,lflags	 ;  lflags.last_armed_status, lflags.last_armed_status
	bst r18,0	 ;  D.29360
	bld r25,7	 ;  lflags.last_armed_status,
	sts lflags,r25	 ;  lflags.last_armed_status, lflags.last_armed_status
	tst r24	 ;  en
	breq .L63	 ; ,
	ldi r24,lo8(8)	 ;  tmp109,
	ldi r30,lo8(osd_pos)	 ; ,
	ldi r31,hi8(osd_pos)	 ; ,
	ldi r26,lo8(osd_home)	 ; ,
	ldi r27,hi8(osd_home)	 ; ,
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r24	 ;  tmp109
	brne 0b
	lds r24,lflags+1	 ;  lflags.osd_got_home, lflags.osd_got_home
	ori r24,lo8(1<<7)	 ;  lflags.osd_got_home,
	sts lflags+1,r24	 ;  lflags.osd_got_home, lflags.osd_got_home
	rjmp .L56	 ; 
.L63:
	lds r24,lflags+1	 ;  lflags, lflags
	sbrs r24,7	 ;  lflags,
	rjmp .L56	 ; 
	lds r12,osd_home	 ;  D.29361, osd_home.lat
	lds r13,osd_home+1	 ;  D.29361, osd_home.lat
	lds r14,osd_home+2	 ;  D.29361, osd_home.lat
	lds r15,osd_home+3	 ;  D.29361, osd_home.lat
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	movw r20,r18	 ; 
	movw r24,r14	 ; , D.29361
	movw r22,r12	 ; , D.29361
	call __gtsf2	 ; 
	ldi r18,lo8(53)	 ; ,
	ldi r19,lo8(-6)	 ; ,
	ldi r20,lo8(-114)	 ; ,
	ldi r21,lo8(60)	 ; ,
	cp __zero_reg__,r24	 ; 
	brge .L80	 ; ,
	movw r24,r14	 ; , D.29361
	movw r22,r12	 ; , D.29361
	rjmp .L82	 ; 
.L80:
	movw r24,r14	 ;  D.29361, D.29361
	movw r22,r12	 ;  D.29361, D.29361
	subi r25,0x80	 ;  D.29361
.L82:
	call __mulsf3	 ; 
	call cos	 ; 
	movw r4,r22	 ;  scaleLongDown,
	movw r6,r24	 ;  scaleLongDown,
	lds r18,osd_pos	 ; , osd_pos.lat
	lds r19,osd_pos+1	 ; , osd_pos.lat
	lds r20,osd_pos+2	 ; , osd_pos.lat
	lds r21,osd_pos+3	 ; , osd_pos.lat
	movw r24,r14	 ; , D.29361
	movw r22,r12	 ; , D.29361
	call __subsf3	 ; 
	ldi r18,lo8(-64)	 ; ,
	ldi r19,lo8(107)	 ; ,
	ldi r20,lo8(-39)	 ; ,
	ldi r21,lo8(71)	 ; ,
	call __mulsf3	 ; 
	movw r8,r22	 ;  tmp125,
	movw r10,r24	 ;  tmp125,
	lds r18,osd_pos+4	 ; , osd_pos.lon
	lds r19,osd_pos+4+1	 ; , osd_pos.lon
	lds r20,osd_pos+4+2	 ; , osd_pos.lon
	lds r21,osd_pos+4+3	 ; , osd_pos.lon
	lds r22,osd_home+4	 ; , osd_home.lon
	lds r23,osd_home+4+1	 ; , osd_home.lon
	lds r24,osd_home+4+2	 ; , osd_home.lon
	lds r25,osd_home+4+3	 ; , osd_home.lon
	call __subsf3	 ; 
	ldi r18,lo8(-64)	 ; ,
	ldi r19,lo8(107)	 ; ,
	ldi r20,lo8(-39)	 ; ,
	ldi r21,lo8(71)	 ; ,
	call __mulsf3	 ; 
	movw r20,r6	 ; , scaleLongDown
	movw r18,r4	 ; , scaleLongDown
	call __mulsf3	 ; 
	movw r12,r22	 ;  tmp130,
	movw r14,r24	 ;  tmp130,
	movw r20,r10	 ; , tmp125
	movw r18,r8	 ; , tmp125
	movw r24,r10	 ; , tmp125
	movw r22,r8	 ; , tmp125
	call __mulsf3	 ; 
	movw r4,r22	 ;  D.29361,
	movw r6,r24	 ;  D.29361,
	movw r20,r14	 ; , tmp130
	movw r18,r12	 ; , tmp130
	movw r24,r14	 ; , tmp130
	movw r22,r12	 ; , tmp130
	call __mulsf3	 ; 
	movw r18,r22	 ;  D.29361,
	movw r20,r24	 ;  D.29361,
	movw r24,r6	 ; , D.29361
	movw r22,r4	 ; , D.29361
	call __addsf3	 ; 
	call sqrt	 ; 
	call __fixsfsi	 ; 
	sts _ZL17osd_home_distance,r22	 ;  osd_home_distance, tmp134
	sts _ZL17osd_home_distance+1,r23	 ;  osd_home_distance, tmp134
	sts _ZL17osd_home_distance+2,r24	 ;  osd_home_distance, tmp134
	sts _ZL17osd_home_distance+3,r25	 ;  osd_home_distance, tmp134
	movw r24,r10	 ;  D.29362, tmp125
	movw r22,r8	 ;  D.29362, tmp125
	andi r25,0x7f	 ;  D.29362
	call __fixsfsi	 ; 
	sts _ZL5dst_x+1,r23	 ;  dst_x, tmp136
	sts _ZL5dst_x,r22	 ;  dst_x, tmp136
	movw r24,r14	 ;  D.29362, tmp130
	movw r22,r12	 ;  D.29362, tmp130
	andi r25,0x7f	 ;  D.29362
	call __fixsfsi	 ; 
	sts _ZL5dst_y+1,r23	 ;  dst_y, tmp138
	sts _ZL5dst_y,r22	 ;  dst_y, tmp138
	movw r20,r14	 ;  D.29361, tmp130
	movw r18,r12	 ;  D.29361, tmp130
	subi r21,0x80	 ;  D.29361
	movw r24,r10	 ; , tmp125
	movw r22,r8	 ; , tmp125
	call atan2	 ; 
	ldi r18,lo8(-32)	 ; ,
	ldi r19,lo8(46)	 ; ,
	ldi r20,lo8(101)	 ; ,
	ldi r21,lo8(66)	 ; ,
	call __mulsf3	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-76)	 ; ,
	ldi r21,lo8(66)	 ; ,
	call __addsf3	 ; 
	call __fixsfsi	 ; 
	movw r18,r22	 ;  bearing, tmp142
	sbrs r23,7	 ;  bearing,
	rjmp .L68	 ; 
	subi r18,-104	 ;  bearing,
	sbci r19,-2	 ;  bearing,
.L68:
	movw r24,r18	 ;  D.29359, bearing
	subi r24,-76	 ;  D.29359,
	sbc r25,__zero_reg__	 ;  D.29359
	lds r18,_ZL11osd_heading	 ;  osd_heading, osd_heading
	lds r19,_ZL11osd_heading+1	 ;  osd_heading, osd_heading
	sub r24,r18	 ;  bearing, osd_heading
	sbc r25,r19	 ;  bearing, osd_heading
	sbrs r25,7	 ;  bearing,
	rjmp .L69	 ; 
	subi r24,-104	 ;  bearing,
	sbci r25,-2	 ;  bearing,
.L69:
	call _Z12grad_to_secti	 ; 
	sts _ZL18osd_home_direction,r24	 ;  osd_home_direction,
.L56:
/* epilogue start */
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	pop r7	 ; 
	pop r6	 ; 
	pop r5	 ; 
	pop r4	 ; 
	ret
	.size	_Z11setHomeVarsv, .-_Z11setHomeVarsv
.global	__ltsf2
	.section	.text._Z8calc_maxRfS_,"ax",@progbits
.global	_Z8calc_maxRfS_
	.type	_Z8calc_maxRfS_, @function
_Z8calc_maxRfS_:
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r28,r24	 ;  dst, dst
	movw r30,r22	 ; , src
	ld r12,Z	 ;  D.29371, *src_5(D)
	ldd r13,Z+1	 ;  D.29371, *src_5(D)
	ldd r14,Z+2	 ;  D.29371, *src_5(D)
	ldd r15,Z+3	 ;  D.29371, *src_5(D)
	movw r20,r14	 ; , D.29371
	movw r18,r12	 ; , D.29371
	ld r22,Y	 ; , *dst_3(D)
	ldd r23,Y+1	 ; , *dst_3(D)
	ldd r24,Y+2	 ; , *dst_3(D)
	ldd r25,Y+3	 ; , *dst_3(D)
	call __ltsf2	 ; 
	sbrs r24,7	 ; ,
	rjmp .L83	 ; 
	st Y,r12	 ;  *dst_3(D), D.29371
	std Y+1,r13	 ;  *dst_3(D), D.29371
	std Y+2,r14	 ;  *dst_3(D), D.29371
	std Y+3,r15	 ;  *dst_3(D), D.29371
.L83:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	ret
	.size	_Z8calc_maxRfS_, .-_Z8calc_maxRfS_
.global	__floatsisf
.global	__divsf3
.global	__floatunsisf
	.section	.text._Z12setFdataVarsv,"ax",@progbits
.global	_Z12setFdataVarsv
	.type	_Z12setFdataVarsv, @function
_Z12setFdataVarsv:
	push r4	 ; 
	push r5	 ; 
	push r6	 ; 
	push r7	 ; 
	push r8	 ; 
	push r9	 ; 
	push r10	 ; 
	push r11	 ; 
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
	 ; SP -= 4	 ; 
	rcall .
	rcall .
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
/* prologue: function */
/* frame size = 4 */
/* stack size = 20 */
.L__stack_usage = 20
	call millis	 ; 
	lds r16,runtime	 ;  runtime, runtime
	lds r17,runtime+1	 ;  runtime, runtime
	lds r18,runtime+2	 ;  runtime, runtime
	lds r19,runtime+3	 ;  runtime, runtime
	movw r12,r22	 ;  time_lapse, D.29375
	movw r14,r24	 ;  time_lapse, D.29375
	sub r12,r16	 ;  time_lapse, runtime
	sbc r13,r17	 ;  time_lapse, runtime
	sbc r14,r18	 ;  time_lapse, runtime
	sbc r15,r19	 ;  time_lapse, runtime
	ldi r22,0	 ; 
	ldi r23,0	 ; 
	ldi r24,lo8(runtime)	 ; ,
	ldi r25,hi8(runtime)	 ; ,
	call _Z11millis_plusPmj	 ; 
	lds r30,_ZL7measure	 ;  measure, measure
	lds r31,_ZL7measure+1	 ;  measure, measure
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  368 "Func.h" 1
	lpm r22, Z+	 ;  __result
	lpm r23, Z+	 ;  __result
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lds r18,_ZL9osd_climb	 ; , osd_climb
	lds r19,_ZL9osd_climb+1	 ; , osd_climb
	lds r20,_ZL9osd_climb+2	 ; , osd_climb
	lds r21,_ZL9osd_climb+3	 ; , osd_climb
	call __mulsf3	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-64)	 ; ,
	ldi r21,lo8(64)	 ; ,
	call __mulsf3	 ; 
	movw r8,r22	 ;  D.29379,
	movw r10,r24	 ;  D.29379,
	ldi r18,lo8(102)	 ; ,
	ldi r19,lo8(102)	 ; ,
	ldi r20,lo8(102)	 ; ,
	ldi r21,lo8(63)	 ; ,
	lds r22,_ZL14vertical_speed	 ; , vertical_speed
	lds r23,_ZL14vertical_speed+1	 ; , vertical_speed
	lds r24,_ZL14vertical_speed+2	 ; , vertical_speed
	lds r25,_ZL14vertical_speed+3	 ; , vertical_speed
	call __mulsf3	 ; 
	movw r18,r22	 ;  D.29379,
	movw r20,r24	 ;  D.29379,
	movw r24,r10	 ; , D.29379
	movw r22,r8	 ; , D.29379
	call __addsf3	 ; 
	sts _ZL14vertical_speed,r22	 ;  vertical_speed, D.29379
	sts _ZL14vertical_speed+1,r23	 ;  vertical_speed, D.29379
	sts _ZL14vertical_speed+2,r24	 ;  vertical_speed, D.29379
	sts _ZL14vertical_speed+3,r25	 ;  vertical_speed, D.29379
	lds r18,_ZL23osd_battery_remaining_A	 ;  D.29382, osd_battery_remaining_A
	lds r24,_ZL19max_battery_reading	 ;  max_battery_reading, max_battery_reading
	mov __tmp_reg__,r24	 ; 
	lsl r0	 ; 
	sbc r25,r25	 ; 
	mov r20,r18	 ;  D.29381, D.29382
	ldi r21,0	 ;  D.29381
	cp r24,r20	 ;  D.29381, D.29381
	cpc r25,r21	 ;  D.29381, D.29381
	brge .L88	 ; ,
	sts _ZL19max_battery_reading,r18	 ;  max_battery_reading, D.29382
.L88:
	lds r22,_ZL12osd_home_alt	 ; , osd_home_alt
	lds r23,_ZL12osd_home_alt+1	 ; , osd_home_alt
	lds r24,_ZL12osd_home_alt+2	 ; , osd_home_alt
	lds r25,_ZL12osd_home_alt+3	 ; , osd_home_alt
	call __floatsisf	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(122)	 ; ,
	ldi r21,lo8(68)	 ; ,
	call __divsf3	 ; 
	movw r18,r22	 ;  D.29379,
	movw r20,r24	 ;  D.29379,
	lds r22,_ZL11osd_alt_rel	 ; , osd_alt_rel
	lds r23,_ZL11osd_alt_rel+1	 ; , osd_alt_rel
	lds r24,_ZL11osd_alt_rel+2	 ; , osd_alt_rel
	lds r25,_ZL11osd_alt_rel+3	 ; , osd_alt_rel
	call __subsf3	 ; 
	sts _ZL15osd_alt_to_home,r22	 ;  osd_alt_to_home, tmp122
	sts _ZL15osd_alt_to_home+1,r23	 ;  osd_alt_to_home, tmp122
	sts _ZL15osd_alt_to_home+2,r24	 ;  osd_alt_to_home, tmp122
	sts _ZL15osd_alt_to_home+3,r25	 ;  osd_alt_to_home, tmp122
	lds r17,lflags+1	 ;  lflags, lflags
	sbrc r17,1	 ;  lflags,
	rjmp .L89	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-96)	 ; ,
	ldi r21,lo8(64)	 ; ,
	call __gtsf2	 ; 
	cp __zero_reg__,r24	 ; 
	brge .L89	 ; ,
	lds r24,_ZL12osd_throttle	 ;  osd_throttle, osd_throttle
	cpi r24,lo8(11)	 ;  osd_throttle,
	brlo .L89	 ; ,
	ori r17,lo8(1<<1)	 ;  lflags.takeofftime,
	sts lflags+1,r17	 ;  lflags.takeofftime, lflags.takeofftime
	sts _ZL9tdistance,__zero_reg__	 ;  tdistance,
	sts _ZL9tdistance+1,__zero_reg__	 ;  tdistance,
	sts _ZL9tdistance+2,__zero_reg__	 ;  tdistance,
	sts _ZL9tdistance+3,__zero_reg__	 ;  tdistance,
.L89:
	movw r24,r14	 ; , time_lapse
	movw r22,r12	 ; , time_lapse
	call __floatunsisf	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(122)	 ; ,
	ldi r21,lo8(68)	 ; ,
	call __divsf3	 ; 
	movw r4,r22	 ;  time_1000,
	movw r6,r24	 ;  time_1000,
	lds r9,lflags+1	 ;  lflags, lflags
	sbrs r9,7	 ;  lflags,
	rjmp .L91	 ; 
	lds r24,lflags	 ;  lflags, lflags
	sbrs r24,6	 ;  lflags,
	rjmp .L91	 ; 
	lds r18,_ZL15osd_groundspeed	 ; , osd_groundspeed
	lds r19,_ZL15osd_groundspeed+1	 ; , osd_groundspeed
	lds r20,_ZL15osd_groundspeed+2	 ; , osd_groundspeed
	lds r21,_ZL15osd_groundspeed+3	 ; , osd_groundspeed
	movw r24,r6	 ; , time_1000
	movw r22,r4	 ; , time_1000
	call __mulsf3	 ; 
	movw r18,r22	 ;  D.29378,
	movw r20,r24	 ;  D.29378,
	lds r22,_ZL9tdistance	 ; , tdistance
	lds r23,_ZL9tdistance+1	 ; , tdistance
	lds r24,_ZL9tdistance+2	 ; , tdistance
	lds r25,_ZL9tdistance+3	 ; , tdistance
	call __addsf3	 ; 
	sts _ZL9tdistance,r22	 ;  tdistance, D.29378
	sts _ZL9tdistance+1,r23	 ;  tdistance, D.29378
	sts _ZL9tdistance+2,r24	 ;  tdistance, D.29378
	sts _ZL9tdistance+3,r25	 ;  tdistance, D.29378
.L91:
	lds r22,_ZL10osd_curr_A	 ;  osd_curr_A, osd_curr_A
	lds r23,_ZL10osd_curr_A+1	 ;  osd_curr_A, osd_curr_A
	mov __tmp_reg__,r23	 ; 
	lsl r0	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	movw r20,r6	 ; , time_1000
	movw r18,r4	 ; , time_1000
	call __mulsf3	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-76)	 ; ,
	ldi r21,lo8(67)	 ; ,
	call __divsf3	 ; 
	movw r18,r22	 ;  D.29379,
	movw r20,r24	 ;  D.29379,
	lds r22,_ZL8mah_used	 ; , mah_used
	lds r23,_ZL8mah_used+1	 ; , mah_used
	lds r24,_ZL8mah_used+2	 ; , mah_used
	lds r25,_ZL8mah_used+3	 ; , mah_used
	call __addsf3	 ; 
	sts _ZL8mah_used,r22	 ;  mah_used, D.29379
	sts _ZL8mah_used+1,r23	 ;  mah_used, D.29379
	sts _ZL8mah_used+2,r24	 ;  mah_used, D.29379
	sts _ZL8mah_used+3,r25	 ;  mah_used, D.29379
	lds r24,_ZL7rssi_in	 ;  rssi_v, rssi_in
	lds r25,_ZL7rssi_in+1	 ;  rssi_v, rssi_in
	lds r18,sets+10	 ;  sets.RSSI_raw, sets.RSSI_raw
	sbrc r18,0	 ;  sets.RSSI_raw,
	rjmp .L92	 ; 
	lds r10,sets+68	 ;  rssi_v, sets.RSSI_16_low
	lds r11,sets+68+1	 ;  rssi_v, sets.RSSI_16_low
	lds r16,sets+70	 ;  rssi_v, sets.RSSI_16_high
	lds r17,sets+70+1	 ;  rssi_v, sets.RSSI_16_high
	cp r16,r10	 ;  rssi_v, rssi_v
	cpc r17,r11	 ;  rssi_v, rssi_v
	brsh .L102	 ; ,
	lds r18,sets+9	 ;  sets.RSSI_low, sets.RSSI_low
	movw r10,r16	 ;  rssi_v, rssi_v
	mov r16,r18	 ;  rssi_v, sets.RSSI_low
	ldi r17,0	 ;  rssi_v
	clr r8	 ;  rev
	inc r8	 ;  rev
	rjmp .L93	 ; 
.L102:
	mov r8,__zero_reg__	 ;  rev
.L93:
	movw r18,r10	 ;  rssi_v, rssi_v
	cp r10,r24	 ;  rssi_v, rssi_v
	cpc r11,r25	 ;  rssi_v, rssi_v
	brsh .L94	 ; ,
	movw r18,r24	 ;  rssi_v, rssi_v
.L94:
	movw r22,r16	 ;  rssi_v, rssi_v
	cp r18,r16	 ;  rssi_v, rssi_v
	cpc r19,r17	 ;  rssi_v, rssi_v
	brsh .L95	 ; ,
	movw r22,r18	 ;  rssi_v, rssi_v
.L95:
	ldi r24,0	 ;  rssi_v
	ldi r25,0	 ;  rssi_v
	call __floatunsisf	 ; 
	movw r4,r22	 ;  D.29378,
	movw r6,r24	 ;  D.29378,
	movw r22,r10	 ;  rssi_v, rssi_v
	ldi r24,0	 ;  rssi_v
	ldi r25,0	 ;  rssi_v
	call __floatunsisf	 ; 
	movw r18,r22	 ;  D.29378,
	movw r20,r24	 ;  D.29378,
	movw r24,r6	 ; , D.29378
	movw r22,r4	 ; , D.29378
	call __subsf3	 ; 
	movw r4,r22	 ;  D.29378,
	movw r6,r24	 ;  D.29378,
	movw r22,r16	 ;  D.29385, rssi_v
	sub r22,r10	 ;  D.29385, rssi_v
	sbc r23,r11	 ;  D.29385, rssi_v
	ldi r24,0	 ;  D.29385
	ldi r25,0	 ;  D.29385
	call __floatunsisf	 ; 
	movw r18,r22	 ;  D.29378,
	movw r20,r24	 ;  D.29378,
	movw r24,r6	 ; , D.29378
	movw r22,r4	 ; , D.29378
	call __divsf3	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-56)	 ; ,
	ldi r21,lo8(66)	 ; ,
	call __mulsf3	 ; 
	call __fixsfsi	 ; 
	cpi r22,101	 ;  tmp173,
	cpc r23,__zero_reg__	 ; 
	brsh .L96	 ; ,
	sts _ZL4rssi+1,r23	 ;  rssi, tmp173
	sts _ZL4rssi,r22	 ;  rssi, tmp173
	rjmp .L97	 ; 
.L96:
	ldi r24,lo8(100)	 ;  tmp174,
	ldi r25,0	 ; 
	sts _ZL4rssi+1,r25	 ;  rssi, tmp174
	sts _ZL4rssi,r24	 ;  rssi, tmp174
.L97:
	tst r8	 ;  rev
	breq .L98	 ; ,
	lds r18,_ZL4rssi	 ;  rssi, rssi
	lds r19,_ZL4rssi+1	 ;  rssi, rssi
	ldi r24,lo8(100)	 ;  tmp176,
	ldi r25,0	 ; 
	sub r24,r18	 ;  D.29385, rssi
	sbc r25,r19	 ;  D.29385, rssi
.L92:
	sts _ZL4rssi+1,r25	 ;  rssi, rssi_v
	sts _ZL4rssi,r24	 ;  rssi, rssi_v
.L98:
	lds r24,sets	 ;  sets.model_type, sets.model_type
	cpse r24,__zero_reg__	 ;  sets.model_type,
	rjmp .L99	 ; 
	sbrc r9,1	 ;  lflags,
	rjmp .L100	 ; 
.L99:
	lds r24,lflags	 ;  lflags, lflags
	sbrs r24,6	 ;  lflags,
	rjmp .L87	 ; 
.L100:
	lds r24,_ZL23total_flight_time_milis	 ;  total_flight_time_milis, total_flight_time_milis
	lds r25,_ZL23total_flight_time_milis+1	 ;  total_flight_time_milis, total_flight_time_milis
	lds r26,_ZL23total_flight_time_milis+2	 ;  total_flight_time_milis, total_flight_time_milis
	lds r27,_ZL23total_flight_time_milis+3	 ;  total_flight_time_milis, total_flight_time_milis
	add r12,r24	 ;  D.29375, total_flight_time_milis
	adc r13,r25	 ;  D.29375, total_flight_time_milis
	adc r14,r26	 ;  D.29375, total_flight_time_milis
	adc r15,r27	 ;  D.29375, total_flight_time_milis
	sts _ZL23total_flight_time_milis,r12	 ;  total_flight_time_milis, D.29375
	sts _ZL23total_flight_time_milis+1,r13	 ;  total_flight_time_milis, D.29375
	sts _ZL23total_flight_time_milis+2,r14	 ;  total_flight_time_milis, D.29375
	sts _ZL23total_flight_time_milis+3,r15	 ;  total_flight_time_milis, D.29375
	lds r22,_ZL17osd_home_distance	 ; , osd_home_distance
	lds r23,_ZL17osd_home_distance+1	 ; , osd_home_distance
	lds r24,_ZL17osd_home_distance+2	 ; , osd_home_distance
	lds r25,_ZL17osd_home_distance+3	 ; , osd_home_distance
	call __floatsisf	 ; 
	std Y+1,r22	 ;  dst, tmp192
	std Y+2,r23	 ;  dst, tmp192
	std Y+3,r24	 ;  dst, tmp192
	std Y+4,r25	 ;  dst, tmp192
	movw r22,r28	 ; ,
	subi r22,-1	 ; ,
	sbci r23,-1	 ; ,
	ldi r24,lo8(_ZL17max_home_distance)	 ; ,
	ldi r25,hi8(_ZL17max_home_distance)	 ; ,
	call _Z8calc_maxRfS_	 ; 
	ldi r22,lo8(_ZL12osd_airspeed)	 ; ,
	ldi r23,hi8(_ZL12osd_airspeed)	 ; ,
	ldi r24,lo8(_ZL16max_osd_airspeed)	 ; ,
	ldi r25,hi8(_ZL16max_osd_airspeed)	 ; ,
	call _Z8calc_maxRfS_	 ; 
	ldi r22,lo8(_ZL15osd_groundspeed)	 ; ,
	ldi r23,hi8(_ZL15osd_groundspeed)	 ; ,
	ldi r24,lo8(_ZL19max_osd_groundspeed)	 ; ,
	ldi r25,hi8(_ZL19max_osd_groundspeed)	 ; ,
	call _Z8calc_maxRfS_	 ; 
	ldi r22,lo8(_ZL11osd_alt_rel)	 ; ,
	ldi r23,hi8(_ZL11osd_alt_rel)	 ; ,
	ldi r24,lo8(_ZL16max_osd_home_alt)	 ; ,
	ldi r25,hi8(_ZL16max_osd_home_alt)	 ; ,
	call _Z8calc_maxRfS_	 ; 
	ldi r22,lo8(_ZL13osd_windspeed)	 ; ,
	ldi r23,hi8(_ZL13osd_windspeed)	 ; ,
	ldi r24,lo8(_ZL17max_osd_windspeed)	 ; ,
	ldi r25,hi8(_ZL17max_osd_windspeed)	 ; ,
	call _Z8calc_maxRfS_	 ; 
.L87:
/* epilogue start */
	 ; SP += 4	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	pop r7	 ; 
	pop r6	 ; 
	pop r5	 ; 
	pop r4	 ; 
	ret
	.size	_Z12setFdataVarsv, .-_Z12setFdataVarsv
	.section	.text._Z8gps_norml,"ax",@progbits
.global	_Z8gps_norml
	.type	_Z8gps_norml, @function
_Z8gps_norml:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	call __floatsisf	 ; 
	ldi r18,lo8(-128)	 ; ,
	ldi r19,lo8(-106)	 ; ,
	ldi r20,lo8(24)	 ; ,
	ldi r21,lo8(75)	 ; ,
	call __divsf3	 ; 
	ret
	.size	_Z8gps_norml, .-_Z8gps_norml
	.section	.text._Z7set_crch,"ax",@progbits
.global	_Z7set_crch
	.type	_Z7set_crch, @function
_Z7set_crch:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r26,lo8(msg+266)	 ;  tmp51,
	ldi r27,hi8(msg+266)	 ; ,
	ld r30,X	 ;  msg.u.Crc, msg.u.Crc
	eor r24,r30	 ;  D.29398, msg.u.Crc
	mov r30,r24	 ;  D.29399, D.29398
	ldi r31,0	 ;  D.29399
	subi r30,lo8(-(_ZL9crc_table))	 ;  D.29400,
	sbci r31,hi8(-(_ZL9crc_table))	 ;  D.29400,
/* #APP */
 ;  264 "UAVTalk_core.h" 1
	lpm r30, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	st X,r30	 ;  msg.u.Crc, __result
	ret
	.size	_Z7set_crch, .-_Z7set_crch
	.section	.text._Z12uavtalk_readv,"ax",@progbits
.global	_Z12uavtalk_readv
	.type	_Z12uavtalk_readv, @function
_Z12uavtalk_readv:
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	ldi r28,lo8(1)	 ;  tmp61,
	ldi r16,lo8(10)	 ;  tmp62,
	ldi r17,0	 ; 
.L121:
	call _ZN12SingleSerial11available_SEv	 ; 
	tst r24	 ; 
	breq .L118	 ; ,
	call _ZN12SingleSerial6read_SEv	 ; 
	sts msg+267,__zero_reg__	 ;  msg.u.state,
	sts msg+268,__zero_reg__	 ;  msg.u.cnt,
	cpi r24,lo8(60)	 ; ,
	brne .L120	 ; ,
	sts msg+267,r28	 ;  msg.u.state, tmp61
	sts msg+266,__zero_reg__	 ;  MEM[(uint8_t *)&msg + 266B],
	call _Z7set_crch	 ; 
	sts msg+269+1,r17	 ;  msg.u.f_length, tmp62
	sts msg+269,r16	 ;  msg.u.f_length, tmp62
.L120:
	call _ZN12SingleSerial11available_SEv	 ; 
	cpse r24,__zero_reg__	 ; ,
	rjmp .L121	 ; 
	ldi r24,lo8(-86)	 ; ,
	ldi r25,0	 ; 
	call delayMicroseconds	 ; 
	rjmp .L121	 ; 
.L118:
/* epilogue start */
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	ret
	.size	_Z12uavtalk_readv, .-_Z12uavtalk_readv
	.section	.text._Z15mwii_check_modev,"ax",@progbits
.global	_Z15mwii_check_modev
	.type	_Z15mwii_check_modev, @function
_Z15mwii_check_modev:
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	lds r12,msg+143	 ;  D.29420, msg.mwii.sensorActive
	lds r13,msg+143+1	 ;  D.29420, msg.mwii.sensorActive
	lds r14,msg+143+2	 ;  D.29420, msg.mwii.sensorActive
	lds r15,msg+143+3	 ;  D.29420, msg.mwii.sensorActive
	lds r26,_ZL8osd_mode	 ;  osd_mode_lsm.741, osd_mode
	ldi r19,lo8(8)	 ;  D.29417,
	ldi r27,0	 ;  osd_mode_lsm.742
	ldi r24,lo8(_ZL4bits)	 ;  bp,
	ldi r25,hi8(_ZL4bits)	 ;  bp,
.L127:
	movw r30,r24	 ;  D.29418, bp
	adiw r30,1	 ;  D.29418,
/* #APP */
 ;  525 "cleanflight_core.h" 1
	lpm r18, Z	 ;  b
	
 ;  0 "" 2
/* #NOAPP */
	tst r18	 ;  b
	breq .L125	 ; ,
	adiw r30,1	 ;  __addr16,
/* #APP */
 ;  528 "cleanflight_core.h" 1
	lpm r28, Z+	 ;  __result
	lpm r29, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	ld r20,Y	 ;  *v_15, *v_15
	ldd r21,Y+1	 ;  *v_15, *v_15
	ldd r22,Y+2	 ;  *v_15, *v_15
	ldd r23,Y+3	 ;  *v_15, *v_15
	and r20,r12	 ;  D.29420, D.29420
	and r21,r13	 ;  D.29420, D.29420
	and r22,r14	 ;  D.29420, D.29420
	and r23,r15	 ;  D.29420, D.29420
	or r20,r21	 ;  D.29420
	or r20,r22	 ;  D.29420
	or r20,r23	 ;  D.29420
	breq .L126	 ; ,
	ldi r26,lo8(-1)	 ;  osd_mode_lsm.741,
	add r26,r18	 ;  osd_mode_lsm.741, b
	ldi r27,lo8(1)	 ;  osd_mode_lsm.742,
.L126:
	adiw r24,4	 ;  bp,
.L125:
	subi r19,lo8(-(-1))	 ;  D.29417,
	brne .L127	 ; ,
	cpse r27,__zero_reg__	 ;  osd_mode_lsm.742
	sts _ZL8osd_mode,r26	 ;  osd_mode, osd_mode_lsm.741
.L124:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	ret
	.size	_Z15mwii_check_modev, .-_Z15mwii_check_modev
	.section	.text._Z9mwii_readv,"ax",@progbits
.global	_Z9mwii_readv
	.type	_Z9mwii_readv, @function
_Z9mwii_readv:
	push r4	 ; 
	push r5	 ; 
	push r6	 ; 
	push r7	 ; 
	push r8	 ; 
	push r9	 ; 
	push r10	 ; 
	push r11	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 15 */
.L__stack_usage = 15
	sts msg+131,__zero_reg__	 ;  msg.mwii.state,
	ldi r16,lo8(msg+147)	 ;  tmp393,
	ldi r17,hi8(msg+147)	 ; ,
	ldi r18,lo8(32)	 ; ,
	mov r15,r18	 ;  tmp394,
	ldi r19,lo8(5)	 ; ,
	mov r14,r19	 ;  tmp398,
	ldi r20,lo8(4)	 ; ,
	mov r13,r20	 ;  tmp399,
.L174:
	call _ZN12SingleSerial11available_SEv	 ; 
	tst r24	 ; 
	brne .+2	 ; 
	rjmp .L139	 ; 
	call _ZN12SingleSerial6read_SEv	 ; 
	lds r25,msg+131	 ;  D.29478, msg.mwii.state
	cpi r25,lo8(2)	 ;  D.29478,
	breq .L142	 ; ,
	brsh .L143	 ; ,
	tst r25	 ;  D.29478
	breq .L144	 ; ,
	cpi r25,lo8(1)	 ;  D.29478,
	breq .L145	 ; ,
	rjmp .L141	 ; 
.L143:
	cpi r25,lo8(4)	 ;  D.29478,
	breq .L146	 ; ,
	brlo .L147	 ; ,
	cpi r25,lo8(5)	 ;  D.29478,
	breq .L148	 ; ,
	rjmp .L141	 ; 
.L144:
	ldi r25,lo8(1)	 ;  D.29483,
	cpi r24,lo8(36)	 ;  c,
	breq .L149	 ; ,
	ldi r25,0	 ;  D.29483
.L149:
	sts msg+131,r25	 ;  msg.mwii.state, D.29483
	rjmp .L141	 ; 
.L145:
	cpi r24,lo8(77)	 ;  c,
	brne .L185	 ; ,
	ldi r24,lo8(2)	 ;  D.29477,
	rjmp .L151	 ; 
.L142:
	cpi r24,lo8(62)	 ;  c,
	breq .L177	 ; ,
.L185:
	ldi r24,0	 ;  D.29477
	rjmp .L151	 ; 
.L177:
	ldi r24,lo8(3)	 ;  D.29477,
.L151:
	sts msg+131,r24	 ;  msg.mwii.state, D.29477
	rjmp .L141	 ; 
.L147:
	cpi r24,lo8(-127)	 ;  c,
	brlo .+2	 ; 
	rjmp .L154	 ; 
	sts msg+130,r24	 ;  msg.mwii.size, c
	sts msg+131,r13	 ;  msg.mwii.state, tmp399
	sts msg+129,r24	 ;  msg.mwii.crc, c
	rjmp .L141	 ; 
.L146:
	sts msg+131,r14	 ;  msg.mwii.state, tmp398
	sts msg+132,r24	 ;  msg.mwii.cmd, c
	lds r25,msg+129	 ;  msg.mwii.crc, msg.mwii.crc
	eor r24,r25	 ;  D.29478, msg.mwii.crc
	sts msg+129,r24	 ;  msg.mwii.crc, D.29478
	sts msg+128,__zero_reg__	 ;  msg.mwii.idx,
	rjmp .L141	 ; 
.L148:
	lds r25,msg+129	 ;  msg.mwii.crc, msg.mwii.crc
	eor r25,r24	 ;  D.29478, c
	sts msg+129,r25	 ;  msg.mwii.crc, D.29478
	lds r30,msg+128	 ;  D.29478, msg.mwii.idx
	lds r18,msg+130	 ;  msg.mwii.size, msg.mwii.size
	cpse r30,r18	 ;  D.29478, msg.mwii.size
	rjmp .L153	 ; 
	cpse r25,__zero_reg__	 ;  D.29478,
	rjmp .L154	 ; 
	sts msg+133,__zero_reg__	 ;  msg.mwii.read_idx,
	lds r24,lflags+1	 ;  lflags.mwii_active, lflags.mwii_active
	ori r24,lo8(1<<4)	 ;  lflags.mwii_active,
	sts lflags+1,r24	 ;  lflags.mwii_active, lflags.mwii_active
	lds r24,lflags	 ;  lflags.got_data, lflags.got_data
	ori r24,lo8(1<<2)	 ;  lflags.got_data,
	sts lflags,r24	 ;  lflags.got_data, lflags.got_data
	ldi r22,0	 ; 
	ldi r23,0	 ; 
	ldi r24,lo8(_ZL11lastMAVBeat)	 ; ,
	ldi r25,hi8(_ZL11lastMAVBeat)	 ; ,
	call _Z11millis_plusPmj	 ; 
	lds r30,msg+132	 ;  msg.mwii.cmd, msg.mwii.cmd
	mov r24,r30	 ;  msg.mwii.cmd, msg.mwii.cmd
	ldi r25,0	 ;  msg.mwii.cmd
	movw r30,r24	 ;  tmp218,
	subi r30,100	 ;  tmp218,
	sbc r31,__zero_reg__	 ; 
	cpi r30,20	 ;  tmp218,
	cpc r31,__zero_reg__	 ; 
	brlo .+2	 ; 
	rjmp .L154	 ; 
	subi r30,lo8(-(gs(.L156)))	 ;  tmp218,
	sbci r31,hi8(-(gs(.L156)))	 ;  tmp218,
	jmp __tablejump2__
	.section	.progmem.gcc_sw_table._Z9mwii_readv,"a",@progbits
	.p2align	1
.L156:
	.word gs(.L155)
	.word gs(.L157)
	.word gs(.L154)
	.word gs(.L154)
	.word gs(.L154)
	.word gs(.L158)
	.word gs(.L159)
	.word gs(.L160)
	.word gs(.L161)
	.word gs(.L162)
	.word gs(.L163)
	.word gs(.L164)
	.word gs(.L165)
	.word gs(.L154)
	.word gs(.L154)
	.word gs(.L154)
	.word gs(.L154)
	.word gs(.L154)
	.word gs(.L154)
	.word gs(.L166)
	.section	.text._Z9mwii_readv
.L155:
	lds r30,msg+133	 ;  D.29478, msg.mwii.read_idx
	ldi r24,lo8(1)	 ;  D.29478,
	add r24,r30	 ;  D.29478, D.29478
	sts msg+133,r24	 ;  msg.mwii.read_idx, D.29478
	ldi r31,0	 ;  D.29479
	subi r30,lo8(-(msg))	 ;  tmp226,
	sbci r31,hi8(-(msg))	 ;  tmp226,
	ld r24,Z	 ;  tmp227, msg.mwii.buf
	sts _ZL14apm_mav_system,r24	 ;  apm_mav_system, tmp227
	lds r24,msg+135	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	lds r25,msg+135+1	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	lds r26,msg+135+2	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	lds r27,msg+135+3	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	andi r24,254	 ;  D.29481,
	rjmp .L183	 ; 
.L157:
	lds r30,msg+133	 ;  msg.mwii.read_idx, msg.mwii.read_idx
	ldi r31,0	 ;  D.29479
	subi r30,lo8(-(msg))	 ;  tmp239,
	sbci r31,hi8(-(msg))	 ;  tmp239,
	ldd r20,Z+6	 ;  D.29481, MEM[(char * {ref-all})_49 + 6B]
	ldd r21,Z+7	 ;  D.29481, MEM[(char * {ref-all})_49 + 6B]
	ldd r22,Z+8	 ;  D.29481, MEM[(char * {ref-all})_49 + 6B]
	ldd r23,Z+9	 ;  D.29481, MEM[(char * {ref-all})_49 + 6B]
	sts msg+143,r20	 ;  msg.mwii.sensorActive, D.29481
	sts msg+143+1,r21	 ;  msg.mwii.sensorActive, D.29481
	sts msg+143+2,r22	 ;  msg.mwii.sensorActive, D.29481
	sts msg+143+3,r23	 ;  msg.mwii.sensorActive, D.29481
	lds r24,msg+147	 ;  msg.mwii.mode.armed, msg.mwii.mode.armed
	lds r25,msg+147+1	 ;  msg.mwii.mode.armed, msg.mwii.mode.armed
	lds r26,msg+147+2	 ;  msg.mwii.mode.armed, msg.mwii.mode.armed
	lds r27,msg+147+3	 ;  msg.mwii.mode.armed, msg.mwii.mode.armed
	and r24,r20	 ;  D.29481, D.29481
	and r25,r21	 ;  D.29481, D.29481
	and r26,r22	 ;  D.29481, D.29481
	and r27,r23	 ;  D.29481, D.29481
	ldi r18,lo8(1)	 ;  D.29483,
	or r24,r25	 ;  D.29481
	or r24,r26	 ;  D.29481
	or r24,r27	 ;  D.29481
	brne .L167	 ; ,
	ldi r18,0	 ;  D.29483
.L167:
	lds r24,lflags	 ;  lflags.motor_armed, lflags.motor_armed
	bst r18,0	 ;  D.29483
	bld r24,6	 ;  lflags.motor_armed,
	sts lflags,r24	 ;  lflags.motor_armed, lflags.motor_armed
	rjmp .L154	 ; 
.L158:
	lds r30,msg+133	 ;  msg.mwii.read_idx, msg.mwii.read_idx
	ldi r31,0	 ;  D.29479
	subi r30,lo8(-(msg))	 ;  tmp255,
	sbci r31,hi8(-(msg))	 ;  tmp255,
	ldi r24,lo8(16)	 ;  tmp256,
	ldi r26,lo8(_ZL8chan_raw)	 ; ,
	ldi r27,hi8(_ZL8chan_raw)	 ; ,
	rjmp .L184	 ; 
.L159:
	lds r28,msg+133	 ;  msg.mwii.read_idx, msg.mwii.read_idx
	ldi r29,0	 ;  D.29479
	subi r28,lo8(-(msg))	 ;  tmp261,
	sbci r29,hi8(-(msg))	 ;  tmp261,
	ld r24,Y	 ;  tmp262, msg.mwii.buf
	sts _ZL12osd_fix_type,r24	 ;  osd_fix_type, tmp262
	ldd r24,Y+1	 ;  tmp266, msg.mwii.buf
	sts _ZL22osd_satellites_visible,r24	 ;  osd_satellites_visible, tmp266
	ldd r22,Y+2	 ; , MEM[(char * {ref-all})_61 + 2B]
	ldd r23,Y+3	 ; , MEM[(char * {ref-all})_61 + 2B]
	ldd r24,Y+4	 ; , MEM[(char * {ref-all})_61 + 2B]
	ldd r25,Y+5	 ; , MEM[(char * {ref-all})_61 + 2B]
	call __floatunsisf	 ; 
	sts osd_pos,r22	 ;  osd_pos.lat, tmp268
	sts osd_pos+1,r23	 ;  osd_pos.lat, tmp268
	sts osd_pos+2,r24	 ;  osd_pos.lat, tmp268
	sts osd_pos+3,r25	 ;  osd_pos.lat, tmp268
	ldd r22,Y+6	 ; , MEM[(char * {ref-all})_61 + 6B]
	ldd r23,Y+7	 ; , MEM[(char * {ref-all})_61 + 6B]
	ldd r24,Y+8	 ; , MEM[(char * {ref-all})_61 + 6B]
	ldd r25,Y+9	 ; , MEM[(char * {ref-all})_61 + 6B]
	call __floatunsisf	 ; 
	sts osd_pos+4,r22	 ;  osd_pos.lon, tmp270
	sts osd_pos+4+1,r23	 ;  osd_pos.lon, tmp270
	sts osd_pos+4+2,r24	 ;  osd_pos.lon, tmp270
	sts osd_pos+4+3,r25	 ;  osd_pos.lon, tmp270
	ldd r24,Y+10	 ;  MEM[(char * {ref-all})_61 + 10B], MEM[(char * {ref-all})_61 + 10B]
	ldd r25,Y+11	 ;  MEM[(char * {ref-all})_61 + 10B], MEM[(char * {ref-all})_61 + 10B]
	ldi r26,0	 ;  MEM[(char * {ref-all})_61 + 10B]
	ldi r27,0	 ;  MEM[(char * {ref-all})_61 + 10B]
	sts _ZL11osd_alt_gps,r24	 ;  osd_alt_gps, MEM[(char * {ref-all})_61 + 10B]
	sts _ZL11osd_alt_gps+1,r25	 ;  osd_alt_gps, MEM[(char * {ref-all})_61 + 10B]
	sts _ZL11osd_alt_gps+2,r26	 ;  osd_alt_gps, MEM[(char * {ref-all})_61 + 10B]
	sts _ZL11osd_alt_gps+3,r27	 ;  osd_alt_gps, MEM[(char * {ref-all})_61 + 10B]
	ldd r22,Y+12	 ;  MEM[(char * {ref-all})_61 + 12B], MEM[(char * {ref-all})_61 + 12B]
	ldd r23,Y+13	 ;  MEM[(char * {ref-all})_61 + 12B], MEM[(char * {ref-all})_61 + 12B]
	ldi r24,0	 ;  MEM[(char * {ref-all})_61 + 12B]
	ldi r25,0	 ;  MEM[(char * {ref-all})_61 + 12B]
	call __floatunsisf	 ; 
	sts _ZL15osd_groundspeed,r22	 ;  osd_groundspeed, tmp275
	sts _ZL15osd_groundspeed+1,r23	 ;  osd_groundspeed, tmp275
	sts _ZL15osd_groundspeed+2,r24	 ;  osd_groundspeed, tmp275
	sts _ZL15osd_groundspeed+3,r25	 ;  osd_groundspeed, tmp275
	ldd r24,Y+14	 ;  MEM[(char * {ref-all})_61 + 14B], MEM[(char * {ref-all})_61 + 14B]
	ldd r25,Y+15	 ;  MEM[(char * {ref-all})_61 + 14B], MEM[(char * {ref-all})_61 + 14B]
	sts _ZL7osd_cog+1,r25	 ;  osd_cog, MEM[(char * {ref-all})_61 + 14B]
	sts _ZL7osd_cog,r24	 ;  osd_cog, MEM[(char * {ref-all})_61 + 14B]
	rjmp .L154	 ; 
.L160:
	lds r30,msg+133	 ;  msg.mwii.read_idx, msg.mwii.read_idx
	ldi r31,0	 ;  D.29479
	subi r30,lo8(-(msg))	 ;  D.29482,
	sbci r31,hi8(-(msg))	 ;  D.29482,
	ld r24,Z	 ;  MEM[(char * {ref-all})_73], MEM[(char * {ref-all})_73]
	ldd r25,Z+1	 ;  MEM[(char * {ref-all})_73], MEM[(char * {ref-all})_73]
	ldi r26,0	 ;  MEM[(char * {ref-all})_73]
	ldi r27,0	 ;  MEM[(char * {ref-all})_73]
	sts _ZL17osd_home_distance,r24	 ;  osd_home_distance, MEM[(char * {ref-all})_73]
	sts _ZL17osd_home_distance+1,r25	 ;  osd_home_distance, MEM[(char * {ref-all})_73]
	sts _ZL17osd_home_distance+2,r26	 ;  osd_home_distance, MEM[(char * {ref-all})_73]
	sts _ZL17osd_home_distance+3,r27	 ;  osd_home_distance, MEM[(char * {ref-all})_73]
	ldd r24,Z+2	 ; , MEM[(char * {ref-all})_73 + 2B]
	ldd r25,Z+3	 ; , MEM[(char * {ref-all})_73 + 2B]
	call _Z12grad_to_secti	 ; 
	sts _ZL18osd_home_direction,r24	 ;  osd_home_direction,
	rjmp .L154	 ; 
.L161:
	lds r30,msg+133	 ;  msg.mwii.read_idx, msg.mwii.read_idx
	ldi r31,0	 ;  D.29479
	subi r30,lo8(-(msg))	 ;  D.29482,
	sbci r31,hi8(-(msg))	 ;  D.29482,
	ldd r24,Z+4	 ;  MEM[(char * {ref-all})_82 + 4B], MEM[(char * {ref-all})_82 + 4B]
	ldd r25,Z+5	 ;  MEM[(char * {ref-all})_82 + 4B], MEM[(char * {ref-all})_82 + 4B]
	sts _ZL11osd_heading+1,r25	 ;  osd_heading, MEM[(char * {ref-all})_82 + 4B]
	sts _ZL11osd_heading,r24	 ;  osd_heading, MEM[(char * {ref-all})_82 + 4B]
	ldi r24,lo8(6)	 ;  tmp290,
	ldi r26,lo8(osd_att)	 ; ,
	ldi r27,hi8(osd_att)	 ; ,
.L184:
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r24	 ;  tmp290
	brne 0b
	rjmp .L154	 ; 
.L162:
	lds r28,msg+133	 ;  msg.mwii.read_idx, msg.mwii.read_idx
	ldi r29,0	 ;  D.29479
	subi r28,lo8(-(msg))	 ;  D.29482,
	sbci r29,hi8(-(msg))	 ;  D.29482,
	ld r22,Y	 ; , MEM[(char * {ref-all})_87]
	ldd r23,Y+1	 ; , MEM[(char * {ref-all})_87]
	ldd r24,Y+2	 ; , MEM[(char * {ref-all})_87]
	ldd r25,Y+3	 ; , MEM[(char * {ref-all})_87]
	call __floatunsisf	 ; 
	sts _ZL11osd_alt_rel,r22	 ;  osd_alt_rel, tmp295
	sts _ZL11osd_alt_rel+1,r23	 ;  osd_alt_rel, tmp295
	sts _ZL11osd_alt_rel+2,r24	 ;  osd_alt_rel, tmp295
	sts _ZL11osd_alt_rel+3,r25	 ;  osd_alt_rel, tmp295
	ldd r22,Y+4	 ;  MEM[(char * {ref-all})_87 + 4B], MEM[(char * {ref-all})_87 + 4B]
	ldd r23,Y+5	 ;  MEM[(char * {ref-all})_87 + 4B], MEM[(char * {ref-all})_87 + 4B]
	ldi r24,0	 ;  MEM[(char * {ref-all})_87 + 4B]
	ldi r25,0	 ;  MEM[(char * {ref-all})_87 + 4B]
	call __floatunsisf	 ; 
	sts _ZL9osd_climb,r22	 ;  osd_climb, tmp298
	sts _ZL9osd_climb+1,r23	 ;  osd_climb, tmp298
	sts _ZL9osd_climb+2,r24	 ;  osd_climb, tmp298
	sts _ZL9osd_climb+3,r25	 ;  osd_climb, tmp298
	rjmp .L154	 ; 
.L163:
	lds r24,flags	 ;  flags, flags
	lds r30,msg+133	 ;  msg.mwii.read_idx, msg.mwii.read_idx
	sbrc r24,4	 ;  flags,
	rjmp .L168	 ; 
	mov r26,r30	 ;  D.29479, msg.mwii.read_idx
	ldi r27,0	 ;  D.29479
	subi r26,lo8(-(msg))	 ;  D.29482,
	sbci r27,hi8(-(msg))	 ;  D.29482,
	ld r18,X+	 ;  MEM[(char * {ref-all})_95]
	ld r19,X	 ;  MEM[(char * {ref-all})_95]
	sbiw r26,1
	sts _ZL10osd_vbat_A+1,r19	 ;  osd_vbat_A, MEM[(char * {ref-all})_95]
	sts _ZL10osd_vbat_A,r18	 ;  osd_vbat_A, MEM[(char * {ref-all})_95]
	adiw r26,1	 ;  MEM[(char * {ref-all})_95 + 1B]
	ld r25,X	 ;  MEM[(char * {ref-all})_95 + 1B]
	sts _ZL23osd_battery_remaining_A,r25	 ;  osd_battery_remaining_A, MEM[(char * {ref-all})_95 + 1B]
.L168:
	sbrc r24,6	 ;  flags,
	rjmp .L169	 ; 
	mov r26,r30	 ;  D.29479, msg.mwii.read_idx
	ldi r27,0	 ;  D.29479
	subi r26,lo8(-(msg))	 ;  tmp320,
	sbci r27,hi8(-(msg))	 ;  tmp320,
	adiw r26,5	 ;  MEM[(char * {ref-all})_102 + 5B]
	ld r24,X+	 ;  MEM[(char * {ref-all})_102 + 5B]
	ld r25,X	 ;  MEM[(char * {ref-all})_102 + 5B]
	sbiw r26,5+1	 ;  MEM[(char * {ref-all})_102 + 5B]
	sts _ZL10osd_curr_A+1,r25	 ;  osd_curr_A, MEM[(char * {ref-all})_102 + 5B]
	sts _ZL10osd_curr_A,r24	 ;  osd_curr_A, MEM[(char * {ref-all})_102 + 5B]
.L169:
	ldi r31,0	 ;  D.29479
	subi r30,lo8(-(msg))	 ;  tmp327,
	sbci r31,hi8(-(msg))	 ;  tmp327,
	ldd r24,Z+3	 ;  MEM[(char * {ref-all})_107 + 3B], MEM[(char * {ref-all})_107 + 3B]
	sts _ZL8osd_rssi,r24	 ;  osd_rssi, MEM[(char * {ref-all})_107 + 3B]
	rjmp .L154	 ; 
.L164:
	lds r24,msg+135	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	lds r25,msg+135+1	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	lds r26,msg+135+2	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	lds r27,msg+135+3	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	andi r25,253	 ;  D.29481,
	rjmp .L183	 ; 
.L165:
	lds r24,msg+135	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	lds r25,msg+135+1	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	lds r26,msg+135+2	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	lds r27,msg+135+3	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	andi r25,251	 ;  D.29481,
	rjmp .L183	 ; 
.L166:
	lds r18,msg+130	 ;  remaining, msg.mwii.size
	movw r30,r16	 ; , tmp393
	mov r19,r15	 ; , tmp394
	0:
	st Z+,__zero_reg__	 ; 
	dec r19	 ; 
	brne 0b
	mov r8,__zero_reg__	 ;  bit
	mov r9,__zero_reg__	 ;  bit
	movw r10,r8	 ;  bit
	inc r8	 ;  bit
.L173:
	tst r18	 ;  remaining
	breq .L170	 ; ,
	lds r30,msg+133	 ;  D.29478, msg.mwii.read_idx
	ldi r24,lo8(1)	 ;  D.29478,
	add r24,r30	 ;  D.29478, D.29478
	sts msg+133,r24	 ;  msg.mwii.read_idx, D.29478
	ldi r31,0	 ;  D.29479
	subi r30,lo8(-(msg))	 ;  tmp353,
	sbci r31,hi8(-(msg))	 ;  tmp353,
	ld r20,Z	 ;  D.29480, msg.mwii.buf
	ldi r24,lo8(_ZL4bits)	 ;  bp,
	ldi r25,hi8(_ZL4bits)	 ;  bp,
	mov __tmp_reg__,r20	 ; 
	lsl r0	 ; 
	sbc r21,r21	 ; 
.L172:
	movw r30,r24	 ; , bp
/* #APP */
 ;  775 "cleanflight_core.h" 1
	lpm r22, Z	 ;  b
	
 ;  0 "" 2
/* #NOAPP */
	ldi r23,0	 ;  D.29479
	cp r20,r22	 ;  D.29479, D.29479
	cpc r21,r23	 ;  D.29479, D.29479
	brne .L171	 ; ,
	adiw r30,2	 ;  D.29487,
/* #APP */
 ;  778 "cleanflight_core.h" 1
	lpm r26, Z+	 ;  __result
	lpm r27, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	ld r4,X+	 ;  *v_129
	ld r5,X+	 ;  *v_129
	ld r6,X+	 ;  *v_129
	ld r7,X	 ;  *v_129
	sbiw r26,3
	or r4,r8	 ;  D.29481, bit
	or r5,r9	 ;  D.29481, bit
	or r6,r10	 ;  D.29481, bit
	or r7,r11	 ;  D.29481, bit
	st X+,r4	 ;  *v_129, D.29481
	st X+,r5	 ;  *v_129, D.29481
	st X+,r6	 ;  *v_129, D.29481
	st X,r7	 ;  *v_129, D.29481
	sbiw r26,3
.L171:
	adiw r24,4	 ;  bp,
	ldi r31,hi8(_ZL4bits+32)	 ; ,
	cpi r24,lo8(_ZL4bits+32)	 ;  bp,
	cpc r25,r31	 ;  bp,
	brne .L172	 ; ,
	lsl r8	 ;  bit
	rol r9	 ;  bit
	rol r10	 ;  bit
	rol r11	 ;  bit
	subi r18,lo8(-(-1))	 ;  remaining,
	rjmp .L173	 ; 
.L170:
	lds r24,msg+135	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	lds r25,msg+135+1	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	lds r26,msg+135+2	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	lds r27,msg+135+3	 ;  msg.mwii.modeMSPRequests, msg.mwii.modeMSPRequests
	andi r25,247	 ;  D.29481,
.L183:
	sts msg+135,r24	 ;  msg.mwii.modeMSPRequests, D.29481
	sts msg+135+1,r25	 ;  msg.mwii.modeMSPRequests, D.29481
	sts msg+135+2,r26	 ;  msg.mwii.modeMSPRequests, D.29481
	sts msg+135+3,r27	 ;  msg.mwii.modeMSPRequests, D.29481
.L154:
	sts msg+131,__zero_reg__	 ;  msg.mwii.state,
	rjmp .L141	 ; 
.L153:
	ldi r25,lo8(1)	 ;  D.29478,
	add r25,r30	 ;  D.29478, D.29478
	sts msg+128,r25	 ;  msg.mwii.idx, D.29478
	ldi r31,0	 ;  D.29479
	subi r30,lo8(-(msg))	 ;  tmp375,
	sbci r31,hi8(-(msg))	 ;  tmp375,
	st Z,r24	 ;  msg.mwii.buf, c
.L141:
	call _ZN12SingleSerial11available_SEv	 ; 
	cpse r24,__zero_reg__	 ; ,
	rjmp .L174	 ; 
	ldi r24,lo8(-86)	 ; ,
	ldi r25,0	 ; 
	call delayMicroseconds	 ; 
	rjmp .L174	 ; 
.L139:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	pop r7	 ; 
	pop r6	 ; 
	pop r5	 ; 
	pop r4	 ; 
	ret
	.size	_Z9mwii_readv, .-_Z9mwii_readv
	.section	.text._Z15eeprom_read_lenPhjj,"ax",@progbits
.global	_Z15eeprom_read_lenPhjj
	.type	_Z15eeprom_read_lenPhjj, @function
_Z15eeprom_read_lenPhjj:
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r14,r24	 ;  D.29514, p
	add r14,r20	 ;  D.29514, l
	adc r15,r21	 ;  D.29514, l
	movw r28,r24	 ;  ivtmp.779, p
	movw r16,r22	 ;  D.29514, e
	sub r16,r24	 ;  D.29514, ivtmp.779
	sbc r17,r25	 ;  D.29514, ivtmp.779
.L188:
	cp r28,r14	 ;  ivtmp.779, D.29514
	cpc r29,r15	 ;  ivtmp.779, D.29514
	breq .L186	 ; ,
	movw r24,r16	 ; , D.29514
	add r24,r28	 ; , ivtmp.779
	adc r25,r29	 ; , ivtmp.779
	call eeprom_read_byte	 ; 
	st Y+,r24	 ;  MEM[base: _24, offset: 0B],
	rjmp .L188	 ; 
.L186:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	ret
	.size	_Z15eeprom_read_lenPhjj, .-_Z15eeprom_read_lenPhjj
	.section	.text._Z16eeprom_write_lenPhjj,"ax",@progbits
.global	_Z16eeprom_write_lenPhjj
	.type	_Z16eeprom_write_lenPhjj, @function
_Z16eeprom_write_lenPhjj:
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r28,r22	 ;  e, e
	movw r14,r24	 ;  ivtmp.799, p
	movw r16,r22	 ;  D.29539, e
	add r16,r20	 ;  D.29539, l
	adc r17,r21	 ;  D.29539, l
.L191:
	cp r28,r16	 ;  e, D.29539
	cpc r29,r17	 ;  e, D.29539
	breq .L189	 ; ,
	movw r30,r14	 ; , ivtmp.799
	ld r22,Z+	 ;  D.29537, MEM[base: _19, offset: 0B]
	movw r14,r30	 ;  ivtmp.799,
	movw r24,r28	 ; , e
	call eeprom_write_byte	 ; 
	adiw r28,1	 ;  e,
	rjmp .L191	 ; 
.L189:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	ret
	.size	_Z16eeprom_write_lenPhjj, .-_Z16eeprom_write_lenPhjj
	.section	.text._Z12readSettingsv,"ax",@progbits
.global	_Z12readSettingsv
	.type	_Z12readSettingsv, @function
_Z12readSettingsv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r20,lo8(2)	 ; ,
	ldi r21,0	 ; 
	ldi r22,0	 ; 
	ldi r23,lo8(2)	 ; ,
	ldi r24,lo8(flags)	 ; ,
	ldi r25,hi8(flags)	 ; ,
	call _Z15eeprom_read_lenPhjj	 ; 
	ldi r20,lo8(72)	 ; ,
	ldi r21,0	 ; 
	ldi r22,lo8(4)	 ; ,
	ldi r23,lo8(2)	 ; ,
	ldi r24,lo8(sets)	 ; ,
	ldi r25,hi8(sets)	 ; ,
	call _Z15eeprom_read_lenPhjj	 ; 
	lds r24,flags	 ;  flags, flags
	sbrc r24,1	 ;  flags,
	rjmp .L194	 ; 
	ldi r24,lo8(_ZL4metr)	 ;  D.29543,
	ldi r25,hi8(_ZL4metr)	 ;  D.29543,
	rjmp .L193	 ; 
.L194:
	ldi r24,lo8(_ZL5imper)	 ;  D.29543,
	ldi r25,hi8(_ZL5imper)	 ;  D.29543,
.L193:
	sts _ZL7measure+1,r25	 ;  measure, D.29543
	sts _ZL7measure,r24	 ;  measure, D.29543
	ret
	.size	_Z12readSettingsv, .-_Z12readSettingsv
	.section	.text._Z17readPanelSettingsv,"ax",@progbits
.global	_Z17readPanelSettingsv
	.type	_Z17readPanelSettingsv, @function
_Z17readPanelSettingsv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r22,_ZL6panelN	 ;  D.29547, panelN
	lds r24,_ZZ17readPanelSettingsvE12currentPanel	 ;  currentPanel, currentPanel
	cp r22,r24	 ;  D.29547, currentPanel
	breq .L195	 ; ,
	cpi r22,lo8(4)	 ;  D.29547,
	brsh .L195	 ; ,
	sts _ZZ17readPanelSettingsvE12currentPanel,r22	 ;  currentPanel, D.29547
	ldi r24,lo8(-128)	 ; ,
	mul r22,r24	 ;  D.29547,
	movw r22,r0	 ;  D.29548
	clr __zero_reg__
	ldi r20,lo8(76)	 ; ,
	ldi r21,0	 ; 
	ldi r24,lo8(panel)	 ; ,
	ldi r25,hi8(panel)	 ; ,
	jmp _Z15eeprom_read_lenPhjj	 ; 
.L195:
	ret
	.size	_Z17readPanelSettingsv, .-_Z17readPanelSettingsv
	.section	.text._Z10pan_togglev,"ax",@progbits
.global	_Z10pan_togglev
	.type	_Z10pan_togglev, @function
_Z10pan_togglev:
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	lds r30,sets+1	 ;  D.29552, sets.ch_toggle
	tst r30	 ;  D.29552
	brne .+2	 ; 
	rjmp .L197	 ; 
	lds r28,_ZL6panelN	 ;  old_panel, panelN
	cpi r30,lo8(1)	 ;  D.29552,
	brne .L200	 ; ,
	lds r24,PWM_IN	 ;  ch_raw, PWM_IN
	lds r25,PWM_IN+1	 ;  ch_raw, PWM_IN
	rjmp .L201	 ; 
.L200:
	ldi r24,lo8(-5)	 ;  D.29552,
	add r24,r30	 ;  D.29552, D.29552
	cpi r24,lo8(4)	 ;  D.29552,
	brsh .L202	 ; ,
	ldi r31,0	 ;  D.29553
	lsl r30	 ;  tmp77
	rol r31	 ;  tmp77
	subi r30,lo8(-(_ZL8chan_raw-2))	 ;  tmp78,
	sbci r31,hi8(-(_ZL8chan_raw-2))	 ;  tmp78,
	ld r24,Z	 ;  ch_raw, chan_raw
	ldd r25,Z+1	 ;  ch_raw, chan_raw
	rjmp .L201	 ; 
.L202:
	lds r24,_ZL8chan_raw+14	 ;  ch_raw, chan_raw
	lds r25,_ZL8chan_raw+14+1	 ;  ch_raw, chan_raw
	cpi r30,lo8(4)	 ;  D.29552,
	brne .L201	 ; ,
	lds r24,_ZL8osd_mode	 ;  D.29552, osd_mode
	ldi r25,lo8(-6)	 ;  D.29552,
	add r25,r24	 ;  D.29552, D.29552
	cpi r25,lo8(2)	 ;  D.29552,
	brsh .+2	 ; 
	rjmp .L204	 ; 
	lds r25,_ZL14osd_off_switch	 ;  osd_off_switch, osd_off_switch
	cp r24,r25	 ;  D.29552, osd_off_switch
	breq .L206	 ; ,
	sts _ZL14osd_off_switch,r24	 ;  osd_off_switch, D.29552
	ldi r22,0	 ; 
	ldi r23,0	 ; 
	ldi r24,lo8(_ZL15osd_switch_time)	 ; ,
	ldi r25,hi8(_ZL15osd_switch_time)	 ; ,
	call _Z11millis_plusPmj	 ; 
	lds r25,_ZL14osd_off_switch	 ;  osd_off_switch, osd_off_switch
	lds r24,_ZL15osd_switch_last	 ;  osd_switch_last, osd_switch_last
	cpse r25,r24	 ;  osd_off_switch, osd_switch_last
	rjmp .L206	 ; 
	lds r24,lflags	 ;  lflags.rotatePanel, lflags.rotatePanel
	ori r24,lo8(1<<4)	 ;  lflags.rotatePanel,
	sts lflags,r24	 ;  lflags.rotatePanel, lflags.rotatePanel
.L206:
	call millis	 ; 
	lds r16,_ZL15osd_switch_time	 ;  osd_switch_time, osd_switch_time
	lds r17,_ZL15osd_switch_time+1	 ;  osd_switch_time, osd_switch_time
	lds r18,_ZL15osd_switch_time+2	 ;  osd_switch_time, osd_switch_time
	lds r19,_ZL15osd_switch_time+3	 ;  osd_switch_time, osd_switch_time
	movw r26,r24	 ;  D.29554, D.29554
	movw r24,r22	 ;  D.29554, D.29554
	sub r24,r16	 ;  D.29554, osd_switch_time
	sbc r25,r17	 ;  D.29554, osd_switch_time
	sbc r26,r18	 ;  D.29554, osd_switch_time
	sbc r27,r19	 ;  D.29554, osd_switch_time
	cpi r24,-47	 ;  D.29554,
	sbci r25,7	 ;  D.29554,
	cpc r26,__zero_reg__	 ;  D.29554
	cpc r27,__zero_reg__	 ;  D.29554
	brlo .L204	 ; ,
	lds r24,_ZL8osd_mode	 ;  osd_mode, osd_mode
	sts _ZL15osd_switch_last,r24	 ;  osd_switch_last, osd_mode
	rjmp .L204	 ; 
.L201:
	lds r18,sets+6	 ;  sets.switch_mode, sets.switch_mode
	cpse r18,__zero_reg__	 ;  sets.switch_mode,
	rjmp .L209	 ; 
	lds r22,sets+67	 ;  D.29552, sets.n_screens
	cpi r24,77	 ;  ch_raw,
	ldi r18,4	 ; ,
	cpc r25,r18	 ;  ch_raw,
	brlo .L215	 ; ,
	movw r18,r24	 ;  D.29555, ch_raw
	subi r18,76	 ;  D.29555,
	sbci r19,4	 ;  D.29555,
	ldi r23,0	 ;  D.29553
	ldi r24,lo8(32)	 ; ,
	ldi r25,lo8(3)	 ; ,
	call __divmodhi4
	movw r24,r18	 ; , D.29555
	call __udivmodhi4
	rjmp .L210	 ; 
.L215:
	ldi r22,0	 ;  n
.L210:
	cp r22,r28	 ;  n, old_panel
	breq .L204	 ; ,
	sts _ZL6panelN,r22	 ;  panelN, n
	rjmp .L204	 ; 
.L209:
	cpi r24,-79	 ;  ch_raw,
	sbci r25,4	 ;  ch_raw,
	brlo .L204	 ; ,
	call millis	 ; 
	lds r16,_ZL15osd_switch_time	 ;  osd_switch_time, osd_switch_time
	lds r17,_ZL15osd_switch_time+1	 ;  osd_switch_time, osd_switch_time
	lds r18,_ZL15osd_switch_time+2	 ;  osd_switch_time, osd_switch_time
	lds r19,_ZL15osd_switch_time+3	 ;  osd_switch_time, osd_switch_time
	cp r16,r22	 ;  osd_switch_time, D.29554
	cpc r17,r23	 ;  osd_switch_time, D.29554
	cpc r18,r24	 ;  osd_switch_time, D.29554
	cpc r19,r25	 ;  osd_switch_time, D.29554
	brsh .L204	 ; ,
	lds r24,lflags	 ;  lflags.rotatePanel, lflags.rotatePanel
	ori r24,lo8(1<<4)	 ;  lflags.rotatePanel,
	sts lflags,r24	 ;  lflags.rotatePanel, lflags.rotatePanel
	ldi r22,lo8(-12)	 ; ,
	ldi r23,lo8(1)	 ; ,
	ldi r24,lo8(_ZL15osd_switch_time)	 ; ,
	ldi r25,hi8(_ZL15osd_switch_time)	 ; ,
	call _Z11millis_plusPmj	 ; 
.L204:
	lds r24,lflags	 ;  lflags, lflags
	sbrs r24,4	 ;  lflags,
	rjmp .L212	 ; 
	andi r24,lo8(~(1<<4))	 ;  lflags.rotatePanel,
	sts lflags,r24	 ;  lflags.rotatePanel, lflags.rotatePanel
	lds r24,_ZL6panelN	 ;  panelN, panelN
	subi r24,lo8(-(1))	 ;  D.29552,
	sts _ZL6panelN,r24	 ;  panelN, D.29552
	lds r25,sets+67	 ;  sets.n_screens, sets.n_screens
	cp r25,r24	 ;  sets.n_screens, D.29552
	brsh .L212	 ; ,
	sts _ZL6panelN,__zero_reg__	 ;  panelN,
.L212:
	lds r24,_ZL6panelN	 ;  panelN, panelN
	cp r28,r24	 ;  old_panel, panelN
	breq .L197	 ; ,
	call _Z17readPanelSettingsv	 ; 
	lds r24,lflags	 ;  lflags.got_data, lflags.got_data
	ori r24,lo8(1<<2)	 ;  lflags.got_data,
	sts lflags,r24	 ;  lflags.got_data, lflags.got_data
.L197:
/* epilogue start */
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	ret
	.size	_Z10pan_togglev, .-_Z10pan_togglev
	.section	.text._Z8checkPALh,"ax",@progbits
.global	_Z8checkPALh
	.type	_Z8checkPALh, @function
_Z8checkPALh:
	push r28	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24	 ;  line, line
	lds r24,_ZN3OSD12video_centerE	 ;  video_center, video_center
	cp r28,r24	 ;  line, video_center
	brlo .L220	 ; ,
	call _ZN3OSD7getModeEv	 ; 
	cpse r24,__zero_reg__	 ; ,
	rjmp .L220	 ; 
	subi r28,lo8(-(-3))	 ;  line,
.L220:
	mov r24,r28	 ; , line
/* epilogue start */
	pop r28	 ; 
	ret
	.size	_Z8checkPALh, .-_Z8checkPALh
	.section	.text._Z12osd_setPanel5Point,"ax",@progbits
.global	_Z12osd_setPanel5Point
	.type	_Z12osd_setPanel5Point, @function
_Z12osd_setPanel5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r22,r25	 ; , p
	jmp _ZN3OSD8setPanelEhh	 ; 
	.size	_Z12osd_setPanel5Point, .-_Z12osd_setPanel5Point
	.section	.text._Z16print_all_panelsv,"ax",@progbits
.global	_Z16print_all_panelsv
	.type	_Z16print_all_panelsv, @function
_Z16print_all_panelsv:
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	ldi r28,lo8(_ZL11panels_list)	 ;  pl,
	ldi r29,hi8(_ZL11panels_list)	 ;  pl,
.L225:
	movw r30,r28	 ; , pl
/* #APP */
 ;  69 "Panels.h" 1
	lpm r24, Z	 ;  n
	
 ;  0 "" 2
/* #NOAPP */
	adiw r30,1	 ;  D.29575,
/* #APP */
 ;  70 "Panels.h" 1
	lpm r14, Z+	 ;  __result
	lpm r15, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	cp r14,__zero_reg__	 ;  __result
	cpc r15,__zero_reg__	 ;  __result
	breq .L222	 ; ,
	mov r30,r24	 ;  n, n
	ldi r31,0	 ;  n
	lsl r30	 ;  D.29572
	rol r31	 ;  D.29572
	subi r30,lo8(-(panel))	 ;  D.29573,
	sbci r31,hi8(-(panel))	 ;  D.29573,
	ld r16,Z	 ;  p, *_16
	ldd r17,Z+1	 ;  p$1, MEM[(const struct Point &)_16 + 1]
	sbrc r17,7	 ;  p$1,
	rjmp .L224	 ; 
	movw r24,r16	 ; ,
	call _Z12osd_setPanel5Point	 ; 
	movw r24,r16	 ; ,
	movw r30,r14	 ; , __result
	icall
.L224:
	adiw r28,3	 ;  pl,
	rjmp .L225	 ; 
.L222:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	ret
	.size	_Z16print_all_panelsv, .-_Z16print_all_panelsv
	.section	.text._Z9osd_writeh,"ax",@progbits
.global	_Z9osd_writeh
	.type	_Z9osd_writeh, @function
_Z9osd_writeh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	jmp _ZN3OSD6writebEh	 ; 
	.size	_Z9osd_writeh, .-_Z9osd_writeh
	.section	.text._Z16osd_setPanelSign5Pointc,"ax",@progbits
.global	_Z16osd_setPanelSign5Pointc
	.type	_Z16osd_setPanelSign5Pointc, @function
_Z16osd_setPanelSign5Pointc:
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
	 ; SP -= 1	 ; 
	push __zero_reg__
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
/* prologue: function */
/* frame size = 1 */
/* stack size = 4 */
.L__stack_usage = 4
	mov r17,r24	 ;  p, p
	std Y+1,r22	 ; ,
	call _Z12osd_setPanel5Point	 ; 
	ldd r22,Y+1	 ; ,
	sbrc r17,7	 ;  p,
	rjmp .L227	 ; 
	mov r24,r22	 ; , c
/* epilogue start */
	 ; SP += 1	 ; 
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	jmp _ZN3OSD6writebEh	 ; 
.L227:
/* epilogue start */
	 ; SP += 1	 ; 
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	ret
	.size	_Z16osd_setPanelSign5Pointc, .-_Z16osd_setPanelSign5Pointc
	.section	.text._Z14cnvGroundSpeedv,"ax",@progbits
.global	_Z14cnvGroundSpeedv
	.type	_Z14cnvGroundSpeedv, @function
_Z14cnvGroundSpeedv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r30,_ZL7measure	 ;  __addr16, measure
	lds r31,_ZL7measure+1	 ;  __addr16, measure
/* #APP */
 ;  164 "Panels.h" 1
	lpm r22, Z+	 ;  __result
	lpm r23, Z+	 ;  __result
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lds r18,_ZL15osd_groundspeed	 ; , osd_groundspeed
	lds r19,_ZL15osd_groundspeed+1	 ; , osd_groundspeed
	lds r20,_ZL15osd_groundspeed+2	 ; , osd_groundspeed
	lds r21,_ZL15osd_groundspeed+3	 ; , osd_groundspeed
	call __mulsf3	 ; 
	ret
	.size	_Z14cnvGroundSpeedv, .-_Z14cnvGroundSpeedv
	.section	.text._Z9printTimei,"ax",@progbits
.global	_Z9printTimei
	.type	_Z9printTimei, @function
_Z9printTimei:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r18,lo8(60)	 ;  tmp49,
	ldi r19,0	 ; 
	movw r22,r18	 ; , tmp49
	call __divmodhi4
	push r25	 ;  D.29595
	push r24	 ;  D.29595
	movw r24,r22	 ; , tmp48
	movw r22,r18	 ; , tmp49
	call __divmodhi4
	push r25	 ;  D.29595
	push r24	 ;  D.29595
	ldi r24,lo8(_ZZ9printTimeiE3__c)	 ;  tmp62,
	ldi r25,hi8(_ZZ9printTimeiE3__c)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp62
	ldi r24,lo8(osd)	 ;  tmp66,
	ldi r25,hi8(osd)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp66
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	in r24,__SP_L__	 ; 
	in r25,__SP_H__	 ; 
	adiw r24,8	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ; 
	ret
	.size	_Z9printTimei, .-_Z9printTimei
	.section	.text._Z7panTime5Point,"ax",@progbits
.global	_Z7panTime5Point
	.type	_Z7panTime5Point, @function
_Z7panTime5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r22,_ZL23total_flight_time_milis	 ;  total_flight_time_milis, total_flight_time_milis
	lds r23,_ZL23total_flight_time_milis+1	 ;  total_flight_time_milis, total_flight_time_milis
	lds r24,_ZL23total_flight_time_milis+2	 ;  total_flight_time_milis, total_flight_time_milis
	lds r25,_ZL23total_flight_time_milis+3	 ;  total_flight_time_milis, total_flight_time_milis
	ldi r18,lo8(-24)	 ; ,
	ldi r19,lo8(3)	 ; ,
	ldi r20,0	 ; 
	ldi r21,0	 ; 
	call __udivmodsi4
	movw r24,r18	 ; , D.29599
	jmp _Z9printTimei	 ; 
	.size	_Z7panTime5Point, .-_Z7panTime5Point
	.section	.text._Z12osd_printf_1PKcf,"ax",@progbits
.global	_Z12osd_printf_1PKcf
	.type	_Z12osd_printf_1PKcf, @function
_Z12osd_printf_1PKcf:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	push r23	 ;  f
	push r22	 ;  f
	push r21	 ;  f
	push r20	 ;  f
	push r25	 ;  fmt
	push r24	 ;  fmt
	ldi r24,lo8(osd)	 ;  tmp50,
	ldi r25,hi8(osd)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp50
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	in r24,__SP_L__	 ; 
	in r25,__SP_H__	 ; 
	adiw r24,8	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ; 
	ret
	.size	_Z12osd_printf_1PKcf, .-_Z12osd_printf_1PKcf
	.section	.text._Z8panCur_A5Point,"ax",@progbits
.global	_Z8panCur_A5Point
	.type	_Z8panCur_A5Point, @function
_Z8panCur_A5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbrc r24,7	 ;  p,
	rjmp .L234	 ; 
	ldi r24,lo8(-67)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L234:
	lds r22,_ZL10osd_curr_A	 ;  osd_curr_A, osd_curr_A
	lds r23,_ZL10osd_curr_A+1	 ;  osd_curr_A, osd_curr_A
	mov __tmp_reg__,r23	 ; 
	lsl r0	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	ldi r18,lo8(10)	 ; ,
	ldi r19,lo8(-41)	 ; ,
	ldi r20,lo8(35)	 ; ,
	ldi r21,lo8(60)	 ; ,
	call __mulsf3	 ; 
	movw r20,r22	 ;  D.29608,
	movw r22,r24	 ;  D.29608,
	ldi r24,lo8(_ZZ8panCur_A5PointE3__c)	 ; ,
	ldi r25,hi8(_ZZ8panCur_A5PointE3__c)	 ; ,
	jmp _Z12osd_printf_1PKcf	 ; 
	.size	_Z8panCur_A5Point, .-_Z8panCur_A5Point
	.section	.text._Z12osd_printf_2PKcfh,"ax",@progbits
.global	_Z12osd_printf_2PKcfh
	.type	_Z12osd_printf_2PKcfh, @function
_Z12osd_printf_2PKcfh:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	push __zero_reg__
	push r18	 ;  c
	push r23	 ;  f
	push r22	 ;  f
	push r21	 ;  f
	push r20	 ;  f
	push r25	 ;  fmt
	push r24	 ;  fmt
	ldi r24,lo8(osd)	 ;  tmp55,
	ldi r25,hi8(osd)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp55
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	in r24,__SP_L__	 ; 
	in r25,__SP_H__	 ; 
	adiw r24,10	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ; 
	ret
	.size	_Z12osd_printf_2PKcfh, .-_Z12osd_printf_2PKcfh
	.section	.text._Z7panTemp5Point,"ax",@progbits
.global	_Z7panTemp5Point
	.type	_Z7panTemp5Point, @function
_Z7panTemp5Point:
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 8 */
.L__stack_usage = 8
	lds r24,_ZL7measure	 ;  D.29616, measure
	lds r25,_ZL7measure+1	 ;  D.29616, measure
	movw r30,r24	 ;  D.29617, D.29616
	adiw r30,10	 ;  D.29617,
/* #APP */
 ;  403 "Panels.h" 1
	lpm r29, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	adiw r30,2	 ;  D.29620,
/* #APP */
 ;  403 "Panels.h" 1
	lpm r28, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	adiw r30,1	 ;  __addr16,
/* #APP */
 ;  403 "Panels.h" 1
	lpm r16, Z+	 ;  __result
	lpm r17, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lds r22,_ZL11temperature	 ;  temperature, temperature
	lds r23,_ZL11temperature+1	 ;  temperature, temperature
	ldi r24,0	 ;  temperature
	ldi r25,0	 ;  temperature
	call __floatunsisf	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(32)	 ; ,
	ldi r21,lo8(65)	 ; ,
	call __divsf3	 ; 
	movw r12,r22	 ;  D.29619,
	movw r14,r24	 ;  D.29619,
	mov r22,r28	 ;  D.29621, __result
	ldi r23,0	 ;  D.29621
	ldi r24,0	 ;  D.29621
	ldi r25,0	 ;  D.29621
	call __floatsisf	 ; 
	movw r18,r22	 ;  D.29619,
	movw r20,r24	 ;  D.29619,
	movw r24,r14	 ; , D.29619
	movw r22,r12	 ; , D.29619
	call __mulsf3	 ; 
	movw r12,r22	 ;  D.29619,
	movw r14,r24	 ;  D.29619,
	movw r22,r16	 ;  __result, __result
	ldi r24,0	 ;  __result
	ldi r25,0	 ;  __result
	call __floatunsisf	 ; 
	movw r18,r22	 ;  D.29619,
	movw r20,r24	 ;  D.29619,
	movw r24,r14	 ; , D.29619
	movw r22,r12	 ; , D.29619
	call __addsf3	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-56)	 ; ,
	ldi r21,lo8(66)	 ; ,
	call __divsf3	 ; 
	movw r20,r22	 ;  D.29619,
	movw r22,r24	 ;  D.29619,
	mov r18,r29	 ; , __result
	ldi r24,lo8(_ZZ7panTemp5PointE3__c)	 ; ,
	ldi r25,hi8(_ZZ7panTemp5PointE3__c)	 ; ,
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	jmp _Z12osd_printf_2PKcfh	 ; 
	.size	_Z7panTemp5Point, .-_Z7panTemp5Point
.global	__nesf2
.global	__gesf2
.global	__fixunssfsi
	.section	.text._Z6panEff5Point,"ax",@progbits
.global	_Z6panEff5Point
	.type	_Z6panEff5Point, @function
_Z6panEff5Point:
	push r8	 ; 
	push r9	 ; 
	push r10	 ; 
	push r11	 ; 
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 12 */
.L__stack_usage = 12
	mov r28,r24	 ;  p, p
	lds r24,sets	 ;  sets.model_type, sets.model_type
	cpse r24,__zero_reg__	 ;  sets.model_type,
	rjmp .L238	 ; 
	lds r25,_ZL12osd_throttle	 ;  osd_throttle, osd_throttle
	lds r24,lflags+1	 ;  lflags, lflags
	tst r25	 ;  osd_throttle
	brne .+2	 ; 
	rjmp .L239	 ; 
	sbrc r24,0	 ;  lflags,
	rjmp .L240	 ; 
	ori r24,lo8(1<<0)	 ;  lflags.throttle_on,
	sts lflags+1,r24	 ;  lflags.throttle_on, lflags.throttle_on
.L240:
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	movw r20,r18	 ; 
	lds r22,_ZL15osd_groundspeed	 ; , osd_groundspeed
	lds r23,_ZL15osd_groundspeed+1	 ; , osd_groundspeed
	lds r24,_ZL15osd_groundspeed+2	 ; , osd_groundspeed
	lds r25,_ZL15osd_groundspeed+3	 ; , osd_groundspeed
	call __nesf2	 ; 
	tst r24	 ; 
	breq .L266	 ; ,
	lds r22,_ZL10osd_curr_A	 ;  osd_curr_A, osd_curr_A
	lds r23,_ZL10osd_curr_A+1	 ;  osd_curr_A, osd_curr_A
	mov __tmp_reg__,r23	 ; 
	lsl r0	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	movw r12,r22	 ;  D.29631,
	movw r14,r24	 ;  D.29631,
	call _Z14cnvGroundSpeedv	 ; 
	movw r18,r22	 ;  D.29631,
	movw r20,r24	 ;  D.29631,
	movw r24,r14	 ; , D.29631
	movw r22,r12	 ; , D.29631
	call __divsf3	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	movw r20,r18	 ; 
	call __addsf3	 ; 
	movw r12,r22	 ;  eff,
	movw r14,r24	 ;  eff,
	rjmp .L241	 ; 
.L266:
	mov r12,__zero_reg__	 ;  eff
	mov r13,__zero_reg__	 ;  eff
	movw r14,r12	 ;  eff
.L241:
	sbrc r28,7	 ;  p,
	rjmp .L243	 ; 
	ldi r24,lo8(22)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L243:
	movw r24,r14	 ; , eff
	movw r22,r12	 ; , eff
	call __fixsfsi	 ; 
	subi r22,1	 ;  D.29637,
	sbc r23,__zero_reg__	 ;  D.29637
	cpi r22,15	 ;  D.29637,
	sbci r23,39	 ;  D.29637,
	brlo .+2	 ; 
	rjmp .L237	 ; 
	movw r22,r14	 ; , eff
	movw r20,r12	 ; , eff
	ldi r24,lo8(_ZZ6panEff5PointE3__c)	 ; ,
	ldi r25,hi8(_ZZ6panEff5PointE3__c)	 ; ,
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	jmp _Z12osd_printf_1PKcf	 ; 
.L239:
	sbrs r24,0	 ;  lflags,
	rjmp .L246	 ; 
	lds r20,_ZL15osd_alt_to_home	 ;  osd_alt_to_home, osd_alt_to_home
	lds r21,_ZL15osd_alt_to_home+1	 ;  osd_alt_to_home, osd_alt_to_home
	lds r22,_ZL15osd_alt_to_home+2	 ;  osd_alt_to_home, osd_alt_to_home
	lds r23,_ZL15osd_alt_to_home+3	 ;  osd_alt_to_home, osd_alt_to_home
	sts _ZL4palt,r20	 ;  palt, osd_alt_to_home
	sts _ZL4palt+1,r21	 ;  palt, osd_alt_to_home
	sts _ZL4palt+2,r22	 ;  palt, osd_alt_to_home
	sts _ZL4palt+3,r23	 ;  palt, osd_alt_to_home
	lds r20,_ZL9tdistance	 ;  tdistance, tdistance
	lds r21,_ZL9tdistance+1	 ;  tdistance, tdistance
	lds r22,_ZL9tdistance+2	 ;  tdistance, tdistance
	lds r23,_ZL9tdistance+3	 ;  tdistance, tdistance
	sts _ZZ6panEff5PointE9ddistance,r20	 ;  ddistance, tdistance
	sts _ZZ6panEff5PointE9ddistance+1,r21	 ;  ddistance, tdistance
	sts _ZZ6panEff5PointE9ddistance+2,r22	 ;  ddistance, tdistance
	sts _ZZ6panEff5PointE9ddistance+3,r23	 ;  ddistance, tdistance
	andi r24,lo8(~(1<<0))	 ;  lflags.throttle_on,
	sts lflags+1,r24	 ;  lflags.throttle_on, lflags.throttle_on
.L246:
	sbrc r28,7	 ;  p,
	rjmp .L247	 ; 
	ldi r24,lo8(24)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L247:
	lds r12,_ZL9osd_climb	 ;  D.29631, osd_climb
	lds r13,_ZL9osd_climb+1	 ;  D.29631, osd_climb
	lds r14,_ZL9osd_climb+2	 ;  D.29631, osd_climb
	lds r15,_ZL9osd_climb+3	 ;  D.29631, osd_climb
	ldi r18,lo8(-51)	 ; ,
	ldi r19,lo8(-52)	 ; ,
	ldi r20,lo8(76)	 ; ,
	ldi r21,lo8(-67)	 ; ,
	movw r24,r14	 ; , D.29631
	movw r22,r12	 ; , D.29631
	call __ltsf2	 ; 
	sbrs r24,7	 ; ,
	rjmp .L267	 ; 
	lds r12,_ZL15osd_alt_to_home	 ;  D.29631, osd_alt_to_home
	lds r13,_ZL15osd_alt_to_home+1	 ;  D.29631, osd_alt_to_home
	lds r14,_ZL15osd_alt_to_home+2	 ;  D.29631, osd_alt_to_home
	lds r15,_ZL15osd_alt_to_home+3	 ;  D.29631, osd_alt_to_home
	lds r28,_ZL7measure	 ;  D.29633, measure
	lds r29,_ZL7measure+1	 ;  D.29633, measure
	movw r30,r28	 ;  __addr16, D.29633
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  453 "Panels.h" 1
	lpm r8, Z+	 ;  __result
	lpm r9, Z+	 ;  __result
	lpm r10, Z+	 ;  __result
	lpm r11, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	movw r20,r14	 ; , D.29631
	movw r18,r12	 ; , D.29631
	lds r22,_ZL4palt	 ; , palt
	lds r23,_ZL4palt+1	 ; , palt
	lds r24,_ZL4palt+2	 ; , palt
	lds r25,_ZL4palt+3	 ; , palt
	call __subsf3	 ; 
	movw r18,r22	 ;  D.29631,
	movw r20,r24	 ;  D.29631,
	movw r24,r14	 ; , D.29631
	movw r22,r12	 ; , D.29631
	call __divsf3	 ; 
	movw r12,r22	 ;  D.29631,
	movw r14,r24	 ;  D.29631,
	lds r18,_ZZ6panEff5PointE9ddistance	 ; , ddistance
	lds r19,_ZZ6panEff5PointE9ddistance+1	 ; , ddistance
	lds r20,_ZZ6panEff5PointE9ddistance+2	 ; , ddistance
	lds r21,_ZZ6panEff5PointE9ddistance+3	 ; , ddistance
	lds r22,_ZL9tdistance	 ; , tdistance
	lds r23,_ZL9tdistance+1	 ; , tdistance
	lds r24,_ZL9tdistance+2	 ; , tdistance
	lds r25,_ZL9tdistance+3	 ; , tdistance
	call __subsf3	 ; 
	movw r18,r22	 ;  D.29631,
	movw r20,r24	 ;  D.29631,
	movw r24,r14	 ; , D.29631
	movw r22,r12	 ; , D.29631
	call __mulsf3	 ; 
	movw r20,r10	 ; , __result
	movw r18,r8	 ; , __result
	call __mulsf3	 ; 
	movw r12,r22	 ;  glide,
	movw r14,r24	 ;  glide,
	call __fixsfsi	 ; 
	cpi r22,16	 ;  iGlide,
	ldi r24,39	 ; ,
	cpc r23,r24	 ;  iGlide,
	brge .L256	 ; ,
	cp __zero_reg__,r22	 ;  iGlide
	cpc __zero_reg__,r23	 ;  iGlide
	brlt .+2	 ; 
	rjmp .L237	 ; 
	rjmp .L250	 ; 
.L256:
	mov r12,__zero_reg__	 ;  glide
	ldi r24,lo8(60)	 ; ,
	mov r13,r24	 ;  glide,
	ldi r24,lo8(28)	 ; ,
	mov r14,r24	 ;  glide,
	ldi r24,lo8(70)	 ; ,
	mov r15,r24	 ;  glide,
.L250:
	movw r30,r28	 ;  D.29635, D.29633
	adiw r30,9	 ;  D.29635,
/* #APP */
 ;  457 "Panels.h" 1
	lpm r18, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	movw r22,r14	 ; , glide
	movw r20,r12	 ; , glide
	ldi r24,lo8(_ZL10fmt_xtrack+3)	 ; ,
	ldi r25,hi8(_ZL10fmt_xtrack+3)	 ; ,
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	jmp _Z12osd_printf_2PKcfh	 ; 
.L267:
	ldi r18,lo8(-51)	 ; ,
	ldi r19,lo8(-52)	 ; ,
	ldi r20,lo8(76)	 ; ,
	ldi r21,lo8(-67)	 ; ,
	movw r24,r14	 ; , D.29631
	movw r22,r12	 ; , D.29631
	call __gesf2	 ; 
	sbrc r24,7	 ; ,
	rjmp .L237	 ; 
	lds r24,osd_att	 ;  osd_att.pitch, osd_att.pitch
	lds r25,osd_att+1	 ;  osd_att.pitch, osd_att.pitch
	sbrs r25,7	 ;  osd_att.pitch,
	rjmp .L237	 ; 
	ldi r22,lo8(_ZZ6panEff5PointE3__c_0)	 ; ,
	ldi r23,hi8(_ZZ6panEff5PointE3__c_0)	 ; ,
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	jmp _ZN12BetterStream7print_PEPKc	 ; 
.L238:
	lds r24,lflags	 ;  lflags, lflags
	sbrs r24,6	 ;  lflags,
	rjmp .L237	 ; 
	lds r29,_ZL23osd_battery_remaining_A	 ;  D.29629, osd_battery_remaining_A
	mov r16,r29	 ;  D.29636, D.29629
	ldi r17,0	 ;  D.29636
	lds r24,_ZL20last_battery_reading	 ;  last_battery_reading, last_battery_reading
	mov __tmp_reg__,r24	 ; 
	lsl r0	 ; 
	sbc r25,r25	 ; 
	cp r16,r24	 ;  D.29636, D.29636
	cpc r17,r25	 ;  D.29636, D.29636
	brne .+2	 ; 
	rjmp .L253	 ; 
	lds r24,lflags+1	 ;  lflags, lflags
	sbrc r24,3	 ;  lflags,
	rjmp .L253	 ; 
	lds r22,_ZL23total_flight_time_milis	 ; , total_flight_time_milis
	lds r23,_ZL23total_flight_time_milis+1	 ; , total_flight_time_milis
	lds r24,_ZL23total_flight_time_milis+2	 ; , total_flight_time_milis
	lds r25,_ZL23total_flight_time_milis+3	 ; , total_flight_time_milis
	call __floatunsisf	 ; 
	movw r12,r22	 ;  D.29631,
	movw r14,r24	 ;  D.29631,
	mov r22,r29	 ;  D.29629, D.29629
	ldi r23,0	 ;  D.29629
	ldi r24,0	 ;  D.29629
	ldi r25,0	 ;  D.29629
	call __floatunsisf	 ; 
	movw r18,r22	 ;  D.29631,
	movw r20,r24	 ;  D.29631,
	movw r24,r14	 ; , D.29631
	movw r22,r12	 ; , D.29631
	call __mulsf3	 ; 
	movw r12,r22	 ;  D.29631,
	movw r14,r24	 ;  D.29631,
	lds r22,_ZL19max_battery_reading	 ;  max_battery_reading, max_battery_reading
	mov __tmp_reg__,r22	 ; 
	lsl r0	 ; 
	sbc r23,r23	 ; 
	sub r22,r16	 ;  D.29636, D.29636
	sbc r23,r17	 ;  D.29636, D.29636
	mov __tmp_reg__,r23	 ; 
	lsl r0	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	movw r18,r22	 ;  D.29631,
	movw r20,r24	 ;  D.29631,
	movw r24,r14	 ; , D.29631
	movw r22,r12	 ; , D.29631
	call __divsf3	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(122)	 ; ,
	ldi r21,lo8(68)	 ; ,
	call __divsf3	 ; 
	call __fixunssfsi	 ; 
	sts _ZL39remaining_estimated_flight_time_seconds+1,r23	 ;  remaining_estimated_flight_time_seconds, tmp167
	sts _ZL39remaining_estimated_flight_time_seconds,r22	 ;  remaining_estimated_flight_time_seconds, tmp167
	sts _ZL20last_battery_reading,r29	 ;  last_battery_reading, D.29629
.L253:
	sbrc r28,7	 ;  p,
	rjmp .L254	 ; 
	ldi r24,lo8(23)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L254:
	lds r24,_ZL39remaining_estimated_flight_time_seconds	 ; , remaining_estimated_flight_time_seconds
	lds r25,_ZL39remaining_estimated_flight_time_seconds+1	 ; , remaining_estimated_flight_time_seconds
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	jmp _Z9printTimei	 ; 
.L237:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	ret
	.size	_Z6panEff5Point, .-_Z6panEff5Point
	.section	.text._Z8panClimb5Point,"ax",@progbits
.global	_Z8panClimb5Point
	.type	_Z8panClimb5Point, @function
_Z8panClimb5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbrc r24,7	 ;  p,
	rjmp .L269	 ; 
	ldi r24,lo8(21)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L269:
	lds r30,_ZL7measure	 ;  measure, measure
	lds r31,_ZL7measure+1	 ;  measure, measure
	adiw r30,18	 ;  D.29650,
/* #APP */
 ;  581 "Panels.h" 1
	lpm r18, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lds r20,_ZL14vertical_speed	 ;  vertical_speed, vertical_speed
	lds r21,_ZL14vertical_speed+1	 ;  vertical_speed, vertical_speed
	lds r22,_ZL14vertical_speed+2	 ;  vertical_speed, vertical_speed
	lds r23,_ZL14vertical_speed+3	 ;  vertical_speed, vertical_speed
	ldi r24,lo8(_ZL10fmt_xtrack+3)	 ; ,
	ldi r25,hi8(_ZL10fmt_xtrack+3)	 ; ,
	jmp _Z12osd_printf_2PKcfh	 ; 
	.size	_Z8panClimb5Point, .-_Z8panClimb5Point
	.section	.text._Z13panRadarScale5Point,"ax",@progbits
.global	_Z13panRadarScale5Point
	.type	_Z13panRadarScale5Point, @function
_Z13panRadarScale5Point:
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
	 ; SP -= 4	 ; 
	rcall .
	rcall .
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
/* prologue: function */
/* frame size = 4 */
/* stack size = 10 */
.L__stack_usage = 10
	sbrc r24,7	 ;  p,
	rjmp .L271	 ; 
	ldi r24,lo8(31)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L271:
	lds r16,_ZL10radar_zoom	 ;  D.29657, radar_zoom
	lds r17,_ZL10radar_zoom+1	 ;  D.29657, radar_zoom
	lds r14,_ZL7measure	 ;  D.29659, measure
	lds r15,_ZL7measure+1	 ;  D.29659, measure
	movw r30,r14	 ;  __addr16, D.29659
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  1657 "Panels.h" 1
	lpm r18, Z+	 ;  __result
	lpm r19, Z+	 ;  __result
	lpm r20, Z+	 ;  __result
	lpm r21, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(-6)	 ;  tmp63,
	mul r24,r16	 ;  tmp63, D.29657
	movw r22,r0	 ;  D.29657
	mul r24,r17	 ;  tmp63, D.29657
	add r23,r0	 ;  D.29657
	clr __zero_reg__
	mov __tmp_reg__,r23	 ; 
	lsl r0	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	std Y+1,r18	 ; ,
	std Y+2,r19	 ; ,
	std Y+3,r20	 ; ,
	std Y+4,r21	 ; ,
	call __floatsisf	 ; 
	ldd r18,Y+1	 ; ,
	ldd r19,Y+2	 ; ,
	ldd r20,Y+3	 ; ,
	ldd r21,Y+4	 ; ,
	call __mulsf3	 ; 
	movw r30,r14	 ;  D.29661, D.29659
	cpi r16,40	 ;  D.29657,
	cpc r17,__zero_reg__	 ;  D.29657
	brlt .L272	 ; ,
	adiw r30,15	 ;  D.29661,
/* #APP */
 ;  1660 "Panels.h" 1
	lpm r17, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(122)	 ; ,
	ldi r21,lo8(68)	 ; ,
	call __divsf3	 ; 
	movw r20,r22	 ;  D.29662,
	movw r22,r24	 ;  D.29662,
	mov r18,r17	 ; , __result
	ldi r24,lo8(_ZZ13panRadarScale5PointE3__c)	 ; ,
	ldi r25,hi8(_ZZ13panRadarScale5PointE3__c)	 ; ,
	rjmp .L273	 ; 
.L272:
	adiw r30,9	 ;  D.29663,
/* #APP */
 ;  1662 "Panels.h" 1
	lpm r18, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	movw r20,r22	 ; , tmp66
	movw r22,r24	 ; , tmp66
	ldi r24,lo8(_ZZ13panRadarScale5PointE3__c_0)	 ; ,
	ldi r25,hi8(_ZZ13panRadarScale5PointE3__c_0)	 ; ,
.L273:
/* epilogue start */
	 ; SP += 4	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	jmp _Z12osd_printf_2PKcfh	 ; 
	.size	_Z13panRadarScale5Point, .-_Z13panRadarScale5Point
	.section	.text._Z12osd_printi_1PKci,"ax",@progbits
.global	_Z12osd_printi_1PKci
	.type	_Z12osd_printi_1PKci, @function
_Z12osd_printi_1PKci:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	push r23	 ;  f
	push r22	 ;  f
	push r25	 ;  fmt
	push r24	 ;  fmt
	ldi r24,lo8(osd)	 ;  tmp48,
	ldi r25,hi8(osd)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp48
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	 ; SP += 6	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	ret
	.size	_Z12osd_printi_1PKci, .-_Z12osd_printi_1PKci
	.section	.text._Z7panRSSI5Point,"ax",@progbits
.global	_Z7panRSSI5Point
	.type	_Z7panRSSI5Point, @function
_Z7panRSSI5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbrc r24,7	 ;  p,
	rjmp .L276	 ; 
	ldi r24,lo8(9)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L276:
	lds r22,_ZL4rssi	 ;  rssi, rssi
	lds r23,_ZL4rssi+1	 ;  rssi, rssi
	ldi r24,lo8(_ZZ7panRSSI5PointE3__c)	 ; ,
	ldi r25,hi8(_ZZ7panRSSI5PointE3__c)	 ; ,
	jmp _Z12osd_printi_1PKci	 ; 
	.size	_Z7panRSSI5Point, .-_Z7panRSSI5Point
	.section	.text._Z6panThr5Point,"ax",@progbits
.global	_Z6panThr5Point
	.type	_Z6panThr5Point, @function
_Z6panThr5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r22,_ZL12osd_throttle	 ;  osd_throttle, osd_throttle
	ldi r23,0	 ;  D.29681
	ldi r24,lo8(_ZZ6panThr5PointE3__c)	 ; ,
	ldi r25,hi8(_ZZ6panThr5PointE3__c)	 ; ,
	jmp _Z12osd_printi_1PKci	 ; 
	.size	_Z6panThr5Point, .-_Z6panThr5Point
	.section	.text._Z8panPitch5Point,"ax",@progbits
.global	_Z8panPitch5Point
	.type	_Z8panPitch5Point, @function
_Z8panPitch5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r22,osd_att	 ;  osd_att.pitch, osd_att.pitch
	lds r23,osd_att+1	 ;  osd_att.pitch, osd_att.pitch
	ldi r24,lo8(_ZZ8panPitch5PointE3__c)	 ; ,
	ldi r25,hi8(_ZZ8panPitch5PointE3__c)	 ; ,
	jmp _Z12osd_printi_1PKci	 ; 
	.size	_Z8panPitch5Point, .-_Z8panPitch5Point
	.section	.text._Z7panRoll5Point,"ax",@progbits
.global	_Z7panRoll5Point
	.type	_Z7panRoll5Point, @function
_Z7panRoll5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r22,osd_att+2	 ;  osd_att.roll, osd_att.roll
	lds r23,osd_att+2+1	 ;  osd_att.roll, osd_att.roll
	ldi r24,lo8(_ZZ7panRoll5PointE3__c)	 ; ,
	ldi r25,hi8(_ZZ7panRoll5PointE3__c)	 ; ,
	jmp _Z12osd_printi_1PKci	 ; 
	.size	_Z7panRoll5Point, .-_Z7panRoll5Point
	.section	.text._Z9panGPSats5Point,"ax",@progbits
.global	_Z9panGPSats5Point
	.type	_Z9panGPSats5Point, @function
_Z9panGPSats5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	mov r18,r24	 ;  p, p
	lds r25,_ZL12osd_fix_type	 ;  D.29690, osd_fix_type
	cpi r25,lo8(2)	 ;  D.29690,
	breq .L284	 ; ,
	cpi r25,lo8(3)	 ;  D.29690,
	brne .L285	 ; ,
	ldi r24,lo8(15)	 ;  gps_str,
	rjmp .L281	 ; 
.L284:
	ldi r24,lo8(31)	 ;  gps_str,
	rjmp .L281	 ; 
.L285:
	ldi r24,lo8(42)	 ;  gps_str,
.L281:
	lds r20,_ZL3eph	 ;  eph, eph
	lds r21,_ZL3eph+1	 ;  eph, eph
	cpi r20,-56	 ;  eph,
	cpc r21,__zero_reg__	 ;  eph
	brlo .L282	 ; ,
	lds r25,lflags+1	 ;  lflags, lflags
	sbrc r25,2	 ;  lflags,
	ldi r24,lo8(32)	 ;  gps_str,
.L282:
	sbrs r18,7	 ;  p,
	call _ZN3OSD6writebEh	 ; 
.L283:
	lds r22,_ZL22osd_satellites_visible	 ;  osd_satellites_visible, osd_satellites_visible
	ldi r23,0	 ;  D.29693
	ldi r24,lo8(_ZZ9panGPSats5PointE3__c)	 ; ,
	ldi r25,hi8(_ZZ9panGPSats5PointE3__c)	 ; ,
	jmp _Z12osd_printi_1PKci	 ; 
	.size	_Z9panGPSats5Point, .-_Z9panGPSats5Point
	.section	.text._Z10panHeading5Point,"ax",@progbits
.global	_Z10panHeading5Point
	.type	_Z10panHeading5Point, @function
_Z10panHeading5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r22,_ZL11osd_heading	 ;  osd_heading, osd_heading
	lds r23,_ZL11osd_heading+1	 ;  osd_heading, osd_heading
	ldi r24,lo8(_ZZ10panHeading5PointE3__c)	 ; ,
	ldi r25,hi8(_ZZ10panHeading5PointE3__c)	 ; ,
	jmp _Z12osd_printi_1PKci	 ; 
	.size	_Z10panHeading5Point, .-_Z10panHeading5Point
	.section	.text._Z9printDistf,"ax",@progbits
.global	_Z9printDistf
	.type	_Z9printDistf, @function
_Z9printDistf:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r20,r22	 ;  d, d
	movw r22,r24	 ;  d, d
	lds r30,_ZL7measure	 ;  measure, measure
	lds r31,_ZL7measure+1	 ;  measure, measure
	adiw r30,9	 ;  D.29702,
/* #APP */
 ;  214 "Panels.h" 1
	lpm r18, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(_ZZ9printDistfE3__c)	 ; ,
	ldi r25,hi8(_ZZ9printDistfE3__c)	 ; ,
	jmp _Z12osd_printf_2PKcfh	 ; 
	.size	_Z9printDistf, .-_Z9printDistf
	.section	.text._Z6panAlt5Point,"ax",@progbits
.global	_Z6panAlt5Point
	.type	_Z6panAlt5Point, @function
_Z6panAlt5Point:
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	sbrc r24,7	 ;  p,
	rjmp .L292	 ; 
	ldi r24,lo8(17)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L292:
	lds r30,_ZL7measure	 ;  measure, measure
	lds r31,_ZL7measure+1	 ;  measure, measure
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  565 "Panels.h" 1
	lpm r12, Z+	 ;  __result
	lpm r13, Z+	 ;  __result
	lpm r14, Z+	 ;  __result
	lpm r15, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lds r22,_ZL11osd_alt_gps	 ; , osd_alt_gps
	lds r23,_ZL11osd_alt_gps+1	 ; , osd_alt_gps
	lds r24,_ZL11osd_alt_gps+2	 ; , osd_alt_gps
	lds r25,_ZL11osd_alt_gps+3	 ; , osd_alt_gps
	call __floatsisf	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(122)	 ; ,
	ldi r21,lo8(68)	 ; ,
	call __divsf3	 ; 
	movw r20,r14	 ; , __result
	movw r18,r12	 ; , __result
	call __mulsf3	 ; 
/* epilogue start */
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	jmp _Z9printDistf	 ; 
	.size	_Z6panAlt5Point, .-_Z6panAlt5Point
	.section	.text._Z10panHomeAlt5Point,"ax",@progbits
.global	_Z10panHomeAlt5Point
	.type	_Z10panHomeAlt5Point, @function
_Z10panHomeAlt5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbrc r24,7	 ;  p,
	rjmp .L294	 ; 
	ldi r24,lo8(18)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L294:
	lds r30,_ZL7measure	 ;  measure, measure
	lds r31,_ZL7measure+1	 ;  measure, measure
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  596 "Panels.h" 1
	lpm r22, Z+	 ;  __result
	lpm r23, Z+	 ;  __result
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lds r18,_ZL11osd_alt_rel	 ; , osd_alt_rel
	lds r19,_ZL11osd_alt_rel+1	 ; , osd_alt_rel
	lds r20,_ZL11osd_alt_rel+2	 ; , osd_alt_rel
	lds r21,_ZL11osd_alt_rel+3	 ; , osd_alt_rel
	call __mulsf3	 ; 
	jmp _Z9printDistf	 ; 
	.size	_Z10panHomeAlt5Point, .-_Z10panHomeAlt5Point
	.section	.text._Z13printFullDistf,"ax",@progbits
.global	_Z13printFullDistf
	.type	_Z13printFullDistf, @function
_Z13printFullDistf:
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	movw r18,r22	 ;  dd, dd
	movw r20,r24	 ;  dd, dd
	lds r28,_ZL7measure	 ;  D.29725, measure
	lds r29,_ZL7measure+1	 ;  D.29725, measure
	movw r30,r28	 ;  __addr16, D.29725
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  219 "Panels.h" 1
	lpm r22, Z+	 ;  __result
	lpm r23, Z+	 ;  __result
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	call __mulsf3	 ; 
	movw r12,r22	 ;  tmp58,
	movw r14,r24	 ;  tmp58,
	ldi r18,0	 ; 
	ldi r19,lo8(60)	 ; ,
	ldi r20,lo8(28)	 ; ,
	ldi r21,lo8(70)	 ; ,
	call __gtsf2	 ; 
	cp __zero_reg__,r24	 ; 
	brge .L299	 ; ,
	movw r30,r28	 ;  D.29727, D.29725
	adiw r30,15	 ;  D.29727,
/* #APP */
 ;  221 "Panels.h" 1
	lpm r17, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	adiw r30,1	 ;  __addr16,
/* #APP */
 ;  221 "Panels.h" 1
	lpm r22, Z+	 ;  __result
	lpm r23, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	ldi r24,0	 ;  __result
	ldi r25,0	 ;  __result
	call __floatunsisf	 ; 
	movw r18,r22	 ;  D.29729,
	movw r20,r24	 ;  D.29729,
	movw r24,r14	 ; , tmp58
	movw r22,r12	 ; , tmp58
	call __divsf3	 ; 
	movw r20,r22	 ;  D.29729,
	movw r22,r24	 ;  D.29729,
	mov r18,r17	 ; , __result
	ldi r24,lo8(_ZZ13printFullDistfE3__c)	 ; ,
	ldi r25,hi8(_ZZ13printFullDistfE3__c)	 ; ,
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	jmp _Z12osd_printf_2PKcfh	 ; 
.L299:
	movw r24,r14	 ; , tmp58
	movw r22,r12	 ; , tmp58
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	jmp _Z9printDistf	 ; 
	.size	_Z13printFullDistf, .-_Z13printFullDistf
	.section	.text._Z11panDistance5Point,"ax",@progbits
.global	_Z11panDistance5Point
	.type	_Z11panDistance5Point, @function
_Z11panDistance5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbrc r24,7	 ;  p,
	rjmp .L301	 ; 
	ldi r24,lo8(-113)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L301:
	lds r22,_ZL9tdistance	 ;  tdistance, tdistance
	lds r23,_ZL9tdistance+1	 ;  tdistance, tdistance
	lds r24,_ZL9tdistance+2	 ;  tdistance, tdistance
	lds r25,_ZL9tdistance+3	 ;  tdistance, tdistance
	jmp _Z13printFullDistf	 ; 
	.size	_Z11panDistance5Point, .-_Z11panDistance5Point
	.section	.text._Z10panHomeDis5Point,"ax",@progbits
.global	_Z10panHomeDis5Point
	.type	_Z10panHomeDis5Point, @function
_Z10panHomeDis5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r25,lflags+1	 ;  lflags, lflags
	sbrs r25,7	 ;  lflags,
	rjmp .L302	 ; 
	sbrc r24,7	 ;  p,
	rjmp .L304	 ; 
	ldi r24,lo8(11)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L304:
	lds r22,_ZL17osd_home_distance	 ; , osd_home_distance
	lds r23,_ZL17osd_home_distance+1	 ; , osd_home_distance
	lds r24,_ZL17osd_home_distance+2	 ; , osd_home_distance
	lds r25,_ZL17osd_home_distance+3	 ; , osd_home_distance
	call __floatsisf	 ; 
	jmp _Z13printFullDistf	 ; 
.L302:
	ret
	.size	_Z10panHomeDis5Point, .-_Z10panHomeDis5Point
	.section	.text._Z10print_listPK7Formats,"ax",@progbits
.global	_Z10print_listPK7Formats
	.type	_Z10print_listPK7Formats, @function
_Z10print_listPK7Formats:
	push r8	 ; 
	push r9	 ; 
	push r10	 ; 
	push r11	 ; 
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 12 */
.L__stack_usage = 12
	movw r28,r24	 ;  f, f
.L312:
	movw r30,r28	 ;  __addr16, f
/* #APP */
 ;  267 "Panels.h" 1
	lpm r12, Z+	 ;  __result
	lpm r13, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	cp r12,__zero_reg__	 ;  __result
	cpc r13,__zero_reg__	 ;  __result
	brne .+2	 ; 
	rjmp .L305	 ; 
	movw r30,r28	 ;  D.29762, f
	adiw r30,2	 ;  D.29762,
/* #APP */
 ;  270 "Panels.h" 1
	lpm r24, Z	 ;  t
	
 ;  0 "" 2
/* #NOAPP */
	adiw r30,1	 ;  D.29762,
/* #APP */
 ;  271 "Panels.h" 1
	lpm r26, Z+	 ;  __result
	lpm r27, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	movw r30,r28	 ;  D.29762, f
	adiw r30,5	 ;  D.29762,
/* #APP */
 ;  272 "Panels.h" 1
	lpm r16, Z+	 ;  __result
	lpm r17, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	movw r30,r28	 ;  D.29762, f
	adiw r30,7	 ;  D.29762,
/* #APP */
 ;  273 "Panels.h" 1
	lpm r14, Z+	 ;  __result
	lpm r15, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	cpi r24,lo8(102)	 ;  t,
	breq .L308	 ; ,
	cpi r24,lo8(105)	 ;  t,
	brne .L307	 ; ,
	ld r22,X+	 ;  MEM[(int *)v_24]
	ld r23,X	 ;  MEM[(int *)v_24]
	mov __tmp_reg__,r23	 ; 
	lsl r0	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	movw r8,r22	 ;  val,
	movw r10,r24	 ;  val,
	rjmp .L307	 ; 
.L308:
	ld r8,X+	 ;  val
	ld r9,X+	 ;  val
	ld r10,X+	 ;  val
	ld r11,X	 ;  val
.L307:
	cp r16,__zero_reg__	 ;  __result
	cpc r17,__zero_reg__	 ;  __result
	breq .L310	 ; ,
	movw r30,r16	 ;  __addr16, __result
/* #APP */
 ;  286 "Panels.h" 1
	lpm r18, Z+	 ;  __result
	lpm r19, Z+	 ;  __result
	lpm r20, Z+	 ;  __result
	lpm r21, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	movw r24,r10	 ; , val
	movw r22,r8	 ; , val
	call __mulsf3	 ; 
	movw r8,r22	 ;  val,
	movw r10,r24	 ;  val,
.L310:
	cp r14,__zero_reg__	 ;  __result
	cpc r15,__zero_reg__	 ;  __result
	breq .L313	 ; ,
	movw r30,r14	 ; , __result
/* #APP */
 ;  287 "Panels.h" 1
	lpm r18, Z	 ;  h
	
 ;  0 "" 2
/* #NOAPP */
	rjmp .L311	 ; 
.L313:
	ldi r18,lo8(32)	 ;  h,
.L311:
	movw r22,r10	 ; , val
	movw r20,r8	 ; , val
	movw r24,r12	 ; , __result
	call _Z12osd_printf_2PKcfh	 ; 
	ldi r24,lo8(124)	 ; ,
	call _ZN3OSD6writebEh	 ; 
	adiw r28,9	 ;  f,
	rjmp .L312	 ; 
.L305:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	ret
	.size	_Z10print_listPK7Formats, .-_Z10print_listPK7Formats
	.section	.text._Z8panFdata5Point,"ax",@progbits
.global	_Z8panFdata5Point
	.type	_Z8panFdata5Point, @function
_Z8panFdata5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,_ZGVZ8panFdata5PointE2fd	 ;  MEM[(char *)&_ZGVZ8panFdata5PointE2fd], MEM[(char *)&_ZGVZ8panFdata5PointE2fd]
	cpse r24,__zero_reg__	 ;  MEM[(char *)&_ZGVZ8panFdata5PointE2fd],
	rjmp .L319	 ; 
	ldi r24,lo8(_ZGVZ8panFdata5PointE2fd)	 ; ,
	ldi r25,hi8(_ZGVZ8panFdata5PointE2fd)	 ; ,
	call __cxa_guard_acquire	 ; 
	or r24,r25	 ; 
	breq .L319	 ; ,
	lds r24,_ZL7measure	 ;  D.29781, measure
	lds r25,_ZL7measure+1	 ;  D.29781, measure
	movw r20,r24	 ;  D.29782, D.29781
	subi r20,-4	 ;  D.29782,
	sbci r21,-1	 ;  D.29782,
	sts _ZZ8panFdata5PointE2fd+5+1,r21	 ;  fd[0].k, D.29782
	sts _ZZ8panFdata5PointE2fd+5,r20	 ;  fd[0].k, D.29782
	movw r18,r24	 ;  D.29783, D.29781
	subi r18,-9	 ;  D.29783,
	sbci r19,-1	 ;  D.29783,
	sts _ZZ8panFdata5PointE2fd+7+1,r19	 ;  fd[0].c, D.29783
	sts _ZZ8panFdata5PointE2fd+7,r18	 ;  fd[0].c, D.29783
	sts _ZZ8panFdata5PointE2fd+14+1,r21	 ;  fd[1].k, D.29782
	sts _ZZ8panFdata5PointE2fd+14,r20	 ;  fd[1].k, D.29782
	sts _ZZ8panFdata5PointE2fd+16+1,r19	 ;  fd[1].c, D.29783
	sts _ZZ8panFdata5PointE2fd+16,r18	 ;  fd[1].c, D.29783
	sts _ZZ8panFdata5PointE2fd+23+1,r25	 ;  fd[2].k, D.29781
	sts _ZZ8panFdata5PointE2fd+23,r24	 ;  fd[2].k, D.29781
	adiw r24,8	 ;  D.29783,
	sts _ZZ8panFdata5PointE2fd+25+1,r25	 ;  fd[2].c, D.29783
	sts _ZZ8panFdata5PointE2fd+25,r24	 ;  fd[2].c, D.29783
	sts _ZZ8panFdata5PointE2fd+32+1,r21	 ;  fd[3].k, D.29782
	sts _ZZ8panFdata5PointE2fd+32,r20	 ;  fd[3].k, D.29782
	sts _ZZ8panFdata5PointE2fd+34+1,r19	 ;  fd[3].c, D.29783
	sts _ZZ8panFdata5PointE2fd+34,r18	 ;  fd[3].c, D.29783
	ldi r24,lo8(_ZGVZ8panFdata5PointE2fd)	 ; ,
	ldi r25,hi8(_ZGVZ8panFdata5PointE2fd)	 ; ,
	call __cxa_guard_release	 ; 
.L319:
	ldi r24,lo8(8)	 ; ,
	call _ZN3OSD6writebEh	 ; 
	lds r22,_ZL23total_flight_time_milis	 ;  total_flight_time_milis, total_flight_time_milis
	lds r23,_ZL23total_flight_time_milis+1	 ;  total_flight_time_milis, total_flight_time_milis
	lds r24,_ZL23total_flight_time_milis+2	 ;  total_flight_time_milis, total_flight_time_milis
	lds r25,_ZL23total_flight_time_milis+3	 ;  total_flight_time_milis, total_flight_time_milis
	ldi r18,lo8(-24)	 ; ,
	ldi r19,lo8(3)	 ; ,
	ldi r20,0	 ; 
	ldi r21,0	 ; 
	call __udivmodsi4
	movw r24,r18	 ; , D.29784
	call _Z9printTimei	 ; 
	ldi r24,lo8(_ZZ8panFdata5PointE2fd)	 ; ,
	ldi r25,hi8(_ZZ8panFdata5PointE2fd)	 ; ,
	jmp _Z10print_listPK7Formats	 ; 
	.size	_Z8panFdata5Point, .-_Z8panFdata5Point
	.section	.text._Z7panTune5Point,"ax",@progbits
.global	_Z7panTune5Point
	.type	_Z7panTune5Point, @function
_Z7panTune5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,_ZGVZ7panTune5PointE2fd	 ;  MEM[(char *)&_ZGVZ7panTune5PointE2fd], MEM[(char *)&_ZGVZ7panTune5PointE2fd]
	cpse r24,__zero_reg__	 ;  MEM[(char *)&_ZGVZ7panTune5PointE2fd],
	rjmp .L326	 ; 
	ldi r24,lo8(_ZGVZ7panTune5PointE2fd)	 ; ,
	ldi r25,hi8(_ZGVZ7panTune5PointE2fd)	 ; ,
	call __cxa_guard_acquire	 ; 
	or r24,r25	 ; 
	breq .L326	 ; ,
	lds r24,_ZL7measure	 ;  D.29789, measure
	lds r25,_ZL7measure+1	 ;  D.29789, measure
	movw r18,r24	 ;  D.29790, D.29789
	subi r18,-4	 ;  D.29790,
	sbci r19,-1	 ;  D.29790,
	sts _ZZ7panTune5PointE2fd+41+1,r19	 ;  fd[4].k, D.29790
	sts _ZZ7panTune5PointE2fd+41,r18	 ;  fd[4].k, D.29790
	subi r18,-5	 ;  D.29791,
	sbci r19,-1	 ;  D.29791,
	sts _ZZ7panTune5PointE2fd+43+1,r19	 ;  fd[4].c, D.29791
	sts _ZZ7panTune5PointE2fd+43,r18	 ;  fd[4].c, D.29791
	sts _ZZ7panTune5PointE2fd+59+1,r25	 ;  fd[6].k, D.29789
	sts _ZZ7panTune5PointE2fd+59,r24	 ;  fd[6].k, D.29789
	adiw r24,8	 ;  D.29791,
	sts _ZZ7panTune5PointE2fd+61+1,r25	 ;  fd[6].c, D.29791
	sts _ZZ7panTune5PointE2fd+61,r24	 ;  fd[6].c, D.29791
	ldi r24,lo8(_ZGVZ7panTune5PointE2fd)	 ; ,
	ldi r25,hi8(_ZGVZ7panTune5PointE2fd)	 ; ,
	call __cxa_guard_release	 ; 
.L326:
	ldi r24,lo8(_ZZ7panTune5PointE2fd)	 ; ,
	ldi r25,hi8(_ZZ7panTune5PointE2fd)	 ; ,
	jmp _Z10print_listPK7Formats	 ; 
	.size	_Z7panTune5Point, .-_Z7panTune5Point
	.section	.text._Z10printSpeedf,"ax",@progbits
.global	_Z10printSpeedf
	.type	_Z10printSpeedf, @function
_Z10printSpeedf:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r20,r22	 ;  s, s
	movw r22,r24	 ;  s, s
	lds r30,_ZL7measure	 ;  measure, measure
	lds r31,_ZL7measure+1	 ;  measure, measure
	adiw r30,8	 ;  D.29795,
/* #APP */
 ;  600 "Panels.h" 1
	lpm r18, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(_ZZ10printSpeedfE3__c)	 ; ,
	ldi r25,hi8(_ZZ10printSpeedfE3__c)	 ; ,
	jmp _Z12osd_printf_2PKcfh	 ; 
	.size	_Z10printSpeedf, .-_Z10printSpeedf
	.section	.text._Z6panVel5Point,"ax",@progbits
.global	_Z6panVel5Point
	.type	_Z6panVel5Point, @function
_Z6panVel5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbrc r24,7	 ;  p,
	rjmp .L333	 ; 
	ldi r24,lo8(20)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L333:
	call _Z14cnvGroundSpeedv	 ; 
	jmp _Z10printSpeedf	 ; 
	.size	_Z6panVel5Point, .-_Z6panVel5Point
	.section	.text._Z11panAirSpeed5Point,"ax",@progbits
.global	_Z11panAirSpeed5Point
	.type	_Z11panAirSpeed5Point, @function
_Z11panAirSpeed5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbrc r24,7	 ;  p,
	rjmp .L335	 ; 
	ldi r24,lo8(19)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L335:
	lds r30,_ZL7measure	 ;  __addr16, measure
	lds r31,_ZL7measure+1	 ;  __addr16, measure
/* #APP */
 ;  631 "Panels.h" 1
	lpm r22, Z+	 ;  __result
	lpm r23, Z+	 ;  __result
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lds r18,_ZL12osd_airspeed	 ; , osd_airspeed
	lds r19,_ZL12osd_airspeed+1	 ; , osd_airspeed
	lds r20,_ZL12osd_airspeed+2	 ; , osd_airspeed
	lds r21,_ZL12osd_airspeed+3	 ; , osd_airspeed
	call __mulsf3	 ; 
	jmp _Z10printSpeedf	 ; 
	.size	_Z11panAirSpeed5Point, .-_Z11panAirSpeed5Point
	.section	.text._Z10check_warnv,"ax",@progbits
.global	_Z10check_warnv
	.type	_Z10check_warnv, @function
_Z10check_warnv:
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 7 */
.L__stack_usage = 7
	lds r24,lflags	 ;  lflags, lflags
	bst r24,5	 ;  lflags,
	clr r29	 ;  D.29823
	bld r29,0	 ;  D.29823
	sbrs r24,5	 ;  lflags,
	rjmp .L336	 ; 
	andi r24,lo8(~(1<<5))	 ;  lflags.one_sec_timer_switch,
	sts lflags,r24	 ;  lflags.one_sec_timer_switch, lflags.one_sec_timer_switch
	lds r30,_ZL7measure	 ;  __addr16, measure
	lds r31,_ZL7measure+1	 ;  __addr16, measure
/* #APP */
 ;  650 "Panels.h" 1
	lpm r22, Z+	 ;  __result
	lpm r23, Z+	 ;  __result
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lds r18,_ZL12osd_airspeed	 ; , osd_airspeed
	lds r19,_ZL12osd_airspeed+1	 ; , osd_airspeed
	lds r20,_ZL12osd_airspeed+2	 ; , osd_airspeed
	lds r21,_ZL12osd_airspeed+3	 ; , osd_airspeed
	call __mulsf3	 ; 
	call __fixsfsi	 ; 
	lds r18,_ZL10osd_vbat_A	 ;  D.29827, osd_vbat_A
	lds r19,_ZL10osd_vbat_A+1	 ;  D.29827, osd_vbat_A
	ldi r28,lo8(1)	 ;  wmask,
	lds r24,_ZL12osd_fix_type	 ;  osd_fix_type, osd_fix_type
	cpi r24,lo8(2)	 ;  osd_fix_type,
	brlo .L338	 ; ,
	ldi r28,0	 ;  wmask
.L338:
	lds r17,sets	 ;  D.29829, sets.model_type
	cpse r17,__zero_reg__	 ;  D.29829,
	rjmp .L339	 ; 
	lds r24,sets+4	 ;  sets.stall, sets.stall
	ldi r25,0	 ;  D.29830
	cp r22,r24	 ;  iAirspeed, D.29830
	cpc r23,r25	 ;  iAirspeed, D.29830
	brge .L339	 ; ,
	lds r24,lflags+1	 ;  lflags, lflags
	sbrc r24,1	 ;  lflags,
	ori r28,lo8(2)	 ;  wmask,
.L339:
	lds r24,sets+3	 ;  D.29829, sets.overspeed
	tst r24	 ;  D.29829
	breq .L340	 ; ,
	ldi r25,0	 ;  D.29830
	cp r24,r22	 ;  D.29830, iAirspeed
	cpc r25,r23	 ;  D.29830, iAirspeed
	brge .L340	 ; ,
	ori r28,lo8(4)	 ;  wmask,
.L340:
	lds r15,sets+5	 ;  D.29829, sets.battv
	tst r15	 ;  D.29829
	breq .L341	 ; ,
	movw r22,r18	 ;  D.29827, D.29827
	ldi r24,0	 ;  D.29827
	ldi r25,0	 ;  D.29827
	call __floatunsisf	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-56)	 ; ,
	ldi r21,lo8(66)	 ; ,
	call __divsf3	 ; 
	call __fixsfsi	 ; 
	mov r18,r15	 ;  D.29830, D.29829
	ldi r19,0	 ;  D.29830
	cp r22,r18	 ;  tmp117, D.29830
	cpc r23,r19	 ;  tmp117, D.29830
	brlt .L342	 ; ,
.L341:
	lds r24,sets+11	 ;  D.29829, sets.batt_warn_level
	tst r24	 ;  D.29829
	breq .L343	 ; ,
	lds r25,_ZL23osd_battery_remaining_A	 ;  osd_battery_remaining_A, osd_battery_remaining_A
	cp r25,r24	 ;  osd_battery_remaining_A, D.29829
	brsh .L343	 ; ,
.L342:
	ori r28,lo8(8)	 ;  wmask,
.L343:
	lds r24,sets+10	 ;  sets.RSSI_raw, sets.RSSI_raw
	sbrc r24,0	 ;  sets.RSSI_raw,
	rjmp .L344	 ; 
	lds r24,sets+12	 ;  sets.rssi_warn_level, sets.rssi_warn_level
	ldi r25,0	 ;  D.29827
	lds r18,_ZL4rssi	 ;  rssi, rssi
	lds r19,_ZL4rssi+1	 ;  rssi, rssi
	cp r18,r24	 ;  rssi, D.29827
	cpc r19,r25	 ;  rssi, D.29827
	brsh .L344	 ; ,
	ori r28,lo8(16)	 ;  wmask,
.L344:
	lds r12,_ZL14vertical_speed	 ;  D.29826, vertical_speed
	lds r13,_ZL14vertical_speed+1	 ;  D.29826, vertical_speed
	lds r14,_ZL14vertical_speed+2	 ;  D.29826, vertical_speed
	lds r15,_ZL14vertical_speed+3	 ;  D.29826, vertical_speed
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	movw r20,r18	 ; 
	movw r24,r14	 ; , D.29826
	movw r22,r12	 ; , D.29826
	call __gtsf2	 ; 
	cp __zero_reg__,r24	 ; 
	brge .L382	 ; ,
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(32)	 ; ,
	ldi r21,lo8(65)	 ; ,
	movw r24,r14	 ; , D.29826
	movw r22,r12	 ; , D.29826
	rjmp .L383	 ; 
.L382:
	movw r24,r14	 ;  D.29826, D.29826
	movw r22,r12	 ;  D.29826, D.29826
	subi r25,0x80	 ;  D.29826
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(32)	 ; ,
	ldi r21,lo8(65)	 ; ,
.L383:
	call __divsf3	 ; 
	call __fixsfsi	 ; 
	cpi r17,lo8(1)	 ;  D.29829,
	brne .L348	 ; ,
	lds r24,sets+4	 ;  D.29829, sets.stall
	tst r24	 ;  D.29829
	breq .L348	 ; ,
	ldi r25,0	 ;  D.29830
	cp r24,r22	 ;  D.29830, iVs
	cpc r25,r23	 ;  D.29830, iVs
	brge .L348	 ; ,
	ori r28,lo8(32)	 ;  wmask,
	rjmp .L349	 ; 
.L348:
	cpse r28,__zero_reg__	 ;  wmask,
	rjmp .L349	 ; 
	sts warning,__zero_reg__	 ;  warning,
	rjmp .L350	 ; 
.L349:
	lds r18,warning	 ;  prev_warn, warning
	ldi r24,lo8(1)	 ;  tmp136,
	cpse r18,__zero_reg__	 ;  prev_warn
	add r24,r18	 ;  D.29829, prev_warn
.L384:
	sts warning,r24	 ;  warning, D.29829
	lds r25,warning	 ;  D.29829, warning
	ldi r19,lo8(-1)	 ;  D.29830,
	add r19,r25	 ;  D.29830, D.29829
	ldi r24,lo8(1)	 ;  tmp158,
	rjmp 2f
	1:
	lsl r24	 ;  tmp157
	2:
	dec r19	 ;  D.29830
	brpl 1b
	ldi r19,0	 ;  warning_lsm.891
.L355:
	cpi r25,lo8(7)	 ;  D.29829,
	brlo .L353	 ; ,
	mov r19,r29	 ;  warning_lsm.891, D.29823
	ldi r25,lo8(1)	 ;  D.29829,
	ldi r24,lo8(1)	 ;  bit,
.L353:
	mov r20,r24	 ;  D.29829, bit
	and r20,r28	 ;  D.29829, wmask
	brne .L354	 ; ,
	subi r25,lo8(-(1))	 ;  D.29829,
	lsl r24	 ;  bit
	mov r19,r29	 ;  warning_lsm.891, D.29823
	rjmp .L355	 ; 
.L354:
	cpse r19,__zero_reg__	 ;  warning_lsm.891
	sts warning,r25	 ;  warning, D.29829
.L356:
	lds r24,warning	 ;  warning, warning
	cpse r18,r24	 ;  prev_warn, warning
	rjmp .L357	 ; 
	sts warning,__zero_reg__	 ;  warning,
	rjmp .L357	 ; 
.L350:
	lds r24,lflags	 ;  lflags.canswitch, lflags.canswitch
	ori r24,lo8(1<<1)	 ;  lflags.canswitch,
.L385:
	sts lflags,r24	 ;  lflags.canswitch, lflags.canswitch
	rjmp .L336	 ; 
.L357:
	lds r24,sets+7	 ;  sets.auto_screen_switch, sets.auto_screen_switch
	cpi r24,lo8(3)	 ;  sets.auto_screen_switch,
	brsh .L350	 ; ,
	lds r24,lflags	 ;  lflags.canswitch, lflags.canswitch
	andi r24,lo8(~(1<<1))	 ;  lflags.canswitch,
	rjmp .L385	 ; 
.L336:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	ret
	.size	_Z10check_warnv, .-_Z10check_warnv
	.section	.text._Z7panWarn5Point,"ax",@progbits
.global	_Z7panWarn5Point
	.type	_Z7panWarn5Point, @function
_Z7panWarn5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	call _Z12osd_setPanel5Point	 ; 
	call _Z10check_warnv	 ; 
	lds r30,warning	 ;  warning, warning
	ldi r31,0	 ;  D.29836
	lsl r30	 ;  tmp49
	rol r31	 ;  tmp49
	subi r30,lo8(-(_ZL8warn_str))	 ;  tmp50,
	sbci r31,hi8(-(_ZL8warn_str))	 ;  tmp50,
	ld r22,Z	 ;  w, warn_str
	ldd r23,Z+1	 ;  w, warn_str
	cp r22,__zero_reg__	 ;  w
	cpc r23,__zero_reg__	 ;  w
	breq .L386	 ; ,
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	jmp _ZN12BetterStream7print_PEPKc	 ; 
.L386:
	ret
	.size	_Z7panWarn5Point, .-_Z7panWarn5Point
	.section	.text._Z13osd_print_batPKcf,"ax",@progbits
.global	_Z13osd_print_batPKcf
	.type	_Z13osd_print_batPKcf, @function
_Z13osd_print_batPKcf:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	push r23	 ;  f
	push r22	 ;  f
	push r21	 ;  f
	push r20	 ;  f
	ldi r30,lo8(_ZL17osd_battery_pic_A)	 ;  tmp52,
	ldi r31,hi8(_ZL17osd_battery_pic_A)	 ; ,
	ldd r18,Z+1	 ;  osd_battery_pic_A, osd_battery_pic_A
	push __zero_reg__
	push r18	 ;  osd_battery_pic_A
	ld r18,Z	 ;  osd_battery_pic_A, osd_battery_pic_A
	push __zero_reg__
	push r18	 ;  osd_battery_pic_A
	push r25	 ;  fmt
	push r24	 ;  fmt
	ldi r24,lo8(osd)	 ;  tmp64,
	ldi r25,hi8(osd)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp64
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	in r24,__SP_L__	 ; 
	in r25,__SP_H__	 ; 
	adiw r24,12	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ; 
	ret
	.size	_Z13osd_print_batPKcf, .-_Z13osd_print_batPKcf
	.section	.text._Z17panBatteryPercent5Point,"ax",@progbits
.global	_Z17panBatteryPercent5Point
	.type	_Z17panBatteryPercent5Point, @function
_Z17panBatteryPercent5Point:
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
	 ; SP -= 4	 ; 
	rcall .
	rcall .
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
/* prologue: function */
/* frame size = 4 */
/* stack size = 8 */
.L__stack_usage = 8
	mov r16,r24	 ;  p, p
	lds r24,flags	 ;  flags, flags
	mov r17,r24	 ;  D.29843, flags
	andi r17,1	 ;  D.29843
	sbrs r24,0	 ;  flags,
	rjmp .L390	 ; 
	lds r22,_ZL23osd_battery_remaining_A	 ;  osd_battery_remaining_A, osd_battery_remaining_A
	ldi r23,0	 ;  osd_battery_remaining_A
	ldi r24,0	 ;  osd_battery_remaining_A
	ldi r25,0	 ;  osd_battery_remaining_A
	call __floatunsisf	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-128)	 ; ,
	ldi r21,lo8(59)	 ; ,
	call __mulsf3	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-56)	 ; ,
	ldi r21,lo8(66)	 ; ,
	call __mulsf3	 ; 
	movw r20,r22	 ;  val,
	movw r22,r24	 ;  val,
	rjmp .L391	 ; 
.L390:
	lds r20,_ZL8mah_used	 ;  val, mah_used
	lds r21,_ZL8mah_used+1	 ;  val, mah_used
	lds r22,_ZL8mah_used+2	 ;  val, mah_used
	lds r23,_ZL8mah_used+3	 ;  val, mah_used
.L391:
	sbrc r16,7	 ;  p,
	rjmp .L392	 ; 
	ldi r24,lo8(-120)	 ; ,
	std Y+1,r20	 ; ,
	std Y+2,r21	 ; ,
	std Y+3,r22	 ; ,
	std Y+4,r23	 ; ,
	call _ZN3OSD6writebEh	 ; 
	lds r24,flags	 ;  flags, flags
	ldd r20,Y+1	 ; ,
	ldd r21,Y+2	 ; ,
	ldd r22,Y+3	 ; ,
	ldd r23,Y+4	 ; ,
	sbrs r24,0	 ;  flags,
	rjmp .L393	 ; 
	ldi r24,lo8(_ZZ17panBatteryPercent5PointE3__c)	 ; ,
	ldi r25,hi8(_ZZ17panBatteryPercent5PointE3__c)	 ; ,
	rjmp .L395	 ; 
.L393:
	ldi r24,lo8(_ZZ17panBatteryPercent5PointE3__c_0)	 ; ,
	ldi r25,hi8(_ZZ17panBatteryPercent5PointE3__c_0)	 ; ,
.L395:
/* epilogue start */
	 ; SP += 4	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	jmp _Z13osd_print_batPKcf	 ; 
.L392:
	tst r17	 ;  D.29843
	breq .L394	 ; ,
	ldi r24,lo8(_ZZ17panBatteryPercent5PointE3__c_1)	 ; ,
	ldi r25,hi8(_ZZ17panBatteryPercent5PointE3__c_1)	 ; ,
	rjmp .L396	 ; 
.L394:
	ldi r24,lo8(_ZZ17panBatteryPercent5PointE3__c_2)	 ; ,
	ldi r25,hi8(_ZZ17panBatteryPercent5PointE3__c_2)	 ; ,
.L396:
/* epilogue start */
	 ; SP += 4	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	jmp _Z12osd_printf_1PKcf	 ; 
	.size	_Z17panBatteryPercent5Point, .-_Z17panBatteryPercent5Point
	.section	.text._Z9printVoltj,"ax",@progbits
.global	_Z9printVoltj
	.type	_Z9printVoltj, @function
_Z9printVoltj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r22,r24	 ;  v, v
	ldi r24,0	 ;  v
	ldi r25,0	 ;  v
	call __floatunsisf	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(122)	 ; ,
	ldi r21,lo8(68)	 ; ,
	call __divsf3	 ; 
	movw r20,r22	 ;  D.29850,
	movw r22,r24	 ;  D.29850,
	ldi r24,lo8(_ZZ9printVoltjE3__c)	 ; ,
	ldi r25,hi8(_ZZ9printVoltjE3__c)	 ; ,
	jmp _Z12osd_printf_1PKcf	 ; 
	.size	_Z9printVoltj, .-_Z9printVoltj
	.section	.text._Z9panBatt_A5Point,"ax",@progbits
.global	_Z9panBatt_A5Point
	.type	_Z9panBatt_A5Point, @function
_Z9panBatt_A5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbrc r24,7	 ;  p,
	rjmp .L399	 ; 
	ldi r24,lo8(-68)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L399:
	lds r24,_ZL10osd_vbat_A	 ; , osd_vbat_A
	lds r25,_ZL10osd_vbat_A+1	 ; , osd_vbat_A
	jmp _Z9printVoltj	 ; 
	.size	_Z9panBatt_A5Point, .-_Z9panBatt_A5Point
	.section	.text._Z9panBatt_B5Point,"ax",@progbits
.global	_Z9panBatt_B5Point
	.type	_Z9panBatt_B5Point, @function
_Z9panBatt_B5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbrc r24,7	 ;  p,
	rjmp .L401	 ; 
	ldi r24,lo8(38)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L401:
	lds r24,_ZL10osd_vbat_B	 ; , osd_vbat_B
	lds r25,_ZL10osd_vbat_B+1	 ; , osd_vbat_B
	jmp _Z9printVoltj	 ; 
	.size	_Z9panBatt_B5Point, .-_Z9panBatt_B5Point
	.section	.text._Z15panWaitMAVBeatsv,"ax",@progbits
.global	_Z15panWaitMAVBeatsv
	.type	_Z15panWaitMAVBeatsv, @function
_Z15panWaitMAVBeatsv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r22,lo8(9)	 ; ,
	ldi r24,lo8(5)	 ; ,
	call _ZN3OSD8setPanelEhh	 ; 
	ldi r22,lo8(_ZZ15panWaitMAVBeatsvE3__c)	 ; ,
	ldi r23,hi8(_ZZ15panWaitMAVBeatsvE3__c)	 ; ,
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	jmp _ZN12BetterStream7print_PEPKc	 ; 
	.size	_Z15panWaitMAVBeatsv, .-_Z15panWaitMAVBeatsv
	.section	.text._Z9print_GPSPKc,"ax",@progbits
.global	_Z9print_GPSPKc
	.type	_Z9print_GPSPKc, @function
_Z9print_GPSPKc:
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	mov r15,r24	 ;  f, f
	mov r14,r25	 ;  f, f
	lds r28,osd_pos+4	 ;  D.29865, osd_pos.lon
	lds r29,osd_pos+5	 ;  D.29865, osd_pos.lon
	lds r17,osd_pos+6	 ;  D.29865, osd_pos.lon
	lds r16,osd_pos+7	 ;  D.29865, osd_pos.lon
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	movw r20,r18	 ; 
	movw r30,r16	 ; ,
	mov r22,r28	 ;  tmp76, D.29865
	mov r23,r29	 ; , D.29865
	mov r24,r31	 ; , D.29865
	mov r25,r30	 ; , D.29865
	call __nesf2	 ; 
	cpse r24,__zero_reg__	 ; ,
	rjmp .L404	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	movw r20,r18	 ; 
	lds r22,osd_pos	 ; , osd_pos.lat
	lds r23,osd_pos+1	 ; , osd_pos.lat
	lds r24,osd_pos+2	 ; , osd_pos.lat
	lds r25,osd_pos+3	 ; , osd_pos.lat
	call __nesf2	 ; 
	tst r24	 ; 
	breq .L403	 ; ,
.L404:
	push r16	 ;  D.29865
	push r17	 ;  D.29865
	push r29	 ;  D.29865
	push r28	 ;  D.29865
	lds r24,osd_pos+3	 ;  osd_pos.lat, osd_pos.lat
	push r24	 ;  osd_pos.lat
	lds r24,osd_pos+2	 ;  osd_pos.lat, osd_pos.lat
	push r24	 ;  osd_pos.lat
	lds r24,osd_pos+1	 ;  osd_pos.lat, osd_pos.lat
	push r24	 ;  osd_pos.lat
	lds r24,osd_pos	 ;  osd_pos.lat, osd_pos.lat
	push r24	 ;  osd_pos.lat
	push r14	 ;  f
	push r15	 ;  f
	ldi r24,lo8(osd)	 ;  tmp61,
	ldi r25,hi8(osd)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp61
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	in r24,__SP_L__	 ; 
	in r25,__SP_H__	 ; 
	adiw r24,12	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ; 
.L403:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	ret
	.size	_Z9print_GPSPKc, .-_Z9print_GPSPKc
	.section	.text._Z6panGPS5Point,"ax",@progbits
.global	_Z6panGPS5Point
	.type	_Z6panGPS5Point, @function
_Z6panGPS5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbrs r24,7	 ;  p,
	rjmp .L409	 ; 
	ldi r24,lo8(_ZZ6panGPS5PointE3__c_0)	 ;  f,
	ldi r25,hi8(_ZZ6panGPS5PointE3__c_0)	 ;  f,
	rjmp .L408	 ; 
.L409:
	ldi r24,lo8(_ZZ6panGPS5PointE3__c)	 ;  f,
	ldi r25,hi8(_ZZ6panGPS5PointE3__c)	 ;  f,
.L408:
	jmp _Z9print_GPSPKc	 ; 
	.size	_Z6panGPS5Point, .-_Z6panGPS5Point
	.section	.text._Z7panGPS25Point,"ax",@progbits
.global	_Z7panGPS25Point
	.type	_Z7panGPS25Point, @function
_Z7panGPS25Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	sbrs r24,7	 ;  p,
	rjmp .L412	 ; 
	ldi r24,lo8(_ZZ7panGPS25PointE3__c_0)	 ;  f,
	ldi r25,hi8(_ZZ7panGPS25PointE3__c_0)	 ;  f,
	rjmp .L411	 ; 
.L412:
	ldi r24,lo8(_ZZ7panGPS25PointE3__c)	 ;  f,
	ldi r25,hi8(_ZZ7panGPS25PointE3__c)	 ;  f,
.L411:
	jmp _Z9print_GPSPKc	 ; 
	.size	_Z7panGPS25Point, .-_Z7panGPS25Point
	.section	.text._Z16getTargetBearingv,"ax",@progbits
.global	_Z16getTargetBearingv
	.type	_Z16getTargetBearingv, @function
_Z16getTargetBearingv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,_ZL17wp_target_bearing	 ;  D.29876, wp_target_bearing
	lds r25,_ZL17wp_target_bearing+1	 ;  D.29876, wp_target_bearing
	sbrs r25,7	 ;  D.29876,
	rjmp .L414	 ; 
	subi r24,-104	 ;  D.29876,
	sbci r25,-2	 ;  D.29876,
	sts _ZL17wp_target_bearing+1,r25	 ;  wp_target_bearing, D.29876
	sts _ZL17wp_target_bearing,r24	 ;  wp_target_bearing, D.29876
.L414:
	lds r24,_ZL17wp_target_bearing	 ;  wp_target_bearing, wp_target_bearing
	lds r25,_ZL17wp_target_bearing+1	 ;  wp_target_bearing, wp_target_bearing
	lds r18,_ZL11osd_heading	 ;  osd_heading, osd_heading
	lds r19,_ZL11osd_heading+1	 ;  osd_heading, osd_heading
	sub r24,r18	 ; , osd_heading
	sbc r25,r19	 ; , osd_heading
	jmp _Z12grad_to_secti	 ; 
	.size	_Z16getTargetBearingv, .-_Z16getTargetBearingv
	.section	.text._Z9showArrowhh,"ax",@progbits
.global	_Z9showArrowhh
	.type	_Z9showArrowhh, @function
_Z9showArrowhh:
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
.L417:
	cpi r24,lo8(17)	 ;  rotate_arrow,
	brlo .L416	 ; ,
	subi r24,lo8(-(-16))	 ;  rotate_arrow,
	rjmp .L417	 ; 
.L416:
	cpse r24,__zero_reg__	 ;  rotate_arrow,
	rjmp .L418	 ; 
	ldi r24,lo8(16)	 ;  rotate_arrow,
.L418:
	lsl r24	 ;  D.29887
	ldi r28,lo8(-2)	 ;  D.29888,
	add r28,r24	 ;  D.29888, D.29887
	ldi r29,lo8(-112)	 ;  D.29888,
	add r29,r28	 ;  D.29888, D.29888
	cpi r22,lo8(1)	 ;  method,
	breq .L420	 ; ,
	cpi r22,lo8(2)	 ;  method,
	breq .+2	 ; 
	rjmp .L425	 ; 
	mov r24,r29	 ;  D.29887, D.29888
	mov __tmp_reg__,r29	 ; 
	lsl r0	 ; 
	sbc r25,r25	 ; 
	lds r18,_ZL10off_course+1	 ;  off_course, off_course
	push r18	 ;  off_course
	lds r18,_ZL10off_course	 ;  off_course, off_course
	push r18	 ;  off_course
	movw r18,r24	 ;  D.29887, D.29887
	subi r18,-1	 ;  D.29887,
	sbci r19,-1	 ;  D.29887,
	push r19	 ;  D.29887
	push r18	 ;  D.29887
	push r25	 ;  D.29887
	push r29	 ;  D.29888
	ldi r24,lo8(_ZZ9showArrowhhE3__c_0)	 ;  tmp118,
	ldi r25,hi8(_ZZ9showArrowhhE3__c_0)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp118
	ldi r24,lo8(osd)	 ;  tmp122,
	ldi r25,hi8(osd)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp122
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	in r24,__SP_L__	 ; 
	in r25,__SP_H__	 ; 
	adiw r24,10	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ; 
	rjmp .L415	 ; 
.L420:
	lds r30,_ZL7measure	 ;  __addr16, measure
	lds r31,_ZL7measure+1	 ;  __addr16, measure
/* #APP */
 ;  1388 "Panels.h" 1
	lpm r22, Z+	 ;  __result
	lpm r23, Z+	 ;  __result
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lds r18,_ZL13osd_windspeed	 ; , osd_windspeed
	lds r19,_ZL13osd_windspeed+1	 ; , osd_windspeed
	lds r20,_ZL13osd_windspeed+2	 ; , osd_windspeed
	lds r21,_ZL13osd_windspeed+3	 ; , osd_windspeed
	call __mulsf3	 ; 
	call _Z10printSpeedf	 ; 
	lds r24,_ZL7measure	 ;  D.29889, measure
	lds r25,_ZL7measure+1	 ;  D.29889, measure
	movw r30,r24	 ;  D.29892, D.29889
	adiw r30,8	 ;  D.29892,
/* #APP */
 ;  1389 "Panels.h" 1
	lpm r18, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	movw r30,r24	 ;  __addr16, D.29889
/* #APP */
 ;  1389 "Panels.h" 1
	lpm r22, Z+	 ;  __result
	lpm r23, Z+	 ;  __result
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	mov r16,r29	 ;  D.29887, D.29888
	mov __tmp_reg__,r29	 ; 
	lsl r0	 ; 
	sbc r17,r17	 ; 
	push __zero_reg__
	push r18	 ;  __result
	lds r18,_ZL17nor_osd_windspeed	 ; , nor_osd_windspeed
	lds r19,_ZL17nor_osd_windspeed+1	 ; , nor_osd_windspeed
	lds r20,_ZL17nor_osd_windspeed+2	 ; , nor_osd_windspeed
	lds r21,_ZL17nor_osd_windspeed+3	 ; , nor_osd_windspeed
	call __mulsf3	 ; 
	push r25	 ; 
	push r24	 ; 
	push r23	 ;  D.29891
	push r22	 ;  D.29891
	movw r24,r16	 ;  D.29887, D.29887
	adiw r24,1	 ;  D.29887,
	push r25	 ;  D.29887
	push r24	 ;  D.29887
	push r17	 ;  D.29887
	push r29	 ;  D.29888
	ldi r24,lo8(_ZZ9showArrowhhE3__c)	 ;  tmp103,
	ldi r25,hi8(_ZZ9showArrowhhE3__c)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp103
	ldi r24,lo8(osd)	 ;  tmp107,
	ldi r25,hi8(osd)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp107
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	in r24,__SP_L__	 ; 
	in r25,__SP_H__	 ; 
	adiw r24,14	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ; 
	rjmp .L415	 ; 
.L425:
	mov r24,r29	 ; , D.29888
	call _ZN3OSD6writebEh	 ; 
	ldi r24,lo8(-111)	 ; ,
	add r24,r28	 ; , D.29888
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	jmp _ZN3OSD6writebEh	 ; 
.L415:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	ret
	.size	_Z9showArrowhh, .-_Z9showArrowhh
	.section	.text._Z6panCOG5Point,"ax",@progbits
.global	_Z6panCOG5Point
	.type	_Z6panCOG5Point, @function
_Z6panCOG5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,_ZL7osd_cog	 ;  osd_cog, osd_cog
	lds r25,_ZL7osd_cog+1	 ;  osd_cog, osd_cog
	adiw r24,50	 ;  D.29902,
	ldi r22,lo8(100)	 ; ,
	ldi r23,0	 ; 
	call __udivmodhi4
	lds r24,_ZL11osd_heading	 ;  osd_heading, osd_heading
	lds r25,_ZL11osd_heading+1	 ;  osd_heading, osd_heading
	sub r22,r24	 ;  D.29902, osd_heading
	sbc r23,r25	 ;  D.29902, osd_heading
	cpi r22,-75	 ;  D.29902,
	cpc r23,__zero_reg__	 ;  D.29902
	brlt .L427	 ; ,
	subi r22,104	 ;  D.29903,
	sbci r23,1	 ;  D.29903,
	rjmp .L429	 ; 
.L427:
	cpi r22,76	 ;  D.29902,
	ldi r24,-1	 ; ,
	cpc r23,r24	 ;  D.29902,
	brge .L429	 ; ,
	subi r22,-104	 ;  D.29903,
	sbci r23,-2	 ;  D.29903,
.L429:
	sts _ZL10off_course+1,r23	 ;  off_course, D.29902
	sts _ZL10off_course,r22	 ;  off_course, D.29902
	lds r24,_ZL10off_course	 ; , off_course
	lds r25,_ZL10off_course+1	 ; , off_course
	call _Z12grad_to_secti	 ; 
	ldi r22,lo8(2)	 ; ,
	jmp _Z9showArrowhh	 ; 
	.size	_Z6panCOG5Point, .-_Z6panCOG5Point
	.section	.text._Z12panWindSpeed5Point,"ax",@progbits
.global	_Z12panWindSpeed5Point
	.type	_Z12panWindSpeed5Point, @function
_Z12panWindSpeed5Point:
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	sbrc r24,7	 ;  p,
	rjmp .L431	 ; 
	ldi r24,lo8(29)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L431:
	lds r28,_ZL17osd_winddirection	 ;  dir, osd_winddirection
	lds r29,_ZL17osd_winddirection+1	 ;  dir, osd_winddirection
	sbrs r29,7	 ;  dir,
	rjmp .L432	 ; 
	subi r28,-104	 ;  dir,
	sbci r29,-2	 ;  dir,
.L432:
	ldi r18,lo8(10)	 ; ,
	ldi r19,lo8(-41)	 ; ,
	ldi r20,lo8(35)	 ; ,
	ldi r21,lo8(60)	 ; ,
	lds r22,_ZL13osd_windspeed	 ; , osd_windspeed
	lds r23,_ZL13osd_windspeed+1	 ; , osd_windspeed
	lds r24,_ZL13osd_windspeed+2	 ; , osd_windspeed
	lds r25,_ZL13osd_windspeed+3	 ; , osd_windspeed
	call __mulsf3	 ; 
	movw r12,r22	 ;  D.29909,
	movw r14,r24	 ;  D.29909,
	ldi r18,lo8(-92)	 ; ,
	ldi r19,lo8(112)	 ; ,
	ldi r20,lo8(125)	 ; ,
	ldi r21,lo8(63)	 ; ,
	lds r22,_ZL17nor_osd_windspeed	 ; , nor_osd_windspeed
	lds r23,_ZL17nor_osd_windspeed+1	 ; , nor_osd_windspeed
	lds r24,_ZL17nor_osd_windspeed+2	 ; , nor_osd_windspeed
	lds r25,_ZL17nor_osd_windspeed+3	 ; , nor_osd_windspeed
	call __mulsf3	 ; 
	movw r18,r22	 ;  D.29909,
	movw r20,r24	 ;  D.29909,
	movw r24,r14	 ; , D.29909
	movw r22,r12	 ; , D.29909
	call __addsf3	 ; 
	sts _ZL17nor_osd_windspeed,r22	 ;  nor_osd_windspeed, D.29909
	sts _ZL17nor_osd_windspeed+1,r23	 ;  nor_osd_windspeed, D.29909
	sts _ZL17nor_osd_windspeed+2,r24	 ;  nor_osd_windspeed, D.29909
	sts _ZL17nor_osd_windspeed+3,r25	 ;  nor_osd_windspeed, D.29909
	lds r24,_ZL11osd_heading	 ;  osd_heading, osd_heading
	lds r25,_ZL11osd_heading+1	 ;  osd_heading, osd_heading
	movw r18,r28	 ; , dir
	sub r18,r24	 ; , osd_heading
	sbc r19,r25	 ; , osd_heading
	movw r24,r18	 ; ,
	call _Z12grad_to_secti	 ; 
	ldi r22,lo8(1)	 ; ,
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	jmp _Z9showArrowhh	 ; 
	.size	_Z12panWindSpeed5Point, .-_Z12panWindSpeed5Point
	.section	.text._Z8panWPDir5Point,"ax",@progbits
.global	_Z8panWPDir5Point
	.type	_Z8panWPDir5Point, @function
_Z8panWPDir5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,_ZL9wp_number	 ;  wp_number, wp_number
	tst r24	 ;  wp_number
	breq .L433	 ; ,
	call _Z16getTargetBearingv	 ; 
	ldi r22,0	 ; 
	jmp _Z9showArrowhh	 ; 
.L433:
	ret
	.size	_Z8panWPDir5Point, .-_Z8panWPDir5Point
	.section	.text._Z8panWPDis5Point,"ax",@progbits
.global	_Z8panWPDis5Point
	.type	_Z8panWPDis5Point, @function
_Z8panWPDis5Point:
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
	 ; SP -= 4	 ; 
	rcall .
	rcall .
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
/* prologue: function */
/* frame size = 4 */
/* stack size = 7 */
.L__stack_usage = 7
	sbrc r24,7	 ;  p,
	rjmp .L436	 ; 
	ldi r24,lo8(92)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L436:
	lds r24,_ZL12xtrack_error	 ;  xtrack_error, xtrack_error
	lds r25,_ZL12xtrack_error+1	 ;  xtrack_error, xtrack_error
	cpi r24,-24	 ;  xtrack_error,
	sbci r25,3	 ;  xtrack_error,
	brlt .L437	 ; ,
	ldi r24,lo8(-25)	 ;  tmp71,
	ldi r25,lo8(3)	 ; ,
	sts _ZL12xtrack_error+1,r25	 ;  xtrack_error, tmp71
	sts _ZL12xtrack_error,r24	 ;  xtrack_error, tmp71
.L437:
	lds r24,_ZL12xtrack_error	 ;  xtrack_error, xtrack_error
	lds r25,_ZL12xtrack_error+1	 ;  xtrack_error, xtrack_error
	cpi r24,25	 ;  xtrack_error,
	sbci r25,-4	 ;  xtrack_error,
	brge .L438	 ; ,
	ldi r24,lo8(25)	 ;  tmp73,
	ldi r25,lo8(-4)	 ; ,
	sts _ZL12xtrack_error+1,r25	 ;  xtrack_error, tmp73
	sts _ZL12xtrack_error,r24	 ;  xtrack_error, tmp73
.L438:
	lds r24,_ZL7measure	 ;  D.29920, measure
	lds r25,_ZL7measure+1	 ;  D.29920, measure
	movw r30,r24	 ;  D.29921, D.29920
	adiw r30,9	 ;  D.29921,
/* #APP */
 ;  1145 "Panels.h" 1
	lpm r17, Z	 ;  h
	
 ;  0 "" 2
/* #NOAPP */
	sbiw r30,5	 ;  __addr16,
/* #APP */
 ;  1147 "Panels.h" 1
	lpm r18, Z+	 ;  __result
	lpm r19, Z+	 ;  __result
	lpm r20, Z+	 ;  __result
	lpm r21, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	push __zero_reg__
	push r17	 ;  h
	lds r22,_ZL7wp_dist	 ;  wp_dist, wp_dist
	lds r23,_ZL7wp_dist+1	 ;  wp_dist, wp_dist
	ldi r24,0	 ;  wp_dist
	ldi r25,0	 ;  wp_dist
	std Y+1,r18	 ; ,
	std Y+2,r19	 ; ,
	std Y+3,r20	 ; ,
	std Y+4,r21	 ; ,
	call __floatunsisf	 ; 
	ldd r18,Y+1	 ; ,
	ldd r19,Y+2	 ; ,
	ldd r20,Y+3	 ; ,
	ldd r21,Y+4	 ; ,
	call __mulsf3	 ; 
	push r25	 ; 
	push r24	 ; 
	push r23	 ;  D.29923
	push r22	 ;  D.29923
	lds r24,_ZL9wp_number	 ;  wp_number, wp_number
	push __zero_reg__
	push r24	 ;  wp_number
	ldi r24,lo8(_ZZ8panWPDis5PointE3__c)	 ;  tmp93,
	ldi r25,hi8(_ZZ8panWPDis5PointE3__c)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp93
	ldi r24,lo8(osd)	 ;  tmp97,
	ldi r25,hi8(osd)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp97
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	call _Z16getTargetBearingv	 ; 
	ldi r22,0	 ; 
	call _Z9showArrowhh	 ; 
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; 
	lds r24,_ZL8osd_mode	 ;  osd_mode, osd_mode
	cpi r24,lo8(10)	 ;  osd_mode,
	brne .L435	 ; ,
	lds r30,_ZL7measure	 ;  measure, measure
	lds r31,_ZL7measure+1	 ;  measure, measure
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  1151 "Panels.h" 1
	lpm r18, Z+	 ;  __result
	lpm r19, Z+	 ;  __result
	lpm r20, Z+	 ;  __result
	lpm r21, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lds r22,_ZL12xtrack_error	 ;  xtrack_error, xtrack_error
	lds r23,_ZL12xtrack_error+1	 ;  xtrack_error, xtrack_error
	mov __tmp_reg__,r23	 ; 
	lsl r0	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	std Y+1,r18	 ; ,
	std Y+2,r19	 ; ,
	std Y+3,r20	 ; ,
	std Y+4,r21	 ; ,
	call __floatsisf	 ; 
	ldd r18,Y+1	 ; ,
	ldd r19,Y+2	 ; ,
	ldd r20,Y+3	 ; ,
	ldd r21,Y+4	 ; ,
	call __mulsf3	 ; 
	movw r20,r22	 ;  D.29923,
	movw r22,r24	 ;  D.29923,
	mov r18,r17	 ; , h
	ldi r24,lo8(_ZZ8panWPDis5PointE3__c_0)	 ; ,
	ldi r25,hi8(_ZZ8panWPDis5PointE3__c_0)	 ; ,
/* epilogue start */
	 ; SP += 4	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	jmp _Z12osd_printf_2PKcfh	 ; 
.L435:
/* epilogue start */
	 ; SP += 4	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	ret
	.size	_Z8panWPDis5Point, .-_Z8panWPDis5Point
	.section	.text._Z10panHomeDir5Point,"ax",@progbits
.global	_Z10panHomeDir5Point
	.type	_Z10panHomeDir5Point, @function
_Z10panHomeDir5Point:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,lflags+1	 ;  lflags, lflags
	sbrs r24,7	 ;  lflags,
	rjmp .L440	 ; 
	ldi r22,0	 ; 
	lds r24,_ZL18osd_home_direction	 ; , osd_home_direction
	jmp _Z9showArrowhh	 ; 
.L440:
	ret
	.size	_Z10panHomeDir5Point, .-_Z10panHomeDir5Point
	.section	.text._Z11showHorizonhh,"ax",@progbits
.global	_Z11showHorizonhh
	.type	_Z11showHorizonhh, @function
_Z11showHorizonhh:
	push r2	 ; 
	push r3	 ; 
	push r4	 ; 
	push r5	 ; 
	push r6	 ; 
	push r7	 ; 
	push r8	 ; 
	push r9	 ; 
	push r10	 ; 
	push r11	 ; 
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
	 ; SP -= 4	 ; 
	rcall .
	rcall .
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
/* prologue: function */
/* frame size = 4 */
/* stack size = 22 */
.L__stack_usage = 22
	mov r15,r24	 ;  start_col, start_col
	mov r9,r22	 ;  start_row, start_row
	call _ZN3OSD7getModeEv	 ; 
	ldi r18,lo8(-89)	 ; ,
	ldi r19,lo8(-110)	 ; ,
	ldi r20,lo8(43)	 ; ,
	ldi r21,lo8(60)	 ; ,
	cpse r24,__zero_reg__	 ; ,
	rjmp .L443	 ; 
	lds r22,sets+54	 ; , sets.horiz_kRoll_a
	lds r23,sets+54+1	 ; , sets.horiz_kRoll_a
	lds r24,sets+54+2	 ; , sets.horiz_kRoll_a
	lds r25,sets+54+3	 ; , sets.horiz_kRoll_a
	call __mulsf3	 ; 
	movw r10,r22	 ;  AH_PITCH_FACTOR,
	movw r12,r24	 ;  AH_PITCH_FACTOR,
	ldi r18,lo8(53)	 ; ,
	ldi r19,lo8(-6)	 ; ,
	ldi r20,lo8(-114)	 ; ,
	ldi r21,lo8(60)	 ; ,
	lds r22,sets+58	 ; , sets.horiz_kPitch_a
	lds r23,sets+58+1	 ; , sets.horiz_kPitch_a
	lds r24,sets+58+2	 ; , sets.horiz_kPitch_a
	lds r25,sets+58+3	 ; , sets.horiz_kPitch_a
	rjmp .L468	 ; 
.L443:
	lds r22,sets+46	 ; , sets.horiz_kRoll
	lds r23,sets+46+1	 ; , sets.horiz_kRoll
	lds r24,sets+46+2	 ; , sets.horiz_kRoll
	lds r25,sets+46+3	 ; , sets.horiz_kRoll
	call __mulsf3	 ; 
	movw r10,r22	 ;  AH_PITCH_FACTOR,
	movw r12,r24	 ;  AH_PITCH_FACTOR,
	ldi r18,lo8(53)	 ; ,
	ldi r19,lo8(-6)	 ; ,
	ldi r20,lo8(-114)	 ; ,
	ldi r21,lo8(60)	 ; ,
	lds r22,sets+50	 ; , sets.horiz_kPitch
	lds r23,sets+50+1	 ; , sets.horiz_kPitch
	lds r24,sets+50+2	 ; , sets.horiz_kPitch
	lds r25,sets+50+3	 ; , sets.horiz_kPitch
.L468:
	call __mulsf3	 ; 
	movw r4,r22	 ;  AH_ROLL_FACTOR,
	movw r6,r24	 ;  AH_ROLL_FACTOR,
	lds r24,osd_att+2	 ;  roll, osd_att.roll
	lds r25,osd_att+2+1	 ;  roll, osd_att.roll
	cpi r24,90	 ;  roll,
	cpc r25,__zero_reg__	 ;  roll
	brlo .L445	 ; ,
	movw r18,r24	 ;  D.29953, roll
	subi r18,77	 ;  D.29953,
	sbci r19,-1	 ;  D.29953,
	cpi r18,89	 ;  D.29953,
	cpc r19,__zero_reg__	 ;  D.29953
	brsh .L446	 ; ,
	movw r24,r18	 ;  roll, D.29953
.L445:
	cpi r24,26	 ;  roll,
	cpc r25,__zero_reg__	 ;  roll
	brge .L458	 ; ,
	sbiw r24,10	 ;  roll,
	brlt .L461	 ; ,
	ldi r16,lo8(8)	 ;  subval_overflow,
	ldi r30,lo8(-13)	 ; ,
	mov r14,r30	 ;  line_set_overflow,
	ldi r17,lo8(-48)	 ;  line_set,
	rjmp .L447	 ; 
.L446:
	cpi r24,91	 ;  roll,
	cpc r25,__zero_reg__	 ;  roll
	brlt .L448	 ; ,
	subi r24,-77	 ;  roll,
	sbc r25,__zero_reg__	 ;  roll
.L448:
	sbrs r25,7	 ;  roll,
	rjmp .L449	 ; 
	neg r25	 ;  roll
	neg r24	 ;  roll
	sbc r25,__zero_reg__	 ;  roll
.L449:
	cpi r24,26	 ;  roll,
	cpc r25,__zero_reg__	 ;  roll
	brge .L460	 ; ,
	sbiw r24,10	 ;  roll,
	brlt .L461	 ; ,
	ldi r16,lo8(8)	 ;  subval_overflow,
	ldi r23,lo8(-11)	 ; ,
	mov r14,r23	 ;  line_set_overflow,
	ldi r17,lo8(-30)	 ;  line_set,
	rjmp .L447	 ; 
.L458:
	ldi r16,lo8(7)	 ;  subval_overflow,
	ldi r22,lo8(-8)	 ; ,
	mov r14,r22	 ;  line_set_overflow,
	ldi r17,lo8(-39)	 ;  line_set,
	rjmp .L447	 ; 
.L460:
	ldi r16,lo8(7)	 ;  subval_overflow,
	ldi r21,lo8(-5)	 ; ,
	mov r14,r21	 ;  line_set_overflow,
	ldi r17,lo8(-21)	 ;  line_set,
	rjmp .L447	 ; 
.L461:
	ldi r16,lo8(9)	 ;  subval_overflow,
	ldi r20,lo8(-51)	 ; ,
	mov r14,r20	 ;  line_set_overflow,
	ldi r17,lo8(-58)	 ;  line_set,
.L447:
	lds r22,osd_att	 ;  osd_att.pitch, osd_att.pitch
	lds r23,osd_att+1	 ;  osd_att.pitch, osd_att.pitch
	mov __tmp_reg__,r23	 ; 
	lsl r0	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	movw r20,r12	 ;  D.29952, AH_PITCH_FACTOR
	movw r18,r10	 ;  D.29952, AH_PITCH_FACTOR
	subi r21,0x80	 ;  D.29952
	call __mulsf3	 ; 
	call tan	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-96)	 ; ,
	ldi r21,lo8(64)	 ; ,
	call __mulsf3	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-112)	 ; ,
	ldi r21,lo8(65)	 ; ,
	call __mulsf3	 ; 
	movw r10,r22	 ;  tmp124,
	movw r12,r24	 ;  tmp124,
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	movw r20,r18	 ; 
	call __gesf2	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,0	 ; 
	ldi r21,lo8(63)	 ; ,
	sbrc r24,7	 ; ,
	rjmp .L467	 ; 
	movw r24,r12	 ; , tmp124
	movw r22,r10	 ; , tmp124
	call __addsf3	 ; 
	rjmp .L469	 ; 
.L467:
	movw r24,r12	 ; , tmp124
	movw r22,r10	 ; , tmp124
	call __subsf3	 ; 
.L469:
	call __fixsfsi	 ; 
	ldi r25,lo8(45)	 ; ,
	mov r8,r25	 ;  pitch_line,
	add r8,r22	 ;  pitch_line, D.29955
	ldi r18,lo8(-66)	 ; ,
	mov r12,r18	 ;  ivtmp.943,
	clr r13	 ;  ivtmp.943
	dec r13	 ;  ivtmp.943
	ldi r19,lo8(18)	 ; ,
	mov r10,r19	 ;  tmp171,
	mov r11,__zero_reg__	 ; 
	mov r2,r16	 ;  D.29951, subval_overflow
	lsl r16	 ; 
	sbc r3,r3	 ; 
	ldi r16,lo8(-6)	 ;  D.29950,
	add r16,r14	 ;  D.29950, line_set_overflow
.L457:
	lds r22,osd_att+2	 ;  osd_att.roll, osd_att.roll
	lds r23,osd_att+2+1	 ;  osd_att.roll, osd_att.roll
	mov __tmp_reg__,r23	 ; 
	lsl r0	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	movw r20,r6	 ; , AH_ROLL_FACTOR
	movw r18,r4	 ; , AH_ROLL_FACTOR
	call __mulsf3	 ; 
	call tan	 ; 
	movw r18,r22	 ;  D.29954,
	movw r20,r24	 ;  D.29954,
	movw r22,r12	 ;  ivtmp.943, ivtmp.943
	mov __tmp_reg__,r13	 ; 
	lsl r0	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	std Y+3,r18	 ; ,
	std Y+4,r19	 ; ,
	std Y+1,r20	 ; ,
	std Y+2,r21	 ; ,
	call __floatsisf	 ; 
	ldd r18,Y+3	 ; ,
	ldd r19,Y+4	 ; ,
	ldd r20,Y+1	 ; ,
	ldd r21,Y+2	 ; ,
	call __mulsf3	 ; 
	call __fixsfsi	 ; 
	add r22,r8	 ;  D.29956, pitch_line
	ldi r24,lo8(-1)	 ;  D.29956,
	add r24,r22	 ;  D.29956, D.29956
	cpi r24,lo8(90)	 ;  D.29956,
	brsh .L454	 ; ,
	mov r30,r22	 ;  D.29951, D.29956
	ldi r31,0	 ;  D.29951
	movw r24,r30	 ;  D.29951, D.29951
	sbiw r24,1	 ;  D.29951,
	movw r22,r10	 ; , tmp171
	call __divmodhi4
	mov r14,r22	 ;  row, tmp142
	ldi r18,lo8(-18)	 ; ,
	mulsu r18,r22	 ; , tmp142
	movw r20,r0	 ;  D.29951
	mul r18,r23	 ; , tmp142
	add r21,r0	 ;  D.29951
	clr __zero_reg__
	add r20,r30	 ;  D.29951, D.29951
	adc r21,r31	 ;  D.29951, D.29951
	subi r20,-1	 ;  D.29951,
	sbci r21,-1	 ;  D.29951,
	sbrs r21,7	 ;  D.29951,
	rjmp .L455	 ; 
	subi r20,-1	 ;  D.29951,
	sbci r21,-1	 ;  D.29951,
.L455:
	movw r18,r20	 ;  tmp150, D.29951
	asr r19	 ;  tmp150
	ror r18	 ;  tmp150
	mov r25,r9	 ;  D.29950, start_row
	sub r25,r22	 ;  D.29950, tmp142
	mov r20,r18	 ;  D.29950,
	add r20,r17	 ;  D.29950, line_set
	ldi r22,lo8(4)	 ;  D.29950,
	add r22,r25	 ;  D.29950, D.29950
	mov r24,r15	 ; , ivtmp.945
	std Y+3,r18	 ; ,
	std Y+4,r19	 ; ,
	std Y+1,r25	 ; ,
	call _ZN3OSD8write_xyEhhh	 ; 
	ldd r18,Y+3	 ; ,
	ldd r19,Y+4	 ; ,
	ldd r25,Y+1	 ; ,
	cp r18,r2	 ;  tmp150, D.29951
	cpc r19,r3	 ;  tmp150, D.29951
	brlt .L454	 ; ,
	ldi r24,lo8(4)	 ; ,
	cp r14,r24	 ;  row,
	breq .L454	 ; ,
	mov r20,r18	 ;  D.29950,
	add r20,r16	 ;  D.29950, D.29950
	ldi r22,lo8(3)	 ;  D.29950,
	add r22,r25	 ;  D.29950, D.29950
	mov r24,r15	 ; , ivtmp.945
	call _ZN3OSD8write_xyEhhh	 ; 
.L454:
	ldi r18,12	 ; ,
	add r12,r18	 ;  ivtmp.943,
	adc r13,__zero_reg__	 ;  ivtmp.943
	inc r15	 ;  ivtmp.945
	ldi r24,78	 ; ,
	cp r12,r24	 ;  ivtmp.943,
	cpc r13,__zero_reg__	 ;  ivtmp.943
	breq .+2	 ; 
	rjmp .L457	 ; 
/* epilogue start */
	 ; SP += 4	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	pop r7	 ; 
	pop r6	 ; 
	pop r5	 ; 
	pop r4	 ; 
	pop r3	 ; 
	pop r2	 ; 
	ret
	.size	_Z11showHorizonhh, .-_Z11showHorizonhh
	.section	.text._Z11setup_horizv,"ax",@progbits
.global	_Z11setup_horizv
	.type	_Z11setup_horizv, @function
_Z11setup_horizv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r22,lo8(6)	 ; ,
	ldi r24,lo8(9)	 ; ,
	jmp _Z11showHorizonhh	 ; 
	.size	_Z11setup_horizv, .-_Z11setup_horizv
	.section	.text._Z7showILShh,"ax",@progbits
.global	_Z7showILShh
	.type	_Z7showILShh, @function
_Z7showILShh:
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	mov r29,r24	 ;  start_col, start_col
	mov r28,r22	 ;  start_row, start_row
	lds r24,sets	 ;  sets.model_type, sets.model_type
	cpse r24,__zero_reg__	 ;  sets.model_type,
	rjmp .L472	 ; 
	lds r22,_ZL17osd_home_distance	 ; , osd_home_distance
	lds r23,_ZL17osd_home_distance+1	 ; , osd_home_distance
	lds r24,_ZL17osd_home_distance+2	 ; , osd_home_distance
	lds r25,_ZL17osd_home_distance+3	 ; , osd_home_distance
	call __floatsisf	 ; 
	movw r18,r22	 ;  D.29976,
	movw r20,r24	 ;  D.29976,
	lds r22,_ZL15osd_alt_to_home	 ;  osd_alt_to_home, osd_alt_to_home
	lds r23,_ZL15osd_alt_to_home+1	 ;  osd_alt_to_home, osd_alt_to_home
	lds r24,_ZL15osd_alt_to_home+2	 ;  osd_alt_to_home, osd_alt_to_home
	lds r25,_ZL15osd_alt_to_home+3	 ;  osd_alt_to_home, osd_alt_to_home
	call atan2	 ; 
	ldi r18,lo8(-31)	 ; ,
	ldi r19,lo8(46)	 ; ,
	ldi r20,lo8(101)	 ; ,
	ldi r21,lo8(66)	 ; ,
	call __mulsf3	 ; 
	call __fixsfsi	 ; 
	subi r22,10	 ;  currentAngleDisplacement,
	sbc r23,__zero_reg__	 ;  currentAngleDisplacement
	ldi r18,lo8(45)	 ;  tmp106,
	mul r18,r22	 ;  tmp106, currentAngleDisplacement
	movw r24,r0	 ;  D.29980
	mul r18,r23	 ;  tmp106, currentAngleDisplacement
	add r25,r0	 ;  D.29980
	clr __zero_reg__
	ldi r22,lo8(10)	 ; ,
	ldi r23,0	 ; 
	call __divmodhi4
	movw r24,r22	 ;  linePosition, D.29980
	adiw r24,22	 ;  linePosition,
	ldi r22,lo8(9)	 ; ,
	ldi r23,0	 ; 
	call __divmodhi4
	cpi r22,lo8(19)	 ;  D.29980,
	brsh .L473	 ; ,
	ldi r16,lo8(-48)	 ;  tmp119,
	sub r16,r24	 ;  selectedChar, tmp166
	mov r17,r28	 ;  D.29972, start_row
	add r17,r22	 ;  D.29972, D.29980
	mov r20,r16	 ; , selectedChar
	mov r22,r17	 ; , D.29972
	ldi r24,lo8(12)	 ; ,
	add r24,r29	 ; , start_col
	call _ZN3OSD8write_xyEhhh	 ; 
	mov r20,r16	 ; , selectedChar
	mov r22,r17	 ; , D.29972
	ldi r24,lo8(1)	 ; ,
	add r24,r29	 ; , start_col
	call _ZN3OSD8write_xyEhhh	 ; 
.L473:
	lds r18,_ZL18osd_home_direction	 ;  osd_home_direction, osd_home_direction
	ldi r19,0	 ;  D.29980
	lds r24,_ZL15takeoff_heading	 ;  takeoff_heading, takeoff_heading
	lds r25,_ZL15takeoff_heading+1	 ;  takeoff_heading, takeoff_heading
	sub r18,r24	 ;  currentAngleDisplacement, takeoff_heading
	sbc r19,r25	 ;  currentAngleDisplacement, takeoff_heading
	ldi r20,lo8(72)	 ;  tmp127,
	mul r20,r18	 ;  tmp127, currentAngleDisplacement
	movw r24,r0	 ;  D.29980
	mul r20,r19	 ;  tmp127, currentAngleDisplacement
	add r25,r0	 ;  D.29980
	clr __zero_reg__
	ldi r22,lo8(10)	 ; ,
	ldi r23,0	 ; 
	call __divmodhi4
	movw r24,r22	 ;  linePosition, D.29980
	adiw r24,36	 ;  linePosition,
	ldi r22,lo8(6)	 ; ,
	ldi r23,0	 ; 
	call __divmodhi4
	cpi r22,lo8(13)	 ;  D.29980,
	brlo .+2	 ; 
	rjmp .L471	 ; 
	ldi r17,lo8(-65)	 ;  selectedChar,
	add r17,r24	 ;  selectedChar, tmp170
	add r29,r22	 ;  D.29972, D.29980
	ldi r22,lo8(4)	 ;  D.29972,
	add r22,r28	 ;  D.29972, start_row
	mov r20,r17	 ; , selectedChar
	mov r24,r29	 ; , D.29972
	call _ZN3OSD8write_xyEhhh	 ; 
	ldi r22,lo8(1)	 ;  D.29972,
	add r22,r28	 ;  D.29972, start_row
	mov r20,r17	 ; , selectedChar
	mov r24,r29	 ; , D.29972
	rjmp .L478	 ; 
.L472:
	lds r30,_ZL7measure	 ;  measure, measure
	lds r31,_ZL7measure+1	 ;  measure, measure
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  1560 "Panels.h" 1
	lpm r22, Z+	 ;  __result
	lpm r23, Z+	 ;  __result
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	lds r18,_ZL11osd_alt_rel	 ; , osd_alt_rel
	lds r19,_ZL11osd_alt_rel+1	 ; , osd_alt_rel
	lds r20,_ZL11osd_alt_rel+2	 ; , osd_alt_rel
	lds r21,_ZL11osd_alt_rel+3	 ; , osd_alt_rel
	call __mulsf3	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-96)	 ; ,
	ldi r21,lo8(64)	 ; ,
	call __addsf3	 ; 
	ldi r18,lo8(-51)	 ; ,
	ldi r19,lo8(-52)	 ; ,
	ldi r20,lo8(-116)	 ; ,
	ldi r21,lo8(64)	 ; ,
	call __mulsf3	 ; 
	call __fixsfsi	 ; 
	mov r24,r22	 ;  tmp160,
	ldi r25,lo8(-1)	 ;  D.29977,
	add r25,r22	 ;  D.29977, tmp160
	cpi r25,lo8(43)	 ;  D.29977,
	brsh .L475	 ; ,
	ldi r22,lo8(9)	 ; ,
	call __divmodqi4
	ldi r20,lo8(-49)	 ;  tmp154,
	sub r20,r25	 ;  subval_char, D.29978
	add r28,r24	 ;  start_row, tmp152
	rjmp .L476	 ; 
.L475:
	cpi r22,lo8(44)	 ;  tmp160,
	brlt .L477	 ; ,
	subi r28,lo8(-(4))	 ;  start_row,
	ldi r20,lo8(46)	 ;  subval_char,
	rjmp .L476	 ; 
.L477:
	ldi r20,lo8(-49)	 ;  subval_char,
.L476:
	mov r22,r28	 ; , start_row
	ldi r24,lo8(6)	 ; ,
	add r24,r29	 ; , start_col
.L478:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	jmp _ZN3OSD8write_xyEhhh	 ; 
.L471:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	ret
	.size	_Z7showILShh, .-_Z7showILShh
	.section	.rodata
.LC1:
	.byte	-80
	.byte	-79
	.byte	-76
	.byte	-75
	.byte	-74
	.byte	-73
	.byte	123
	.byte	125
	.section	.text._Z9showRADARhh,"ax",@progbits
.global	_Z9showRADARhh
	.type	_Z9showRADARhh, @function
_Z9showRADARhh:
	push r2	 ; 
	push r3	 ; 
	push r4	 ; 
	push r5	 ; 
	push r6	 ; 
	push r7	 ; 
	push r8	 ; 
	push r9	 ; 
	push r10	 ; 
	push r11	 ; 
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
	sbiw r28,8	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
/* prologue: function */
/* frame size = 8 */
/* stack size = 26 */
.L__stack_usage = 26
	mov r3,r24	 ;  center_col, center_col
	mov r2,r22	 ;  center_line, center_line
	ldi r24,lo8(8)	 ;  tmp91,
	ldi r30,lo8(.LC1)	 ; ,
	ldi r31,hi8(.LC1)	 ; ,
	movw r26,r28	 ; ,
	adiw r26,1	 ; ,
	0:
	ld r0,Z+	 ; 
	st X+,r0	 ; 
	dec r24	 ;  tmp91
	brne 0b
	lds r22,_ZL11osd_heading	 ;  osd_heading, osd_heading
	lds r23,_ZL11osd_heading+1	 ;  osd_heading, osd_heading
	mov __tmp_reg__,r23	 ; 
	lsl r0	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(-76)	 ; ,
	ldi r21,lo8(65)	 ; ,
	call __addsf3	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(52)	 ; ,
	ldi r21,lo8(66)	 ; ,
	call __divsf3	 ; 
	call __fixsfsi	 ; 
	movw r16,r22	 ;  index, tmp97
	cpi r22,8	 ;  index,
	cpc r23,__zero_reg__	 ;  index
	brlt .L480	 ; ,
	ldi r16,0	 ;  index
	ldi r17,0	 ;  index
.L480:
	lds r14,_ZL5dst_x	 ;  D.30012, dst_x
	lds r15,_ZL5dst_x+1	 ;  D.30012, dst_x
	lds r12,_ZL5dst_y	 ;  D.30012, dst_y
	lds r13,_ZL5dst_y+1	 ;  D.30012, dst_y
	movw r24,r14	 ;  D.30012, D.30012
	sbrs r15,7	 ;  D.30012,
	rjmp .L481	 ; 
	clr r24	 ;  D.30012
	clr r25	 ;  D.30012
	sub r24,r14	 ;  D.30012, D.30012
	sbc r25,r15	 ;  D.30012, D.30012
.L481:
	ldi r22,lo8(-6)	 ; ,
	ldi r23,0	 ; 
	call __divmodhi4
	mov r19,r22	 ;  D.30012,
	mov r18,r23	 ;  D.30012,
	movw r24,r12	 ;  D.30012, D.30012
	sbrs r13,7	 ;  D.30012,
	rjmp .L482	 ; 
	clr r24	 ;  D.30012
	clr r25	 ;  D.30012
	sub r24,r12	 ;  D.30012, D.30012
	sbc r25,r13	 ;  D.30012, D.30012
.L482:
	ldi r22,lo8(-6)	 ; ,
	ldi r23,0	 ; 
	call __divmodhi4
	mov r24,r19	 ;  D.30012, D.30012
	mov r25,r18	 ;  D.30012, D.30012
	cp r24,r22	 ;  D.30012, D.30012
	cpc r25,r23	 ;  D.30012, D.30012
	brge .L483	 ; ,
	movw r24,r22	 ;  D.30012, D.30012
.L483:
	movw r22,r24	 ;  D.30012, D.30012
	subi r22,-1	 ;  D.30012,
	sbci r23,-1	 ;  D.30012,
	sts _ZL10radar_zoom+1,r23	 ;  radar_zoom, D.30012
	sts _ZL10radar_zoom,r22	 ;  radar_zoom, D.30012
	mov __tmp_reg__,r23	 ; 
	lsl r0	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	movw r4,r22	 ;  D.30013,
	movw r6,r24	 ;  D.30013,
	movw r22,r12	 ;  D.30012, D.30012
	lsl r13	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	movw r8,r22	 ;  D.30013,
	movw r10,r24	 ;  D.30013,
	ldi r18,lo8(-68)	 ; ,
	ldi r19,lo8(116)	 ; ,
	ldi r20,lo8(-109)	 ; ,
	ldi r21,lo8(60)	 ; ,
	movw r24,r6	 ; , D.30013
	movw r22,r4	 ; , D.30013
	call __divsf3	 ; 
	movw r18,r22	 ;  D.30013,
	movw r20,r24	 ;  D.30013,
	movw r24,r10	 ; , D.30013
	movw r22,r8	 ; , D.30013
	call __divsf3	 ; 
	call __fixsfsi	 ; 
	mov r10,r22	 ;  tmp149,
	movw r22,r14	 ;  D.30012, D.30012
	lsl r15	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	movw r12,r22	 ;  D.30013,
	movw r14,r24	 ;  D.30013,
	ldi r18,lo8(66)	 ; ,
	ldi r19,lo8(96)	 ; ,
	ldi r20,lo8(-27)	 ; ,
	ldi r21,lo8(60)	 ; ,
	movw r24,r6	 ; , D.30013
	movw r22,r4	 ; , D.30013
	call __divsf3	 ; 
	movw r18,r22	 ;  D.30013,
	movw r20,r24	 ;  D.30013,
	movw r24,r14	 ; , D.30013
	movw r22,r12	 ; , D.30013
	call __divsf3	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,0	 ; 
	ldi r21,lo8(63)	 ; ,
	call __addsf3	 ; 
	call __fixsfsi	 ; 
	mov r15,r22	 ;  tmp153,
	ldi r30,lo8(1)	 ;  tmp123,
	ldi r31,0	 ; 
	add r30,r28	 ;  tmp123,
	adc r31,r29	 ; ,
	add r30,r16	 ;  tmp123, index
	adc r31,r17	 ; , index
	ld r6,Z	 ;  D.30014, arr
	mov r7,r2	 ;  D.30014, center_line
	sub r7,r10	 ;  D.30014, tmp149
	mov r14,r3	 ;  D.30014, center_col
	add r14,r22	 ;  D.30014, tmp153
	mov r20,r6	 ; , D.30014
	mov r22,r7	 ; , D.30014
	mov r24,r14	 ; , D.30014
	call _ZN3OSD8write_xyEhhh	 ; 
	lds r24,flags+1	 ;  flags, flags
	sbrs r24,3	 ;  flags,
	rjmp .L479	 ; 
	lds r24,_ZZ9showRADARhhE3trk	 ;  trk[0].x, trk[0].x
	cp r15,r24	 ;  x, trk[0].x
	breq .L485	 ; ,
.L487:
	ldi r16,lo8(_ZZ9showRADARhhE3trk+6)	 ;  ivtmp.966,
	ldi r17,hi8(_ZZ9showRADARhhE3trk+6)	 ;  ivtmp.966,
	ldi r25,lo8(_ZZ9showRADARhhE3trk+8)	 ; ,
	mov r4,r25	 ;  ivtmp.972,
	ldi r25,hi8(_ZZ9showRADARhhE3trk+8)	 ; ,
	mov r5,r25	 ;  ivtmp.972,
	rjmp .L486	 ; 
.L485:
	lds r24,_ZZ9showRADARhhE3trk+1	 ;  trk[0].y, trk[0].y
	cpse r10,r24	 ;  y, trk[0].y
	rjmp .L487	 ; 
	rjmp .L488	 ; 
.L486:
	movw r30,r16	 ; , ivtmp.966
	ld r25,-Z	 ;  MEM[base: _75, offset: 0B], MEM[base: _75, offset: 0B]
	ld r24,-Z	 ;  MEM[base: _75, offset: 0B], MEM[base: _75, offset: 0B]
	movw r16,r30	 ;  ivtmp.966,
	movw r30,r4	 ; , ivtmp.972
	st -Z,r25	 ;  MEM[base: _76, offset: 0B], MEM[base: _75, offset: 0B]
	st -Z,r24	 ;  MEM[base: _76, offset: 0B], MEM[base: _75, offset: 0B]
	movw r4,r30	 ;  ivtmp.972,
	mov r20,r6	 ; , D.30014
	mov r22,r7	 ; , D.30014
	mov r24,r14	 ; , D.30014
	call _ZN3OSD8write_xyEhhh	 ; 
	ldi r31,hi8(_ZZ9showRADARhhE3trk)	 ; ,
	cpi r16,lo8(_ZZ9showRADARhhE3trk)	 ;  ivtmp.966,
	cpc r17,r31	 ;  ivtmp.966,
	brne .L486	 ; ,
	sts _ZZ9showRADARhhE3trk,r15	 ;  trk[0].x, tmp153
	sts _ZZ9showRADARhhE3trk+1,r10	 ;  trk[0].y, tmp149
.L488:
	ldi r16,lo8(_ZZ9showRADARhhE3trk+6)	 ;  ivtmp.959,
	ldi r17,hi8(_ZZ9showRADARhhE3trk+6)	 ;  ivtmp.959,
	ldi r24,lo8(_ZZ9showRADARhhE3trk)	 ; ,
	mov r14,r24	 ;  D.30010,
	ldi r24,hi8(_ZZ9showRADARhhE3trk)	 ; ,
	mov r15,r24	 ;  D.30010,
.L490:
	movw r30,r16	 ; , ivtmp.959
	ldd r24,Z+1	 ;  MEM[base: _5, offset: 1B], MEM[base: _5, offset: 1B]
	mov r22,r2	 ;  D.30014, center_line
	sub r22,r24	 ;  D.30014, MEM[base: _5, offset: 1B]
	ld r24,Z	 ;  MEM[base: _5, offset: 0B], MEM[base: _5, offset: 0B]
	ldi r20,lo8(36)	 ; ,
	add r24,r3	 ; , center_col
	call _ZN3OSD8write_xyEhhh	 ; 
	subi r16,2	 ;  ivtmp.959,
	sbc r17,__zero_reg__	 ;  ivtmp.959
	cp r14,r16	 ;  D.30010, ivtmp.959
	cpc r15,r17	 ;  D.30010, ivtmp.959
	brne .L490	 ; ,
.L479:
/* epilogue start */
	adiw r28,8	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	pop r7	 ; 
	pop r6	 ; 
	pop r5	 ; 
	pop r4	 ; 
	pop r3	 ; 
	pop r2	 ; 
	ret
	.size	_Z9showRADARhh, .-_Z9showRADARhh
	.section	.text._Z10panHorizon5Point,"ax",@progbits
.global	_Z10panHorizon5Point
	.type	_Z10panHorizon5Point, @function
_Z10panHorizon5Point:
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24	 ; ,
	lds r24,flags+1	 ;  flags, flags
	sbrs r24,2	 ;  flags,
	rjmp .L493	 ; 
	ldi r22,lo8(_ZL7str_hud)	 ; ,
	ldi r23,hi8(_ZL7str_hud)	 ; ,
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	call _ZN12BetterStream7print_PEPKc	 ; 
	ldi r22,lo8(_ZL7str_hud)	 ; ,
	ldi r23,hi8(_ZL7str_hud)	 ; ,
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	call _ZN12BetterStream7print_PEPKc	 ; 
	ldi r22,lo8(_ZZ10panHorizon5PointE3__c)	 ; ,
	ldi r23,hi8(_ZZ10panHorizon5PointE3__c)	 ; ,
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	call _ZN12BetterStream7print_PEPKc	 ; 
	ldi r22,lo8(_ZL7str_hud)	 ; ,
	ldi r23,hi8(_ZL7str_hud)	 ; ,
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	call _ZN12BetterStream7print_PEPKc	 ; 
	ldi r22,lo8(_ZL7str_hud)	 ; ,
	ldi r23,hi8(_ZL7str_hud)	 ; ,
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	call _ZN12BetterStream7print_PEPKc	 ; 
.L493:
	mov r22,r29	 ; , p
	ldi r24,lo8(1)	 ; ,
	add r24,r28	 ; , p
	call _Z11showHorizonhh	 ; 
	lds r24,flags	 ;  flags, flags
	sbrs r24,7	 ;  flags,
	rjmp .L494	 ; 
	ldi r22,lo8(2)	 ;  D.30020,
	add r22,r29	 ;  D.30020, p
	ldi r24,lo8(6)	 ; ,
	add r24,r28	 ; , p
	call _Z9showRADARhh	 ; 
.L494:
	sbrc r28,7	 ;  p,
	rjmp .L495	 ; 
	ldi r22,lo8(2)	 ;  D.30020,
	add r22,r29	 ;  D.30020, p
	ldi r24,lo8(6)	 ; ,
	add r24,r28	 ; , p
	call _ZN3OSD8setPanelEhh	 ; 
	ldi r22,lo8(_ZZ10panHorizon5PointE3__c_0)	 ; ,
	ldi r23,hi8(_ZZ10panHorizon5PointE3__c_0)	 ; ,
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	call _ZN12BetterStream7print_PEPKc	 ; 
.L495:
	lds r24,flags+1	 ;  flags, flags
	sbrs r24,0	 ;  flags,
	rjmp .L492	 ; 
	mov r22,r29	 ; , p
	mov r24,r28	 ; , p
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	jmp _Z7showILShh	 ; 
.L492:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	ret
	.size	_Z10panHorizon5Point, .-_Z10panHorizon5Point
	.section	.text._Z9move_menuc,"ax",@progbits
.global	_Z9move_menuc
	.type	_Z9move_menuc, @function
_Z9move_menuc:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r30,_ZL12setup_screen	 ;  setup_screen, setup_screen
	ldi r19,lo8(5)	 ; ,
	mul r30,r19	 ;  setup_screen,
	movw r30,r0	 ;  tmp61
	clr __zero_reg__
	subi r30,lo8(-(_ZL7screens+2))	 ;  D.30028,
	sbci r31,hi8(-(_ZL7screens+2))	 ;  D.30028,
/* #APP */
 ;  1799 "Panels.h" 1
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	subi r25,lo8(-(-1))	 ;  n,
	lds r18,_ZL10setup_menu	 ;  setup_menu_lsm.979, setup_menu
	lds r22,params	 ;  D.30029, params
	lds r23,params+1	 ;  D.30029, params
.L504:
	sbrs r24,7	 ;  dir,
	rjmp .L505	 ; 
	tst r18	 ;  setup_menu_lsm.979
	breq .L508	 ; ,
	rjmp .L507	 ; 
.L505:
	tst r24	 ;  dir
	breq .L507	 ; ,
	cp r25,r18	 ;  n, setup_menu_lsm.979
	breq .L509	 ; ,
.L507:
	add r18,r24	 ;  setup_menu_lsm.979, dir
	rjmp .L506	 ; 
.L508:
	mov r18,r25	 ;  setup_menu_lsm.979, n
	rjmp .L506	 ; 
.L509:
	ldi r18,0	 ;  setup_menu_lsm.979
.L506:
	movw r30,r22	 ;  D.30029, D.30029
	ldi r19,lo8(14)	 ; ,
	mul r18,r19	 ;  setup_menu_lsm.979,
	add r30,r0	 ;  D.30029
	adc r31,r1	 ;  D.30029
	clr __zero_reg__
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  1807 "Panels.h" 1
	lpm r20, Z+	 ;  __result
	lpm r21, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	or r20,r21	 ;  __result
	breq .L504	 ; ,
	sts _ZL10setup_menu,r18	 ;  setup_menu, setup_menu_lsm.979
	lds r24,lflags	 ;  lflags.got_data, lflags.got_data
	ori r24,lo8(1<<2)	 ;  lflags.got_data,
	sts lflags,r24	 ;  lflags.got_data, lflags.got_data
	ret
	.size	_Z9move_menuc, .-_Z9move_menuc
	.section	.text._Z11move_screenc,"ax",@progbits
.global	_Z11move_screenc
	.type	_Z11move_screenc, @function
_Z11move_screenc:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r18,lo8(1)	 ;  tmp48,
	sts _ZL10setup_menu,r18	 ;  setup_menu, tmp48
	lds r25,_ZL12setup_screen	 ;  setup_screen, setup_screen
	sbrs r24,7	 ;  dir,
	rjmp .L516	 ; 
	cpse r25,__zero_reg__	 ;  setup_screen,
	rjmp .L517	 ; 
	sts _ZL12setup_screen,r18	 ;  setup_screen, tmp48
	rjmp .L518	 ; 
.L516:
	tst r24	 ;  dir
	breq .L517	 ; ,
	cpi r25,lo8(1)	 ;  setup_screen,
	brne .L517	 ; ,
	sts _ZL12setup_screen,__zero_reg__	 ;  setup_screen,
	rjmp .L518	 ; 
.L517:
	add r24,r25	 ;  D.30037, setup_screen
	sts _ZL12setup_screen,r24	 ;  setup_screen, D.30037
.L518:
	lds r24,lflags	 ;  lflags.got_data, lflags.got_data
	ori r24,lo8(1<<2)	 ;  lflags.got_data,
	sts lflags,r24	 ;  lflags.got_data, lflags.got_data
	ret
	.size	_Z11move_screenc, .-_Z11move_screenc
	.section	.text._Z8panSetupv,"ax",@progbits
.global	_Z8panSetupv
	.type	_Z8panSetupv, @function
_Z8panSetupv:
	push r2	 ; 
	push r3	 ; 
	push r4	 ; 
	push r5	 ; 
	push r6	 ; 
	push r7	 ; 
	push r8	 ; 
	push r9	 ; 
	push r10	 ; 
	push r11	 ; 
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
	sbiw r28,11	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
/* prologue: function */
/* frame size = 11 */
/* stack size = 29 */
.L__stack_usage = 29
	lds r25,_ZL12setup_screen	 ;  setup_screen, setup_screen
	mov r8,r25	 ;  D.30055, setup_screen
	mov r9,__zero_reg__	 ;  D.30055
	ldi r24,lo8(5)	 ; ,
	mul r25,r24	 ;  setup_screen,
	movw r18,r0	 ;  tmp169
	clr __zero_reg__
	movw r30,r18	 ;  __addr16, tmp169
	subi r30,lo8(-(_ZL7screens))	 ;  __addr16,
	sbci r31,hi8(-(_ZL7screens))	 ;  __addr16,
/* #APP */
 ;  1846 "Panels.h" 1
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	sts params+1,r25	 ;  params, __result
	sts params,r24	 ;  params, __result
	movw r30,r18	 ;  D.30058, tmp169
	subi r30,lo8(-(_ZL7screens+2))	 ;  D.30058,
	sbci r31,hi8(-(_ZL7screens+2))	 ;  D.30058,
/* #APP */
 ;  1847 "Panels.h" 1
	lpm r25, Z	 ; 
	
 ;  0 "" 2
/* #NOAPP */
	std Y+10,r25	 ;  %sfp,
	lds r24,_ZL16chan1_raw_middle	 ;  chan1_raw_middle, chan1_raw_middle
	lds r25,_ZL16chan1_raw_middle+1	 ;  chan1_raw_middle, chan1_raw_middle
	or r24,r25	 ;  chan1_raw_middle
	brne .L523	 ; ,
	lds r24,_ZL16chan2_raw_middle	 ;  chan2_raw_middle, chan2_raw_middle
	lds r25,_ZL16chan2_raw_middle+1	 ;  chan2_raw_middle, chan2_raw_middle
	or r24,r25	 ;  chan2_raw_middle
	brne .L523	 ; ,
	lds r24,_ZL16chan4_raw_middle	 ;  chan4_raw_middle, chan4_raw_middle
	lds r25,_ZL16chan4_raw_middle+1	 ;  chan4_raw_middle, chan4_raw_middle
	or r24,r25	 ;  chan4_raw_middle
	brne .L523	 ; ,
	lds r24,_ZL8chan_raw	 ;  chan_raw, chan_raw
	lds r25,_ZL8chan_raw+1	 ;  chan_raw, chan_raw
	sts _ZL16chan1_raw_middle+1,r25	 ;  chan1_raw_middle, chan_raw
	sts _ZL16chan1_raw_middle,r24	 ;  chan1_raw_middle, chan_raw
	lds r24,_ZL8chan_raw+2	 ;  chan_raw, chan_raw
	lds r25,_ZL8chan_raw+2+1	 ;  chan_raw, chan_raw
	sts _ZL16chan2_raw_middle+1,r25	 ;  chan2_raw_middle, chan_raw
	sts _ZL16chan2_raw_middle,r24	 ;  chan2_raw_middle, chan_raw
	lds r24,_ZL8chan_raw+6	 ;  chan_raw, chan_raw
	lds r25,_ZL8chan_raw+6+1	 ;  chan_raw, chan_raw
	sts _ZL16chan4_raw_middle+1,r25	 ;  chan4_raw_middle, chan_raw
	sts _ZL16chan4_raw_middle,r24	 ;  chan4_raw_middle, chan_raw
.L523:
	mov r12,__zero_reg__	 ;  ivtmp.988
	mov r13,__zero_reg__	 ;  ivtmp.988
	mov r15,__zero_reg__	 ;  i
.L524:
	ldd r27,Y+10	 ; , %sfp
	cp r15,r27	 ;  i,
	brne .+2	 ; 
	rjmp .L526	 ; 
	clr r14	 ;  i
	inc r14	 ;  i
	add r14,r15	 ;  i, i
	mov r22,r14	 ; , i
	ldi r24,lo8(1)	 ; ,
	call _ZN3OSD8setPanelEhh	 ; 
	lds r16,params	 ;  params, params
	lds r17,params+1	 ;  params, params
	add r16,r12	 ;  p, ivtmp.988
	adc r17,r13	 ;  p, ivtmp.988
	movw r30,r16	 ;  __addr16, p
/* #APP */
 ;  1862 "Panels.h" 1
	lpm r22, Z+	 ;  __result
	lpm r23, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	call _ZN12BetterStream7print_PEPKc	 ; 
	mov r22,r14	 ; , i
	ldi r24,lo8(19)	 ; ,
	call _ZN3OSD8setPanelEhh	 ; 
	lds r24,_ZL10setup_menu	 ;  setup_menu, setup_menu
	cpse r15,r24	 ;  i, setup_menu
	rjmp .L527	 ; 
	ldi r24,lo8(62)	 ; ,
	call _ZN3OSD6writebEh	 ; 
	lds r11,_ZN3OSD3colE	 ;  col, col
	rjmp .L528	 ; 
.L527:
	ldi r24,lo8(32)	 ; ,
	call _ZN3OSD6writebEh	 ; 
.L528:
	movw r30,r16	 ;  D.30061, p
	adiw r30,2	 ;  D.30061,
/* #APP */
 ;  1876 "Panels.h" 1
	lpm r24, Z	 ;  type
	
 ;  0 "" 2
/* #NOAPP */
	adiw r30,1	 ;  D.30058,
/* #APP */
 ;  1877 "Panels.h" 1
	lpm r18, Z	 ; 
	
 ;  0 "" 2
/* #NOAPP */
	std Y+2,r18	 ;  %sfp,
	cpi r24,lo8(99)	 ;  type,
	breq .L530	 ; ,
	brsh .L531	 ; ,
	cpse r24,__zero_reg__	 ;  type,
	rjmp .L594	 ; 
.L525:
	ldi r26,14	 ; ,
	add r12,r26	 ;  ivtmp.988,
	adc r13,__zero_reg__	 ;  ivtmp.988
	mov r15,r14	 ;  i, i
	rjmp .L524	 ; 
.L594:
	cpi r24,lo8(98)	 ;  type,
	breq .+2	 ; 
	rjmp .L529	 ; 
	movw r30,r16	 ;  __addr16, p
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  1892 "Panels.h" 1
	lpm r26, Z+	 ;  __result
	lpm r27, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	ld r22,X	 ;  *_85, *_85
	ldi r23,0	 ;  l
	ldi r24,0	 ;  l
	ldi r25,0	 ;  l
	call __floatsisf	 ; 
	movw r4,r22	 ;  D.30064,
	movw r6,r24	 ;  D.30064,
	ldd r19,Y+2	 ; , %sfp
	mov r22,r19	 ;  k,
	rjmp .L590	 ; 
.L531:
	cpi r24,lo8(102)	 ;  type,
	breq .L533	 ; ,
	cpi r24,lo8(104)	 ;  type,
	breq .+2	 ; 
	rjmp .L529	 ; 
	call _ZN3OSD7getModeEv	 ; 
	tst r24	 ; 
	breq .L535	 ; ,
	ldi r22,lo8(_ZZ8panSetupvE3__c)	 ; ,
	ldi r23,hi8(_ZZ8panSetupvE3__c)	 ; ,
	rjmp .L589	 ; 
.L535:
	ldi r22,lo8(_ZZ8panSetupvE3__c_0)	 ; ,
	ldi r23,hi8(_ZZ8panSetupvE3__c_0)	 ; ,
.L589:
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	call _ZN12BetterStream7print_PEPKc	 ; 
	rjmp .L525	 ; 
.L530:
	movw r30,r16	 ;  __addr16, p
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  1899 "Panels.h" 1
	lpm r26, Z+	 ;  __result
	lpm r27, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	ld r22,X	 ;  *_95, *_95
	mov __tmp_reg__,r22	 ; 
	lsl r0	 ; 
	sbc r23,r23	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	movw r4,r22	 ;  D.30064,
	movw r6,r24	 ;  D.30064,
	ldd r18,Y+2	 ; , %sfp
	mov r22,r18	 ;  k,
.L590:
	ldi r23,0	 ;  k
	ldi r24,0	 ;  k
	ldi r25,0	 ;  k
	call __floatunsisf	 ; 
	movw r18,r22	 ;  D.30064,
	movw r20,r24	 ;  D.30064,
	movw r24,r6	 ; , D.30064
	movw r22,r4	 ; , D.30064
	call __divsf3	 ; 
	movw r4,r22	 ; ,
	movw r6,r24	 ; ,
	rjmp .L529	 ; 
.L533:
	movw r30,r16	 ;  __addr16, p
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  1905 "Panels.h" 1
	lpm r26, Z+	 ;  __result
	lpm r27, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	ld r4,X	 ;  v, *_104
	adiw r26,1	 ;  *_104
	ld r5,X	 ;  v
	sbiw r26,1	 ;  *_104
	adiw r26,2	 ;  *_104
	ld r6,X	 ;  v
	sbiw r26,2	 ;  *_104
	adiw r26,3	 ;  *_104
	ld r7,X	 ;  v
.L529:
	lds r24,_ZL10setup_menu	 ;  setup_menu, setup_menu
	cpse r15,r24	 ;  i, setup_menu
	rjmp .L536	 ; 
	mov r10,r4	 ;  c_val, v
	mov r3,r5	 ;  c_val, v
	mov r2,r6	 ;  c_val, v
	std Y+1,r7	 ;  %sfp, v
.L536:
	movw r30,r16	 ;  __addr16, p
	adiw r30,8	 ;  __addr16,
/* #APP */
 ;  1912 "Panels.h" 1
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	movw r20,r4	 ; ,
	movw r22,r6	 ; ,
	call _Z12osd_printf_1PKcf	 ; 
	rjmp .L525	 ; 
.L526:
	ldi r24,lo8(5)	 ;  tmp218,
	mul r24,r8	 ;  tmp218, D.30055
	movw r30,r0	 ;  tmp217
	mul r24,r9	 ;  tmp218, D.30055
	add r31,r0	 ;  tmp217
	clr __zero_reg__
	subi r30,lo8(-(_ZL7screens+3))	 ;  __addr16,
	sbci r31,hi8(-(_ZL7screens+3))	 ;  __addr16,
/* #APP */
 ;  1915 "Panels.h" 1
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	sbiw r24,0	 ;  __result,
	breq .L537	 ; ,
	movw r30,r24	 ; , __result
	icall
.L537:
	call millis	 ; 
	lds r16,_ZL10text_timer	 ;  text_timer, text_timer
	lds r17,_ZL10text_timer+1	 ;  text_timer, text_timer
	lds r18,_ZL10text_timer+2	 ;  text_timer, text_timer
	lds r19,_ZL10text_timer+3	 ;  text_timer, text_timer
	cp r16,r22	 ;  text_timer, D.30070
	cpc r17,r23	 ;  text_timer, D.30070
	cpc r18,r24	 ;  text_timer, D.30070
	cpc r19,r25	 ;  text_timer, D.30070
	brlo .+2	 ; 
	rjmp .L522	 ; 
	ldi r22,lo8(-12)	 ; ,
	ldi r23,lo8(1)	 ; ,
	ldi r24,lo8(_ZL10text_timer)	 ; ,
	ldi r25,hi8(_ZL10text_timer)	 ; ,
	call _Z11millis_plusPmj	 ; 
	lds r24,lflags	 ;  lflags.got_data, lflags.got_data
	ori r24,lo8(1<<2)	 ;  lflags.got_data,
	sts lflags,r24	 ;  lflags.got_data, lflags.got_data
	lds r24,_ZL8chan_raw+2	 ;  D.30059, chan_raw
	lds r25,_ZL8chan_raw+2+1	 ;  D.30059, chan_raw
	lds r18,_ZL16chan2_raw_middle	 ;  D.30059, chan2_raw_middle
	lds r19,_ZL16chan2_raw_middle+1	 ;  D.30059, chan2_raw_middle
	movw r20,r24	 ;  D.30059, D.30059
	subi r20,100	 ;  D.30059,
	sbc r21,__zero_reg__	 ;  D.30059
	cp r18,r20	 ;  D.30059, D.30059
	cpc r19,r21	 ;  D.30059, D.30059
	brsh .L540	 ; ,
	ldi r24,lo8(1)	 ; ,
	rjmp .L592	 ; 
.L540:
	subi r24,-100	 ;  D.30059,
	sbci r25,-1	 ;  D.30059,
	cp r24,r18	 ;  D.30059, D.30059
	cpc r25,r19	 ;  D.30059, D.30059
	brsh .L541	 ; ,
	ldi r24,lo8(-1)	 ; ,
.L592:
/* epilogue start */
	adiw r28,11	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	pop r7	 ; 
	pop r6	 ; 
	pop r5	 ; 
	pop r4	 ; 
	pop r3	 ; 
	pop r2	 ; 
	jmp _Z9move_menuc	 ; 
.L541:
	lds r24,_ZL8chan_raw+6	 ;  D.30059, chan_raw
	lds r25,_ZL8chan_raw+6+1	 ;  D.30059, chan_raw
	lds r18,_ZL16chan4_raw_middle	 ;  D.30059, chan4_raw_middle
	lds r19,_ZL16chan4_raw_middle+1	 ;  D.30059, chan4_raw_middle
	movw r20,r24	 ;  D.30059, D.30059
	subi r20,100	 ;  D.30059,
	sbc r21,__zero_reg__	 ;  D.30059
	cp r18,r20	 ;  D.30059, D.30059
	cpc r19,r21	 ;  D.30059, D.30059
	brsh .L542	 ; ,
	ldi r24,lo8(1)	 ; ,
	rjmp .L593	 ; 
.L542:
	subi r24,-100	 ;  D.30059,
	sbci r25,-1	 ;  D.30059,
	cp r24,r18	 ;  D.30059, D.30059
	cpc r25,r19	 ;  D.30059, D.30059
	brsh .L543	 ; ,
	ldi r24,lo8(-1)	 ; ,
.L593:
/* epilogue start */
	adiw r28,11	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	pop r7	 ; 
	pop r6	 ; 
	pop r5	 ; 
	pop r4	 ; 
	pop r3	 ; 
	pop r2	 ; 
	jmp _Z11move_screenc	 ; 
.L543:
	lds r22,_ZL10setup_menu	 ;  setup_menu, setup_menu
	subi r22,lo8(-(1))	 ;  D.30054,
	mov r24,r11	 ; , col
	call _ZN3OSD8setPanelEhh	 ; 
	lds r24,_ZL10setup_menu	 ;  D.30054, setup_menu
	lds r16,params	 ;  params, params
	lds r17,params+1	 ;  params, params
	ldi r31,lo8(14)	 ; ,
	mul r24,r31	 ;  D.30054,
	add r16,r0	 ;  p
	adc r17,r1	 ;  p
	clr __zero_reg__
	lds r18,_ZL16chan1_raw_middle	 ; , chan1_raw_middle
	lds r19,_ZL16chan1_raw_middle+1	 ; , chan1_raw_middle
	std Y+5,r19	 ;  %sfp,
	std Y+4,r18	 ;  %sfp,
	lds r8,_ZL8chan_raw	 ;  D.30059, chan_raw
	lds r9,_ZL8chan_raw+1	 ;  D.30059, chan_raw
	movw r14,r18	 ;  diff,
	sub r14,r8	 ;  diff, D.30059
	sbc r15,r9	 ;  diff, D.30059
	sbrs r15,7	 ;  diff,
	rjmp .L544	 ; 
	neg r15	 ;  diff
	neg r14	 ;  diff
	sbc r15,__zero_reg__	 ;  diff
.L544:
	movw r30,r16	 ;  __addr16, p
	adiw r30,4	 ;  __addr16,
/* #APP */
 ;  1942 "Panels.h" 1
	lpm r12, Z+	 ;  __result
	lpm r13, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	movw r30,r16	 ;  __addr16, p
	adiw r30,10	 ;  __addr16,
/* #APP */
 ;  1944 "Panels.h" 1
	lpm r24, Z+	 ; 
	lpm r25, Z	 ; 
	
 ;  0 "" 2
/* #NOAPP */
	std Y+7,r25	 ;  %sfp,
	std Y+6,r24	 ;  %sfp,
	movw r30,r16	 ;  __addr16, p
	adiw r30,12	 ;  __addr16,
/* #APP */
 ;  1945 "Panels.h" 1
	lpm r26, Z+	 ; 
	lpm r27, Z	 ; 
	
 ;  0 "" 2
/* #NOAPP */
	std Y+9,r27	 ;  %sfp,
	std Y+8,r26	 ;  %sfp,
	movw r30,r16	 ;  D.30061, p
	adiw r30,2	 ;  D.30061,
/* #APP */
 ;  1948 "Panels.h" 1
	lpm r27, Z	 ; 
	
 ;  0 "" 2
/* #NOAPP */
	std Y+2,r27	 ;  %sfp,
	adiw r30,1	 ;  D.30058,
/* #APP */
 ;  1949 "Panels.h" 1
	lpm r18, Z	 ; 
	
 ;  0 "" 2
/* #NOAPP */
	std Y+3,r18	 ;  %sfp,
	cpi r27,lo8(98)	 ; ,
	brsh .+2	 ; 
	rjmp .L565	 ; 
	cpi r27,lo8(100)	 ; ,
	brlo .L546	 ; ,
	cpi r27,lo8(102)	 ; ,
	breq .L547	 ; ,
	rjmp .L565	 ; 
.L546:
	ldi r19,45	 ; ,
	cp r14,r19	 ;  diff,
	ldi r19,1	 ; ,
	cpc r15,r19	 ;  diff,
	brlt .L548	 ; ,
	ldd r26,Y+3	 ; , %sfp
	mov r22,r26	 ;  k,
	ldi r23,0	 ;  k
	ldi r24,0	 ;  k
	ldi r25,0	 ;  k
	call __floatunsisf	 ; 
	movw r18,r22	 ;  D.30064,
	movw r20,r24	 ;  D.30064,
	ldi r22,0	 ; 
	ldi r23,0	 ; 
	ldi r24,lo8(32)	 ; ,
	ldi r25,lo8(65)	 ; ,
	call __divsf3	 ; 
	movw r4,r22	 ;  inc,
	movw r6,r24	 ;  inc,
	ldi r27,lo8(1)	 ; ,
	std Y+10,r27	 ;  %sfp,
	rjmp .L550	 ; 
.L548:
	ldi r30,-105	 ; ,
	cp r14,r30	 ;  diff,
	cpc r15,__zero_reg__	 ;  diff
	brlt .L566	 ; ,
	ldd r31,Y+3	 ; , %sfp
	mov r22,r31	 ;  k,
	ldi r23,0	 ;  k
	ldi r24,0	 ;  k
	ldi r25,0	 ;  k
	call __floatunsisf	 ; 
	movw r18,r22	 ;  D.30064,
	movw r20,r24	 ;  D.30064,
	ldi r22,0	 ; 
	ldi r23,0	 ; 
	ldi r24,lo8(-128)	 ; ,
	ldi r25,lo8(63)	 ; ,
	call __divsf3	 ; 
	movw r4,r22	 ;  inc,
	movw r6,r24	 ;  inc,
	ldi r18,lo8(1)	 ; ,
	std Y+10,r18	 ;  %sfp,
	rjmp .L545	 ; 
.L547:
	ldi r19,-111	 ; ,
	cp r14,r19	 ;  diff,
	ldi r19,1	 ; ,
	cpc r15,r19	 ;  diff,
	brge .L567	 ; ,
	ldi r24,45	 ; ,
	cp r14,r24	 ;  diff,
	ldi r24,1	 ; ,
	cpc r15,r24	 ;  diff,
	brge .L568	 ; ,
	ldi r25,-55	 ; ,
	cp r14,r25	 ;  diff,
	cpc r15,__zero_reg__	 ;  diff
	brge .L569	 ; ,
	ldi r26,101	 ; ,
	cp r14,r26	 ;  diff,
	cpc r15,__zero_reg__	 ;  diff
	brge .+2	 ; 
	rjmp .L595	 ; 
	ldi r25,lo8(111)	 ; ,
	mov r4,r25	 ;  inc,
	ldi r25,lo8(18)	 ; ,
	mov r5,r25	 ;  inc,
	ldi r25,lo8(-125)	 ; ,
	mov r6,r25	 ;  inc,
	ldi r25,lo8(58)	 ; ,
	mov r7,r25	 ;  inc,
	ldi r19,lo8(4)	 ; ,
	std Y+10,r19	 ;  %sfp,
	rjmp .L550	 ; 
.L565:
	mov r4,__zero_reg__	 ;  inc
	mov r5,__zero_reg__	 ;  inc
	movw r6,r4	 ;  inc
	rjmp .L545	 ; 
.L566:
	mov r4,__zero_reg__	 ;  inc
	mov r5,__zero_reg__	 ;  inc
	movw r6,r4	 ;  inc
	ldi r27,lo8(1)	 ; ,
	std Y+10,r27	 ;  %sfp,
	rjmp .L545	 ; 
.L568:
	ldi r19,lo8(-51)	 ; ,
	mov r4,r19	 ;  inc,
	ldi r19,lo8(-52)	 ; ,
	mov r5,r19	 ;  inc,
	mov r6,r5	 ;  inc, inc
	ldi r19,lo8(61)	 ; ,
	mov r7,r19	 ;  inc,
	ldi r30,lo8(4)	 ; ,
	std Y+10,r30	 ;  %sfp,
	rjmp .L545	 ; 
.L569:
	ldi r18,lo8(10)	 ; ,
	mov r4,r18	 ;  inc,
	ldi r18,lo8(-41)	 ; ,
	mov r5,r18	 ;  inc,
	ldi r18,lo8(35)	 ; ,
	mov r6,r18	 ;  inc,
	ldi r18,lo8(60)	 ; ,
	mov r7,r18	 ;  inc,
	ldi r31,lo8(4)	 ; ,
	std Y+10,r31	 ;  %sfp,
.L545:
	ldi r18,101	 ; ,
	cp r14,r18	 ;  diff,
	cpc r15,__zero_reg__	 ;  diff
	brge .+2	 ; 
	rjmp .L571	 ; 
	rjmp .L550	 ; 
.L567:
	mov r4,__zero_reg__	 ;  inc
	mov r5,__zero_reg__	 ;  inc
	ldi r24,lo8(-128)	 ; ,
	mov r6,r24	 ;  inc,
	ldi r24,lo8(63)	 ; ,
	mov r7,r24	 ;  inc,
	ldi r31,lo8(4)	 ; ,
	std Y+10,r31	 ;  %sfp,
.L550:
	ldd r24,Y+4	 ; , %sfp
	ldd r25,Y+5	 ; , %sfp
	cp r8,r24	 ;  D.30059,
	cpc r9,r25	 ;  D.30059,
	brsh .L572	 ; ,
	movw r20,r6	 ; , inc
	movw r18,r4	 ; , inc
	mov r22,r10	 ;  tmp310, c_val
	mov r23,r3	 ; , c_val
	mov r24,r2	 ; , c_val
	ldd r25,Y+1	 ; , %sfp
	call __subsf3	 ; 
	mov r11,r22	 ;  v,
	mov r14,r23	 ;  v,
	mov r15,r24	 ;  v,
	rjmp .L591	 ; 
.L572:
	mov r11,r10	 ;  v, c_val
	mov r14,r3	 ;  v, c_val
	mov r15,r2	 ;  v, c_val
	ldd r25,Y+1	 ; , %sfp
.L591:
	std Y+11,r25	 ;  %sfp,
	ldd r26,Y+4	 ; , %sfp
	ldd r27,Y+5	 ; , %sfp
	cp r26,r8	 ; , D.30059
	cpc r27,r9	 ; , D.30059
	brsh .L554	 ; ,
	movw r20,r6	 ; , inc
	movw r18,r4	 ; , inc
	mov r22,r11	 ;  tmp311, v
	mov r23,r14	 ; , v
	mov r24,r15	 ; , v
	ldd r25,Y+11	 ; , %sfp
	call __addsf3	 ; 
	mov r11,r22	 ;  v,
	mov r14,r23	 ;  v,
	mov r15,r24	 ;  v,
	std Y+11,r25	 ;  %sfp,
.L554:
	ldd r30,Y+6	 ; , %sfp
	ldd r31,Y+7	 ; , %sfp
	movw r22,r30	 ;  __result,
	lsl r31	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	movw r6,r22	 ; ,
	movw r8,r24	 ; ,
	movw r18,r22	 ; , tmp6
	movw r20,r24	 ; , tmp8
	mov r22,r11	 ;  tmp313, v
	mov r23,r14	 ; , v
	mov r24,r15	 ; , v
	ldd r25,Y+11	 ; , %sfp
	call __ltsf2	 ; 
	sbrs r24,7	 ; ,
	rjmp .L555	 ; 
	mov r11,r6	 ;  v, tmp301
	mov r14,r7	 ;  v, tmp302
	mov r15,r8	 ;  v, tmp303
	std Y+11,r9	 ;  %sfp, tmp304
.L555:
	ldd r18,Y+8	 ; , %sfp
	ldd r19,Y+9	 ; , %sfp
	movw r22,r18	 ;  __result,
	lsl r19	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
	call __floatsisf	 ; 
	movw r6,r22	 ; ,
	movw r8,r24	 ; ,
	movw r18,r22	 ; , tmp6
	movw r20,r24	 ; , tmp8
	mov r22,r11	 ;  tmp315, v
	mov r23,r14	 ; , v
	mov r24,r15	 ; , v
	ldd r25,Y+11	 ; , %sfp
	call __gtsf2	 ; 
	cp __zero_reg__,r24	 ; 
	brge .L552	 ; ,
	mov r11,r6	 ;  v, tmp305
	mov r14,r7	 ;  v, tmp306
	mov r15,r8	 ;  v, tmp307
	std Y+11,r9	 ;  %sfp, tmp308
	rjmp .L552	 ; 
.L571:
	mov r11,r10	 ;  v, c_val
	mov r14,r3	 ;  v, c_val
	mov r15,r2	 ;  v, c_val
	ldd r19,Y+1	 ; , %sfp
	std Y+11,r19	 ;  %sfp,
.L552:
	mov r18,r10	 ;  tmp316, c_val
	mov r19,r3	 ; , c_val
	mov r20,r2	 ; , c_val
	ldd r21,Y+1	 ; , %sfp
	mov r22,r11	 ;  tmp317, v
	mov r23,r14	 ; , v
	mov r24,r15	 ; , v
	ldd r25,Y+11	 ; , %sfp
	call __nesf2	 ; 
	tst r24	 ; 
	brne .+2	 ; 
	rjmp .L522	 ; 
	ldd r24,Y+2	 ; , %sfp
	cpi r24,lo8(99)	 ; ,
	breq .L561	 ; ,
	cpi r24,lo8(102)	 ; ,
	breq .L562	 ; ,
	cpi r24,lo8(98)	 ; ,
	breq .+2	 ; 
	rjmp .L560	 ; 
	ldd r31,Y+3	 ; , %sfp
	mov r22,r31	 ;  D.30055,
	ldi r23,0	 ;  D.30055
	ldi r24,0	 ;  D.30055
	ldi r25,0	 ;  D.30055
	call __floatsisf	 ; 
	mov r18,r11	 ;  tmp319, v
	mov r19,r14	 ; , v
	mov r20,r15	 ; , v
	ldd r21,Y+11	 ; , %sfp
	call __mulsf3	 ; 
	call __fixunssfsi	 ; 
	movw r26,r12	 ; , __result
	st X,r22	 ;  MEM[(byte *)pval_153], tmp285
	rjmp .L560	 ; 
.L561:
	ldd r26,Y+3	 ; , %sfp
	mov r22,r26	 ;  D.30055,
	ldi r23,0	 ;  D.30055
	ldi r24,0	 ;  D.30055
	ldi r25,0	 ;  D.30055
	call __floatsisf	 ; 
	mov r18,r11	 ;  tmp318, v
	mov r19,r14	 ; , v
	mov r20,r15	 ; , v
	ldd r21,Y+11	 ; , %sfp
	call __mulsf3	 ; 
	call __fixsfsi	 ; 
	movw r30,r12	 ; , __result
	st Z,r22	 ;  MEM[(char *)pval_153], tmp281
	rjmp .L560	 ; 
.L595:
	mov r18,r10	 ;  tmp321, c_val
	mov r19,r3	 ; , c_val
	mov r20,r2	 ; , c_val
	ldd r21,Y+1	 ; , %sfp
	mov r22,r10	 ;  tmp322, c_val
	mov r23,r3	 ; , c_val
	mov r24,r2	 ; , c_val
	ldd r25,Y+1	 ; , %sfp
	call __nesf2	 ; 
	tst r24	 ; 
	breq .L522	 ; ,
	mov r11,r10	 ;  v, c_val
	mov r14,r3	 ;  v, c_val
	mov r15,r2	 ;  v, c_val
	ldd r18,Y+1	 ; , %sfp
	std Y+11,r18	 ;  %sfp,
	ldi r19,lo8(4)	 ; ,
	std Y+10,r19	 ;  %sfp,
.L562:
	mov r24,r11	 ;  tmp320, v
	mov r25,r14	 ; , v
	mov r26,r15	 ; , v
	ldd r27,Y+11	 ; , %sfp
	movw r30,r12	 ; , __result
	st Z,r24	 ;  MEM[(float *)pval_209], tmp320
	std Z+1,r25	 ;  MEM[(float *)pval_209], tmp320
	std Z+2,r26	 ;  MEM[(float *)pval_209], tmp320
	std Z+3,r27	 ;  MEM[(float *)pval_209], tmp320
.L560:
	ldd r31,Y+10	 ; , %sfp
	mov r20,r31	 ;  D.30059,
	ldi r21,0	 ;  D.30059
	movw r22,r12	 ;  D.30059, __result
	subi r22,lo8(sets-516)	 ;  D.30059,
	sbci r23,hi8(sets-516)	 ;  D.30059,
	movw r24,r12	 ; , __result
	call _Z16eeprom_write_lenPhjj	 ; 
	movw r30,r16	 ;  __addr16, p
	adiw r30,6	 ;  __addr16,
/* #APP */
 ;  2022 "Panels.h" 1
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	sbiw r24,0	 ;  __result,
	breq .L522	 ; ,
	movw r30,r24	 ; , __result
/* epilogue start */
	adiw r28,11	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	pop r7	 ; 
	pop r6	 ; 
	pop r5	 ; 
	pop r4	 ; 
	pop r3	 ; 
	pop r2	 ; 
	ijmp
.L522:
/* epilogue start */
	adiw r28,11	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	pop r7	 ; 
	pop r6	 ; 
	pop r5	 ; 
	pop r4	 ; 
	pop r3	 ; 
	pop r2	 ; 
	ret
	.size	_Z8panSetupv, .-_Z8panSetupv
	.section	.text._Z11writePanelsv,"ax",@progbits
.global	_Z11writePanelsv
	.type	_Z11writePanelsv, @function
_Z11writePanelsv:
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	call _ZN3OSD10detectModeEv	 ; 
	call millis	 ; 
	lds r18,sets+67	 ;  sets.n_screens, sets.n_screens
	cpi r18,lo8(5)	 ;  sets.n_screens,
	brlo .L597	 ; ,
	ldi r18,lo8(4)	 ;  tmp59,
	sts sets+67,r18	 ;  sets.n_screens, tmp59
.L597:
	lds r16,_ZL11lastMAVBeat	 ;  lastMAVBeat, lastMAVBeat
	lds r17,_ZL11lastMAVBeat+1	 ;  lastMAVBeat, lastMAVBeat
	lds r18,_ZL11lastMAVBeat+2	 ;  lastMAVBeat, lastMAVBeat
	lds r19,_ZL11lastMAVBeat+3	 ;  lastMAVBeat, lastMAVBeat
	subi r16,104	 ;  D.30104,
	sbci r17,-9	 ;  D.30104,
	sbci r18,-1	 ;  D.30104,
	sbci r19,-1	 ;  D.30104,
	cp r16,r22	 ;  D.30104, pt
	cpc r17,r23	 ;  D.30104, pt
	cpc r18,r24	 ;  D.30104, pt
	cpc r19,r25	 ;  D.30104, pt
	brsh .L598	 ; ,
/* epilogue start */
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	jmp _Z15panWaitMAVBeatsv	 ; 
.L598:
	lds r24,lflags	 ;  lflags, lflags
	bst r24,6	 ;  lflags,
	clr r28	 ;  D.30105
	bld r28,0	 ;  D.30105
	sbrc r24,6	 ;  lflags,
	rjmp .L599	 ; 
	lds r24,_ZL7seconds	 ;  seconds, seconds
	ldi r22,lo8(10)	 ; ,
	call __udivmodqi4
	sbrc r24,0	 ;  D.30103,
	rjmp .L599	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(72)	 ; ,
	ldi r21,lo8(66)	 ; ,
	lds r22,_ZL9tdistance	 ; , tdistance
	lds r23,_ZL9tdistance+1	 ; , tdistance
	lds r24,_ZL9tdistance+2	 ; , tdistance
	lds r25,_ZL9tdistance+3	 ; , tdistance
	call __gtsf2	 ; 
	cp __zero_reg__,r24	 ; 
	brge .L599	 ; ,
	ldi r24,lo8(1)	 ; ,
	ldi r25,lo8(1)	 ; ,
	call _Z8panFdata5Point	 ; 
/* epilogue start */
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	ret
.L599:
	lds r25,sets+67	 ;  sets.n_screens, sets.n_screens
	lds r24,_ZL6panelN	 ;  panelN, panelN
	cp r24,r25	 ;  panelN, sets.n_screens
	brsh .L602	 ; ,
	call _Z16print_all_panelsv	 ; 
	rjmp .L603	 ; 
.L602:
	cpse r28,__zero_reg__	 ;  D.30105,
	rjmp .L603	 ; 
/* epilogue start */
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	jmp _Z8panSetupv	 ; 
.L603:
	lds r24,panel+52	 ; , panel.warn
	lds r25,panel+52+1	 ; , panel.warn
/* epilogue start */
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	jmp _Z7panWarn5Point	 ; 
	.size	_Z11writePanelsv, .-_Z11writePanelsv
	.section	.text._Z12read_mavlinkv,"ax",@progbits
.global	_Z12read_mavlinkv
	.type	_Z12read_mavlinkv, @function
_Z12read_mavlinkv:
	push r2	 ; 
	push r3	 ; 
	push r4	 ; 
	push r5	 ; 
	push r6	 ; 
	push r7	 ; 
	push r8	 ; 
	push r9	 ; 
	push r10	 ; 
	push r11	 ; 
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
	 ; SP -= 1	 ; 
	push __zero_reg__
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
/* prologue: function */
/* frame size = 1 */
/* stack size = 19 */
.L__stack_usage = 19
	ldi r21,lo8(6)	 ; ,
	mov r6,r21	 ;  tmp430,
	mov r7,__zero_reg__	 ; 
	ldi r16,lo8(2)	 ;  tmp432,
	ldi r17,0	 ; 
	clr r14	 ;  tmp433
	dec r14	 ;  tmp433
	mov r15,r14	 ; , tmp433
	ldi r23,lo8(8)	 ; ,
	mov r10,r23	 ;  tmp435,
	mov r11,__zero_reg__	 ; 
	ldi r30,lo8(7)	 ; ,
	mov r8,r30	 ;  tmp436,
	mov r9,__zero_reg__	 ; 
.L650:
	clr r5	 ;  tmp413
	inc r5	 ;  tmp413
	ldi r20,lo8(4)	 ; ,
	mov r2,r20	 ;  tmp423,
	mov r3,__zero_reg__	 ; 
.L649:
	call _ZN12SingleSerial11available_SEv	 ; 
	tst r24	 ; 
	brne .+2	 ; 
	rjmp .L606	 ; 
	call _ZN12SingleSerial6read_SEv	 ; 
	mov r25,r24	 ;  c,
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status,__zero_reg__	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].msg_received,
	lds r30,_ZZ26mavlink_get_channel_statusE16m_mavlink_status+3	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state
	lds r31,_ZZ26mavlink_get_channel_statusE16m_mavlink_status+3+1	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state
	cpi r30,10	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state,
	cpc r31,__zero_reg__	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state
	brlo .+2	 ; 
	rjmp .L608	 ; 
	subi r30,lo8(-(gs(.L610)))	 ;  tmp171,
	sbci r31,hi8(-(gs(.L610)))	 ;  tmp171,
	jmp __tablejump2__
	.section	.progmem.gcc_sw_table._Z12read_mavlinkv,"a",@progbits
	.p2align	1
.L610:
	.word gs(.L609)
	.word gs(.L611)
	.word gs(.L612)
	.word gs(.L613)
	.word gs(.L614)
	.word gs(.L615)
	.word gs(.L616)
	.word gs(.L617)
	.word gs(.L618)
	.word gs(.L619)
	.section	.text._Z12read_mavlinkv
.L609:
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+10+1,__zero_reg__	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_rx_drop_count,
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+10,__zero_reg__	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_rx_drop_count,
.L611:
	cpi r25,lo8(-2)	 ;  c,
	breq .+2	 ; 
	rjmp .L620	 ; 
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3+1,r17	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, tmp432
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3,r16	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, tmp432
	sts msg+3,__zero_reg__	 ;  MEM[(struct mavlink_message_t *)&msg].len,
	sts msg+2,r25	 ;  MEM[(struct mavlink_message_t *)&msg].magic, c
	rjmp .L666	 ; 
.L612:
	cpi r24,lo8(102)	 ;  c,
	brlo .L621	 ; ,
	lds r24,_ZZ26mavlink_get_channel_statusE16m_mavlink_status+1	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].buffer_overrun, MEM[(struct mavlink_status_t *)&m_mavlink_status][0].buffer_overrun
	subi r24,lo8(-(1))	 ;  D.30133,
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+1,r24	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].buffer_overrun, D.30133
	ldi r18,lo8(1)	 ; ,
	ldi r19,0	 ; 
	rjmp .L668	 ; 
.L621:
	sts msg+3,r24	 ;  MEM[(struct mavlink_message_t *)&msg].len, c
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+5,__zero_reg__	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_idx,
	ldi r22,lo8(msg)	 ; ,
	ldi r23,hi8(msg)	 ; ,
	call crc_accumulate	 ; 
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3+1,r3	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, tmp423
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3,r2	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, tmp423
	rjmp .L608	 ; 
.L614:
	sts msg+4,r24	 ;  MEM[(struct mavlink_message_t *)&msg].seq, c
	ldi r22,lo8(msg)	 ; ,
	ldi r23,hi8(msg)	 ; ,
	call crc_accumulate	 ; 
	ldi r24,lo8(3)	 ; ,
	ldi r25,0	 ; 
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3+1,r25	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state,
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3,r24	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state,
	rjmp .L608	 ; 
.L613:
	sts msg+5,r24	 ;  MEM[(struct mavlink_message_t *)&msg].sysid, c
	ldi r22,lo8(msg)	 ; ,
	ldi r23,hi8(msg)	 ; ,
	call crc_accumulate	 ; 
	ldi r18,lo8(5)	 ; ,
	ldi r19,0	 ; 
.L668:
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3+1,r19	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state,
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3,r18	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state,
	rjmp .L608	 ; 
.L615:
	sts msg+6,r24	 ;  MEM[(struct mavlink_message_t *)&msg].compid, c
	ldi r22,lo8(msg)	 ; ,
	ldi r23,hi8(msg)	 ; ,
	call crc_accumulate	 ; 
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3+1,r7	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, tmp430
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3,r6	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, tmp430
	rjmp .L608	 ; 
.L616:
	sts msg+7,r24	 ;  MEM[(struct mavlink_message_t *)&msg].msgid, c
	ldi r22,lo8(msg)	 ; ,
	ldi r23,hi8(msg)	 ; ,
	call crc_accumulate	 ; 
	lds r24,msg+3	 ;  MEM[(struct mavlink_message_t *)&msg].len, MEM[(struct mavlink_message_t *)&msg].len
	cpse r24,__zero_reg__	 ;  MEM[(struct mavlink_message_t *)&msg].len,
	rjmp .L622	 ; 
.L623:
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3+1,r11	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, tmp435
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3,r10	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, tmp435
	rjmp .L608	 ; 
.L622:
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3+1,r9	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, tmp436
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3,r8	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, tmp436
	rjmp .L608	 ; 
.L617:
	lds r30,_ZZ26mavlink_get_channel_statusE16m_mavlink_status+5	 ;  D.30133, MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_idx
	clr r4	 ;  D.30133
	inc r4	 ;  D.30133
	add r4,r30	 ;  D.30133, D.30133
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+5,r4	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_idx, D.30133
	ldi r31,0	 ;  D.30149
	subi r30,lo8(-(msg+8))	 ;  tmp214,
	sbci r31,hi8(-(msg+8))	 ;  tmp214,
	st Z,r24	 ;  *_171, c
	ldi r22,lo8(msg)	 ; ,
	ldi r23,hi8(msg)	 ; ,
	call crc_accumulate	 ; 
	lds r24,msg+3	 ;  MEM[(struct mavlink_message_t *)&msg].len, MEM[(struct mavlink_message_t *)&msg].len
	cpse r4,r24	 ;  D.30133, MEM[(struct mavlink_message_t *)&msg].len
	rjmp .L620	 ; 
	rjmp .L623	 ; 
.L618:
	lds r30,msg+7	 ;  MEM[(struct mavlink_message_t *)&msg].msgid, MEM[(struct mavlink_message_t *)&msg].msgid
	ldi r31,0	 ;  D.30141
	subi r30,lo8(-(_ZZ18mavlink_parse_charE20mavlink_message_crcs))	 ;  tmp221,
	sbci r31,hi8(-(_ZZ18mavlink_parse_charE20mavlink_message_crcs))	 ;  tmp221,
	ldi r22,lo8(msg)	 ; ,
	ldi r23,hi8(msg)	 ; ,
	ld r24,Z	 ; , mavlink_message_crcs
	std Y+1,r25	 ; ,
	call crc_accumulate	 ; 
	ldd r25,Y+1	 ; ,
	mov r20,r25	 ;  D.30140, c
	ldi r21,0	 ;  D.30140
	lds r18,msg	 ;  MEM[(struct mavlink_message_t *)&msg].checksum, MEM[(struct mavlink_message_t *)&msg].checksum
	lds r19,msg+1	 ;  MEM[(struct mavlink_message_t *)&msg].checksum, MEM[(struct mavlink_message_t *)&msg].checksum
	clr r19	 ;  D.30140
	cp r20,r18	 ;  D.30140, D.30140
	cpc r21,r19	 ;  D.30140, D.30140
	breq .L624	 ; ,
.L665:
	ldi r18,lo8(1)	 ; ,
	ldi r19,0	 ; 
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3+1,r19	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state,
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3,r18	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state,
	cpi r25,lo8(-2)	 ;  c,
	breq .+2	 ; 
	rjmp .L620	 ; 
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3+1,r17	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, tmp432
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3,r16	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state, tmp432
	sts msg+3,__zero_reg__	 ;  MEM[(struct mavlink_message_t *)&msg].len,
.L666:
	sts msg+1,r15	 ;  MEM[(uint16_t *)&msg], tmp433
	sts msg,r14	 ;  MEM[(uint16_t *)&msg], tmp433
	rjmp .L608	 ; 
.L624:
	ldi r18,lo8(9)	 ; ,
	ldi r19,0	 ; 
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3+1,r19	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state,
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3,r18	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state,
	lds r30,_ZZ26mavlink_get_channel_statusE16m_mavlink_status+5	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_idx, MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_idx
	ldi r31,0	 ;  D.30149
	subi r30,lo8(-(msg+8))	 ;  tmp243,
	sbci r31,hi8(-(msg+8))	 ;  tmp243,
	rjmp .L667	 ; 
.L619:
	mov r18,r24	 ;  D.30140, c
	ldi r19,0	 ;  D.30140
	lds r12,msg+1	 ;  D.30140, MEM[(struct mavlink_message_t *)&msg].checksum
	mov r13,__zero_reg__	 ;  D.30140
	cp r18,r12	 ;  D.30140, D.30140
	cpc r19,r13	 ;  D.30140, D.30140
	brne .L665	 ; ,
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status,r5	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].msg_received, tmp413
	ldi r18,lo8(1)	 ; ,
	ldi r19,0	 ; 
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3+1,r19	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state,
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+3,r18	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_state,
	lds r30,_ZZ26mavlink_get_channel_statusE16m_mavlink_status+5	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_idx, MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_idx
	ldi r31,0	 ;  D.30149
	subi r30,lo8(-(msg+9))	 ;  tmp262,
	sbci r31,hi8(-(msg+9))	 ;  tmp262,
.L667:
	st Z,r25	 ; , c
.L608:
	lds r18,_ZZ26mavlink_get_channel_statusE16m_mavlink_status	 ;  D.30133, MEM[(struct mavlink_status_t *)&m_mavlink_status][0].msg_received
	cpi r18,lo8(1)	 ;  D.30133,
	brne .L627	 ; ,
	lds r24,msg+4	 ;  MEM[(struct mavlink_message_t *)&msg].seq, MEM[(struct mavlink_message_t *)&msg].seq
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+6,r24	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].current_rx_seq, MEM[(struct mavlink_message_t *)&msg].seq
	lds r24,_ZZ26mavlink_get_channel_statusE16m_mavlink_status+8	 ;  D.30140, MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_rx_success_count
	lds r25,_ZZ26mavlink_get_channel_statusE16m_mavlink_status+8+1	 ;  D.30140, MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_rx_success_count
	sbiw r24,0	 ;  D.30140,
	brne .L628	 ; ,
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+10+1,__zero_reg__	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_rx_drop_count,
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+10,__zero_reg__	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_rx_drop_count,
.L628:
	adiw r24,1	 ;  D.30140,
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+8+1,r25	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_rx_success_count, D.30140
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+8,r24	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].packet_rx_success_count, D.30140
.L627:
	sts _ZZ26mavlink_get_channel_statusE16m_mavlink_status+2,__zero_reg__	 ;  MEM[(struct mavlink_status_t *)&m_mavlink_status][0].parse_error,
	tst r18	 ;  D.30133
	brne .+2	 ; 
	rjmp .L630	 ; 
	ldi r22,0	 ; 
	ldi r23,0	 ; 
	ldi r24,lo8(_ZL11lastMAVBeat)	 ; ,
	ldi r25,hi8(_ZL11lastMAVBeat)	 ; ,
	call _Z11millis_plusPmj	 ; 
	lds r18,lflags	 ;  lflags.got_data, lflags.got_data
	ori r18,lo8(4)	 ;  lflags.mavlink_active,
	ori r18,lo8(1<<3)	 ;  lflags.mavlink_active,
	sts lflags,r18	 ;  lflags.mavlink_active, lflags.mavlink_active
	lds r24,msg+7	 ;  D.30133, msg.m.msgid
	tst r24	 ;  D.30133
	brne .+2	 ; 
	rjmp .L631	 ; 
	lds r25,_ZL14apm_mav_system	 ;  D.30133, apm_mav_system
	tst r25	 ;  D.30133
	breq .L632	 ; ,
	lds r18,msg+5	 ;  msg.m.sysid, msg.m.sysid
	cpse r25,r18	 ;  D.30133, msg.m.sysid
	rjmp .L606	 ; 
.L632:
	cpi r24,lo8(35)	 ;  D.30133,
	brne .+2	 ; 
	rjmp .L633	 ; 
	brlo .+2	 ; 
	rjmp .L634	 ; 
	cpi r24,lo8(29)	 ;  D.30133,
	brne .+2	 ; 
	rjmp .L645	 ; 
	brlo .+2	 ; 
	rjmp .L636	 ; 
	cpi r24,lo8(1)	 ;  D.30133,
	brne .+2	 ; 
	rjmp .L637	 ; 
	cpi r24,lo8(24)	 ;  D.30133,
	breq .+2	 ; 
	rjmp .L630	 ; 
	lds r24,msg+24	 ;  MEM[(const int32_t *)&msg + 24B], MEM[(const int32_t *)&msg + 24B]
	lds r25,msg+24+1	 ;  MEM[(const int32_t *)&msg + 24B], MEM[(const int32_t *)&msg + 24B]
	lds r26,msg+24+2	 ;  MEM[(const int32_t *)&msg + 24B], MEM[(const int32_t *)&msg + 24B]
	lds r27,msg+24+3	 ;  MEM[(const int32_t *)&msg + 24B], MEM[(const int32_t *)&msg + 24B]
	sts _ZL11osd_alt_gps,r24	 ;  osd_alt_gps, MEM[(const int32_t *)&msg + 24B]
	sts _ZL11osd_alt_gps+1,r25	 ;  osd_alt_gps, MEM[(const int32_t *)&msg + 24B]
	sts _ZL11osd_alt_gps+2,r26	 ;  osd_alt_gps, MEM[(const int32_t *)&msg + 24B]
	sts _ZL11osd_alt_gps+3,r27	 ;  osd_alt_gps, MEM[(const int32_t *)&msg + 24B]
	lds r22,msg+16	 ;  MEM[(const int32_t *)&msg + 16B], MEM[(const int32_t *)&msg + 16B]
	lds r23,msg+16+1	 ;  MEM[(const int32_t *)&msg + 16B], MEM[(const int32_t *)&msg + 16B]
	lds r24,msg+16+2	 ;  MEM[(const int32_t *)&msg + 16B], MEM[(const int32_t *)&msg + 16B]
	lds r25,msg+16+3	 ;  MEM[(const int32_t *)&msg + 16B], MEM[(const int32_t *)&msg + 16B]
	call _Z8gps_norml	 ; 
	sts osd_pos,r22	 ;  osd_pos.lat, D.30138
	sts osd_pos+1,r23	 ;  osd_pos.lat, D.30138
	sts osd_pos+2,r24	 ;  osd_pos.lat, D.30138
	sts osd_pos+3,r25	 ;  osd_pos.lat, D.30138
	lds r22,msg+20	 ;  MEM[(const int32_t *)&msg + 20B], MEM[(const int32_t *)&msg + 20B]
	lds r23,msg+20+1	 ;  MEM[(const int32_t *)&msg + 20B], MEM[(const int32_t *)&msg + 20B]
	lds r24,msg+20+2	 ;  MEM[(const int32_t *)&msg + 20B], MEM[(const int32_t *)&msg + 20B]
	lds r25,msg+20+3	 ;  MEM[(const int32_t *)&msg + 20B], MEM[(const int32_t *)&msg + 20B]
	call _Z8gps_norml	 ; 
	sts osd_pos+4,r22	 ;  osd_pos.lon, D.30138
	sts osd_pos+4+1,r23	 ;  osd_pos.lon, D.30138
	sts osd_pos+4+2,r24	 ;  osd_pos.lon, D.30138
	sts osd_pos+4+3,r25	 ;  osd_pos.lon, D.30138
	lds r24,msg+36	 ;  MEM[(const char *)&msg + 36B], MEM[(const char *)&msg + 36B]
	sts _ZL12osd_fix_type,r24	 ;  osd_fix_type, MEM[(const char *)&msg + 36B]
	lds r24,msg+37	 ;  MEM[(const char *)&msg + 37B], MEM[(const char *)&msg + 37B]
	sts _ZL22osd_satellites_visible,r24	 ;  osd_satellites_visible, MEM[(const char *)&msg + 37B]
	lds r24,msg+34	 ;  MEM[(const uint16_t *)&msg + 34B], MEM[(const uint16_t *)&msg + 34B]
	lds r25,msg+34+1	 ;  MEM[(const uint16_t *)&msg + 34B], MEM[(const uint16_t *)&msg + 34B]
	sts _ZL7osd_cog+1,r25	 ;  osd_cog, MEM[(const uint16_t *)&msg + 34B]
	sts _ZL7osd_cog,r24	 ;  osd_cog, MEM[(const uint16_t *)&msg + 34B]
	lds r24,msg+28	 ;  MEM[(const uint16_t *)&msg + 28B], MEM[(const uint16_t *)&msg + 28B]
	lds r25,msg+28+1	 ;  MEM[(const uint16_t *)&msg + 28B], MEM[(const uint16_t *)&msg + 28B]
	sts _ZL3eph+1,r25	 ;  eph, MEM[(const uint16_t *)&msg + 28B]
	sts _ZL3eph,r24	 ;  eph, MEM[(const uint16_t *)&msg + 28B]
	rjmp .L630	 ; 
.L636:
	cpi r24,lo8(30)	 ;  D.30133,
	brne .+2	 ; 
	rjmp .L639	 ; 
	cpi r24,lo8(33)	 ;  D.30133,
	breq .+2	 ; 
	rjmp .L630	 ; 
	lds r22,msg+24	 ; , MEM[(const int32_t *)&msg + 24B]
	lds r23,msg+24+1	 ; , MEM[(const int32_t *)&msg + 24B]
	lds r24,msg+24+2	 ; , MEM[(const int32_t *)&msg + 24B]
	lds r25,msg+24+3	 ; , MEM[(const int32_t *)&msg + 24B]
	call __floatsisf	 ; 
	movw r18,r22	 ;  D.30138,
	movw r20,r24	 ;  D.30138,
	lds r22,_ZL11osd_alt_rel	 ; , osd_alt_rel
	lds r23,_ZL11osd_alt_rel+1	 ; , osd_alt_rel
	lds r24,_ZL11osd_alt_rel+2	 ; , osd_alt_rel
	lds r25,_ZL11osd_alt_rel+3	 ; , osd_alt_rel
	call __subsf3	 ; 
	call __fixsfsi	 ; 
	sts _ZL12osd_home_alt,r22	 ;  osd_home_alt, tmp407
	sts _ZL12osd_home_alt+1,r23	 ;  osd_home_alt, tmp407
	sts _ZL12osd_home_alt+2,r24	 ;  osd_home_alt, tmp407
	sts _ZL12osd_home_alt+3,r25	 ;  osd_home_alt, tmp407
	rjmp .L630	 ; 
.L634:
	cpi r24,lo8(74)	 ;  D.30133,
	brne .+2	 ; 
	rjmp .L641	 ; 
	brlo .+2	 ; 
	rjmp .L642	 ; 
	cpi r24,lo8(42)	 ;  D.30133,
	brne .+2	 ; 
	rjmp .L643	 ; 
	cpi r24,lo8(62)	 ;  D.30133,
	breq .+2	 ; 
	rjmp .L630	 ; 
	lds r24,msg+30	 ;  MEM[(const int16_t *)&msg + 30B], MEM[(const int16_t *)&msg + 30B]
	lds r25,msg+30+1	 ;  MEM[(const int16_t *)&msg + 30B], MEM[(const int16_t *)&msg + 30B]
	sts _ZL17wp_target_bearing+1,r25	 ;  wp_target_bearing, MEM[(const int16_t *)&msg + 30B]
	sts _ZL17wp_target_bearing,r24	 ;  wp_target_bearing, MEM[(const int16_t *)&msg + 30B]
	lds r24,msg+32	 ;  MEM[(const uint16_t *)&msg + 32B], MEM[(const uint16_t *)&msg + 32B]
	lds r25,msg+32+1	 ;  MEM[(const uint16_t *)&msg + 32B], MEM[(const uint16_t *)&msg + 32B]
	sts _ZL7wp_dist+1,r25	 ;  wp_dist, MEM[(const uint16_t *)&msg + 32B]
	sts _ZL7wp_dist,r24	 ;  wp_dist, MEM[(const uint16_t *)&msg + 32B]
	lds r22,msg+8	 ; , MEM[(const float *)&msg + 8B]
	lds r23,msg+8+1	 ; , MEM[(const float *)&msg + 8B]
	lds r24,msg+8+2	 ; , MEM[(const float *)&msg + 8B]
	lds r25,msg+8+3	 ; , MEM[(const float *)&msg + 8B]
	call __fixsfsi	 ; 
	sts _ZL8nav_roll+1,r23	 ;  nav_roll, tmp357
	sts _ZL8nav_roll,r22	 ;  nav_roll, tmp357
	lds r22,msg+12	 ; , MEM[(const float *)&msg + 12B]
	lds r23,msg+12+1	 ; , MEM[(const float *)&msg + 12B]
	lds r24,msg+12+2	 ; , MEM[(const float *)&msg + 12B]
	lds r25,msg+12+3	 ; , MEM[(const float *)&msg + 12B]
	call __fixsfsi	 ; 
	sts _ZL9nav_pitch+1,r23	 ;  nav_pitch, tmp359
	sts _ZL9nav_pitch,r22	 ;  nav_pitch, tmp359
	lds r24,msg+28	 ;  MEM[(const int16_t *)&msg + 28B], MEM[(const int16_t *)&msg + 28B]
	lds r25,msg+28+1	 ;  MEM[(const int16_t *)&msg + 28B], MEM[(const int16_t *)&msg + 28B]
	sts _ZL11nav_bearing+1,r25	 ;  nav_bearing, MEM[(const int16_t *)&msg + 28B]
	sts _ZL11nav_bearing,r24	 ;  nav_bearing, MEM[(const int16_t *)&msg + 28B]
	lds r24,msg+16	 ;  MEM[(const float *)&msg + 16B], MEM[(const float *)&msg + 16B]
	lds r25,msg+16+1	 ;  MEM[(const float *)&msg + 16B], MEM[(const float *)&msg + 16B]
	lds r26,msg+16+2	 ;  MEM[(const float *)&msg + 16B], MEM[(const float *)&msg + 16B]
	lds r27,msg+16+3	 ;  MEM[(const float *)&msg + 16B], MEM[(const float *)&msg + 16B]
	sts _ZL9alt_error,r24	 ;  alt_error, MEM[(const float *)&msg + 16B]
	sts _ZL9alt_error+1,r25	 ;  alt_error, MEM[(const float *)&msg + 16B]
	sts _ZL9alt_error+2,r26	 ;  alt_error, MEM[(const float *)&msg + 16B]
	sts _ZL9alt_error+3,r27	 ;  alt_error, MEM[(const float *)&msg + 16B]
	lds r24,msg+20	 ;  MEM[(const float *)&msg + 20B], MEM[(const float *)&msg + 20B]
	lds r25,msg+20+1	 ;  MEM[(const float *)&msg + 20B], MEM[(const float *)&msg + 20B]
	lds r26,msg+20+2	 ;  MEM[(const float *)&msg + 20B], MEM[(const float *)&msg + 20B]
	lds r27,msg+20+3	 ;  MEM[(const float *)&msg + 20B], MEM[(const float *)&msg + 20B]
	sts _ZL10aspd_error,r24	 ;  aspd_error, MEM[(const float *)&msg + 20B]
	sts _ZL10aspd_error+1,r25	 ;  aspd_error, MEM[(const float *)&msg + 20B]
	sts _ZL10aspd_error+2,r26	 ;  aspd_error, MEM[(const float *)&msg + 20B]
	sts _ZL10aspd_error+3,r27	 ;  aspd_error, MEM[(const float *)&msg + 20B]
	lds r22,msg+24	 ; , MEM[(const float *)&msg + 24B]
	lds r23,msg+24+1	 ; , MEM[(const float *)&msg + 24B]
	lds r24,msg+24+2	 ; , MEM[(const float *)&msg + 24B]
	lds r25,msg+24+3	 ; , MEM[(const float *)&msg + 24B]
	call __fixsfsi	 ; 
	sts _ZL12xtrack_error+1,r23	 ;  xtrack_error, tmp367
	sts _ZL12xtrack_error,r22	 ;  xtrack_error, tmp367
	rjmp .L630	 ; 
.L642:
	cpi r24,lo8(-119)	 ;  D.30133,
	brne .+2	 ; 
	rjmp .L645	 ; 
	cpi r24,lo8(-88)	 ;  D.30133,
	breq .+2	 ; 
	rjmp .L630	 ; 
	lds r22,msg+8	 ; , MEM[(const float *)&msg + 8B]
	lds r23,msg+8+1	 ; , MEM[(const float *)&msg + 8B]
	lds r24,msg+8+2	 ; , MEM[(const float *)&msg + 8B]
	lds r25,msg+8+3	 ; , MEM[(const float *)&msg + 8B]
	call __fixsfsi	 ; 
	sts _ZL17osd_winddirection+1,r23	 ;  osd_winddirection, tmp397
	sts _ZL17osd_winddirection,r22	 ;  osd_winddirection, tmp397
	lds r24,msg+12	 ;  MEM[(const float *)&msg + 12B], MEM[(const float *)&msg + 12B]
	lds r25,msg+12+1	 ;  MEM[(const float *)&msg + 12B], MEM[(const float *)&msg + 12B]
	lds r26,msg+12+2	 ;  MEM[(const float *)&msg + 12B], MEM[(const float *)&msg + 12B]
	lds r27,msg+12+3	 ;  MEM[(const float *)&msg + 12B], MEM[(const float *)&msg + 12B]
	sts _ZL13osd_windspeed,r24	 ;  osd_windspeed, MEM[(const float *)&msg + 12B]
	sts _ZL13osd_windspeed+1,r25	 ;  osd_windspeed, MEM[(const float *)&msg + 12B]
	sts _ZL13osd_windspeed+2,r26	 ;  osd_windspeed, MEM[(const float *)&msg + 12B]
	sts _ZL13osd_windspeed+3,r27	 ;  osd_windspeed, MEM[(const float *)&msg + 12B]
	rjmp .L630	 ; 
.L631:
	lds r24,msg+12	 ;  MEM[(const char *)&msg + 12B], MEM[(const char *)&msg + 12B]
	cpi r24,lo8(6)	 ;  MEM[(const char *)&msg + 12B],
	brne .+2	 ; 
	rjmp .L630	 ; 
	lds r24,msg+5	 ;  msg.m.sysid, msg.m.sysid
	sts _ZL14apm_mav_system,r24	 ;  apm_mav_system, msg.m.sysid
	lds r24,msg+13	 ;  MEM[(const char *)&msg + 13B], MEM[(const char *)&msg + 13B]
	sts _ZL13osd_autopilot,r24	 ;  osd_autopilot, MEM[(const char *)&msg + 13B]
	lds r24,msg+8	 ;  MEM[(const uint32_t *)&msg + 8B], MEM[(const uint32_t *)&msg + 8B]
	sts _ZL8osd_mode,r24	 ;  osd_mode, MEM[(const uint32_t *)&msg + 8B]
	lds r24,msg+14	 ;  MEM[(const char *)&msg + 14B], MEM[(const char *)&msg + 14B]
	ldi r25,0	 ;  D.30141
	lsl r24	 ;  D.30141
	mov r24,r25	 ;  D.30141
	rol r24	 ;  D.30141
	sbc r25,r25	 ;  D.30141
	bst r24,0	 ;  D.30141
	bld r18,6	 ;  lflags.motor_armed,
	sts lflags,r18	 ;  lflags.motor_armed, lflags.motor_armed
	rjmp .L630	 ; 
.L637:
	lds r18,flags	 ;  flags, flags
	sbrc r18,4	 ;  flags,
	rjmp .L648	 ; 
	lds r24,msg+22	 ;  MEM[(const uint16_t *)&msg + 22B], MEM[(const uint16_t *)&msg + 22B]
	lds r25,msg+22+1	 ;  MEM[(const uint16_t *)&msg + 22B], MEM[(const uint16_t *)&msg + 22B]
	sts _ZL10osd_vbat_A+1,r25	 ;  osd_vbat_A, MEM[(const uint16_t *)&msg + 22B]
	sts _ZL10osd_vbat_A,r24	 ;  osd_vbat_A, MEM[(const uint16_t *)&msg + 22B]
	lds r24,msg+38	 ;  MEM[(const char *)&msg + 38B], MEM[(const char *)&msg + 38B]
	sts _ZL23osd_battery_remaining_A,r24	 ;  osd_battery_remaining_A, MEM[(const char *)&msg + 38B]
.L648:
	sbrc r18,6	 ;  flags,
	rjmp .L630	 ; 
	lds r24,msg+24	 ;  MEM[(const int16_t *)&msg + 24B], MEM[(const int16_t *)&msg + 24B]
	lds r25,msg+24+1	 ;  MEM[(const int16_t *)&msg + 24B], MEM[(const int16_t *)&msg + 24B]
	sts _ZL10osd_curr_A+1,r25	 ;  osd_curr_A, MEM[(const int16_t *)&msg + 24B]
	sts _ZL10osd_curr_A,r24	 ;  osd_curr_A, MEM[(const int16_t *)&msg + 24B]
	rjmp .L630	 ; 
.L641:
	lds r24,msg+8	 ;  MEM[(const float *)&msg + 8B], MEM[(const float *)&msg + 8B]
	lds r25,msg+8+1	 ;  MEM[(const float *)&msg + 8B], MEM[(const float *)&msg + 8B]
	lds r26,msg+8+2	 ;  MEM[(const float *)&msg + 8B], MEM[(const float *)&msg + 8B]
	lds r27,msg+8+3	 ;  MEM[(const float *)&msg + 8B], MEM[(const float *)&msg + 8B]
	sts _ZL12osd_airspeed,r24	 ;  osd_airspeed, MEM[(const float *)&msg + 8B]
	sts _ZL12osd_airspeed+1,r25	 ;  osd_airspeed, MEM[(const float *)&msg + 8B]
	sts _ZL12osd_airspeed+2,r26	 ;  osd_airspeed, MEM[(const float *)&msg + 8B]
	sts _ZL12osd_airspeed+3,r27	 ;  osd_airspeed, MEM[(const float *)&msg + 8B]
	lds r24,msg+12	 ;  MEM[(const float *)&msg + 12B], MEM[(const float *)&msg + 12B]
	lds r25,msg+12+1	 ;  MEM[(const float *)&msg + 12B], MEM[(const float *)&msg + 12B]
	lds r26,msg+12+2	 ;  MEM[(const float *)&msg + 12B], MEM[(const float *)&msg + 12B]
	lds r27,msg+12+3	 ;  MEM[(const float *)&msg + 12B], MEM[(const float *)&msg + 12B]
	sts _ZL15osd_groundspeed,r24	 ;  osd_groundspeed, MEM[(const float *)&msg + 12B]
	sts _ZL15osd_groundspeed+1,r25	 ;  osd_groundspeed, MEM[(const float *)&msg + 12B]
	sts _ZL15osd_groundspeed+2,r26	 ;  osd_groundspeed, MEM[(const float *)&msg + 12B]
	sts _ZL15osd_groundspeed+3,r27	 ;  osd_groundspeed, MEM[(const float *)&msg + 12B]
	lds r24,msg+24	 ;  MEM[(const int16_t *)&msg + 24B], MEM[(const int16_t *)&msg + 24B]
	lds r25,msg+24+1	 ;  MEM[(const int16_t *)&msg + 24B], MEM[(const int16_t *)&msg + 24B]
	sts _ZL11osd_heading+1,r25	 ;  osd_heading, MEM[(const int16_t *)&msg + 24B]
	sts _ZL11osd_heading,r24	 ;  osd_heading, MEM[(const int16_t *)&msg + 24B]
	lds r24,msg+26	 ;  MEM[(const uint16_t *)&msg + 26B], MEM[(const uint16_t *)&msg + 26B]
	sts _ZL12osd_throttle,r24	 ;  osd_throttle, MEM[(const uint16_t *)&msg + 26B]
	lds r24,msg+16	 ;  MEM[(const float *)&msg + 16B], MEM[(const float *)&msg + 16B]
	lds r25,msg+16+1	 ;  MEM[(const float *)&msg + 16B], MEM[(const float *)&msg + 16B]
	lds r26,msg+16+2	 ;  MEM[(const float *)&msg + 16B], MEM[(const float *)&msg + 16B]
	lds r27,msg+16+3	 ;  MEM[(const float *)&msg + 16B], MEM[(const float *)&msg + 16B]
	sts _ZL11osd_alt_rel,r24	 ;  osd_alt_rel, MEM[(const float *)&msg + 16B]
	sts _ZL11osd_alt_rel+1,r25	 ;  osd_alt_rel, MEM[(const float *)&msg + 16B]
	sts _ZL11osd_alt_rel+2,r26	 ;  osd_alt_rel, MEM[(const float *)&msg + 16B]
	sts _ZL11osd_alt_rel+3,r27	 ;  osd_alt_rel, MEM[(const float *)&msg + 16B]
	lds r24,msg+20	 ;  MEM[(const float *)&msg + 20B], MEM[(const float *)&msg + 20B]
	lds r25,msg+20+1	 ;  MEM[(const float *)&msg + 20B], MEM[(const float *)&msg + 20B]
	lds r26,msg+20+2	 ;  MEM[(const float *)&msg + 20B], MEM[(const float *)&msg + 20B]
	lds r27,msg+20+3	 ;  MEM[(const float *)&msg + 20B], MEM[(const float *)&msg + 20B]
	sts _ZL9osd_climb,r24	 ;  osd_climb, MEM[(const float *)&msg + 20B]
	sts _ZL9osd_climb+1,r25	 ;  osd_climb, MEM[(const float *)&msg + 20B]
	sts _ZL9osd_climb+2,r26	 ;  osd_climb, MEM[(const float *)&msg + 20B]
	sts _ZL9osd_climb+3,r27	 ;  osd_climb, MEM[(const float *)&msg + 20B]
	rjmp .L630	 ; 
.L639:
	ldi r18,lo8(-31)	 ; ,
	ldi r19,lo8(46)	 ; ,
	ldi r20,lo8(101)	 ; ,
	ldi r21,lo8(66)	 ; ,
	lds r22,msg+16	 ; , MEM[(const float *)&msg + 16B]
	lds r23,msg+16+1	 ; , MEM[(const float *)&msg + 16B]
	lds r24,msg+16+2	 ; , MEM[(const float *)&msg + 16B]
	lds r25,msg+16+3	 ; , MEM[(const float *)&msg + 16B]
	call __mulsf3	 ; 
	call __fixsfsi	 ; 
	sts osd_att+1,r23	 ;  osd_att.pitch, tmp343
	sts osd_att,r22	 ;  osd_att.pitch, tmp343
	ldi r18,lo8(-31)	 ; ,
	ldi r19,lo8(46)	 ; ,
	ldi r20,lo8(101)	 ; ,
	ldi r21,lo8(66)	 ; ,
	lds r22,msg+12	 ; , MEM[(const float *)&msg + 12B]
	lds r23,msg+12+1	 ; , MEM[(const float *)&msg + 12B]
	lds r24,msg+12+2	 ; , MEM[(const float *)&msg + 12B]
	lds r25,msg+12+3	 ; , MEM[(const float *)&msg + 12B]
	call __mulsf3	 ; 
	call __fixsfsi	 ; 
	sts osd_att+2+1,r23	 ;  osd_att.roll, tmp347
	sts osd_att+2,r22	 ;  osd_att.roll, tmp347
	ldi r18,lo8(-31)	 ; ,
	ldi r19,lo8(46)	 ; ,
	ldi r20,lo8(101)	 ; ,
	ldi r21,lo8(66)	 ; ,
	lds r22,msg+20	 ; , MEM[(const float *)&msg + 20B]
	lds r23,msg+20+1	 ; , MEM[(const float *)&msg + 20B]
	lds r24,msg+20+2	 ; , MEM[(const float *)&msg + 20B]
	lds r25,msg+20+3	 ; , MEM[(const float *)&msg + 20B]
	call __mulsf3	 ; 
	call __fixsfsi	 ; 
	sts osd_att+4+1,r23	 ;  osd_att.yaw, tmp351
	sts osd_att+4,r22	 ;  osd_att.yaw, tmp351
	rjmp .L630	 ; 
.L643:
	lds r24,msg+8	 ;  MEM[(const uint16_t *)&msg + 8B], MEM[(const uint16_t *)&msg + 8B]
	sts _ZL9wp_number,r24	 ;  wp_number, MEM[(const uint16_t *)&msg + 8B]
	rjmp .L630	 ; 
.L633:
	lds r24,msg+12	 ;  MEM[(const uint16_t *)&msg + 12B], MEM[(const uint16_t *)&msg + 12B]
	lds r25,msg+12+1	 ;  MEM[(const uint16_t *)&msg + 12B], MEM[(const uint16_t *)&msg + 12B]
	sts _ZL8chan_raw+1,r25	 ;  chan_raw, MEM[(const uint16_t *)&msg + 12B]
	sts _ZL8chan_raw,r24	 ;  chan_raw, MEM[(const uint16_t *)&msg + 12B]
	lds r24,msg+14	 ;  MEM[(const uint16_t *)&msg + 14B], MEM[(const uint16_t *)&msg + 14B]
	lds r25,msg+14+1	 ;  MEM[(const uint16_t *)&msg + 14B], MEM[(const uint16_t *)&msg + 14B]
	sts _ZL8chan_raw+2+1,r25	 ;  chan_raw, MEM[(const uint16_t *)&msg + 14B]
	sts _ZL8chan_raw+2,r24	 ;  chan_raw, MEM[(const uint16_t *)&msg + 14B]
	lds r24,msg+16	 ;  MEM[(const uint16_t *)&msg + 16B], MEM[(const uint16_t *)&msg + 16B]
	lds r25,msg+16+1	 ;  MEM[(const uint16_t *)&msg + 16B], MEM[(const uint16_t *)&msg + 16B]
	sts _ZL8chan_raw+4+1,r25	 ;  chan_raw, MEM[(const uint16_t *)&msg + 16B]
	sts _ZL8chan_raw+4,r24	 ;  chan_raw, MEM[(const uint16_t *)&msg + 16B]
	lds r24,msg+18	 ;  MEM[(const uint16_t *)&msg + 18B], MEM[(const uint16_t *)&msg + 18B]
	lds r25,msg+18+1	 ;  MEM[(const uint16_t *)&msg + 18B], MEM[(const uint16_t *)&msg + 18B]
	sts _ZL8chan_raw+6+1,r25	 ;  chan_raw, MEM[(const uint16_t *)&msg + 18B]
	sts _ZL8chan_raw+6,r24	 ;  chan_raw, MEM[(const uint16_t *)&msg + 18B]
	lds r24,msg+20	 ;  MEM[(const uint16_t *)&msg + 20B], MEM[(const uint16_t *)&msg + 20B]
	lds r25,msg+20+1	 ;  MEM[(const uint16_t *)&msg + 20B], MEM[(const uint16_t *)&msg + 20B]
	sts _ZL8chan_raw+8+1,r25	 ;  chan_raw, MEM[(const uint16_t *)&msg + 20B]
	sts _ZL8chan_raw+8,r24	 ;  chan_raw, MEM[(const uint16_t *)&msg + 20B]
	lds r24,msg+22	 ;  MEM[(const uint16_t *)&msg + 22B], MEM[(const uint16_t *)&msg + 22B]
	lds r25,msg+22+1	 ;  MEM[(const uint16_t *)&msg + 22B], MEM[(const uint16_t *)&msg + 22B]
	sts _ZL8chan_raw+10+1,r25	 ;  chan_raw, MEM[(const uint16_t *)&msg + 22B]
	sts _ZL8chan_raw+10,r24	 ;  chan_raw, MEM[(const uint16_t *)&msg + 22B]
	lds r24,msg+24	 ;  MEM[(const uint16_t *)&msg + 24B], MEM[(const uint16_t *)&msg + 24B]
	lds r25,msg+24+1	 ;  MEM[(const uint16_t *)&msg + 24B], MEM[(const uint16_t *)&msg + 24B]
	sts _ZL8chan_raw+12+1,r25	 ;  chan_raw, MEM[(const uint16_t *)&msg + 24B]
	sts _ZL8chan_raw+12,r24	 ;  chan_raw, MEM[(const uint16_t *)&msg + 24B]
	lds r24,msg+26	 ;  MEM[(const uint16_t *)&msg + 26B], MEM[(const uint16_t *)&msg + 26B]
	lds r25,msg+26+1	 ;  MEM[(const uint16_t *)&msg + 26B], MEM[(const uint16_t *)&msg + 26B]
	sts _ZL8chan_raw+14+1,r25	 ;  chan_raw, MEM[(const uint16_t *)&msg + 26B]
	sts _ZL8chan_raw+14,r24	 ;  chan_raw, MEM[(const uint16_t *)&msg + 26B]
	lds r24,msg+29	 ;  MEM[(const char *)&msg + 29B], MEM[(const char *)&msg + 29B]
	sts _ZL8osd_rssi,r24	 ;  osd_rssi, MEM[(const char *)&msg + 29B]
	rjmp .L630	 ; 
.L645:
	lds r24,msg+20	 ;  MEM[(const int16_t *)&msg + 20B], MEM[(const int16_t *)&msg + 20B]
	lds r25,msg+20+1	 ;  MEM[(const int16_t *)&msg + 20B], MEM[(const int16_t *)&msg + 20B]
	sts _ZL11temperature+1,r25	 ;  temperature, MEM[(const int16_t *)&msg + 20B]
	sts _ZL11temperature,r24	 ;  temperature, MEM[(const int16_t *)&msg + 20B]
.L630:
	call _ZN12SingleSerial11available_SEv	 ; 
	cpse r24,__zero_reg__	 ; ,
	rjmp .L649	 ; 
	ldi r24,lo8(-86)	 ; ,
	ldi r25,0	 ; 
	call delayMicroseconds	 ; 
	rjmp .L650	 ; 
.L620:
	lds r18,_ZZ26mavlink_get_channel_statusE16m_mavlink_status	 ;  D.30133, MEM[(struct mavlink_status_t *)&m_mavlink_status][0].msg_received
	rjmp .L627	 ; 
.L606:
/* epilogue start */
	 ; SP += 1	 ; 
	pop __tmp_reg__
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	pop r8	 ; 
	pop r7	 ; 
	pop r6	 ; 
	pop r5	 ; 
	pop r4	 ; 
	pop r3	 ; 
	pop r2	 ; 
	ret
	.size	_Z12read_mavlinkv, .-_Z12read_mavlinkv
	.section	.text._Z10uploadFontv,"ax",@progbits
.global	_Z10uploadFontv
	.type	_Z10uploadFontv, @function
_Z10uploadFontv:
	push r9	 ; 
	push r10	 ; 
	push r11	 ; 
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
	in r28,__SP_L__	 ; 
	in r29,__SP_H__	 ; 
	subi r28,64	 ; ,
	sbc r29,__zero_reg__	 ; 
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
/* prologue: function */
/* frame size = 64 */
/* stack size = 75 */
.L__stack_usage = 75
	in r24,0x2c	 ;  D.30166, MEM[(volatile uint8_t *)76B]
	ori r24,lo8(1)	 ;  D.30166,
	out 0x2c,r24	 ;  MEM[(volatile uint8_t *)76B], D.30166
	call _ZN3OSD5clearEv	 ; 
	ldi r22,lo8(_ZZ10uploadFontvE3__c)	 ; ,
	ldi r23,hi8(_ZZ10uploadFontvE3__c)	 ; ,
	ldi r24,lo8(Serial)	 ; ,
	ldi r25,hi8(Serial)	 ; ,
	call _ZN12BetterStream7print_PEPKc	 ; 
	ldi r16,0	 ;  chk
	mov r14,__zero_reg__	 ;  font_count
	mov r15,__zero_reg__	 ;  font_count
	ldi r17,0	 ;  byte_count
	ldi r24,lo8(_ZZ10uploadFontvE3__c_0)	 ; ,
	mov r10,r24	 ;  tmp81,
	ldi r24,hi8(_ZZ10uploadFontvE3__c_0)	 ; ,
	mov r11,r24	 ; ,
	ldi r25,lo8(Serial)	 ; ,
	mov r12,r25	 ;  tmp82,
	ldi r25,hi8(Serial)	 ; ,
	mov r13,r25	 ; ,
.L671:
	ldi r24,-1	 ; ,
	cp r14,r24	 ;  font_count,
	cpc r15,__zero_reg__	 ;  font_count
	breq .+4
	brlt .+2
	rjmp .L669	 ; 
	call _ZN12SingleSerial6read_SEv	 ; 
	cpi r24,lo8(50)	 ;  incomingByte,
	brsh .L674	 ; ,
	cpi r24,lo8(48)	 ;  incomingByte,
	brsh .L675	 ; ,
	cpi r24,lo8(10)	 ;  incomingByte,
	breq .L671	 ; ,
	cpi r24,lo8(13)	 ;  incomingByte,
	breq .L676	 ; ,
	rjmp .L673	 ; 
.L674:
	cpi r24,lo8(114)	 ;  incomingByte,
	brne .L673	 ; ,
	ldi r24,1	 ; ,
	sub r14,r24	 ;  font_count,
	sbc r15,__zero_reg__	 ;  font_count
	rjmp .L673	 ; 
.L676:
	ldi r24,lo8(8)	 ; ,
	cpse r9,r24	 ;  bit_count,
	rjmp .L681	 ; 
	subi r17,lo8(-(1))	 ;  byte_count,
	ldi r30,lo8(1)	 ;  tmp58,
	ldi r31,0	 ; 
	add r30,r28	 ;  tmp58,
	adc r31,r29	 ; ,
	add r30,r17	 ;  tmp58, byte_count
	adc r31,__zero_reg__	 ;  tmp58
	st Z,__zero_reg__	 ;  character_bitmap,
	rjmp .L681	 ; 
.L675:
	eor r16,r24	 ;  chk, incomingByte
	ldi r30,lo8(1)	 ;  tmp59,
	ldi r31,0	 ; 
	add r30,r28	 ;  tmp59,
	adc r31,r29	 ; ,
	add r30,r17	 ;  tmp59, byte_count
	adc r31,__zero_reg__	 ;  tmp59
	ld r25,Z	 ;  tmp60, character_bitmap
	lsl r25	 ;  D.30166
	cpi r24,lo8(49)	 ;  incomingByte,
	brne .L684	 ; ,
	subi r25,lo8(-(1))	 ;  D.30166,
.L684:
	st Z,r25	 ;  character_bitmap, D.30166
	inc r9	 ;  bit_count
	rjmp .L673	 ; 
.L681:
	mov r9,__zero_reg__	 ;  bit_count
.L673:
	cpi r17,lo8(64)	 ;  byte_count,
	brne .L671	 ; ,
	movw r22,r28	 ; ,
	subi r22,-1	 ; ,
	sbci r23,-1	 ; ,
	movw r24,r14	 ; , font_count
	call _ZN3OSD9write_NVMEiPh	 ; 
	ldi r24,-1	 ; ,
	sub r14,r24	 ;  font_count,
	sbc r15,r24	 ;  font_count,
	push __zero_reg__
	push r16	 ;  chk
	push r11	 ; 
	push r10	 ;  tmp81
	push r13	 ; 
	push r12	 ;  tmp82
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	 ; SP += 6	 ; 
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	ldi r16,0	 ;  chk
	ldi r17,0	 ;  byte_count
	rjmp .L671	 ; 
.L669:
/* epilogue start */
	subi r28,-64	 ; ,
	sbci r29,-1	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29	 ; ,
	out __SREG__,__tmp_reg__
	out __SP_L__,r28	 ; ,
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	pop r11	 ; 
	pop r10	 ; 
	pop r9	 ; 
	ret
	.size	_Z10uploadFontv, .-_Z10uploadFontv
	.section	.text._Z9adc_setupv,"ax",@progbits
.global	_Z9adc_setupv
	.type	_Z9adc_setupv, @function
_Z9adc_setupv:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r30,lo8(122)	 ;  tmp46,
	ldi r31,0	 ; 
	ld r24,Z	 ;  D.30171, MEM[(volatile uint8_t *)122B]
	andi r24,lo8(-5)	 ;  D.30171,
	st Z,r24	 ;  MEM[(volatile uint8_t *)122B], D.30171
	ld r24,Z	 ;  D.30171, MEM[(volatile uint8_t *)122B]
	ori r24,lo8(6)	 ;  D.30171,
	st Z,r24	 ;  MEM[(volatile uint8_t *)122B], D.30171
	ret
	.size	_Z9adc_setupv, .-_Z9adc_setupv
	.section	.text._Z9delay_150v,"ax",@progbits
.global	_Z9delay_150v
	.type	_Z9delay_150v, @function
_Z9delay_150v:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r22,lo8(-106)	 ; ,
	ldi r23,0	 ; 
	ldi r24,0	 ; 
	ldi r25,0	 ; 
	jmp delay	 ; 
	.size	_Z9delay_150v, .-_Z9delay_150v
	.section	.text.setup,"ax",@progbits
.global	setup
	.type	setup, @function
setup:
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
/* #APP */
 ;  480 "/usr/share/arduino-1.6.6/hardware/tools/pkg-i686-pc-linux-gnu.5.3/avr/include/avr/wdt.h" 1
	in __tmp_reg__,__SREG__
	cli
	wdr
	lds r24,96	 ;  temp_reg,
	ori r24,24	 ;  temp_reg,
	sts 96,r24	 ; , temp_reg
	sts 96,__zero_reg__	 ; 
	out __SREG__,__tmp_reg__
	
 ;  0 "" 2
/* #NOAPP */
	ldi r22,lo8(1)	 ; ,
	ldi r24,lo8(6)	 ; ,
	call pinMode	 ; 
	ldi r22,lo8(2)	 ; ,
	ldi r24,lo8(3)	 ; ,
	call pinMode	 ; 
	ldi r20,lo8(1)	 ; ,
	ldi r22,lo8(gs(_Z11ReadINT_PINv))	 ; ,
	ldi r23,hi8(gs(_Z11ReadINT_PINv))	 ; ,
	ldi r24,lo8(1)	 ; ,
	call attachInterrupt	 ; 
	in r24,0x24	 ;  D.30176, MEM[(volatile uint8_t *)68B]
	andi r24,lo8(-4)	 ;  D.30176,
	out 0x24,r24	 ;  MEM[(volatile uint8_t *)68B], D.30176
	ldi r24,lo8(3)	 ; ,
	call analogReference	 ; 
	call _Z9adc_setupv	 ; 
	ldi r20,lo8(2)	 ; ,
	ldi r22,lo8(gs(_Z9isr_VSYNCv))	 ; ,
	ldi r23,hi8(gs(_Z9isr_VSYNCv))	 ; ,
	ldi r24,0	 ; 
	call attachInterrupt	 ; 
	ldi r22,0	 ; 
	ldi r23,lo8(-31)	 ; ,
	ldi r24,0	 ; 
	ldi r25,0	 ; 
	call _ZN12SingleSerial5beginEl	 ; 
	ldi r24,lo8(Serial)	 ;  tmp66,
	ldi r25,hi8(Serial)	 ; ,
	sts mavlink_comm_0_port+1,r25	 ;  mavlink_comm_0_port, tmp66
	sts mavlink_comm_0_port,r24	 ;  mavlink_comm_0_port, tmp66
	call _Z11max7456_offv	 ; 
	ldi r22,lo8(5)	 ; ,
	ldi r24,lo8(5)	 ; ,
	call _ZN3OSD8setPanelEhh	 ; 
	ldi r22,lo8(_ZZ5setupE3__c)	 ; ,
	ldi r23,hi8(_ZZ5setupE3__c)	 ; ,
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	call _ZN12BetterStream7print_PEPKc	 ; 
	call _Z12readSettingsv	 ; 
	lds r24,sets+22	 ;  sets.CHK1_VERSION, sets.CHK1_VERSION
	cpi r24,lo8(79)	 ;  sets.CHK1_VERSION,
	brne .L688	 ; ,
	lds r24,sets+23	 ;  sets.CHK2_VERSION, sets.CHK2_VERSION
	cpi r24,lo8(26)	 ;  sets.CHK2_VERSION,
	breq .L695	 ; ,
.L688:
	ldi r22,lo8(1)	 ; ,
	ldi r24,lo8(1)	 ; ,
	call _ZN3OSD8setPanelEhh	 ; 
	push __zero_reg__
	ldi r24,lo8(79)	 ;  tmp71,
	push r24	 ;  tmp71
	lds r24,sets+22	 ;  sets.CHK1_VERSION, sets.CHK1_VERSION
	push __zero_reg__
	push r24	 ;  sets.CHK1_VERSION
	ldi r24,lo8(_ZZ5setupE3__c_0)	 ;  tmp77,
	ldi r25,hi8(_ZZ5setupE3__c_0)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp77
	ldi r24,lo8(osd)	 ;  tmp81,
	ldi r25,hi8(osd)	 ; ,
	push r25	 ; 
	push r24	 ;  tmp81
	call _ZN12BetterStream9_printf_PEPKcz	 ; 
	in r24,__SP_L__	 ; 
	in r25,__SP_H__	 ; 
	adiw r24,8	 ; ,
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r25	 ; 
	out __SREG__,__tmp_reg__
	out __SP_L__,r24	 ; 
	ldi r28,lo8(16)	 ;  start_dly,
	ldi r29,lo8(39)	 ;  start_dly,
	rjmp .L689	 ; 
.L695:
	ldi r28,lo8(20)	 ;  start_dly,
	ldi r29,lo8(5)	 ;  start_dly,
.L689:
	lds r24,sets+24	 ;  sets.FW_VERSION, sets.FW_VERSION
	cpi r24,lo8(56)	 ;  sets.FW_VERSION,
	brne .L690	 ; ,
	lds r24,sets+25	 ;  sets.FW_VERSION, sets.FW_VERSION
	cpi r24,lo8(49)	 ;  sets.FW_VERSION,
	brne .L690	 ; ,
	lds r24,sets+26	 ;  sets.FW_VERSION, sets.FW_VERSION
	cpi r24,lo8(56)	 ;  sets.FW_VERSION,
	breq .L691	 ; ,
.L690:
	ldi r24,lo8(56)	 ;  tmp92,
	sts sets+24,r24	 ;  sets.FW_VERSION, tmp92
	ldi r25,lo8(49)	 ;  tmp94,
	sts sets+25,r25	 ;  sets.FW_VERSION, tmp94
	sts sets+26,r24	 ;  sets.FW_VERSION, tmp92
	ldi r20,lo8(3)	 ; ,
	ldi r21,0	 ; 
	ldi r22,lo8(28)	 ; ,
	ldi r23,lo8(2)	 ; ,
	ldi r24,lo8(sets+24)	 ; ,
	ldi r25,hi8(sets+24)	 ; ,
	call _Z16eeprom_write_lenPhjj	 ; 
.L691:
	lds r24,sets+65	 ;  sets.pwm_src, sets.pwm_src
	tst r24	 ;  sets.pwm_src
	breq .L693	 ; ,
	lds r30,sets+66	 ;  D.30176, sets.pwm_dst
	tst r30	 ;  D.30176
	breq .L693	 ; ,
	ldi r31,0	 ;  D.30177
	lsl r30	 ;  tmp104
	rol r31	 ;  tmp104
	subi r30,lo8(-(_ZZ5setupE8alt_pins-2))	 ;  __addr16,
	sbci r31,hi8(-(_ZZ5setupE8alt_pins-2))	 ;  __addr16,
/* #APP */
 ;  217 "MinimOsd_Extra.ino" 1
	lpm r24, Z+	 ;  __result
	lpm r25, Z	 ;  __result
	
 ;  0 "" 2
/* #NOAPP */
	sts PWM_out_pin,r24	 ;  PWM_out_pin, __result
	tst r24	 ;  __result
	breq .L693	 ; ,
	ldi r22,lo8(1)	 ; ,
	call pinMode	 ; 
	ldi r22,0	 ; 
	lds r24,PWM_out_pin	 ; , PWM_out_pin
	call digitalWrite	 ; 
.L693:
	sts _ZL6panelN,__zero_reg__	 ;  panelN,
	call _Z17readPanelSettingsv	 ; 
	call _ZN3OSD4initEv	 ; 
	call _Z9delay_150v	 ; 
	call _ZN3OSD6updateEv	 ; 
	movw r22,r28	 ;  D.30179, start_dly
	lsl r29	 ; 
	sbc r24,r24	 ; 
	sbc r25,r25	 ; 
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	jmp delay	 ; 
	.size	setup, .-setup
	.section	.text._Z7avgRSSIj,"ax",@progbits
.global	_Z7avgRSSIj
	.type	_Z7avgRSSIj, @function
_Z7avgRSSIj:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r30,_ZZ7avgRSSIjE3ind	 ;  ind, ind
	subi r30,lo8(-(1))	 ;  D.30189,
	sts _ZZ7avgRSSIjE3ind,r30	 ;  ind, D.30189
	andi r30,lo8(7)	 ;  D.30189,
	ldi r31,0	 ;  D.30190
	lsl r30	 ;  tmp62
	rol r31	 ;  tmp62
	subi r30,lo8(-(_ZZ7avgRSSIjE13RSSI_rawArray))	 ;  tmp63,
	sbci r31,hi8(-(_ZZ7avgRSSIjE13RSSI_rawArray))	 ;  tmp63,
	std Z+1,r25	 ;  RSSI_rawArray, d
	st Z,r24	 ;  RSSI_rawArray, d
	ldi r24,lo8(8)	 ;  i,
	ldi r22,0	 ;  d
	ldi r23,0	 ;  d
.L706:
	subi r24,lo8(-(-1))	 ;  i,
	mov r30,r24	 ;  D.30190, i
	ldi r31,0	 ;  D.30190
	lsl r30	 ;  tmp66
	rol r31	 ;  tmp66
	subi r30,lo8(-(_ZZ7avgRSSIjE13RSSI_rawArray))	 ;  tmp67,
	sbci r31,hi8(-(_ZZ7avgRSSIjE13RSSI_rawArray))	 ;  tmp67,
	ld r18,Z	 ;  tmp68, RSSI_rawArray
	ldd r19,Z+1	 ;  tmp68, RSSI_rawArray
	add r22,r18	 ;  d, tmp68
	adc r23,r19	 ;  d,
	cpse r24,__zero_reg__	 ;  i,
	rjmp .L706	 ; 
	ldi r24,0	 ;  d
	ldi r25,0	 ;  d
	call __floatunsisf	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,0	 ; 
	ldi r21,lo8(62)	 ; ,
	call __mulsf3	 ; 
	ret
	.size	_Z7avgRSSIj, .-_Z7avgRSSIj
	.section	.text._Z7On100msv,"ax",@progbits
.global	_Z7On100msv
	.type	_Z7On100msv, @function
_Z7On100msv:
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r28	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 5 */
.L__stack_usage = 5
	lds r24,flags	 ;  flags, flags
	sbrs r24,4	 ;  flags,
	rjmp .L709	 ; 
	lds r28,_ZZ7On100msvE3ind	 ;  ind, ind
	subi r28,lo8(-(1))	 ;  D.30211,
	sts _ZZ7On100msvE3ind,r28	 ;  ind, D.30211
	ldi r24,lo8(16)	 ; ,
	call analogRead	 ; 
	andi r28,lo8(7)	 ;  D.30211,
	mov r30,r28	 ;  D.30212, D.30211
	ldi r31,0	 ;  D.30212
	lsl r30	 ;  tmp140
	rol r31	 ;  tmp140
	subi r30,lo8(-(_ZZ7On100msvE15voltageRawArray))	 ;  tmp141,
	sbci r31,hi8(-(_ZZ7On100msvE15voltageRawArray))	 ;  tmp141,
	std Z+1,r25	 ;  voltageRawArray,
	st Z,r24	 ;  voltageRawArray,
	ldi r24,lo8(8)	 ;  i,
	ldi r22,0	 ;  voltageRaw
	ldi r23,0	 ;  voltageRaw
.L710:
	subi r24,lo8(-(-1))	 ;  i,
	mov r30,r24	 ;  D.30212, i
	ldi r31,0	 ;  D.30212
	lsl r30	 ;  tmp144
	rol r31	 ;  tmp144
	subi r30,lo8(-(_ZZ7On100msvE15voltageRawArray))	 ;  tmp145,
	sbci r31,hi8(-(_ZZ7On100msvE15voltageRawArray))	 ;  tmp145,
	ld r18,Z	 ;  tmp146, voltageRawArray
	ldd r19,Z+1	 ;  tmp146, voltageRawArray
	add r22,r18	 ;  voltageRaw, tmp146
	adc r23,r19	 ;  voltageRaw,
	cpse r24,__zero_reg__	 ;  i,
	rjmp .L710	 ; 
	ldi r24,0	 ;  voltageRaw
	ldi r25,0	 ;  voltageRaw
	call __floatunsisf	 ; 
	lds r18,sets+30	 ; , sets.evBattA_koef
	lds r19,sets+30+1	 ; , sets.evBattA_koef
	lds r20,sets+30+2	 ; , sets.evBattA_koef
	lds r21,sets+30+3	 ; , sets.evBattA_koef
	call __mulsf3	 ; 
	ldi r18,lo8(89)	 ; ,
	ldi r19,lo8(-18)	 ; ,
	ldi r20,lo8(9)	 ; ,
	ldi r21,lo8(64)	 ; ,
	call __mulsf3	 ; 
	call __fixunssfsi	 ; 
	lds r18,_ZL10osd_vbat_A	 ;  D.30213, osd_vbat_A
	lds r19,_ZL10osd_vbat_A+1	 ;  D.30213, osd_vbat_A
	cp r18,__zero_reg__	 ;  D.30213
	cpc r19,__zero_reg__	 ;  D.30213
	breq .L740	 ; ,
	movw r20,r18	 ;  tmp154, D.30213
	lsl r20	 ;  tmp154
	rol r21	 ;  tmp154
	add r18,r20	 ;  D.30213, tmp154
	adc r19,r21	 ;  D.30213,
	add r22,r18	 ;  D.30213, D.30213
	adc r23,r19	 ;  D.30213, D.30213
	lsr r23	 ;  D.30213
	ror r22	 ;  D.30213
	lsr r23	 ;  D.30213
	ror r22	 ;  D.30213
.L740:
	sts _ZL10osd_vbat_A+1,r23	 ;  osd_vbat_A, D.30213
	sts _ZL10osd_vbat_A,r22	 ;  osd_vbat_A, D.30213
	lds r24,lflags	 ;  lflags.got_data, lflags.got_data
	ori r24,lo8(1<<2)	 ;  lflags.got_data,
	sts lflags,r24	 ;  lflags.got_data, lflags.got_data
	lds r22,_ZL10osd_vbat_A	 ;  osd_vbat_A, osd_vbat_A
	lds r23,_ZL10osd_vbat_A+1	 ;  osd_vbat_A, osd_vbat_A
	ldi r24,0	 ;  osd_vbat_A
	ldi r25,0	 ;  osd_vbat_A
	call __floatunsisf	 ; 
	ldi r18,0	 ; 
	ldi r19,0	 ; 
	ldi r20,lo8(122)	 ; ,
	ldi r21,lo8(68)	 ; ,
	call __divsf3	 ; 
	movw r12,r22	 ;  D.30215,
	movw r14,r24	 ;  D.30215,
	lds r24,sets+5	 ;  sets.battv, sets.battv
	ldi r22,lo8(30)	 ; ,
	call __udivmodqi4
	mov r22,r24	 ;  D.30212, n
	ldi r23,0	 ;  D.30212
	ldi r24,0	 ;  D.30212
	ldi r25,0	 ;  D.30212
	call __floatsisf	 ; 
	movw r18,r22	 ;  D.30215,
	movw r20,r24	 ;  D.30215,
	movw r24,r14	 ; , D.30215
	movw r22,r12	 ; , D.30215
	call __divsf3	 ; 
	ldi r18,lo8(51)	 ; ,
	ldi r19,lo8(51)	 ; ,
	ldi r20,lo8(83)	 ; ,
	ldi r21,lo8(64)	 ; ,
	call __subsf3	 ; 
	ldi r18,lo8(-84)	 ; ,
	ldi r19,lo8(-86)	 ; ,
	ldi r20,lo8(-115)	 ; ,
	ldi r21,lo8(67)	 ; ,
	call __mulsf3	 ; 
	call __fixsfsi	 ; 
	sbrs r23,7	 ;  v,
	rjmp .L713	 ; 
	sts _ZL23osd_battery_remaining_A,__zero_reg__	 ;  osd_battery_remaining_A,
	rjmp .L709	 ; 
.L713:
	cpi r22,-1	 ;  v,
	cpc r23,__zero_reg__	 ;  v
	breq .L714	 ; 
	brlt .L714	 ; 
	ldi r24,lo8(-1)	 ;  tmp178,
	sts _ZL23osd_battery_remaining_A,r24	 ;  osd_battery_remaining_A, tmp178
	rjmp .L709	 ; 
.L714:
	sts _ZL23osd_battery_remaining_A,r22	 ;  osd_battery_remaining_A, tmp246
.L709:
	lds r24,flags	 ;  flags, flags
	sbrs r24,5	 ;  flags,
	rjmp .L715	 ; 
	lds r28,_ZZ7On100msvE3ind_0	 ;  ind, ind
	subi r28,lo8(-(1))	 ;  D.30211,
	sts _ZZ7On100msvE3ind_0,r28	 ;  ind, D.30211
	ldi r24,lo8(14)	 ; ,
	call analogRead	 ; 
	andi r28,lo8(7)	 ;  D.30211,
	mov r30,r28	 ;  D.30212, D.30211
	ldi r31,0	 ;  D.30212
	lsl r30	 ;  tmp188
	rol r31	 ;  tmp188
	subi r30,lo8(-(_ZZ7On100msvE16voltageBRawArray))	 ;  tmp189,
	sbci r31,hi8(-(_ZZ7On100msvE16voltageBRawArray))	 ;  tmp189,
	std Z+1,r25	 ;  voltageBRawArray,
	st Z,r24	 ;  voltageBRawArray,
	ldi r24,lo8(8)	 ;  i,
	ldi r22,0	 ;  voltageRaw
	ldi r23,0	 ;  voltageRaw
.L716:
	subi r24,lo8(-(-1))	 ;  i,
	mov r30,r24	 ;  D.30212, i
	ldi r31,0	 ;  D.30212
	lsl r30	 ;  tmp192
	rol r31	 ;  tmp192
	subi r30,lo8(-(_ZZ7On100msvE16voltageBRawArray))	 ;  tmp193,
	sbci r31,hi8(-(_ZZ7On100msvE16voltageBRawArray))	 ;  tmp193,
	ld r18,Z	 ;  tmp194, voltageBRawArray
	ldd r19,Z+1	 ;  tmp194, voltageBRawArray
	add r22,r18	 ;  voltageRaw, tmp194
	adc r23,r19	 ;  voltageRaw,
	cpse r24,__zero_reg__	 ;  i,
	rjmp .L716	 ; 
	ldi r24,0	 ;  voltageRaw
	ldi r25,0	 ;  voltageRaw
	call __floatunsisf	 ; 
	lds r18,sets+34	 ; , sets.evBattB_koef
	lds r19,sets+34+1	 ; , sets.evBattB_koef
	lds r20,sets+34+2	 ; , sets.evBattB_koef
	lds r21,sets+34+3	 ; , sets.evBattB_koef
	call __mulsf3	 ; 
	ldi r18,lo8(-87)	 ; ,
	ldi r19,lo8(-52)	 ; ,
	ldi r20,lo8(8)	 ; ,
	ldi r21,lo8(64)	 ; ,
	call __mulsf3	 ; 
	call __fixunssfsi	 ; 
	lds r18,_ZL10osd_vbat_B	 ;  D.30213, osd_vbat_B
	lds r19,_ZL10osd_vbat_B+1	 ;  D.30213, osd_vbat_B
	cp r18,__zero_reg__	 ;  D.30213
	cpc r19,__zero_reg__	 ;  D.30213
	breq .L741	 ; ,
	movw r20,r18	 ;  tmp202, D.30213
	lsl r20	 ;  tmp202
	rol r21	 ;  tmp202
	add r18,r20	 ;  D.30213, tmp202
	adc r19,r21	 ;  D.30213,
	add r22,r18	 ;  D.30213, D.30213
	adc r23,r19	 ;  D.30213, D.30213
	lsr r23	 ;  D.30213
	ror r22	 ;  D.30213
	lsr r23	 ;  D.30213
	ror r22	 ;  D.30213
.L741:
	sts _ZL10osd_vbat_B+1,r23	 ;  osd_vbat_B, D.30213
	sts _ZL10osd_vbat_B,r22	 ;  osd_vbat_B, D.30213
	lds r24,lflags	 ;  lflags.got_data, lflags.got_data
	ori r24,lo8(1<<2)	 ;  lflags.got_data,
	sts lflags,r24	 ;  lflags.got_data, lflags.got_data
.L715:
	lds r24,flags	 ;  flags, flags
	sbrs r24,6	 ;  flags,
	rjmp .L719	 ; 
	lds r28,_ZZ7On100msvE3ind_1	 ;  ind, ind
	subi r28,lo8(-(1))	 ;  D.30211,
	sts _ZZ7On100msvE3ind_1,r28	 ;  ind, D.30211
	ldi r24,lo8(15)	 ; ,
	call analogRead	 ; 
	andi r28,lo8(7)	 ;  D.30211,
	mov r30,r28	 ;  D.30212, D.30211
	ldi r31,0	 ;  D.30212
	lsl r30	 ;  tmp218
	rol r31	 ;  tmp218
	subi r30,lo8(-(_ZZ7On100msvE15currentRawArray))	 ;  tmp219,
	sbci r31,hi8(-(_ZZ7On100msvE15currentRawArray))	 ;  tmp219,
	std Z+1,r25	 ;  currentRawArray,
	st Z,r24	 ;  currentRawArray,
	ldi r24,lo8(8)	 ;  i,
	ldi r22,0	 ;  currentRaw
	ldi r23,0	 ;  currentRaw
.L720:
	subi r24,lo8(-(-1))	 ;  i,
	mov r30,r24	 ;  D.30212, i
	ldi r31,0	 ;  D.30212
	lsl r30	 ;  tmp222
	rol r31	 ;  tmp222
	subi r30,lo8(-(_ZZ7On100msvE15currentRawArray))	 ;  tmp223,
	sbci r31,hi8(-(_ZZ7On100msvE15currentRawArray))	 ;  tmp223,
	ld r18,Z	 ;  tmp224, currentRawArray
	ldd r19,Z+1	 ;  tmp224, currentRawArray
	add r22,r18	 ;  currentRaw, tmp224
	adc r23,r19	 ;  currentRaw,
	cpse r24,__zero_reg__	 ;  i,
	rjmp .L720	 ; 
	ldi r24,0	 ;  currentRaw
	ldi r25,0	 ;  currentRaw
	call __floatunsisf	 ; 
	lds r18,sets+38	 ; , sets.eCurrent_koef
	lds r19,sets+38+1	 ; , sets.eCurrent_koef
	lds r20,sets+38+2	 ; , sets.eCurrent_koef
	lds r21,sets+38+3	 ; , sets.eCurrent_koef
	call __mulsf3	 ; 
	ldi r18,lo8(13)	 ; ,
	ldi r19,lo8(50)	 ; ,
	ldi r20,lo8(-56)	 ; ,
	ldi r21,lo8(60)	 ; ,
	call __mulsf3	 ; 
	call __fixsfsi	 ; 
	sts _ZL10osd_curr_A+1,r23	 ;  osd_curr_A, tmp230
	sts _ZL10osd_curr_A,r22	 ;  osd_curr_A, tmp230
	lds r24,lflags	 ;  lflags.got_data, lflags.got_data
	ori r24,lo8(1<<2)	 ;  lflags.got_data,
	sts lflags,r24	 ;  lflags.got_data, lflags.got_data
.L719:
	lds r24,sets+10	 ;  sets.RSSI_raw, sets.RSSI_raw
	lsr r24	 ;  ch
	cpi r24,lo8(1)	 ;  ch,
	breq .L722	 ; ,
	brlo .L723	 ; ,
	cpi r24,lo8(2)	 ;  ch,
	breq .L724	 ; ,
	cpi r24,lo8(4)	 ;  ch,
	brne .L708	 ; ,
	lds r24,_ZL8chan_raw+14	 ;  d, chan_raw
	lds r25,_ZL8chan_raw+14+1	 ;  d, chan_raw
	rjmp .L727	 ; 
.L722:
	ldi r24,lo8(17)	 ; ,
	call analogRead	 ; 
	rjmp .L726	 ; 
.L724:
	ldi r18,lo8(32)	 ; ,
	ldi r19,lo8(78)	 ; ,
	ldi r20,0	 ; 
	ldi r21,0	 ; 
	ldi r22,lo8(1)	 ; ,
	ldi r24,lo8(17)	 ; ,
	call pulseIn	 ; 
	movw r24,r22	 ;  d, D.30217
.L726:
	call _Z7avgRSSIj	 ; 
	lds r18,sets+42	 ; , sets.eRSSI_koef
	lds r19,sets+42+1	 ; , sets.eRSSI_koef
	lds r20,sets+42+2	 ; , sets.eRSSI_koef
	lds r21,sets+42+3	 ; , sets.eRSSI_koef
	call __mulsf3	 ; 
	call __fixunssfsi	 ; 
	sts _ZL7rssi_in+1,r23	 ;  rssi_in, tmp239
	sts _ZL7rssi_in,r22	 ;  rssi_in, tmp239
	lds r24,lflags	 ;  lflags.got_data, lflags.got_data
	ori r24,lo8(1<<2)	 ;  lflags.got_data,
	sts lflags,r24	 ;  lflags.got_data, lflags.got_data
	rjmp .L708	 ; 
.L723:
	lds r24,_ZL8osd_rssi	 ;  osd_rssi, osd_rssi
	ldi r25,0	 ;  d
.L727:
	call _Z7avgRSSIj	 ; 
	call __fixunssfsi	 ; 
	sts _ZL7rssi_in+1,r23	 ;  rssi_in, tmp245
	sts _ZL7rssi_in,r22	 ;  rssi_in, tmp245
.L708:
/* epilogue start */
	pop r28	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	ret
	.size	_Z7On100msv, .-_Z7On100msv
	.section	.text._Z6On20msv,"ax",@progbits
.global	_Z6On20msv
	.type	_Z6On20msv, @function
_Z6On20msv:
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	lds r18,PWM_out_pin	 ;  D.30220, PWM_out_pin
	tst r18	 ;  D.30220
	breq .L742	 ; ,
	lds r30,sets+65	 ;  sets.pwm_src, sets.pwm_src
	ldi r31,0	 ;  D.30221
	lsl r30	 ;  tmp74
	rol r31	 ;  tmp74
	subi r30,lo8(-(_ZL8chan_raw+8))	 ;  tmp75,
	sbci r31,hi8(-(_ZL8chan_raw+8))	 ;  tmp75,
	ld r24,Z	 ;  D.30222, chan_raw
	ldd r25,Z+1	 ;  D.30222, chan_raw
	ldi r19,0	 ;  D.30223
	movw r30,r18	 ;  D.30224, D.30223
	subi r30,lo8(-(digital_pin_to_bit_mask_PGM))	 ;  D.30224,
	sbci r31,hi8(-(digital_pin_to_bit_mask_PGM))	 ;  D.30224,
/* #APP */
 ;  479 "MinimOsd_Extra.ino" 1
	lpm r17, Z	 ;  bit
	
 ;  0 "" 2
/* #NOAPP */
	movw r30,r18	 ;  D.30224, D.30223
	subi r30,lo8(-(digital_pin_to_port_PGM))	 ;  D.30224,
	sbci r31,hi8(-(digital_pin_to_port_PGM))	 ;  D.30224,
/* #APP */
 ;  480 "MinimOsd_Extra.ino" 1
	lpm r30, Z	 ;  port
	
 ;  0 "" 2
/* #NOAPP */
	ldi r31,0	 ;  port
	lsl r30	 ;  D.30222
	rol r31	 ;  D.30222
	subi r30,lo8(-(port_to_output_PGM))	 ;  __addr16,
	sbci r31,hi8(-(port_to_output_PGM))	 ;  __addr16,
/* #APP */
 ;  481 "MinimOsd_Extra.ino" 1
	lpm r28, Z+	 ;  __result
	lpm r29, Z	 ;  __result
	
 ;  0 "" 2
 ;  487 "MinimOsd_Extra.ino" 1
	cli
 ;  0 "" 2
/* #NOAPP */
	ld r18,Y	 ;  D.30220, *out_21
	or r18,r17	 ;  D.30220, bit
	st Y,r18	 ;  *out_21, D.30220
	call delayMicroseconds	 ; 
	ld r24,Y	 ;  D.30220, *out_21
	mov r30,r17	 ;  D.30226, bit
	com r30	 ;  D.30226
	and r30,r24	 ;  D.30220, D.30220
	st Y,r30	 ;  *out_21, D.30220
/* #APP */
 ;  491 "MinimOsd_Extra.ino" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.L742:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	ret
	.size	_Z6On20msv, .-_Z6On20msv
	.section	.text._Z12parseNewDatav,"ax",@progbits
.global	_Z12parseNewDatav
	.type	_Z12parseNewDatav, @function
_Z12parseNewDatav:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	lds r24,_ZL23osd_battery_remaining_A	 ;  osd_battery_remaining_A, osd_battery_remaining_A
	ldi r22,lo8(_ZL17osd_battery_pic_A)	 ; ,
	ldi r23,hi8(_ZL17osd_battery_pic_A)	 ; ,
	ldi r25,0	 ; 
	call _Z13setBatteryPicjPh	 ; 
	call _Z11setHomeVarsv	 ; 
	call _Z12setFdataVarsv	 ; 
	jmp _Z11writePanelsv	 ; 
	.size	_Z12parseNewDatav, .-_Z12parseNewDatav
	.section	.text._Z7getDatav,"ax",@progbits
.global	_Z7getDatav
	.type	_Z7getDatav, @function
_Z7getDatav:
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	lds r24,lflags	 ;  lflags, lflags
	sbrc r24,3	 ;  lflags,
	rjmp .L789	 ; 
	lds r24,lflags+1	 ;  lflags, lflags
	sbrc r24,3	 ;  lflags,
	rjmp .L767	 ; 
	sbrc r24,4	 ;  lflags,
	rjmp .L768	 ; 
	call millis	 ; 
	cpi r22,-120	 ;  D.30242,
	sbci r23,19	 ;  D.30242,
	cpc r24,__zero_reg__	 ;  D.30242
	cpc r25,__zero_reg__	 ;  D.30242
	brsh .L753	 ; ,
	call _ZN12SingleSerial11available_SEv	 ; 
	cpse r24,__zero_reg__	 ; ,
	rjmp .L754	 ; 
.L753:
	lds r24,_ZL7seconds	 ;  seconds, seconds
	andi r24,lo8(3)	 ;  D.30243,
	cpi r24,lo8(2)	 ;  D.30243,
	brne .L791	 ; ,
.L767:
	call _Z12uavtalk_readv	 ; 
	rjmp .L750	 ; 
.L791:
	cpi r24,lo8(3)	 ;  D.30243,
	brne .L792	 ; ,
.L768:
	call _Z9mwii_readv	 ; 
	rjmp .L750	 ; 
.L789:
.L769:
	call _Z12read_mavlinkv	 ; 
.L750:
	lds r24,lflags	 ;  lflags, lflags
	sbrs r24,2	 ;  lflags,
	rjmp .L748	 ; 
	andi r24,lo8(~(1<<2))	 ;  lflags.got_data,
	sts lflags,r24	 ;  lflags.got_data, lflags.got_data
	call _Z10pan_togglev	 ; 
	call _Z12parseNewDatav	 ; 
	lds r24,lflags	 ;  lflags.update_stat, lflags.update_stat
	ori r24,lo8(1<<0)	 ;  lflags.update_stat,
	sts lflags,r24	 ;  lflags.update_stat, lflags.update_stat
	ldi r24,lo8(1)	 ;  tmp94,
	sts vsync_wait,r24	 ;  vsync_wait, tmp94
	rjmp .L748	 ; 
.L792:
	cpi r24,lo8(1)	 ;  D.30243,
	brne .L789	 ; ,
	call _ZN12SingleSerial3endEv	 ; 
	call millis	 ; 
	movw r12,r22	 ;  pt, D.30242
	movw r14,r24	 ;  pt, D.30242
	ldi r18,100	 ; ,
	add r12,r18	 ;  pt,
	adc r13,__zero_reg__	 ;  pt
	adc r14,__zero_reg__	 ;  pt
	adc r15,__zero_reg__	 ;  pt
	ldi r29,lo8(-6)	 ;  D.30244,
	ldi r28,lo8(-1)	 ;  pulse,
.L763:
	ldi r18,lo8(-60)	 ; ,
	ldi r19,lo8(9)	 ; ,
	ldi r20,0	 ; 
	ldi r21,0	 ; 
	ldi r22,0	 ; 
	ldi r24,0	 ; 
	call pulseIn	 ; 
	cpi r22,-1	 ;  D.30242,
	cpc r23,__zero_reg__	 ;  D.30242
	cpc r24,__zero_reg__	 ;  D.30242
	cpc r25,__zero_reg__	 ;  D.30242
	breq .+2
	brge .L760	 ; 
	tst r22	 ;  pulse
	breq .L760	 ; ,
	cp r22,r28	 ;  pulse, pulse
	brsh .L761	 ; ,
	mov r28,r22	 ;  pulse, D.30242
.L761:
	call millis	 ; 
	cp r12,r22	 ;  pt, D.30242
	cpc r13,r23	 ;  pt, D.30242
	cpc r14,r24	 ;  pt, D.30242
	cpc r15,r25	 ;  pt, D.30242
	brlo .L762	 ; ,
.L760:
	subi r29,lo8(-(-1))	 ;  D.30244,
	brne .L763	 ; ,
.L762:
	cpi r28,lo8(-1)	 ;  pulse,
	brne .L764	 ; ,
	lds r28,_ZZ7getDatavE10last_pulse	 ;  pulse, last_pulse
	rjmp .L765	 ; 
.L764:
	sts _ZZ7getDatavE10last_pulse,r28	 ;  last_pulse, pulse
.L765:
	cpi r28,lo8(11)	 ;  pulse,
	brlo .L773	 ; ,
	cpi r28,lo8(19)	 ;  pulse,
	brlo .L774	 ; ,
	cpi r28,lo8(29)	 ;  pulse,
	brlo .L775	 ; ,
	cpi r28,lo8(40)	 ;  pulse,
	brlo .L776	 ; ,
	cpi r28,lo8(60)	 ;  pulse,
	brlo .L777	 ; ,
	cpi r28,lo8(-106)	 ;  pulse,
	brlo .L778	 ; ,
	ldi r22,lo8(-64)	 ;  speed,
	ldi r23,lo8(18)	 ;  speed,
	ldi r24,0	 ;  speed
	ldi r25,0	 ;  speed
	rjmp .L766	 ; 
.L773:
	ldi r22,0	 ;  speed
	ldi r23,lo8(-62)	 ;  speed,
	ldi r24,lo8(1)	 ;  speed,
	ldi r25,0	 ;  speed
	rjmp .L766	 ; 
.L774:
	ldi r22,0	 ;  speed
	ldi r23,lo8(-31)	 ;  speed,
	ldi r24,0	 ;  speed
	ldi r25,0	 ;  speed
	rjmp .L766	 ; 
.L775:
	ldi r22,0	 ;  speed
	ldi r23,lo8(-106)	 ;  speed,
	ldi r24,0	 ;  speed
	ldi r25,0	 ;  speed
	rjmp .L766	 ; 
.L776:
	ldi r22,lo8(-128)	 ;  speed,
	ldi r23,lo8(112)	 ;  speed,
	ldi r24,0	 ;  speed
	ldi r25,0	 ;  speed
	rjmp .L766	 ; 
.L777:
	ldi r22,0	 ;  speed
	ldi r23,lo8(75)	 ;  speed,
	ldi r24,0	 ;  speed
	ldi r25,0	 ;  speed
	rjmp .L766	 ; 
.L778:
	ldi r22,lo8(-128)	 ;  speed,
	ldi r23,lo8(37)	 ;  speed,
	ldi r24,0	 ;  speed
	ldi r25,0	 ;  speed
.L766:
	call _ZN12SingleSerial5beginEl	 ; 
	rjmp .L750	 ; 
.L754:
	call _ZN12SingleSerial6read_SEv	 ; 
	cpi r24,lo8(10)	 ;  c,
	breq .L771	 ; ,
	cpi r24,lo8(13)	 ;  c,
	brne .L755	 ; ,
.L771:
	lds r24,crlf_count	 ;  crlf_count, crlf_count
	subi r24,lo8(-(1))	 ;  D.30243,
	sts crlf_count,r24	 ;  crlf_count, D.30243
	rjmp .L756	 ; 
.L755:
	sts crlf_count,__zero_reg__	 ;  crlf_count,
.L756:
	lds r24,crlf_count	 ;  crlf_count, crlf_count
	cpi r24,lo8(4)	 ;  crlf_count,
	brlo .L748	 ; ,
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	jmp _Z10uploadFontv	 ; 
.L748:
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	ret
	.size	_Z7getDatav, .-_Z7getDatav
	.section	.text.loop,"ax",@progbits
.global	loop
	.type	loop, @function
loop:
	push r12	 ; 
	push r13	 ; 
	push r14	 ; 
	push r15	 ; 
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	call millis	 ; 
	movw r12,r22	 ;  pt,
	movw r14,r24	 ;  pt,
/* #APP */
 ;  277 "MinimOsd_Extra.ino" 1
	wdr
 ;  0 "" 2
/* #NOAPP */
	lds r24,_ZL10timer_20ms	 ;  timer_20ms, timer_20ms
	lds r25,_ZL10timer_20ms+1	 ;  timer_20ms, timer_20ms
	lds r26,_ZL10timer_20ms+2	 ;  timer_20ms, timer_20ms
	lds r27,_ZL10timer_20ms+3	 ;  timer_20ms, timer_20ms
	cp r24,r12	 ;  timer_20ms, pt
	cpc r25,r13	 ;  timer_20ms, pt
	cpc r26,r14	 ;  timer_20ms, pt
	cpc r27,r15	 ;  timer_20ms, pt
	brsh .L794	 ; ,
	ldi r22,lo8(20)	 ; ,
	ldi r23,0	 ; 
	ldi r24,lo8(_ZL10timer_20ms)	 ; ,
	ldi r25,hi8(_ZL10timer_20ms)	 ; ,
	call _Z11millis_plusPmj	 ; 
	call _Z6On20msv	 ; 
.L794:
	lds r24,_ZL11timer_100ms	 ;  timer_100ms, timer_100ms
	lds r25,_ZL11timer_100ms+1	 ;  timer_100ms, timer_100ms
	lds r26,_ZL11timer_100ms+2	 ;  timer_100ms, timer_100ms
	lds r27,_ZL11timer_100ms+3	 ;  timer_100ms, timer_100ms
	cp r24,r12	 ;  timer_100ms, pt
	cpc r25,r13	 ;  timer_100ms, pt
	cpc r26,r14	 ;  timer_100ms, pt
	cpc r27,r15	 ;  timer_100ms, pt
	brsh .L795	 ; ,
	ldi r22,lo8(100)	 ; ,
	ldi r23,0	 ; 
	ldi r24,lo8(_ZL11timer_100ms)	 ; ,
	ldi r25,hi8(_ZL11timer_100ms)	 ; ,
	call _Z11millis_plusPmj	 ; 
	call _Z7On100msv	 ; 
.L795:
	lds r24,_ZL11timer_500ms	 ;  timer_500ms, timer_500ms
	lds r25,_ZL11timer_500ms+1	 ;  timer_500ms, timer_500ms
	lds r26,_ZL11timer_500ms+2	 ;  timer_500ms, timer_500ms
	lds r27,_ZL11timer_500ms+3	 ;  timer_500ms, timer_500ms
	cp r24,r12	 ;  timer_500ms, pt
	cpc r25,r13	 ;  timer_500ms, pt
	cpc r26,r14	 ;  timer_500ms, pt
	cpc r27,r15	 ;  timer_500ms, pt
	brsh .L797	 ; ,
	ldi r22,lo8(-12)	 ; ,
	ldi r23,lo8(1)	 ; ,
	ldi r24,lo8(_ZL11timer_500ms)	 ; ,
	ldi r25,hi8(_ZL11timer_500ms)	 ; ,
	call _Z11millis_plusPmj	 ; 
	lds r24,lflags	 ;  lflags.got_data, lflags.got_data
	ori r24,lo8(1<<2)	 ;  lflags.got_data,
	sts lflags,r24	 ;  lflags.got_data, lflags.got_data
	lds r25,lflags+1	 ;  lflags, lflags
	bst r25,2	 ;  lflags,
	clr r19	 ;  D.30249
	bld r19,0	 ;  D.30249
	ldi r18,lo8(1)	 ;  tmp63,
	eor r18,r19	 ;  D.30249, D.30249
	bst r18,0	 ;  D.30249
	bld r25,2	 ;  lflags.blinker,
	sts lflags+1,r25	 ;  lflags.blinker, lflags.blinker
	tst r18	 ;  D.30249
	breq .L797	 ; ,
	lds r25,_ZL7seconds	 ;  seconds, seconds
	subi r25,lo8(-(1))	 ;  D.30250,
	sts _ZL7seconds,r25	 ;  seconds, D.30250
	ori r24,lo8(1<<5)	 ;  lflags.one_sec_timer_switch,
	sts lflags,r24	 ;  lflags.one_sec_timer_switch, lflags.one_sec_timer_switch
.L797:
	call _Z7getDatav	 ; 
	lds r24,lflags	 ;  lflags, lflags
	sbrs r24,0	 ;  lflags,
	rjmp .L793	 ; 
	lds r24,vsync_wait	 ;  D.30250, vsync_wait
	cpse r24,__zero_reg__	 ;  D.30250,
	rjmp .L793	 ; 
	call _ZN3OSD6updateEv	 ; 
	lds r24,lflags	 ;  lflags.update_stat, lflags.update_stat
	andi r24,lo8(~(1<<0))	 ;  lflags.update_stat,
	sts lflags,r24	 ;  lflags.update_stat, lflags.update_stat
.L793:
/* epilogue start */
	pop r15	 ; 
	pop r14	 ; 
	pop r13	 ; 
	pop r12	 ; 
	ret
	.size	loop, .-loop
	.section	.text.startup._GLOBAL__sub_I_flags,"ax",@progbits
	.type	_GLOBAL__sub_I_flags, @function
_GLOBAL__sub_I_flags:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(Serial)	 ; ,
	ldi r25,hi8(Serial)	 ; ,
	call _ZN12SingleSerialC1Ev	 ; 
	ldi r24,lo8(osd)	 ; ,
	ldi r25,hi8(osd)	 ; ,
	jmp _ZN3OSDC1Ev	 ; 
	.size	_GLOBAL__sub_I_flags, .-_GLOBAL__sub_I_flags
	.global __do_global_ctors
	.section .ctors,"a",@progbits
	.p2align	1
	.word	gs(_GLOBAL__sub_I_flags)
	.section	.bss._ZZ7On100msvE15currentRawArray,"aw",@nobits
	.type	_ZZ7On100msvE15currentRawArray, @object
	.size	_ZZ7On100msvE15currentRawArray, 16
_ZZ7On100msvE15currentRawArray:
	.zero	16
	.section	.data._ZZ7On100msvE3ind_1,"aw",@progbits
	.type	_ZZ7On100msvE3ind_1, @object
	.size	_ZZ7On100msvE3ind_1, 1
_ZZ7On100msvE3ind_1:
	.byte	-1
	.section	.bss._ZZ7On100msvE16voltageBRawArray,"aw",@nobits
	.type	_ZZ7On100msvE16voltageBRawArray, @object
	.size	_ZZ7On100msvE16voltageBRawArray, 16
_ZZ7On100msvE16voltageBRawArray:
	.zero	16
	.section	.data._ZZ7On100msvE3ind_0,"aw",@progbits
	.type	_ZZ7On100msvE3ind_0, @object
	.size	_ZZ7On100msvE3ind_0, 1
_ZZ7On100msvE3ind_0:
	.byte	-1
	.section	.bss._ZZ7On100msvE15voltageRawArray,"aw",@nobits
	.type	_ZZ7On100msvE15voltageRawArray, @object
	.size	_ZZ7On100msvE15voltageRawArray, 16
_ZZ7On100msvE15voltageRawArray:
	.zero	16
	.section	.data._ZZ7On100msvE3ind,"aw",@progbits
	.type	_ZZ7On100msvE3ind, @object
	.size	_ZZ7On100msvE3ind, 1
_ZZ7On100msvE3ind:
	.byte	-1
	.section	.bss._ZZ7avgRSSIjE13RSSI_rawArray,"aw",@nobits
	.type	_ZZ7avgRSSIjE13RSSI_rawArray, @object
	.size	_ZZ7avgRSSIjE13RSSI_rawArray, 16
_ZZ7avgRSSIjE13RSSI_rawArray:
	.zero	16
	.section	.data._ZZ7avgRSSIjE3ind,"aw",@progbits
	.type	_ZZ7avgRSSIjE3ind, @object
	.size	_ZZ7avgRSSIjE3ind, 1
_ZZ7avgRSSIjE3ind:
	.byte	-1
	.section	.progmem.data._ZZ5setupE8alt_pins,"a",@progbits
	.type	_ZZ5setupE8alt_pins, @object
	.size	_ZZ5setupE8alt_pins, 8
_ZZ5setupE8alt_pins:
	.word	16
	.word	14
	.word	15
	.word	17
	.section	.progmem.data._ZZ5setupE3__c_0,"a",@progbits
	.type	_ZZ5setupE3__c_0, @object
	.size	_ZZ5setupE3__c_0, 29
_ZZ5setupE3__c_0:
	.string	"Missing/Old Config: %d my %d"
	.section	.progmem.data._ZZ5setupE3__c,"a",@progbits
	.type	_ZZ5setupE3__c, @object
	.size	_ZZ5setupE3__c, 30
_ZZ5setupE3__c:
	.string	"MinimOSD-Extra 2.4|uni r818DV"
	.section	.progmem.data._ZZ10uploadFontvE3__c_0,"a",@progbits
	.type	_ZZ10uploadFontvE3__c_0, @object
	.size	_ZZ10uploadFontvE3__c_0, 6
_ZZ10uploadFontvE3__c_0:
	.string	"CD%d\n"
	.section	.progmem.data._ZZ10uploadFontvE3__c,"a",@progbits
	.type	_ZZ10uploadFontvE3__c, @object
	.size	_ZZ10uploadFontvE3__c, 5
_ZZ10uploadFontvE3__c:
	.string	"RFF\n"
	.section	.bss._ZZ26mavlink_get_channel_statusE16m_mavlink_status,"aw",@nobits
	.type	_ZZ26mavlink_get_channel_statusE16m_mavlink_status, @object
	.size	_ZZ26mavlink_get_channel_statusE16m_mavlink_status, 12
_ZZ26mavlink_get_channel_statusE16m_mavlink_status:
	.zero	12
	.section	.rodata._ZZ18mavlink_parse_charE20mavlink_message_crcs,"a",@progbits
	.type	_ZZ18mavlink_parse_charE20mavlink_message_crcs, @object
	.size	_ZZ18mavlink_parse_charE20mavlink_message_crcs, 256
_ZZ18mavlink_parse_charE20mavlink_message_crcs:
	.byte	50
	.byte	124
	.byte	-119
	.byte	0
	.byte	-19
	.byte	-39
	.byte	104
	.byte	119
	.byte	0
	.byte	0
	.byte	0
	.byte	89
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-42
	.byte	-97
	.byte	-36
	.byte	-88
	.byte	24
	.byte	23
	.byte	-86
	.byte	-112
	.byte	67
	.byte	115
	.byte	39
	.byte	-10
	.byte	-71
	.byte	104
	.byte	-19
	.byte	-12
	.byte	-34
	.byte	-44
	.byte	9
	.byte	-2
	.byte	-26
	.byte	28
	.byte	28
	.byte	-124
	.byte	-35
	.byte	-24
	.byte	11
	.byte	-103
	.byte	41
	.byte	39
	.byte	-42
	.byte	-33
	.byte	-115
	.byte	33
	.byte	15
	.byte	3
	.byte	100
	.byte	24
	.byte	-17
	.byte	-18
	.byte	30
	.byte	-16
	.byte	-73
	.byte	-126
	.byte	-126
	.byte	0
	.byte	-108
	.byte	21
	.byte	0
	.byte	52
	.byte	124
	.byte	0
	.byte	0
	.byte	0
	.byte	20
	.byte	0
	.byte	-104
	.byte	-113
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-25
	.byte	-73
	.byte	63
	.byte	54
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-81
	.byte	102
	.byte	-98
	.byte	-48
	.byte	56
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-122
	.byte	-37
	.byte	-48
	.byte	-68
	.byte	84
	.byte	22
	.byte	19
	.byte	21
	.byte	-122
	.byte	0
	.byte	78
	.byte	68
	.byte	-67
	.byte	127
	.byte	111
	.byte	21
	.byte	21
	.byte	-112
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-52
	.byte	49
	.byte	-86
	.byte	44
	.byte	83
	.byte	46
	.byte	0
	.section	.progmem.data._ZZ8panSetupvE3__c_0,"a",@progbits
	.type	_ZZ8panSetupvE3__c_0, @object
	.size	_ZZ8panSetupvE3__c_0, 8
_ZZ8panSetupvE3__c_0:
	.string	" (NTSC)"
	.section	.progmem.data._ZZ8panSetupvE3__c,"a",@progbits
	.type	_ZZ8panSetupvE3__c, @object
	.size	_ZZ8panSetupvE3__c, 7
_ZZ8panSetupvE3__c:
	.string	" (PAL)"
	.section	.progmem.data._ZZ5panCh5PointE3__c,"a",@progbits
	.type	_ZZ5panCh5PointE3__c, @object
	.size	_ZZ5panCh5PointE3__c, 8
_ZZ5panCh5PointE3__c:
	.string	"C%d%5i|"
	.section	.progmem.data._ZZ13panRadarScale5PointE3__c_0,"a",@progbits
	.type	_ZZ13panRadarScale5PointE3__c_0, @object
	.size	_ZZ13panRadarScale5PointE3__c_0, 8
_ZZ13panRadarScale5PointE3__c_0:
	.string	"%4.0f%c"
	.section	.progmem.data._ZZ13panRadarScale5PointE3__c,"a",@progbits
	.type	_ZZ13panRadarScale5PointE3__c, @object
	.size	_ZZ13panRadarScale5PointE3__c, 8
_ZZ13panRadarScale5PointE3__c:
	.string	"%4.2f%c"
	.section	.bss._ZZ9showRADARhhE3trk,"aw",@nobits
	.type	_ZZ9showRADARhhE3trk, @object
	.size	_ZZ9showRADARhhE3trk, 8
_ZZ9showRADARhhE3trk:
	.zero	8
	.section	.progmem.data._ZZ9showArrowhhE3__c_0,"a",@progbits
	.type	_ZZ9showArrowhhE3__c_0, @object
	.size	_ZZ9showArrowhhE3__c_0, 9
_ZZ9showArrowhhE3__c_0:
	.string	"%c%c%4i\005"
	.section	.progmem.data._ZZ9showArrowhhE3__c,"a",@progbits
	.type	_ZZ9showArrowhhE3__c, @object
	.size	_ZZ9showArrowhhE3__c, 13
_ZZ9showArrowhhE3__c:
	.string	"|%c%c%2.0f%c"
	.section	.progmem.data._ZZ8panWPDis5PointE3__c_0,"a",@progbits
	.type	_ZZ8panWPDis5PointE3__c_0, @object
	.size	_ZZ8panWPDis5PointE3__c_0, 11
_ZZ8panWPDis5PointE3__c_0:
	.string	" Xe%4.0f%c"
	.section	.progmem.data._ZZ8panWPDis5PointE3__c,"a",@progbits
	.type	_ZZ8panWPDis5PointE3__c, @object
	.size	_ZZ8panWPDis5PointE3__c, 13
_ZZ8panWPDis5PointE3__c:
	.string	"%2i %4.0f%c|"
	.section	.progmem.data._ZZ7panRose5PointE3__c_0,"a",@progbits
	.type	_ZZ7panRose5PointE3__c_0, @object
	.size	_ZZ7panRose5PointE3__c_0, 5
_ZZ7panRose5PointE3__c_0:
	.string	"\303%s\207"
	.section	.progmem.data._ZZ7panRose5PointE3__c,"a",@progbits
	.type	_ZZ7panRose5PointE3__c, @object
	.size	_ZZ7panRose5PointE3__c, 13
_ZZ7panRose5PointE3__c:
	.string	" \307\307\307\307.\307\307\307\307 |"
	.section	.progmem.data._ZZ10panHeading5PointE3__c,"a",@progbits
	.type	_ZZ10panHeading5PointE3__c, @object
	.size	_ZZ10panHeading5PointE3__c, 5
_ZZ10panHeading5PointE3__c:
	.string	"%4i\005"
	.section	.progmem.data._ZZ7panGPS25PointE3__c_0,"a",@progbits
	.type	_ZZ7panGPS25PointE3__c_0, @object
	.size	_ZZ7panGPS25PointE3__c_0, 14
_ZZ7panGPS25PointE3__c_0:
	.string	"%10.6f %10.6f"
	.section	.progmem.data._ZZ7panGPS25PointE3__c,"a",@progbits
	.type	_ZZ7panGPS25PointE3__c, @object
	.size	_ZZ7panGPS25PointE3__c, 16
_ZZ7panGPS25PointE3__c:
	.string	"\003%10.6f \004%10.6f"
	.section	.progmem.data._ZZ6panGPS5PointE3__c_0,"a",@progbits
	.type	_ZZ6panGPS5PointE3__c_0, @object
	.size	_ZZ6panGPS5PointE3__c_0, 14
_ZZ6panGPS5PointE3__c_0:
	.string	"%10.6f|%10.6f"
	.section	.progmem.data._ZZ6panGPS5PointE3__c,"a",@progbits
	.type	_ZZ6panGPS5PointE3__c, @object
	.size	_ZZ6panGPS5PointE3__c, 16
_ZZ6panGPS5PointE3__c:
	.string	"\003%10.6f|\004%10.6f"
	.section	.progmem.data._ZZ9panGPSats5PointE3__c,"a",@progbits
	.type	_ZZ9panGPSats5PointE3__c, @object
	.size	_ZZ9panGPSats5PointE3__c, 4
_ZZ9panGPSats5PointE3__c:
	.string	"%2i"
	.section	.progmem.data._ZZ15panWaitMAVBeatsvE3__c,"a",@progbits
	.type	_ZZ15panWaitMAVBeatsvE3__c, @object
	.size	_ZZ15panWaitMAVBeatsvE3__c, 16
_ZZ15panWaitMAVBeatsvE3__c:
	.string	"No input data! "
	.section	.progmem.data._ZZ9printVoltjE3__c,"a",@progbits
	.type	_ZZ9printVoltjE3__c, @object
	.size	_ZZ9printVoltjE3__c, 7
_ZZ9printVoltjE3__c:
	.string	"%5.2f\r"
	.section	.progmem.data._ZZ7panRoll5PointE3__c,"a",@progbits
	.type	_ZZ7panRoll5PointE3__c, @object
	.size	_ZZ7panRoll5PointE3__c, 6
_ZZ7panRoll5PointE3__c:
	.string	"%4i\005\006"
	.section	.progmem.data._ZZ8panPitch5PointE3__c,"a",@progbits
	.type	_ZZ8panPitch5PointE3__c, @object
	.size	_ZZ8panPitch5PointE3__c, 6
_ZZ8panPitch5PointE3__c:
	.string	"%4i\005\007"
	.section	.progmem.data._ZZ10panHorizon5PointE3__c_0,"a",@progbits
	.type	_ZZ10panHorizon5PointE3__c_0, @object
	.size	_ZZ10panHorizon5PointE3__c_0, 3
_ZZ10panHorizon5PointE3__c_0:
	.string	"\270\271"
	.section	.progmem.data._ZZ10panHorizon5PointE3__c,"a",@progbits
	.type	_ZZ10panHorizon5PointE3__c, @object
	.size	_ZZ10panHorizon5PointE3__c, 16
_ZZ10panHorizon5PointE3__c:
	.string	"\306            \305|"
	.section	.progmem.data._ZZ17panBatteryPercent5PointE3__c_2,"a",@progbits
	.type	_ZZ17panBatteryPercent5PointE3__c_2, @object
	.size	_ZZ17panBatteryPercent5PointE3__c_2, 7
_ZZ17panBatteryPercent5PointE3__c_2:
	.string	"%4.0f\001"
	.section	.progmem.data._ZZ17panBatteryPercent5PointE3__c_1,"a",@progbits
	.type	_ZZ17panBatteryPercent5PointE3__c_1, @object
	.size	_ZZ17panBatteryPercent5PointE3__c_1, 8
_ZZ17panBatteryPercent5PointE3__c_1:
	.string	"%2.0f%%"
	.section	.progmem.data._ZZ17panBatteryPercent5PointE3__c_0,"a",@progbits
	.type	_ZZ17panBatteryPercent5PointE3__c_0, @object
	.size	_ZZ17panBatteryPercent5PointE3__c_0, 12
_ZZ17panBatteryPercent5PointE3__c_0:
	.string	"%c%c\216%4.0f\001"
	.section	.progmem.data._ZZ17panBatteryPercent5PointE3__c,"a",@progbits
	.type	_ZZ17panBatteryPercent5PointE3__c, @object
	.size	_ZZ17panBatteryPercent5PointE3__c, 13
_ZZ17panBatteryPercent5PointE3__c:
	.string	"%c%c\216%2.0f%%"
	.section	.progmem.data._ZZ6panThr5PointE3__c,"a",@progbits
	.type	_ZZ6panThr5PointE3__c, @object
	.size	_ZZ6panThr5PointE3__c, 7
_ZZ6panThr5PointE3__c:
	.string	"%3.0i%"
	.section	.progmem.data._ZZ10printSpeedfE3__c,"a",@progbits
	.type	_ZZ10printSpeedfE3__c, @object
	.size	_ZZ10printSpeedfE3__c, 8
_ZZ10printSpeedfE3__c:
	.string	"%3.0f%c"
	.section	.progmem.data._ZZ8panCur_A5PointE3__c,"a",@progbits
	.type	_ZZ8panCur_A5PointE3__c, @object
	.size	_ZZ8panCur_A5PointE3__c, 7
_ZZ8panCur_A5PointE3__c:
	.string	"%5.2f\016"
	.section	.progmem.data._ZZ7panRSSI5PointE3__c,"a",@progbits
	.type	_ZZ7panRSSI5PointE3__c, @object
	.size	_ZZ7panRSSI5PointE3__c, 5
_ZZ7panRSSI5PointE3__c:
	.string	"%3i%"
	.section	.progmem.data._ZZ6panEff5PointE3__c_0,"a",@progbits
	.type	_ZZ6panEff5PointE3__c_0, @object
	.size	_ZZ6panEff5PointE3__c_0, 5
_ZZ6panEff5PointE3__c_0:
	.string	"  \220\221"
	.section	.bss._ZZ6panEff5PointE9ddistance,"aw",@nobits
	.type	_ZZ6panEff5PointE9ddistance, @object
	.size	_ZZ6panEff5PointE9ddistance, 4
_ZZ6panEff5PointE9ddistance:
	.zero	4
	.section	.progmem.data._ZZ6panEff5PointE3__c,"a",@progbits
	.type	_ZZ6panEff5PointE3__c, @object
	.size	_ZZ6panEff5PointE3__c, 7
_ZZ6panEff5PointE3__c:
	.string	"%4.0f\001"
	.section	.progmem.data._ZZ7panTemp5PointE3__c,"a",@progbits
	.type	_ZZ7panTemp5PointE3__c, @object
	.size	_ZZ7panTemp5PointE3__c, 8
_ZZ7panTemp5PointE3__c:
	.string	"%5.1f%c"
	.section	.progmem.data._ZZ7panTune5PointE4fmt0,"a",@progbits
	.type	_ZZ7panTune5PointE4fmt0, @object
	.size	_ZZ7panTune5PointE4fmt0, 9
_ZZ7panTune5PointE4fmt0:
	.string	"NR%3.0f\005"
	.section	.progmem.data._ZZ7panTune5PointE4fmt1,"a",@progbits
	.type	_ZZ7panTune5PointE4fmt1, @object
	.size	_ZZ7panTune5PointE4fmt1, 9
_ZZ7panTune5PointE4fmt1:
	.string	"NP%3.0f\005"
	.section	.progmem.data._ZZ7panTune5PointE4fmt2,"a",@progbits
	.type	_ZZ7panTune5PointE4fmt2, @object
	.size	_ZZ7panTune5PointE4fmt2, 9
_ZZ7panTune5PointE4fmt2:
	.string	"NH%4.0f\005"
	.section	.progmem.data._ZZ7panTune5PointE4fmt3,"a",@progbits
	.type	_ZZ7panTune5PointE4fmt3, @object
	.size	_ZZ7panTune5PointE4fmt3, 9
_ZZ7panTune5PointE4fmt3:
	.string	"TB%6.1f\005"
	.section	.progmem.data._ZZ7panTune5PointE4fmt4,"a",@progbits
	.type	_ZZ7panTune5PointE4fmt4, @object
	.size	_ZZ7panTune5PointE4fmt4, 10
_ZZ7panTune5PointE4fmt4:
	.string	"AE%5.1f%c"
	.section	.progmem.data._ZZ7panTune5PointE4fmt5,"a",@progbits
	.type	_ZZ7panTune5PointE4fmt5, @object
	.size	_ZZ7panTune5PointE4fmt5, 9
_ZZ7panTune5PointE4fmt5:
	.string	"XE%4.0fm"
	.section	.progmem.data._ZZ7panTune5PointE4fmt6,"a",@progbits
	.type	_ZZ7panTune5PointE4fmt6, @object
	.size	_ZZ7panTune5PointE4fmt6, 10
_ZZ7panTune5PointE4fmt6:
	.string	"AE%5.1f%c"
	.section	.progmem.data,"a",@progbits
	.type	_ZZ7panTune5PointE2fd, @object
	.size	_ZZ7panTune5PointE2fd, 72
_ZZ7panTune5PointE2fd:
 ;  fmt:
	.word	_ZZ7panTune5PointE4fmt0
 ;  t:
	.byte	105
 ;  v:
	.word	_ZL8nav_roll
 ;  k:
	.word	0
 ;  c:
	.word	0
 ;  fmt:
	.word	_ZZ7panTune5PointE4fmt1
 ;  t:
	.byte	105
 ;  v:
	.word	_ZL9nav_pitch
 ;  k:
	.word	0
 ;  c:
	.word	0
 ;  fmt:
	.word	_ZZ7panTune5PointE4fmt2
 ;  t:
	.byte	105
 ;  v:
	.word	_ZL11nav_bearing
 ;  k:
	.word	0
 ;  c:
	.word	0
 ;  fmt:
	.word	_ZZ7panTune5PointE4fmt3
 ;  t:
	.byte	105
 ;  v:
	.word	_ZL17wp_target_bearing
 ;  k:
	.word	0
 ;  c:
	.word	0
 ;  fmt:
	.word	_ZZ7panTune5PointE4fmt4
 ;  t:
	.byte	102
 ;  v:
	.word	_ZL9alt_error
	.zero	4
 ;  fmt:
	.word	_ZZ7panTune5PointE4fmt5
 ;  t:
	.byte	105
 ;  v:
	.word	_ZL12xtrack_error
 ;  k:
	.word	0
 ;  c:
	.word	0
 ;  fmt:
	.word	_ZZ7panTune5PointE4fmt6
 ;  t:
	.byte	102
 ;  v:
	.word	_ZL10aspd_error
	.zero	4
 ;  fmt:
	.word	0
	.zero	7
	.section	.progmem.data._ZZ8panFdata5PointE4fmt0,"a",@progbits
	.type	_ZZ8panFdata5PointE4fmt0, @object
	.size	_ZZ8panFdata5PointE4fmt0, 8
_ZZ8panFdata5PointE4fmt0:
	.string	"|\013%5f%c"
	.section	.progmem.data._ZZ8panFdata5PointE4fmt1,"a",@progbits
	.type	_ZZ8panFdata5PointE4fmt1, @object
	.size	_ZZ8panFdata5PointE4fmt1, 7
_ZZ8panFdata5PointE4fmt1:
	.string	"\217%5f%c"
	.section	.progmem.data._ZZ8panFdata5PointE4fmt2,"a",@progbits
	.type	_ZZ8panFdata5PointE4fmt2, @object
	.size	_ZZ8panFdata5PointE4fmt2, 7
_ZZ8panFdata5PointE4fmt2:
	.string	"\024%5f%c"
	.section	.progmem.data._ZZ8panFdata5PointE4fmt3,"a",@progbits
	.type	_ZZ8panFdata5PointE4fmt3, @object
	.size	_ZZ8panFdata5PointE4fmt3, 7
_ZZ8panFdata5PointE4fmt3:
	.string	"\022%5f%c"
	.section	.progmem.data._ZZ8panFdata5PointE4fmt4,"a",@progbits
	.type	_ZZ8panFdata5PointE4fmt4, @object
	.size	_ZZ8panFdata5PointE4fmt4, 8
_ZZ8panFdata5PointE4fmt4:
	.string	"\003%10.6f"
	.section	.progmem.data._ZZ8panFdata5PointE4fmt5,"a",@progbits
	.type	_ZZ8panFdata5PointE4fmt5, @object
	.size	_ZZ8panFdata5PointE4fmt5, 8
_ZZ8panFdata5PointE4fmt5:
	.string	"\004%10.6f"
	.section	.progmem.data,"a",@progbits
	.type	_ZZ8panFdata5PointE2fd, @object
	.size	_ZZ8panFdata5PointE2fd, 63
_ZZ8panFdata5PointE2fd:
 ;  fmt:
	.word	_ZZ8panFdata5PointE4fmt0
 ;  t:
	.byte	102
 ;  v:
	.word	_ZL17max_home_distance
	.zero	4
 ;  fmt:
	.word	_ZZ8panFdata5PointE4fmt1
 ;  t:
	.byte	102
 ;  v:
	.word	_ZL9tdistance
	.zero	4
 ;  fmt:
	.word	_ZZ8panFdata5PointE4fmt2
 ;  t:
	.byte	102
 ;  v:
	.word	_ZL19max_osd_groundspeed
	.zero	4
 ;  fmt:
	.word	_ZZ8panFdata5PointE4fmt3
 ;  t:
	.byte	102
 ;  v:
	.word	_ZL16max_osd_home_alt
	.zero	4
 ;  fmt:
	.word	_ZZ8panFdata5PointE4fmt4
 ;  t:
	.byte	102
 ;  v:
	.word	osd_pos
 ;  k:
	.word	0
 ;  c:
	.word	0
 ;  fmt:
	.word	_ZZ8panFdata5PointE4fmt5
 ;  t:
	.byte	102
 ;  v:
	.word	osd_pos+4
 ;  k:
	.word	0
 ;  c:
	.word	0
 ;  fmt:
	.word	0
	.zero	7
	.section	.progmem.data._ZZ13printFullDistfE3__c,"a",@progbits
	.type	_ZZ13printFullDistfE3__c, @object
	.size	_ZZ13printFullDistfE3__c, 8
_ZZ13printFullDistfE3__c:
	.string	"%5.2f%c"
	.section	.progmem.data._ZZ9printDistfE3__c,"a",@progbits
	.type	_ZZ9printDistfE3__c, @object
	.size	_ZZ9printDistfE3__c, 8
_ZZ9printDistfE3__c:
	.string	"%5.0f%c"
	.section	.progmem.data._ZZ9printTimeiE3__c,"a",@progbits
	.type	_ZZ9printTimeiE3__c, @object
	.size	_ZZ9printTimeiE3__c, 9
_ZZ9printTimeiE3__c:
	.string	"%2i:%02i"
	.section	.data._ZZ17readPanelSettingsvE12currentPanel,"aw",@progbits
	.type	_ZZ17readPanelSettingsvE12currentPanel, @object
	.size	_ZZ17readPanelSettingsvE12currentPanel, 1
_ZZ17readPanelSettingsvE12currentPanel:
	.byte	-1
	.section	.data._ZZ7getDatavE10last_pulse,"aw",@progbits
	.type	_ZZ7getDatavE10last_pulse, @object
	.size	_ZZ7getDatavE10last_pulse, 1
_ZZ7getDatavE10last_pulse:
	.byte	15
.global	params
	.section	.bss.params,"aw",@nobits
	.type	params, @object
	.size	params, 2
params:
	.zero	2
	.section	.bss._ZL16chan4_raw_middle,"aw",@nobits
	.type	_ZL16chan4_raw_middle, @object
	.size	_ZL16chan4_raw_middle, 2
_ZL16chan4_raw_middle:
	.zero	2
	.section	.bss._ZL16chan2_raw_middle,"aw",@nobits
	.type	_ZL16chan2_raw_middle, @object
	.size	_ZL16chan2_raw_middle, 2
_ZL16chan2_raw_middle:
	.zero	2
	.section	.bss._ZL16chan1_raw_middle,"aw",@nobits
	.type	_ZL16chan1_raw_middle, @object
	.size	_ZL16chan1_raw_middle, 2
_ZL16chan1_raw_middle:
	.zero	2
	.section	.bss._ZL10text_timer,"aw",@nobits
	.type	_ZL10text_timer, @object
	.size	_ZL10text_timer, 4
_ZL10text_timer:
	.zero	4
	.section	.bss._ZL12setup_screen,"aw",@nobits
	.type	_ZL12setup_screen, @object
	.size	_ZL12setup_screen, 1
_ZL12setup_screen:
	.zero	1
	.section	.data._ZL10setup_menu,"aw",@progbits
	.type	_ZL10setup_menu, @object
	.size	_ZL10setup_menu, 1
_ZL10setup_menu:
	.byte	1
	.section	.progmem.data._ZL7screens,"a",@progbits
	.type	_ZL7screens, @object
	.size	_ZL7screens, 15
_ZL7screens:
 ;  ptr:
	.word	_ZL7params1
 ;  size:
	.byte	12
 ;  tail:
	.word	0
 ;  ptr:
	.word	_ZL7params2
 ;  size:
	.byte	5
 ;  tail:
	.word	gs(_Z11setup_horizv)
 ;  ptr:
	.word	0
 ;  size:
	.byte	0
	.zero	2
	.section	.progmem.data._ZL7params2,"a",@progbits
	.type	_ZL7params2, @object
	.size	_ZL7params2, 70
_ZL7params2:
 ;  name:
	.word	_ZL9n_horizon
 ;  type:
	.byte	104
 ;  k:
	.byte	0
 ;  value:
	.word	0
 ;  cb:
	.word	0
 ;  fmt:
	.word	0
	.zero	4
 ;  name:
	.word	_ZL11n_k_RollPAL
 ;  type:
	.byte	102
 ;  k:
	.byte	1
 ;  value:
	.word	sets+46
 ;  cb:
	.word	0
 ;  fmt:
	.word	_ZL7f_float
 ;  min:
	.word	-4
 ;  max:
	.word	4
 ;  name:
	.word	_ZL12n_k_PitchPAL
 ;  type:
	.byte	102
 ;  k:
	.byte	1
 ;  value:
	.word	sets+50
 ;  cb:
	.word	0
 ;  fmt:
	.word	_ZL7f_float
 ;  min:
	.word	-4
 ;  max:
	.word	4
 ;  name:
	.word	_ZL12n_k_RollNTSC
 ;  type:
	.byte	102
 ;  k:
	.byte	1
 ;  value:
	.word	sets+54
 ;  cb:
	.word	0
 ;  fmt:
	.word	_ZL7f_float
 ;  min:
	.word	-4
 ;  max:
	.word	4
 ;  name:
	.word	_ZL13n_k_PitchNTSC
 ;  type:
	.byte	102
 ;  k:
	.byte	1
 ;  value:
	.word	sets+58
 ;  cb:
	.word	0
 ;  fmt:
	.word	_ZL7f_float
 ;  min:
	.word	-4
 ;  max:
	.word	4
	.section	.progmem.data._ZL7params1,"a",@progbits
	.type	_ZL7params1, @object
	.size	_ZL7params1, 168
_ZL7params1:
 ;  name:
	.word	_ZL6n_sets
 ;  type:
	.byte	0
 ;  k:
	.byte	0
 ;  value:
	.word	0
 ;  cb:
	.word	0
 ;  fmt:
	.word	0
	.zero	4
 ;  name:
	.word	_ZL6n_batt
 ;  type:
	.byte	98
 ;  k:
	.byte	10
 ;  value:
	.word	sets+5
 ;  cb:
	.word	0
 ;  fmt:
	.word	_ZL6f_batt
 ;  min:
	.word	0
 ;  max:
	.word	255
 ;  name:
	.word	_ZL7n_battB
 ;  type:
	.byte	98
 ;  k:
	.byte	10
 ;  value:
	.word	sets+62
 ;  cb:
	.word	0
 ;  fmt:
	.word	_ZL6f_batt
 ;  min:
	.word	0
 ;  max:
	.word	255
 ;  name:
	.word	_ZL7n_stall
 ;  type:
	.byte	98
 ;  k:
	.byte	1
 ;  value:
	.word	sets+4
 ;  cb:
	.word	0
 ;  fmt:
	.word	_ZL5f_int
 ;  min:
	.word	0
 ;  max:
	.word	255
 ;  name:
	.word	_ZL8n_oversp
 ;  type:
	.byte	98
 ;  k:
	.byte	1
 ;  value:
	.word	sets+3
 ;  cb:
	.word	0
 ;  fmt:
	.word	_ZL5f_int
 ;  min:
	.word	0
 ;  max:
	.word	255
 ;  name:
	.word	_ZL8n_charge
 ;  type:
	.byte	98
 ;  k:
	.byte	1
 ;  value:
	.word	sets+11
 ;  cb:
	.word	0
 ;  fmt:
	.word	_ZL5f_int
 ;  min:
	.word	0
 ;  max:
	.word	255
 ;  name:
	.word	_ZL6n_rssi
 ;  type:
	.byte	98
 ;  k:
	.byte	1
 ;  value:
	.word	sets+12
 ;  cb:
	.word	0
 ;  fmt:
	.word	_ZL5f_int
 ;  min:
	.word	0
 ;  max:
	.word	255
 ;  name:
	.word	_ZL8n_screen
 ;  type:
	.byte	0
 ;  k:
	.byte	0
 ;  value:
	.word	0
 ;  cb:
	.word	0
 ;  fmt:
	.word	0
	.zero	4
 ;  name:
	.word	_ZL5n_scr
 ;  type:
	.byte	98
 ;  k:
	.byte	1
 ;  value:
	.word	sets+67
 ;  cb:
	.word	0
 ;  fmt:
	.word	_ZL5f_int
 ;  min:
	.word	1
 ;  max:
	.word	4
 ;  name:
	.word	_ZL7n_contr
 ;  type:
	.byte	98
 ;  k:
	.byte	1
 ;  value:
	.word	sets+2
 ;  cb:
	.word	gs(_Z5renewv)
 ;  fmt:
	.word	_ZL5f_int
 ;  min:
	.word	0
 ;  max:
	.word	3
 ;  name:
	.word	_ZL7n_horiz
 ;  type:
	.byte	99
 ;  k:
	.byte	1
 ;  value:
	.word	sets+64
 ;  cb:
	.word	gs(_Z5renewv)
 ;  fmt:
	.word	_ZL5f_int
 ;  min:
	.word	-31
 ;  max:
	.word	31
 ;  name:
	.word	_ZL6n_vert
 ;  type:
	.byte	99
 ;  k:
	.byte	1
 ;  value:
	.word	sets+63
 ;  cb:
	.word	gs(_Z5renewv)
 ;  fmt:
	.word	_ZL5f_int
 ;  min:
	.word	-15
 ;  max:
	.word	15
	.section	.progmem.data._ZL5f_int,"a",@progbits
	.type	_ZL5f_int, @object
	.size	_ZL5f_int, 5
_ZL5f_int:
	.string	"%.0f"
	.section	.progmem.data._ZL6f_batt,"a",@progbits
	.type	_ZL6f_batt, @object
	.size	_ZL6f_batt, 7
_ZL6f_batt:
	.string	"%3.1fv"
	.section	.progmem.data._ZL7f_float,"a",@progbits
	.type	_ZL7f_float, @object
	.size	_ZL7f_float, 5
_ZL7f_float:
	.string	"%.3f"
	.section	.progmem.data._ZL12n_k_RollNTSC,"a",@progbits
	.type	_ZL12n_k_RollNTSC, @object
	.size	_ZL12n_k_RollNTSC, 14
_ZL12n_k_RollNTSC:
	.string	"Roll  in NTSC"
	.section	.progmem.data._ZL13n_k_PitchNTSC,"a",@progbits
	.type	_ZL13n_k_PitchNTSC, @object
	.size	_ZL13n_k_PitchNTSC, 14
_ZL13n_k_PitchNTSC:
	.string	"Pitch in NTSC"
	.section	.progmem.data._ZL11n_k_RollPAL,"a",@progbits
	.type	_ZL11n_k_RollPAL, @object
	.size	_ZL11n_k_RollPAL, 13
_ZL11n_k_RollPAL:
	.string	"Roll  in PAL"
	.section	.progmem.data._ZL12n_k_PitchPAL,"a",@progbits
	.type	_ZL12n_k_PitchPAL, @object
	.size	_ZL12n_k_PitchPAL, 13
_ZL12n_k_PitchPAL:
	.string	"Pitch in PAL"
	.section	.progmem.data._ZL9n_horizon,"a",@progbits
	.type	_ZL9n_horizon, @object
	.size	_ZL9n_horizon, 17
_ZL9n_horizon:
	.string	"  Horizon angles"
	.section	.progmem.data._ZL6n_vert,"a",@progbits
	.type	_ZL6n_vert, @object
	.size	_ZL6n_vert, 14
_ZL6n_vert:
	.string	"Vertical offs"
	.section	.progmem.data._ZL7n_horiz,"a",@progbits
	.type	_ZL7n_horiz, @object
	.size	_ZL7n_horiz, 16
_ZL7n_horiz:
	.string	"Horizontal offs"
	.section	.progmem.data._ZL7n_contr,"a",@progbits
	.type	_ZL7n_contr, @object
	.size	_ZL7n_contr, 9
_ZL7n_contr:
	.string	"Contrast"
	.section	.progmem.data._ZL5n_scr,"a",@progbits
	.type	_ZL5n_scr, @object
	.size	_ZL5n_scr, 14
_ZL5n_scr:
	.string	"Screens Count"
	.section	.progmem.data._ZL8n_screen,"a",@progbits
	.type	_ZL8n_screen, @object
	.size	_ZL8n_screen, 16
_ZL8n_screen:
	.string	"  Screen params"
	.section	.progmem.data._ZL6n_rssi,"a",@progbits
	.type	_ZL6n_rssi, @object
	.size	_ZL6n_rssi, 13
_ZL6n_rssi:
	.string	"RSSI warning"
	.section	.progmem.data._ZL8n_charge,"a",@progbits
	.type	_ZL8n_charge, @object
	.size	_ZL8n_charge, 17
_ZL8n_charge:
	.string	"Batt charge warn"
	.section	.progmem.data._ZL8n_oversp,"a",@progbits
	.type	_ZL8n_oversp, @object
	.size	_ZL8n_oversp, 18
_ZL8n_oversp:
	.string	"Overspeed warning"
	.section	.progmem.data._ZL7n_stall,"a",@progbits
	.type	_ZL7n_stall, @object
	.size	_ZL7n_stall, 14
_ZL7n_stall:
	.string	"Stall warning"
	.section	.progmem.data._ZL7n_battB,"a",@progbits
	.type	_ZL7n_battB, @object
	.size	_ZL7n_battB, 15
_ZL7n_battB:
	.string	"Batt 2 warning"
	.section	.progmem.data._ZL6n_batt,"a",@progbits
	.type	_ZL6n_batt, @object
	.size	_ZL6n_batt, 16
_ZL6n_batt:
	.string	"Battery warning"
	.section	.progmem.data._ZL6n_sets,"a",@progbits
	.type	_ZL6n_sets, @object
	.size	_ZL6n_sets, 16
_ZL6n_sets:
	.string	"      OSD setup"
	.section	.bss._ZL10radar_zoom,"aw",@nobits
	.type	_ZL10radar_zoom, @object
	.size	_ZL10radar_zoom, 2
_ZL10radar_zoom:
	.zero	2
	.section	.progmem.data._ZL15mode_mw_strings,"a",@progbits
	.type	_ZL15mode_mw_strings, @object
	.size	_ZL15mode_mw_strings, 12
_ZL15mode_mw_strings:
	.word	_ZL8s_mode01
	.word	_ZL8mw_mode1
	.word	_ZL8mw_mode2
	.word	_ZL8s_mode02
	.word	_ZL8s_mode06
	.word	_ZL8s_mode08
	.section	.progmem.data._ZL8mw_mode2,"a",@progbits
	.type	_ZL8mw_mode2, @object
	.size	_ZL8mw_mode2, 5
_ZL8mw_mode2:
	.string	"hori"
	.section	.progmem.data._ZL8mw_mode1,"a",@progbits
	.type	_ZL8mw_mode1, @object
	.size	_ZL8mw_mode1, 5
_ZL8mw_mode1:
	.string	"angl"
	.section	.progmem.data._ZL15mode_aq_strings,"a",@progbits
	.type	_ZL15mode_aq_strings, @object
	.size	_ZL15mode_aq_strings, 18
_ZL15mode_aq_strings:
	.word	_ZL8aq_mode0
	.word	_ZL8p_mode01
	.word	_ZL8s_mode02
	.word	_ZL8s_mode08
	.word	_ZL8aq_mode4
	.word	_ZL8aq_mode5
	.word	_ZL8aq_mode6
	.word	_ZL8aq_mode7
	.word	_ZL8aq_mode8
	.section	.progmem.data._ZL8aq_mode8,"a",@progbits
	.type	_ZL8aq_mode8, @object
	.size	_ZL8aq_mode8, 5
_ZL8aq_mode8:
	.string	"init"
	.section	.progmem.data._ZL8aq_mode7,"a",@progbits
	.type	_ZL8aq_mode7, @object
	.size	_ZL8aq_mode7, 5
_ZL8aq_mode7:
	.string	"m_07"
	.section	.progmem.data._ZL8aq_mode6,"a",@progbits
	.type	_ZL8aq_mode6, @object
	.size	_ZL8aq_mode6, 5
_ZL8aq_mode6:
	.string	"m_06"
	.section	.progmem.data._ZL8aq_mode5,"a",@progbits
	.type	_ZL8aq_mode5, @object
	.size	_ZL8aq_mode5, 5
_ZL8aq_mode5:
	.string	"miss"
	.section	.progmem.data._ZL8aq_mode4,"a",@progbits
	.type	_ZL8aq_mode4, @object
	.size	_ZL8aq_mode4, 5
_ZL8aq_mode4:
	.string	"m_04"
	.section	.progmem.data._ZL8aq_mode0,"a",@progbits
	.type	_ZL8aq_mode0, @object
	.size	_ZL8aq_mode0, 4
_ZL8aq_mode0:
	.string	"arm"
	.section	.progmem.data._ZL14mode_u_strings,"a",@progbits
	.type	_ZL14mode_u_strings, @object
	.size	_ZL14mode_u_strings, 36
_ZL14mode_u_strings:
	.word	_ZL8p_mode01
	.word	_ZL8u_mode01
	.word	_ZL8u_mode02
	.word	_ZL8u_mode03
	.word	_ZL8u_mode04
	.word	_ZL8u_mode05
	.word	_ZL8u_mode06
	.word	_ZL8s_mode08
	.word	_ZL8u_mode08
	.word	_ZL8u_mode09
	.word	_ZL8u_mode10
	.word	_ZL8u_mode11
	.word	_ZL8s_mode06
	.word	_ZL8s_mode09
	.word	_ZL8u_mode14
	.word	_ZL8u_mode15
	.word	_ZL8p_mode08
	.word	_ZL8u_mode17
	.section	.progmem.data._ZL8u_mode17,"a",@progbits
	.type	_ZL8u_mode17, @object
	.size	_ZL8u_mode17, 5
_ZL8u_mode17:
	.string	"atof"
	.section	.progmem.data._ZL8u_mode15,"a",@progbits
	.type	_ZL8u_mode15, @object
	.size	_ZL8u_mode15, 4
_ZL8u_mode15:
	.string	"poi"
	.section	.progmem.data._ZL8u_mode14,"a",@progbits
	.type	_ZL8u_mode14, @object
	.size	_ZL8u_mode14, 3
_ZL8u_mode14:
	.string	"pp"
	.section	.progmem.data._ZL8u_mode11,"a",@progbits
	.type	_ZL8u_mode11, @object
	.size	_ZL8u_mode11, 3
_ZL8u_mode11:
	.string	"pa"
	.section	.progmem.data._ZL8u_mode10,"a",@progbits
	.type	_ZL8u_mode10, @object
	.size	_ZL8u_mode10, 3
_ZL8u_mode10:
	.string	"hl"
	.section	.progmem.data._ZL8u_mode09,"a",@progbits
	.type	_ZL8u_mode09, @object
	.size	_ZL8u_mode09, 5
_ZL8u_mode09:
	.string	"posr"
	.section	.progmem.data._ZL8u_mode08,"a",@progbits
	.type	_ZL8u_mode08, @object
	.size	_ZL8u_mode08, 3
_ZL8u_mode08:
	.string	"cl"
	.section	.progmem.data._ZL8u_mode06,"a",@progbits
	.type	_ZL8u_mode06, @object
	.size	_ZL8u_mode06, 5
_ZL8u_mode06:
	.string	"stb6"
	.section	.progmem.data._ZL8u_mode05,"a",@progbits
	.type	_ZL8u_mode05, @object
	.size	_ZL8u_mode05, 5
_ZL8u_mode05:
	.string	"stb5"
	.section	.progmem.data._ZL8u_mode04,"a",@progbits
	.type	_ZL8u_mode04, @object
	.size	_ZL8u_mode04, 5
_ZL8u_mode04:
	.string	"stb4"
	.section	.progmem.data._ZL8u_mode03,"a",@progbits
	.type	_ZL8u_mode03, @object
	.size	_ZL8u_mode03, 5
_ZL8u_mode03:
	.string	"stb3"
	.section	.progmem.data._ZL8u_mode02,"a",@progbits
	.type	_ZL8u_mode02, @object
	.size	_ZL8u_mode02, 5
_ZL8u_mode02:
	.string	"stb2"
	.section	.progmem.data._ZL8u_mode01,"a",@progbits
	.type	_ZL8u_mode01, @object
	.size	_ZL8u_mode01, 5
_ZL8u_mode01:
	.string	"stb1"
	.section	.progmem.data._ZL14mode_p_strings,"a",@progbits
	.type	_ZL14mode_p_strings, @object
	.size	_ZL14mode_p_strings, 38
_ZL14mode_p_strings:
	.word	_ZL8p_mode01
	.word	_ZL8p_mode02
	.word	_ZL8p_mode03
	.word	_ZL8p_mode04
	.word	_ZL8s_mode01
	.word	_ZL8p_mode06
	.word	_ZL8p_mode07
	.word	_ZL8p_mode08
	.word	_ZL8p_mode09
	.word	_ZL8s_mode03
	.word	_ZL8s_mode06
	.word	_ZL8s_mode05
	.word	_ZL8p_mode13
	.word	_ZL8p_mode14
	.word	_ZL8s_mode04
	.word	_ZL8p_mode16
	.word	_ZL8p_mode17
	.word	_ZL8p_mode18
	.word	_ZL8p_mode19
	.section	.progmem.data._ZL8p_mode19,"a",@progbits
	.type	_ZL8p_mode19, @object
	.size	_ZL8p_mode19, 5
_ZL8p_mode19:
	.string	"qloi"
	.section	.progmem.data._ZL8p_mode18,"a",@progbits
	.type	_ZL8p_mode18, @object
	.size	_ZL8p_mode18, 5
_ZL8p_mode18:
	.string	"qhov"
	.section	.progmem.data._ZL8p_mode17,"a",@progbits
	.type	_ZL8p_mode17, @object
	.size	_ZL8p_mode17, 5
_ZL8p_mode17:
	.string	"qstb"
	.section	.progmem.data._ZL8p_mode16,"a",@progbits
	.type	_ZL8p_mode16, @object
	.size	_ZL8p_mode16, 5
_ZL8p_mode16:
	.string	"init"
	.section	.progmem.data._ZL8p_mode14,"a",@progbits
	.type	_ZL8p_mode14, @object
	.size	_ZL8p_mode14, 5
_ZL8p_mode14:
	.string	"m_14"
	.section	.progmem.data._ZL8p_mode13,"a",@progbits
	.type	_ZL8p_mode13, @object
	.size	_ZL8p_mode13, 5
_ZL8p_mode13:
	.string	"m_13"
	.section	.progmem.data._ZL8p_mode09,"a",@progbits
	.type	_ZL8p_mode09, @object
	.size	_ZL8p_mode09, 5
_ZL8p_mode09:
	.string	"atun"
	.section	.progmem.data._ZL8p_mode08,"a",@progbits
	.type	_ZL8p_mode08, @object
	.size	_ZL8p_mode08, 5
_ZL8p_mode08:
	.string	"cruz"
	.section	.progmem.data._ZL8p_mode07,"a",@progbits
	.type	_ZL8p_mode07, @object
	.size	_ZL8p_mode07, 5
_ZL8p_mode07:
	.string	"fbwb"
	.section	.progmem.data._ZL8p_mode06,"a",@progbits
	.type	_ZL8p_mode06, @object
	.size	_ZL8p_mode06, 5
_ZL8p_mode06:
	.string	"fbwa"
	.section	.progmem.data._ZL8p_mode04,"a",@progbits
	.type	_ZL8p_mode04, @object
	.size	_ZL8p_mode04, 5
_ZL8p_mode04:
	.string	"trai"
	.section	.progmem.data._ZL8p_mode03,"a",@progbits
	.type	_ZL8p_mode03, @object
	.size	_ZL8p_mode03, 5
_ZL8p_mode03:
	.string	"stab"
	.section	.progmem.data._ZL8p_mode02,"a",@progbits
	.type	_ZL8p_mode02, @object
	.size	_ZL8p_mode02, 5
_ZL8p_mode02:
	.string	"circ"
	.section	.progmem.data._ZL8p_mode01,"a",@progbits
	.type	_ZL8p_mode01, @object
	.size	_ZL8p_mode01, 5
_ZL8p_mode01:
	.string	"manu"
	.section	.progmem.data._ZL14mode_c_strings,"a",@progbits
	.type	_ZL14mode_c_strings, @object
	.size	_ZL14mode_c_strings, 34
_ZL14mode_c_strings:
	.word	_ZL8s_mode00
	.word	_ZL8s_mode01
	.word	_ZL8s_mode02
	.word	_ZL8s_mode03
	.word	_ZL8s_mode04
	.word	_ZL8s_mode05
	.word	_ZL8s_mode06
	.word	_ZL8s_mode07
	.word	_ZL8s_mode08
	.word	_ZL8s_mode09
	.word	_ZL8s_mode10
	.word	_ZL8s_mode11
	.word	_ZL8s_mode12
	.word	_ZL8s_mode13
	.word	_ZL8s_mode14
	.word	_ZL8s_mode15
	.word	_ZL8s_mode16
	.section	.progmem.data._ZL8s_mode16,"a",@progbits
	.type	_ZL8s_mode16, @object
	.size	_ZL8s_mode16, 5
_ZL8s_mode16:
	.string	"hold"
	.section	.progmem.data._ZL8s_mode15,"a",@progbits
	.type	_ZL8s_mode15, @object
	.size	_ZL8s_mode15, 5
_ZL8s_mode15:
	.string	"tune"
	.section	.progmem.data._ZL8s_mode14,"a",@progbits
	.type	_ZL8s_mode14, @object
	.size	_ZL8s_mode14, 5
_ZL8s_mode14:
	.string	"flip"
	.section	.progmem.data._ZL8s_mode13,"a",@progbits
	.type	_ZL8s_mode13, @object
	.size	_ZL8s_mode13, 5
_ZL8s_mode13:
	.string	"sprt"
	.section	.progmem.data._ZL8s_mode12,"a",@progbits
	.type	_ZL8s_mode12, @object
	.size	_ZL8s_mode12, 5
_ZL8s_mode12:
	.string	"m 12"
	.section	.progmem.data._ZL8s_mode11,"a",@progbits
	.type	_ZL8s_mode11, @object
	.size	_ZL8s_mode11, 5
_ZL8s_mode11:
	.string	"drif"
	.section	.progmem.data._ZL8s_mode10,"a",@progbits
	.type	_ZL8s_mode10, @object
	.size	_ZL8s_mode10, 5
_ZL8s_mode10:
	.string	"oflo"
	.section	.progmem.data._ZL8s_mode09,"a",@progbits
	.type	_ZL8s_mode09, @object
	.size	_ZL8s_mode09, 5
_ZL8s_mode09:
	.string	"land"
	.section	.progmem.data._ZL8s_mode08,"a",@progbits
	.type	_ZL8s_mode08, @object
	.size	_ZL8s_mode08, 5
_ZL8s_mode08:
	.string	"posh"
	.section	.progmem.data._ZL8s_mode07,"a",@progbits
	.type	_ZL8s_mode07, @object
	.size	_ZL8s_mode07, 5
_ZL8s_mode07:
	.string	"circ"
	.section	.progmem.data._ZL8s_mode06,"a",@progbits
	.type	_ZL8s_mode06, @object
	.size	_ZL8s_mode06, 4
_ZL8s_mode06:
	.string	"rtl"
	.section	.progmem.data._ZL8s_mode05,"a",@progbits
	.type	_ZL8s_mode05, @object
	.size	_ZL8s_mode05, 5
_ZL8s_mode05:
	.string	"loit"
	.section	.progmem.data._ZL8s_mode04,"a",@progbits
	.type	_ZL8s_mode04, @object
	.size	_ZL8s_mode04, 5
_ZL8s_mode04:
	.string	"guid"
	.section	.progmem.data._ZL8s_mode03,"a",@progbits
	.type	_ZL8s_mode03, @object
	.size	_ZL8s_mode03, 5
_ZL8s_mode03:
	.string	"auto"
	.section	.progmem.data._ZL8s_mode02,"a",@progbits
	.type	_ZL8s_mode02, @object
	.size	_ZL8s_mode02, 5
_ZL8s_mode02:
	.string	"alth"
	.section	.progmem.data._ZL8s_mode01,"a",@progbits
	.type	_ZL8s_mode01, @object
	.size	_ZL8s_mode01, 5
_ZL8s_mode01:
	.string	"acro"
	.section	.progmem.data._ZL8s_mode00,"a",@progbits
	.type	_ZL8s_mode00, @object
	.size	_ZL8s_mode00, 5
_ZL8s_mode00:
	.string	"stab"
	.section	.progmem.data._ZL7str_hud,"a",@progbits
	.type	_ZL7str_hud, @object
	.size	_ZL7str_hud, 16
_ZL7str_hud:
	.string	"\262            \263|"
	.section	.rodata._ZL8warn_str,"a",@progbits
	.type	_ZL8warn_str, @object
	.size	_ZL8warn_str, 14
_ZL8warn_str:
	.word	0
	.word	_ZL2w1
	.word	_ZL2w2
	.word	_ZL2w3
	.word	_ZL2w4
	.word	_ZL2w5
	.word	_ZL2w6
	.section	.progmem.data._ZL2w6,"a",@progbits
	.type	_ZL2w6, @object
	.size	_ZL2w6, 13
_ZL2w6:
	.string	"High VSpeed!"
	.section	.progmem.data._ZL2w5,"a",@progbits
	.type	_ZL2w5, @object
	.size	_ZL2w5, 11
_ZL2w5:
	.string	"  Low Rssi"
	.section	.progmem.data._ZL2w4,"a",@progbits
	.type	_ZL2w4, @object
	.size	_ZL2w4, 13
_ZL2w4:
	.string	"Battery Low!"
	.section	.progmem.data._ZL2w3,"a",@progbits
	.type	_ZL2w3, @object
	.size	_ZL2w3, 12
_ZL2w3:
	.string	" OverSpeed!"
	.section	.progmem.data._ZL2w2,"a",@progbits
	.type	_ZL2w2, @object
	.size	_ZL2w2, 10
_ZL2w2:
	.string	"   Stall!"
	.section	.progmem.data._ZL2w1,"a",@progbits
	.type	_ZL2w1, @object
	.size	_ZL2w1, 13
_ZL2w1:
	.string	" No GPS fix!"
.global	warning
	.section	.bss.warning,"aw",@nobits
	.type	warning, @object
	.size	warning, 1
warning:
	.zero	1
	.section	.bss._ZGVZ7panTune5PointE2fd,"aw",@nobits
	.type	_ZGVZ7panTune5PointE2fd, @object
	.size	_ZGVZ7panTune5PointE2fd, 8
_ZGVZ7panTune5PointE2fd:
	.zero	8
	.section	.bss._ZGVZ8panFdata5PointE2fd,"aw",@nobits
	.type	_ZGVZ8panFdata5PointE2fd, @object
	.size	_ZGVZ8panFdata5PointE2fd, 8
_ZGVZ8panFdata5PointE2fd:
	.zero	8
	.section	.progmem.data._ZL10fmt_xtrack,"a",@progbits
	.type	_ZL10fmt_xtrack, @object
	.size	_ZL10fmt_xtrack, 11
_ZL10fmt_xtrack:
	.string	" Xe%4.0f%c"
	.section	.progmem.data._ZL11panels_list,"a",@progbits
	.type	_ZL11panels_list, @object
	.size	_ZL11panels_list, 105
_ZL11panels_list:
 ;  n:
	.byte	21
 ;  f:
	.word	gs(_Z10panHorizon5Point)
 ;  n:
	.byte	1
 ;  f:
	.word	gs(_Z8panPitch5Point)
 ;  n:
	.byte	2
 ;  f:
	.word	gs(_Z7panRoll5Point)
 ;  n:
	.byte	3
 ;  f:
	.word	gs(_Z9panBatt_A5Point)
 ;  n:
	.byte	4
 ;  f:
	.word	gs(_Z9panBatt_B5Point)
 ;  n:
	.byte	5
 ;  f:
	.word	gs(_Z9panGPSats5Point)
 ;  n:
	.byte	7
 ;  f:
	.word	gs(_Z6panGPS5Point)
 ;  n:
	.byte	35
 ;  f:
	.word	gs(_Z7panGPS25Point)
 ;  n:
	.byte	24
 ;  f:
	.word	gs(_Z17panBatteryPercent5Point)
 ;  n:
	.byte	6
 ;  f:
	.word	gs(_Z6panCOG5Point)
 ;  n:
	.byte	8
 ;  f:
	.word	gs(_Z7panRose5Point)
 ;  n:
	.byte	9
 ;  f:
	.word	gs(_Z10panHeading5Point)
 ;  n:
	.byte	37
 ;  f:
	.word	gs(_Z8panFdata5Point)
 ;  n:
	.byte	11
 ;  f:
	.word	gs(_Z10panHomeDis5Point)
 ;  n:
	.byte	10
 ;  f:
	.word	gs(_Z10panHomeDir5Point)
 ;  n:
	.byte	25
 ;  f:
	.word	gs(_Z7panTime5Point)
 ;  n:
	.byte	13
 ;  f:
	.word	gs(_Z8panWPDis5Point)
 ;  n:
	.byte	17
 ;  f:
	.word	gs(_Z6panAlt5Point)
 ;  n:
	.byte	22
 ;  f:
	.word	gs(_Z10panHomeAlt5Point)
 ;  n:
	.byte	18
 ;  f:
	.word	gs(_Z6panVel5Point)
 ;  n:
	.byte	23
 ;  f:
	.word	gs(_Z11panAirSpeed5Point)
 ;  n:
	.byte	19
 ;  f:
	.word	gs(_Z6panThr5Point)
 ;  n:
	.byte	20
 ;  f:
	.word	gs(_Z13panFlightMode5Point)
 ;  n:
	.byte	15
 ;  f:
	.word	gs(_Z8panCur_A5Point)
 ;  n:
	.byte	27
 ;  f:
	.word	gs(_Z12panWindSpeed5Point)
 ;  n:
	.byte	28
 ;  f:
	.word	gs(_Z8panClimb5Point)
 ;  n:
	.byte	29
 ;  f:
	.word	gs(_Z7panTune5Point)
 ;  n:
	.byte	14
 ;  f:
	.word	gs(_Z7panRSSI5Point)
 ;  n:
	.byte	30
 ;  f:
	.word	gs(_Z6panEff5Point)
 ;  n:
	.byte	33
 ;  f:
	.word	gs(_Z7panTemp5Point)
 ;  n:
	.byte	32
 ;  f:
	.word	gs(_Z5panCh5Point)
 ;  n:
	.byte	34
 ;  f:
	.word	gs(_Z11panDistance5Point)
 ;  n:
	.byte	36
 ;  f:
	.word	gs(_Z13panRadarScale5Point)
 ;  n:
	.byte	31
 ;  f:
	.word	gs(_Z11panCALLSIGN5Point)
 ;  n:
	.byte	0
 ;  f:
	.word	0
	.section	.progmem.data._ZL4bits,"a",@progbits
	.type	_ZL4bits, @object
	.size	_ZL4bits, 32
_ZL4bits:
 ;  n:
	.byte	0
 ;  mode:
	.byte	1
 ;  v:
	.word	msg+147
 ;  n:
	.byte	1
 ;  mode:
	.byte	2
 ;  v:
	.word	msg+151
 ;  n:
	.byte	2
 ;  mode:
	.byte	3
 ;  v:
	.word	msg+155
 ;  n:
	.byte	3
 ;  mode:
	.byte	4
 ;  v:
	.word	msg+159
 ;  n:
	.byte	5
 ;  mode:
	.byte	0
 ;  v:
	.word	msg+163
 ;  n:
	.byte	10
 ;  mode:
	.byte	6
 ;  v:
	.word	msg+167
 ;  n:
	.byte	11
 ;  mode:
	.byte	7
 ;  v:
	.word	msg+171
 ;  n:
	.byte	19
 ;  mode:
	.byte	0
 ;  v:
	.word	msg+175
	.section	.progmem.data._ZL9crc_table,"a",@progbits
	.type	_ZL9crc_table, @object
	.size	_ZL9crc_table, 256
_ZL9crc_table:
	.byte	0
	.byte	7
	.byte	14
	.byte	9
	.byte	28
	.byte	27
	.byte	18
	.byte	21
	.byte	56
	.byte	63
	.byte	54
	.byte	49
	.byte	36
	.byte	35
	.byte	42
	.byte	45
	.byte	112
	.byte	119
	.byte	126
	.byte	121
	.byte	108
	.byte	107
	.byte	98
	.byte	101
	.byte	72
	.byte	79
	.byte	70
	.byte	65
	.byte	84
	.byte	83
	.byte	90
	.byte	93
	.byte	-32
	.byte	-25
	.byte	-18
	.byte	-23
	.byte	-4
	.byte	-5
	.byte	-14
	.byte	-11
	.byte	-40
	.byte	-33
	.byte	-42
	.byte	-47
	.byte	-60
	.byte	-61
	.byte	-54
	.byte	-51
	.byte	-112
	.byte	-105
	.byte	-98
	.byte	-103
	.byte	-116
	.byte	-117
	.byte	-126
	.byte	-123
	.byte	-88
	.byte	-81
	.byte	-90
	.byte	-95
	.byte	-76
	.byte	-77
	.byte	-70
	.byte	-67
	.byte	-57
	.byte	-64
	.byte	-55
	.byte	-50
	.byte	-37
	.byte	-36
	.byte	-43
	.byte	-46
	.byte	-1
	.byte	-8
	.byte	-15
	.byte	-10
	.byte	-29
	.byte	-28
	.byte	-19
	.byte	-22
	.byte	-73
	.byte	-80
	.byte	-71
	.byte	-66
	.byte	-85
	.byte	-84
	.byte	-91
	.byte	-94
	.byte	-113
	.byte	-120
	.byte	-127
	.byte	-122
	.byte	-109
	.byte	-108
	.byte	-99
	.byte	-102
	.byte	39
	.byte	32
	.byte	41
	.byte	46
	.byte	59
	.byte	60
	.byte	53
	.byte	50
	.byte	31
	.byte	24
	.byte	17
	.byte	22
	.byte	3
	.byte	4
	.byte	13
	.byte	10
	.byte	87
	.byte	80
	.byte	89
	.byte	94
	.byte	75
	.byte	76
	.byte	69
	.byte	66
	.byte	111
	.byte	104
	.byte	97
	.byte	102
	.byte	115
	.byte	116
	.byte	125
	.byte	122
	.byte	-119
	.byte	-114
	.byte	-121
	.byte	-128
	.byte	-107
	.byte	-110
	.byte	-101
	.byte	-100
	.byte	-79
	.byte	-74
	.byte	-65
	.byte	-72
	.byte	-83
	.byte	-86
	.byte	-93
	.byte	-92
	.byte	-7
	.byte	-2
	.byte	-9
	.byte	-16
	.byte	-27
	.byte	-30
	.byte	-21
	.byte	-20
	.byte	-63
	.byte	-58
	.byte	-49
	.byte	-56
	.byte	-35
	.byte	-38
	.byte	-45
	.byte	-44
	.byte	105
	.byte	110
	.byte	103
	.byte	96
	.byte	117
	.byte	114
	.byte	123
	.byte	124
	.byte	81
	.byte	86
	.byte	95
	.byte	88
	.byte	77
	.byte	74
	.byte	67
	.byte	68
	.byte	25
	.byte	30
	.byte	23
	.byte	16
	.byte	5
	.byte	2
	.byte	11
	.byte	12
	.byte	33
	.byte	38
	.byte	47
	.byte	40
	.byte	61
	.byte	58
	.byte	51
	.byte	52
	.byte	78
	.byte	73
	.byte	64
	.byte	71
	.byte	82
	.byte	85
	.byte	92
	.byte	91
	.byte	118
	.byte	113
	.byte	120
	.byte	127
	.byte	106
	.byte	109
	.byte	100
	.byte	99
	.byte	62
	.byte	57
	.byte	48
	.byte	55
	.byte	34
	.byte	37
	.byte	44
	.byte	43
	.byte	6
	.byte	1
	.byte	8
	.byte	15
	.byte	26
	.byte	29
	.byte	20
	.byte	19
	.byte	-82
	.byte	-87
	.byte	-96
	.byte	-89
	.byte	-78
	.byte	-75
	.byte	-68
	.byte	-69
	.byte	-106
	.byte	-111
	.byte	-104
	.byte	-97
	.byte	-118
	.byte	-115
	.byte	-124
	.byte	-125
	.byte	-34
	.byte	-39
	.byte	-48
	.byte	-41
	.byte	-62
	.byte	-59
	.byte	-52
	.byte	-53
	.byte	-26
	.byte	-31
	.byte	-24
	.byte	-17
	.byte	-6
	.byte	-3
	.byte	-12
	.byte	-13
	.section	.bss.msg,"aw",@nobits
	.type	msg, @object
	.size	msg, 272
msg:
	.zero	272
.global	osd
	.section	.bss.osd,"aw",@nobits
	.type	osd, @object
	.size	osd, 4
osd:
	.zero	4
.global	Serial
	.section	.bss.Serial,"aw",@nobits
	.type	Serial, @object
	.size	Serial, 4
Serial:
	.zero	4
.global	PWM_out_pin
	.section	.bss.PWM_out_pin,"aw",@nobits
	.type	PWM_out_pin, @object
	.size	PWM_out_pin, 1
PWM_out_pin:
	.zero	1
.global	int_Timer
	.section	.bss.int_Timer,"aw",@nobits
	.type	int_Timer, @object
	.size	int_Timer, 4
int_Timer:
	.zero	4
.global	PWM_IN
	.section	.bss.PWM_IN,"aw",@nobits
	.type	PWM_IN, @object
	.size	PWM_IN, 2
PWM_IN:
	.zero	2
.global	New_PWM_Frame
	.section	.bss.New_PWM_Frame,"aw",@nobits
	.type	New_PWM_Frame, @object
	.size	New_PWM_Frame, 1
New_PWM_Frame:
	.zero	1
.global	vsync_wait
	.section	.bss.vsync_wait,"aw",@nobits
	.type	vsync_wait, @object
	.size	vsync_wait, 1
vsync_wait:
	.zero	1
.global	lflags
	.section	.data.lflags,"aw",@progbits
	.type	lflags, @object
	.size	lflags, 3
lflags:
 ;  update_stat:
 ;  canswitch:
 ;  got_data:
 ;  mavlink_active:
 ;  rotatePanel:
 ;  one_sec_timer_switch:
 ;  motor_armed:
 ;  last_armed_status:
 ;  throttle_on:
	.byte	3
 ;  takeofftime:
 ;  blinker:
 ;  uavtalk_active:
 ;  mwii_active:
 ;  mode_switch:
	.byte	0
	.zero	1
.global	crlf_count
	.section	.bss.crlf_count,"aw",@nobits
	.type	crlf_count, @object
	.size	crlf_count, 1
crlf_count:
	.zero	1
	.section	.bss._ZL4rssi,"aw",@nobits
	.type	_ZL4rssi, @object
	.size	_ZL4rssi, 2
_ZL4rssi:
	.zero	2
	.section	.bss._ZL7rssi_in,"aw",@nobits
	.type	_ZL7rssi_in, @object
	.size	_ZL7rssi_in, 2
_ZL7rssi_in:
	.zero	2
	.section	.bss._ZL8osd_rssi,"aw",@nobits
	.type	_ZL8osd_rssi, @object
	.size	_ZL8osd_rssi, 1
_ZL8osd_rssi:
	.zero	1
	.section	.bss._ZL6panelN,"aw",@nobits
	.type	_ZL6panelN, @object
	.size	_ZL6panelN, 1
_ZL6panelN:
	.zero	1
	.section	.bss._ZL13osd_autopilot,"aw",@nobits
	.type	_ZL13osd_autopilot, @object
	.size	_ZL13osd_autopilot, 1
_ZL13osd_autopilot:
	.zero	1
	.section	.bss._ZL14apm_mav_system,"aw",@nobits
	.type	_ZL14apm_mav_system, @object
	.size	_ZL14apm_mav_system, 1
_ZL14apm_mav_system:
	.zero	1
	.section	.bss._ZL11lastMAVBeat,"aw",@nobits
	.type	_ZL11lastMAVBeat, @object
	.size	_ZL11lastMAVBeat, 4
_ZL11lastMAVBeat:
	.zero	4
	.section	.bss._ZL7seconds,"aw",@nobits
	.type	_ZL7seconds, @object
	.size	_ZL7seconds, 1
_ZL7seconds:
	.zero	1
	.section	.bss._ZL12osd_throttle,"aw",@nobits
	.type	_ZL12osd_throttle, @object
	.size	_ZL12osd_throttle, 1
_ZL12osd_throttle:
	.zero	1
	.section	.bss._ZL15osd_groundspeed,"aw",@nobits
	.type	_ZL15osd_groundspeed, @object
	.size	_ZL15osd_groundspeed, 4
_ZL15osd_groundspeed:
	.zero	4
	.section	.bss._ZL17osd_winddirection,"aw",@nobits
	.type	_ZL17osd_winddirection, @object
	.size	_ZL17osd_winddirection, 2
_ZL17osd_winddirection:
	.zero	2
	.section	.bss._ZL13osd_windspeed,"aw",@nobits
	.type	_ZL13osd_windspeed, @object
	.size	_ZL13osd_windspeed, 4
_ZL13osd_windspeed:
	.zero	4
	.section	.bss._ZL12osd_airspeed,"aw",@nobits
	.type	_ZL12osd_airspeed, @object
	.size	_ZL12osd_airspeed, 4
_ZL12osd_airspeed:
	.zero	4
	.section	.bss._ZL11osd_alt_gps,"aw",@nobits
	.type	_ZL11osd_alt_gps, @object
	.size	_ZL11osd_alt_gps, 4
_ZL11osd_alt_gps:
	.zero	4
	.section	.bss._ZL11osd_alt_rel,"aw",@nobits
	.type	_ZL11osd_alt_rel, @object
	.size	_ZL11osd_alt_rel, 4
_ZL11osd_alt_rel:
	.zero	4
	.section	.bss._ZL11osd_heading,"aw",@nobits
	.type	_ZL11osd_heading, @object
	.size	_ZL11osd_heading, 2
_ZL11osd_heading:
	.zero	2
.global	osd_att
	.section	.bss.osd_att,"aw",@nobits
	.type	osd_att, @object
	.size	osd_att, 6
osd_att:
	.zero	6
	.section	.bss._ZL5dst_y,"aw",@nobits
	.type	_ZL5dst_y, @object
	.size	_ZL5dst_y, 2
_ZL5dst_y:
	.zero	2
	.section	.bss._ZL5dst_x,"aw",@nobits
	.type	_ZL5dst_x, @object
	.size	_ZL5dst_x, 2
_ZL5dst_x:
	.zero	2
	.section	.bss._ZL18osd_home_direction,"aw",@nobits
	.type	_ZL18osd_home_direction, @object
	.size	_ZL18osd_home_direction, 1
_ZL18osd_home_direction:
	.zero	1
	.section	.bss._ZL17osd_home_distance,"aw",@nobits
	.type	_ZL17osd_home_distance, @object
	.size	_ZL17osd_home_distance, 4
_ZL17osd_home_distance:
	.zero	4
.global	osd_home
	.section	.bss.osd_home,"aw",@nobits
	.type	osd_home, @object
	.size	osd_home, 8
osd_home:
	.zero	8
	.section	.bss._ZL10off_course,"aw",@nobits
	.type	_ZL10off_course, @object
	.size	_ZL10off_course, 2
_ZL10off_course:
	.zero	2
	.section	.bss._ZL7osd_cog,"aw",@nobits
	.type	_ZL7osd_cog, @object
	.size	_ZL7osd_cog, 2
_ZL7osd_cog:
	.zero	2
	.section	.bss._ZL12osd_fix_type,"aw",@nobits
	.type	_ZL12osd_fix_type, @object
	.size	_ZL12osd_fix_type, 1
_ZL12osd_fix_type:
	.zero	1
	.section	.bss._ZL22osd_satellites_visible,"aw",@nobits
	.type	_ZL22osd_satellites_visible, @object
	.size	_ZL22osd_satellites_visible, 1
_ZL22osd_satellites_visible:
	.zero	1
.global	osd_pos
	.section	.bss.osd_pos,"aw",@nobits
	.type	osd_pos, @object
	.size	osd_pos, 8
osd_pos:
	.zero	8
	.section	.bss._ZL9osd_climb,"aw",@nobits
	.type	_ZL9osd_climb, @object
	.size	_ZL9osd_climb, 4
_ZL9osd_climb:
	.zero	4
	.section	.bss._ZL4palt,"aw",@nobits
	.type	_ZL4palt, @object
	.size	_ZL4palt, 4
_ZL4palt:
	.zero	4
	.section	.bss._ZL15osd_switch_time,"aw",@nobits
	.type	_ZL15osd_switch_time, @object
	.size	_ZL15osd_switch_time, 4
_ZL15osd_switch_time:
	.zero	4
	.section	.data._ZL15osd_switch_last,"aw",@progbits
	.type	_ZL15osd_switch_last, @object
	.size	_ZL15osd_switch_last, 1
_ZL15osd_switch_last:
	.byte	100
	.section	.bss._ZL14osd_off_switch,"aw",@nobits
	.type	_ZL14osd_off_switch, @object
	.size	_ZL14osd_off_switch, 1
_ZL14osd_off_switch:
	.zero	1
.global	runtime
	.section	.bss.runtime,"aw",@nobits
	.type	runtime, @object
	.size	runtime, 4
runtime:
	.zero	4
	.section	.bss._ZL23total_flight_time_milis,"aw",@nobits
	.type	_ZL23total_flight_time_milis, @object
	.size	_ZL23total_flight_time_milis, 4
_ZL23total_flight_time_milis:
	.zero	4
	.section	.bss._ZL11timer_500ms,"aw",@nobits
	.type	_ZL11timer_500ms, @object
	.size	_ZL11timer_500ms, 4
_ZL11timer_500ms:
	.zero	4
	.section	.bss._ZL11timer_100ms,"aw",@nobits
	.type	_ZL11timer_100ms, @object
	.size	_ZL11timer_100ms, 4
_ZL11timer_100ms:
	.zero	4
	.section	.bss._ZL10timer_20ms,"aw",@nobits
	.type	_ZL10timer_20ms, @object
	.size	_ZL10timer_20ms, 4
_ZL10timer_20ms:
	.zero	4
	.section	.bss._ZL8osd_mode,"aw",@nobits
	.type	_ZL8osd_mode, @object
	.size	_ZL8osd_mode, 1
_ZL8osd_mode:
	.zero	1
	.section	.bss._ZL39remaining_estimated_flight_time_seconds,"aw",@nobits
	.type	_ZL39remaining_estimated_flight_time_seconds, @object
	.size	_ZL39remaining_estimated_flight_time_seconds, 2
_ZL39remaining_estimated_flight_time_seconds:
	.zero	2
	.section	.bss._ZL11temperature,"aw",@nobits
	.type	_ZL11temperature, @object
	.size	_ZL11temperature, 2
_ZL11temperature:
	.zero	2
	.section	.data._ZL17osd_battery_pic_A,"aw",@progbits
	.type	_ZL17osd_battery_pic_A, @object
	.size	_ZL17osd_battery_pic_A, 2
_ZL17osd_battery_pic_A:
	.byte	-115
	.byte	-115
	.section	.bss._ZL20last_battery_reading,"aw",@nobits
	.type	_ZL20last_battery_reading, @object
	.size	_ZL20last_battery_reading, 1
_ZL20last_battery_reading:
	.zero	1
	.section	.bss._ZL19max_battery_reading,"aw",@nobits
	.type	_ZL19max_battery_reading, @object
	.size	_ZL19max_battery_reading, 1
_ZL19max_battery_reading:
	.zero	1
	.section	.bss._ZL23osd_battery_remaining_A,"aw",@nobits
	.type	_ZL23osd_battery_remaining_A, @object
	.size	_ZL23osd_battery_remaining_A, 1
_ZL23osd_battery_remaining_A:
	.zero	1
	.section	.bss._ZL8mah_used,"aw",@nobits
	.type	_ZL8mah_used, @object
	.size	_ZL8mah_used, 4
_ZL8mah_used:
	.zero	4
	.section	.bss._ZL10osd_curr_A,"aw",@nobits
	.type	_ZL10osd_curr_A, @object
	.size	_ZL10osd_curr_A, 2
_ZL10osd_curr_A:
	.zero	2
	.section	.bss._ZL10osd_vbat_B,"aw",@nobits
	.type	_ZL10osd_vbat_B, @object
	.size	_ZL10osd_vbat_B, 2
_ZL10osd_vbat_B:
	.zero	2
	.section	.bss._ZL10osd_vbat_A,"aw",@nobits
	.type	_ZL10osd_vbat_A, @object
	.size	_ZL10osd_vbat_A, 2
_ZL10osd_vbat_A:
	.zero	2
	.section	.bss._ZL7measure,"aw",@nobits
	.type	_ZL7measure, @object
	.size	_ZL7measure, 2
_ZL7measure:
	.zero	2
	.section	.progmem.data._ZL5imper,"a",@progbits
	.type	_ZL5imper, @object
	.size	_ZL5imper, 19
_ZL5imper:
 ;  converts:
	.byte	82
	.byte	-72
	.byte	14
	.byte	64
 ;  converth:
	.byte	-123
	.byte	-21
	.byte	81
	.byte	64
 ;  spe:
	.byte	25
 ;  high:
	.byte	102
 ;  temps:
	.word	187
 ;  tempconv:
	.byte	18
 ;  tempconvAdd:
	.word	3200
 ;  distchar:
	.byte	28
 ;  distconv:
	.word	5280
 ;  climbchar:
	.byte	30
	.section	.progmem.data._ZL4metr,"a",@progbits
	.type	_ZL4metr, @object
	.size	_ZL4metr, 19
_ZL4metr:
 ;  converts:
	.byte	102
	.byte	102
	.byte	102
	.byte	64
 ;  converth:
	.byte	0
	.byte	0
	.byte	-128
	.byte	63
 ;  spe:
	.byte	16
 ;  high:
	.byte	12
 ;  temps:
	.word	186
 ;  tempconv:
	.byte	10
 ;  tempconvAdd:
	.word	0
 ;  distchar:
	.byte	27
 ;  distconv:
	.word	1000
 ;  climbchar:
	.byte	26
	.section	.bss._ZL8chan_raw,"aw",@nobits
	.type	_ZL8chan_raw, @object
	.size	_ZL8chan_raw, 16
_ZL8chan_raw:
	.zero	16
	.section	.bss._ZL3eph,"aw",@nobits
	.type	_ZL3eph, @object
	.size	_ZL3eph, 2
_ZL3eph:
	.zero	2
	.section	.bss._ZL12xtrack_error,"aw",@nobits
	.type	_ZL12xtrack_error, @object
	.size	_ZL12xtrack_error, 2
_ZL12xtrack_error:
	.zero	2
	.section	.data._ZL15takeoff_heading,"aw",@progbits
	.type	_ZL15takeoff_heading, @object
	.size	_ZL15takeoff_heading, 2
_ZL15takeoff_heading:
	.word	-400
	.section	.bss._ZL15osd_alt_to_home,"aw",@nobits
	.type	_ZL15osd_alt_to_home, @object
	.size	_ZL15osd_alt_to_home, 4
_ZL15osd_alt_to_home:
	.zero	4
	.section	.bss._ZL12osd_home_alt,"aw",@nobits
	.type	_ZL12osd_home_alt, @object
	.size	_ZL12osd_home_alt, 4
_ZL12osd_home_alt:
	.zero	4
	.section	.bss._ZL10aspd_error,"aw",@nobits
	.type	_ZL10aspd_error, @object
	.size	_ZL10aspd_error, 4
_ZL10aspd_error:
	.zero	4
	.section	.bss._ZL9alt_error,"aw",@nobits
	.type	_ZL9alt_error, @object
	.size	_ZL9alt_error, 4
_ZL9alt_error:
	.zero	4
	.section	.bss._ZL9wp_number,"aw",@nobits
	.type	_ZL9wp_number, @object
	.size	_ZL9wp_number, 1
_ZL9wp_number:
	.zero	1
	.section	.bss._ZL7wp_dist,"aw",@nobits
	.type	_ZL7wp_dist, @object
	.size	_ZL7wp_dist, 2
_ZL7wp_dist:
	.zero	2
	.section	.bss._ZL17wp_target_bearing,"aw",@nobits
	.type	_ZL17wp_target_bearing, @object
	.size	_ZL17wp_target_bearing, 2
_ZL17wp_target_bearing:
	.zero	2
	.section	.bss._ZL11nav_bearing,"aw",@nobits
	.type	_ZL11nav_bearing, @object
	.size	_ZL11nav_bearing, 2
_ZL11nav_bearing:
	.zero	2
	.section	.bss._ZL9nav_pitch,"aw",@nobits
	.type	_ZL9nav_pitch, @object
	.size	_ZL9nav_pitch, 2
_ZL9nav_pitch:
	.zero	2
	.section	.bss._ZL8nav_roll,"aw",@nobits
	.type	_ZL8nav_roll, @object
	.size	_ZL8nav_roll, 2
_ZL8nav_roll:
	.zero	2
	.section	.bss._ZL9tdistance,"aw",@nobits
	.type	_ZL9tdistance, @object
	.size	_ZL9tdistance, 4
_ZL9tdistance:
	.zero	4
	.section	.bss._ZL14vertical_speed,"aw",@nobits
	.type	_ZL14vertical_speed, @object
	.size	_ZL14vertical_speed, 4
_ZL14vertical_speed:
	.zero	4
	.section	.bss._ZL17nor_osd_windspeed,"aw",@nobits
	.type	_ZL17nor_osd_windspeed, @object
	.size	_ZL17nor_osd_windspeed, 4
_ZL17nor_osd_windspeed:
	.zero	4
	.section	.bss._ZL17max_osd_windspeed,"aw",@nobits
	.type	_ZL17max_osd_windspeed, @object
	.size	_ZL17max_osd_windspeed, 4
_ZL17max_osd_windspeed:
	.zero	4
	.section	.bss._ZL16max_osd_home_alt,"aw",@nobits
	.type	_ZL16max_osd_home_alt, @object
	.size	_ZL16max_osd_home_alt, 4
_ZL16max_osd_home_alt:
	.zero	4
	.section	.bss._ZL19max_osd_groundspeed,"aw",@nobits
	.type	_ZL19max_osd_groundspeed, @object
	.size	_ZL19max_osd_groundspeed, 4
_ZL19max_osd_groundspeed:
	.zero	4
	.section	.bss._ZL16max_osd_airspeed,"aw",@nobits
	.type	_ZL16max_osd_airspeed, @object
	.size	_ZL16max_osd_airspeed, 4
_ZL16max_osd_airspeed:
	.zero	4
	.section	.bss._ZL17max_home_distance,"aw",@nobits
	.type	_ZL17max_home_distance, @object
	.size	_ZL17max_home_distance, 4
_ZL17max_home_distance:
	.zero	4
.global	panel
	.section	.bss.panel,"aw",@nobits
	.type	panel, @object
	.size	panel, 76
panel:
	.zero	76
.global	sets
	.section	.bss.sets,"aw",@nobits
	.type	sets, @object
	.size	sets, 72
sets:
	.zero	72
.global	flags
	.section	.bss.flags,"aw",@nobits
	.type	flags, @object
	.size	flags, 2
flags:
	.zero	2
	.ident	"GCC: (GNU) 5.3.0"
.global __do_copy_data
.global __do_clear_bss
