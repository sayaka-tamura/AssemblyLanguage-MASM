TITLE MASM Template
INCLUDE Irvine32.inc

.data
myheaderInfo BYTE "Sayaka Tamura - CSC310 - Project1", 0dh, 0ah, 0

.code
main PROC

	;Print out header info
	mov edx, OFFSET myheaderInfo
	call WriteString

	; print out the decical number in eax
	mov eax, 123
	call WriteDec

	;print out the registers
	call Dumpregs

	exit

main ENDP
END main