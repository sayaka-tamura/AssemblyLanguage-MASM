Title countcolors (countcolors.asm)
;Last update: 2015 written by Sayaka Tamura

INCLUDE Irvine32.inc

.data
	
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

countcolors proc
	mov esi, offset mycount
	add esi, mycolor
	mov al, [esi]
	
	inc eax
	mov [esi],al
	ret
coluntcolors endp

end main