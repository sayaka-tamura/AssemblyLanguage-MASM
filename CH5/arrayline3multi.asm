TITLE printing multiline          (arrayline3multi.asm)
 
;
; Last update:2015   written by Sayaka Tamura

INCLUDE Irvine32.inc
;print picture no procedure
.data  
 array1 byte 2,'x',6,' ',2,'z'	;cf: multiple initializers
 array2 byte 2,' ',2,'x',2,' ',2,'z'
 array3 byte 4,' ',2,'x',5,'w'
 ;------------------------------
 ; we wish to output
 ;    xx      zz
 ;      xx  zz
 ;        xxwwwww
 ;------------------------------

 lenarray1 = lengthof array1
 lenarray2 = lengthof array2
 lenarray3 = lengthof array3
 grandarray dword 6 dup(?) ;declare 6 dwords each dword is not initialized
 ; grandarray contains the the three offsets and the 3 lengths of the arrays

 .code

main proc

	call clrscr
  
	mov dh,10 ;x=10
	mov dl,5  ;y=5
	call gotoxy   ;line will start at 10 down 5 across
  
	;---------------------------
	; fill grandarray using the procedure fill
	call fill

	;---------------------------
	; loop around 3 times to print each line with drawline
	mov esi, offset grandarray
	sub esi,4  ; we start a dword back to put "add esi,4" in a outer loop twice
	mov ecx,3  ; loop for 3 times for "outer"

	outer:
		push ecx ;save "ecx" value to the stack

		; get each array from grandarry data
		add esi,4
		mov edi, [esi] ;save a value(n) of [esi("grandarray")] to edi = "array"s value
					   ;edi: used as destination index for string operations.
		add esi, 4	   ; go to next value [esi]
		mov ecx, [esi] ;loop counter for "inner", a value of [esi("grandarray")] = lenarray n/2
   
		inner:
			push ecx  ;use data from each line to set up : save ecx(n value of grandarray")			why?
			mov ecx,0 ;reset ecx to 0
			mov cl, [edi] ;								cl -> loop counter
      
			inc edi
			mov al,[edi] ;mov edi to al to draw string
			call drawline
			inc edi
      
			pop ecx
		loop inner

		inc dh
		mov dl,5
		pop ecx
		call gotoxy

	loop outer
	exit  
     
main ENDP

drawline proc
     
    lineloop:    
       call writechar
       inc dl
    loop lineloop

    ret
 drawline endp
 
fill proc
; dword array will be of the form 
; off len off len off len
  mov esi,offset grandarray ;set the beginning of "grandarray" to esi
  mov [esi],offset array1	;set the beginning of "array1" to first value of "grandarray"
  add esi,4					;mov to 4 in [esi](move to next) coz "grandarray" is dword
  mov ebx, lenarray1/2		;lenarray1 devided by 2
							;if I divided by 3, the print will be a half.
  mov [esi],ebx				;put "lenarray1/2" to ebx
  add esi,4
  mov [esi],offset array2
  add esi,4
  mov ebx, lenarray2/2
  mov [esi],ebx
  add esi,4
  mov [esi],offset array3
  add esi,4
  mov ebx, lenarray3/2
  mov [esi],ebx
  ret
fill endp

END main