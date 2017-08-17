TITLE randomize         (randomize.asm)                     
   
;Last updated 2.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc

.data
ranNum DWORD ?

.code
main PROC
	   call Random32 ; generates and returns a 32-bit random integer in EAX
       mov ranNum, eax
	   call writedec  ;save random number
	   call crlf

	   call clrscr ;Clears the screen

       call Randomize ; initializes the starting seed value of the Random32 and RandomRange procedures
       mov ecx, 10

	   L1: 
		   call Random32
		   call writedec
		   call crlf
	   loop L1
	   
	   exit
	 
main ENDP
 
end main