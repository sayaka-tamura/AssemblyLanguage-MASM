TITLE simple add         (simpleadd.asm)                     
   
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
  mov eax, 0 ;not need since moving a dword (x) into eax, clear eax
  add eax, x ;eax = 1
  call writedec ;print eax
  mov edx, offset plus
  call writestring ;print "plus"
  mov eax, y ;eax = 1
  call writedec
  mov edx, offset equals
  call writestring  ;print "equals"
  add eax, x ;eax = 2
  call writedec
      
  exit
	 
main ENDP
 
end main