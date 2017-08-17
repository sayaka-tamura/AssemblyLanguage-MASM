TITLE random         (random.asm)                     
   
;Last updated 2.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc

.data
	number dword ? ;? is an initializer that means "uninitialized" 
   
.code
main PROC
	call Randomize ;new numbers generate every run
	call clrscr ;Clears the screen
	mov eax, 27 ;get random 0 to 26
	mov ecx, 15 ;loop 15 times

	printland:
		push eax ;save a value to eax
		call RandomRange ;Generates an unsigned pseudo-random 32-bit integer in the range of 0 through (n-1).
		call writedec ;write decimal number
		pop eax ;pick up a value from eax
		call crlf ;a carriage return
	loop printland

	exit
	 
main ENDP
 
end main