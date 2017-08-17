TITLE methoddemo1         (methoddemo1.asm)                     

;draw a line and make a cursol move right
;distance from the left: user-input "a"
;distance from the top: is set 5 to "dh" as default
;how many times a line will repeat : user-input "b"
;how many times show "*" in a line: is set 5 to "ecx" as default

;Last updated 92.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc
.data
	a dword ? 
   	b dword ?
	d dword ?

	aprompt byte "what is the starting point on x-axis?", 0 
	bprompt byte "how many string you would like to show in a line?", 0
	dprompt byte "how many line you would like to draw?", 0
	
	delta dword ?
.code

main PROC
	call clrscr ;call clear screen
	mov eax, 0 ;reset eax to 0 
	call reada ;method "reada"
	call readb ;method "readb"
	call readd ;method "readb"

	call createdelta ;method "createdelta"
	mov ecx, d ;loop for "d" times (make lines "d" times)
	mov dh, 5 ;row for gotoxy (position 5 down)(starting from 0)

	box: 
		push ecx ; save ecx(counter# for loop) in the stack
		
		mov eax,6 ;eax is reseted as 6 (ex "a" is saved as "delta" )
		sub eax,ecx ;eax(6)-ecx(counter# for loop)
		
		call drawline  ;method "drawline"
		call crlf
		inc dh ;increment 1 row for gotoxy
		pop ecx ;restore ecx (counter# for loop)
	loop box
exit
	 
main ENDP

;put methods here
createdelta proc
	;Store a value to "delta"

	;mov eax,b ;put to "b" to eax(no meaning)
	mov eax,a ;eax is reseted as "a" value
	inc eax ;eax(a) increases by 1
	mov delta, eax ;mov "eax(a)" value to delta

	ret ;=return
createdelta endp	
		
drawline proc
	;set cursol position on x-axis(a)
	mov ebx,a ;ebx points to a
	mov dl,bl ;column for gotoxy (position "bl"="a" right)(starting from 0)
	
	mov ecx, b ;repeat "b": make a string "b" times in a line

	printdot:
		call gotoxy
		mov al, '*'
		call writechar
		inc dl
		mov eax, 200
		call delay
	loop printdot
	ret
drawline endp	

	
reada proc
	mov edx, offset aprompt ;mov the beginning of aprompt to edx for printing
	call writestring ;print edx(-> aprompt: byte "what is a?")
	call readint ;readint: reads a 32-bit signed integer from the keyboard 
				 ;and returns the value in EAX
	mov a, eax ; all inputs go into eax, then a
	ret ;=return
reada endp

readb proc
	mov edx, offset bprompt
	call writestring
	call readint
	mov b, eax ; all inputs go into eax, then b
	ret
readb endp

readd proc
	mov edx, offset dprompt
	call writestring
	call readint
	mov d, eax ; all inputs go into eax, then b
	ret
readd endp
	
end main