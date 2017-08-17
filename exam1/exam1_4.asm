TITLE Exam1_4          (exam1_4.asm)                     

;Last updated 2.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc
.data
   A byte 5Ah,67,8,45
   B word 100,400,150,40Ah
   D dword 0Ah,2000,3000,4000,5,60
.code
main PROC
  mov al,0 
  mov al,A+2 
  call writedec
  call crlf

  mov al,0 
  mov al,A+8 ;A+4=100d, A+8=150d
  call writedec
  call crlf

  mov al,0 
  mov al,A+9 
  call writedec
  call crlf

  mov eax,0 
  mov eax,D+8 ;3000d
  call writedec
  call crlf

  mov eax,0 
  mov eax,D-10
  call writedec
  call crlf

 exit
	 
main ENDP
 
end main