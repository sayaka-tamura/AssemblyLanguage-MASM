TITLE  how to count         (count.asm)

;  
; Last update:2015   written by Sayaka Tamura
 
INCLUDE Irvine32.inc
 move textequ <mov>
.data
   
    array1 byte "I USED TO BYTE MY TONGUE AND HOLD MY BREATH? SCARED TO ROCK THE BOAT AND MAKE A MESS,"
	;if u compile "array1 byte "I USED TO BYTE MY TONGUE AND HOLD MY BREATH? SCARED TO ROCK THE BOAT AND MAKE A MESS,",0"
	;only array1 comes up on the screen, no array2
    array2 byte  "SO I SAY QUIETLY, AGREED POLITELY. I FORGOT THAT I HAD A CHOICE"
    ;len dword ?
    
.code    
     
 
main proc

	call clrscr ;call clrscr
	call main1 ;call function
 
exit
main ENDP

main1 proc
    mov ecx, 3 ;<-lengthof array1 ;->length of array 1: the number of characters
    mov esi,0 ;esi starts from 0

	cb:
		movzx eax,array1[esi] ;show the first value of the esi
		mov edi,eax  ;edi<pointer> (destination index for string operation )

		mov  edx,OFFSET array1 ;edx=register
		call writestring
		call crlf

		;inc array2[edi]
      
		inc esi ;mov to next character
		call crlf
	loop cb

	ret
main1 endp


 
;main2 endp

END main