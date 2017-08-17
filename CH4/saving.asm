Title Addand Subtract (AddSub.asm)

;This program adds and subtracts 32bit integers.
;Last update: 2/19/13   written Sayaka Tamura
; ; = // in.java

INCLUDE Irvine32.inc

.code   ; define variables
main PROC
		mov eax, 0
		mov al,29
		add al,40
		sub al,20 

		call DumpRegs
		call writedec
		exit
main ENDP

END main