TITLE printing countsimple (scount.asm)

INCLUDE Irvine32.inc
;print picture no procedure
.data
	number byte 35

.code

main PROC
	movzx eax, number
	call WriteDec
	call Ctlf
	call dumpregs
	shl eax, 1
	call WriteDec
	call crlf
	shl eax, 4
	call WriteDec
	call crlf
main endp
END main


