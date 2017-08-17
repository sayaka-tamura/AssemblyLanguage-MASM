 TITLE method demo for a line         (methoddemo4.asm) 
 
;Refer methoddemo1.asm

;draw a line then make a piramid as much as user want 
;distance from the left: user-input "a"
;distance from the top: 
;how many times a line will repeat : 
;how many times show "*" in a line:  default

;Last updated 92.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc
.data
  a dword ? ;
  b dword ? ;
  aprompt byte "what is the starting point on x-axis?",0
  ;bprompt byte "what is b?",0 
  delta dword ? 

.code

main PROC
    call clrscr ;call clear screen
    mov eax,0
    call reada ;method "reada"
;    call readb ;method "readb"
;    call createdelta ;method "createdelta":
					 ;mov "eax" value(b-a+1) to delta
    mov ecx,5 ;loop for 5 times
    mov dh,5 ;row for gotoxy (position 5 down)(starting from 0)
			 ;dl: input value "a"

    box:
      push ecx ; save ecx(counter# for loop) in the stack
      mov eax,6 ;eax is reseted to 6 
				;(ex "a" is saved as "delta" by createdelta method)
      sub eax,ecx ;eax(6)-ecx(counter# for loop)
      mov delta,eax ;mov eax to delta:(b-a+1) <method is overwritten>
      call drawline ;method "drawline"
      call crlf
      inc dh ;increment 1 row for gotoxy
      pop ecx ;restore ecx (counter# for loop)
    loop box     
	
	exit
	 
main ENDP

; put methods here

;createdelta proc
;	mov eax,b ;put "b" to eax
;	sub eax,a ;subtract "a" from eax(b)
;	inc eax	  ;eax(b-a) increment by 1
;	mov delta, eax ;mov "a" value(b-a+1) to delta
;	ret
;createdelta endp


drawline proc
	mov ebx,a ;ebx points to a
	mov dl,bl ;column for gotoxy (position "bl"="a" right)(starting from 0)
 
	mov ecx, delta ;loop counter for delta times;eax(6)-ecx(counter# for loop)
				   ;-> if create delta method is used, the value of "delta" will change
	printdot:
		call gotoxy
		mov al,'*'
		call writechar
		inc dl
		mov eax,200
		call delay
	loop printdot
	ret
drawline endp


reada proc
	mov edx,offset aprompt ;mov the beginning of aprompt to edx for printing
	call writestring ;print edx(-> aprompt: byte "what is a?")
	call readint ;readint: reads a 32-bit signed integer from the keyboard 
				 ;and returns the value in EAX
	mov a,eax  ; all inputs go into eax, then a
	ret
reada endp

;readb proc
;	mov edx,offset bprompt
;	call writestring
;	call readint
;	mov b,eax  ; all inputs go into eax, then b
;	ret
;readb endp

end main