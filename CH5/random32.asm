TITLE random32         (random32.asm)                     
   
;Last updated 2.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc

.data
ranNum DWORD ?

.code
main PROC
       call Random32 ; generates and returns a 32-bit random integer in EAX
       mov ranNum, eax
	   call writedec  ;save random number
	   
	   exit	 
main ENDP
 
end main