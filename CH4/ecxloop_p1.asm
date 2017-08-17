   TITLE ecx loop_p1          (ecxloop_p1.asm)                     
   
;Last updated 2.15.2016 Written by sayaka tamura
;count numbers and print String " I will not cheat "
INCLUDE Irvine32.inc
.data
   array word  111,2345,4095,1,5
   line byte " I will not cheat ",0
   
.code
main PROC
  mov eax, 0
  mov edx, offset line 
  mov ecx, 100

  mylines:
	mov eax, 101 ;also add eax,1 works(no sub)
	;add eax,1
	
	sub eax, ecx 
	
	call writedec
	call writestring
	call crlf
  loop mylines
      
  exit
	 
main ENDP
 
end main