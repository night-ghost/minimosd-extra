;******************************************************************************
;*
;* FUNCTION
;*	muls16x16
;* DECRIPTION
;*	Signed multiply of two 16bits numbers with 16 bits result.
;* USAGE
;*	r25:r24 = r23:r22 * r25:r24
;******************************************************************************
;int multfix(int a,int b)

.global multfix
multfix:
	;input parameters are in r23:r22(hi:lo) and r25:r24
	  
  	;b aready in right place -- 2nd parameter is in r22:23											

    mov  r20,r24 ;load a -- first parameter is in r24:25 
	mov  r21,r25											

	muls r23, r21	; (signed)ah * (signed)bh		
	mov	 r25, r0         ;r18, r0"						
	mul	 r22, r20		; al * bl"						
	mov  r24, r1      ;movw	r17:r16, r1:r0"		
											
	mulsu r23, r20	; (signed)ah * bl				
	add	 r24, r0         ;r17, r0"						
	adc	 r25, r1         ;r18, r1"	
						
	mulsu r21, r22	; (signed)bh * al				
	add	 r24, r0         ;r17, r0"					
	adc	 r25, r1         ;r18, r1"						
											
	clr  r1   			; required by GCC								
	
	;return values are in 25:r24 (hi:lo)		 								
 	ret
