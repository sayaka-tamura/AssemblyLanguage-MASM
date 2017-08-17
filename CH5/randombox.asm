Title randombox (randombox.asm)
;Last update: 2015 written by Sayaka Tamura

INCLUDE Irvine32.inc

move textequ <mov>

.data
	mycolor dword ?
	mycount byte 16 dup (0)
	first byte "There were ",0
	second byte " of color ",0

.code

main proc
	call clrscr
	call randomize
	mov ecx, 1000
	box:
		call pickdl
		call pickdh
		call pinkcolor
		call printdot
	loop box
	call printcount
	call gotobottom

	exit

main ENDP

end main