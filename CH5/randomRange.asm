TITLE random         (random.asm)                     
   
;Last updated 2.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc

.data
ranNum DWORD ?

.code
main PROC
       mov  eax,100     ;get random 0 to 99
       call RandomRange ;
       inc  eax         ;make range 1 to 100
       mov  ranNum,eax  ;save random number
	   call writedec
	   
	   exit
	 
main ENDP
 
end main