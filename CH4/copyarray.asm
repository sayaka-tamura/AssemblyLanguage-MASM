TITLE copy array          (copyarray.asm)                     
   
;Last updated 2.15.2016 Written by Sayaka Tamura

INCLUDE Irvine32.inc
.data
   array word  111,2345,4095,1,5
   copyarray word 5 dup(?)  ;? means unknown value, duplicate 5 times
line byte "******************************", 0
   
.code
main PROC
	mov eax, 0
	mov ecx, 5
	mov esi, 0 ;esi (source index for string operation ("array"))
	mov edi, 8 ;edi (destination index for string operation ("array"))

	copyloop:
		mov ax, array[esi] ;show the first value of the esi
		mov copyarray[edi], ax
		add esi,2 ;add 2 for "word"
		sub edi,2 ;subtruct 2 for "word"
	loop copyloop

	mov edx,offset line
	call writestring
	call crlf

	mov ecx, 5
	mov eax, 0
	mov esi, 0

	print:
		movzx eax, copyarray[esi]
		call writedec
		call crlf
		add esi,2
	loop print

	call writestring ;print "line"
	call crlf
      
 exit
	 
main ENDP
 
end main