   TITLE ecx and arrays          (simplearray.asm)                     

;Last updated 2.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc
.data
   array dword  111,2345,4095,1,5
.code
main PROC
  mov eax,0 ; if this line is a comment, still this asm works
  mov eax,array+8 ;to show 1, type array+12
  call writedec
  call crlf
  exit
	 
main ENDP
 
end main