   TITLE position         (position.asm)                     
   
;Last updated 2.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc
.data
   
.code
main PROC
	call clrscr ;Clears the screen
	mov eax, 0
	mov al, 'x'
	mov dl, 5 ;column for gotoxy (position 6 right)(starting from 0)
	mov dh, 3 ;row for gotoxy (position 4 down)(starting from 0)
	mov ecx, 20 ;repeat 20 times
	push eax ;save a value to eax

	line:
		mov eax, 200 ;0.2sec delay
		call delay 
		pop eax ;pick up a value from eax
		inc dl ;increment dl
		call gotoxy ;Locate the cursor in the lower right corner of an 6 x 4 screen.
		call writechar
		push eax ;save a value to eax
	loop line
	
	pop eax
    mov dl,0
    mov dh,24
    call gotoxy
	call writechar
	call crlf
	call crlf
	exit
	 
main ENDP
 
end main