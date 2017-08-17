Title call demos (callldemoline.asm)
;Last update: 2015 written by Sayaka Tamura

INCLUDE Irvine32.inc

move textequ <mov>

.data
	array1 byte "I USED BYTE MYTONGUE AND HOLD MY BREATH? SCARED TO ROCK THE BOAT AND"
	array2 byte "SO I SAY QUITELY, AGREED POLITELY. I FORGOT THAT I HAD A CHOICE"
	len dword ?
	countb byte 100 dup(0)
	deltax byte ?
	x1 byte 0
	y1 byte 10
.code

main proc
	call clrscr ;Clears the screen

    ;call delay

exit

main ENDP

end main