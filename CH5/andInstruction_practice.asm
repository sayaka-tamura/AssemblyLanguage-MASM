TITLE and instruction practice          (andInstruction_practice.asm)

;Last updated 5.15.2016 Written by Sayaka Tamura
; all characters in an array are converted to uppercase:
;212
INCLUDE Irvine32.inc

.data 
	array BYTE "This Sentence is in Mixed Case",0 
.code 

main PROC
	mov ecx, LENGTHOF array ;for loop counter of "L1"
	mov esi, OFFSET array ;set the start point of esi
		L1: 
			and BYTE PTR [esi],11011111b ; clear bit 5 /put 11011111b from the beginning of "array"
			
			mov  al, [esi]
			call WriteChar

			inc esi
		loop L1

	call crlf

	;mov  edx,OFFSET array ;this for writestring ->no work well
	;call WriteString

	exit
main ENDP

end main