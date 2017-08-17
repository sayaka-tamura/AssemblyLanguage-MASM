TITLE simple add2        (simpleadd2.asm)                     
;start from 1 + 1, repeat 10 times increasing either value by 1    
;Last updated 2.15.2016 Written by Sayaka Tamura

INCLUDE Irvine32.inc
.data
   x dword 1
   y dword 1
   plus byte " + ",0
   equals byte " = ",0
 
line byte "******************************", 0
   
.code
main PROC

	mov ecx, 10 ;loop for 10 times

	myadd:
		  ;make a expression
		  mov eax, 0 ;not need since moving a dword into eax clear eax
		  add eax, x ;move value of x to eax
		  call writedec ;print value of x
		  mov edx, offset plus ;move value of "plus" from the beginning to edx
		  call writestring ;print value of edx ("plus")
		  mov eax, y ;move value of y to eax
		  call writedec ;print value of y
		  mov edx, offset equals ;mov value of "equals" from the beginning to edx
		  call writestring ;print value of edx ("equals")
		  add eax, x ;add value of x to eax
		  call writedec ;print value of x

		  ;make the color for a expression
		  inc y ;increment y by 1
		  mov eax, 10 +16*black ;10-> text color:green, 16*black->back ground: black
		  call settextcolor
  		  call crlf ;make new line

		  ;make a line and the color
		  mov edx, offset line ;move value of "line" from the beginning to edx
		  call writestring ;print value of edx ("line")
		  call crlf
		  mov eax, white +16*black ;white-> text color, 16*black->back ground: black
		  call settextcolor
	loop myadd   
   
	exit
	 
main ENDP
 
end main