TITLE random         (random.asm)                     
   
;Last updated 2.15.2016 Written by Sayaka Tamura
COMMENT !
	demonstrates random-number-generation capabilities of the link library, 
	and introduces the CALL instruction
	1) randomly generates 10 unsigned integers in the range 0 to 4,294,967,294
	2) generates 10 signed integers in the range 50 to 49
!

TITLE Link Library Test #2 (TestLib2.asm) 
; Testing the Irvine32 Library procedures. 

INCLUDE Irvine32.inc 
TAB = 9 ; ASCII code for Tab 

.code 
main PROC 
	call Randomize ; init random generator 
	call Rand1 
	call Rand2 
	exit 
main ENDP 

Rand1 PROC 
	; Generate ten pseudo-random integers
	mov ecx,10 ; loop 10 times 

	L1: 
		call Random32 ; generate random int 
		call WriteDec ; write in unsigned decimal 
		mov al,TAB ; horizontal tab 
		call WriteChar ; write the tab 
	loop L1 

	call Crlf 
	ret 
Rand1 ENDP 

Rand2 PROC 
	; Generate ten pseudo-random integers from -50 to +49 
	mov ecx,10 ; loop 10 times 
	
	L1: 
		mov eax,100 ; values 0-99 
		call RandomRange ; generate random int 
		sub eax,50 ; values -50 to +49 
		call WriteInt ; write signed decimal 
		mov al,TAB ; horizontal tab 
		call WriteChar ; write the tab 
	loop L1 
	
	call Crlf 
	ret 
Rand2 ENDP 

END main
