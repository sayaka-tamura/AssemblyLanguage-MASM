TITLE procedure practice          (procedure_practice .asm)                     
   
;Last updated 2.15.2016 Written by Sayaka Tamura
;count numbers with drawing a line
INCLUDE Irvine32.inc
.data
	x1 byte 3
	x2 byte 15
	deltax byte ?
	deltay byte ?
	y1 byte 10
	y2 byte 20
	star byte "*",0
.code

main PROC
	;To draw a line for 3 (x1) across 10 down (x1,10) to 15(x2) across 10 down (x2,10) 
	;we need a delta x and an ecx loop

    call createdx ;crate deltax
	mov dl, x1 ;dl:x-positon (x1=3) for gotoxy
	mov dh, y1 ;dh:y-position (y1=10) for gotoxy
	call drawlinex

	mov dl, x1 ;dl:x-positon (x1=3) for gotoxy
	mov dh, y2 ;dh:y-position (y1=10) for gotoxy
	call drawlinex

	;For the lineup from (x ,y1) to (x,y2) use:
    call createdy ;(similar to create dx but use y1 and y2 instead of and b)
	mov dl, x1 ;dl:x-positon (x1=3) for gotoxy
	mov dh, y1 ;dh:y-position (y1=10) for gotoxy
    call drawliney

	mov dl, x2 ;dl:x-positon (x1=3) for gotoxy
	mov dh, y1 ;dh:y-position (y1=10) for gotoxy
    call drawliney

  exit
  
main ENDP

	createdx  proc 
          mov al,x2	;15->x2
          sub al,x1	;15-3
          inc al	;15-3+1=13
          mov deltax, al
          ret
    createdx endp

	createdy  proc 
          mov bl,y2	;15->y2
          sub bl,y1	;20-10
          inc bl	;20-10+1=11
          mov deltay, bl
          ret
    createdy endp

	drawlinex Proc 
		movzx ecx, deltax ;loop counter for "linea", "delatax" times

		linea:
			call gotoxy ;go to xy position you specified (x1,10)

			mov al, star ;mov "star" for writechar			
			call WriteChar

			inc dl ;go to next x-position
        loop linea
		call crlf

       ret
	drawlinex endp


	drawliney PROC
		movzx ecx, deltay ;loop counter for "linea", "delatax" times

		lineu:
			call gotoxy ;go to xy position you specified (x1=3, y1=10)

			mov al, star ;mov "star" for writechar		
			call WriteChar

			inc dh ;go to next x-position
        loop lineu
		call crlf

        ret
	drawliney endp

end main
