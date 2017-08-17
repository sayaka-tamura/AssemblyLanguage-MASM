TITLE copy array and push pop          (copyarraypushpop.asm)
;do i have to use "edi" register?

;print a array in reverse order   
;Last updated 2.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc

.data
	array word  111,2345,4095,1,5
	copyarray word 5 dup(?)  ;?: unknown value 
							 ;DUP: duplicate inside () 5 times
	line byte "******************************", 0
	
.code
main PROC

	mov ecx, 5 ;ecx (for loop 5 times)
	mov eax, 0
	mov esi, 0 ;esi (source index for string operation ("array"))

	copyloop:
		movzx eax, array[esi] ;movzx -> cox using "word" in array
		push eax			  ;push: save the value in the stack (SS and ESP(SP)) 
		add esi,2
	loop copyloop

	mov ecx, 5
	mov eax, 0
	mov esi, 0

	print:
		pop eax ;Restore the original values
		call writedec
		call crlf
	loop print
      
    exit
	 
main ENDP
 
end main