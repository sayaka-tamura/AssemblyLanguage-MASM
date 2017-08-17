   TITLE methoddemo2         (methoddemo2.asm)                     
   
;Last updated 92.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc
.data
	a dword ? 
   	b dword ?
	aprompt byte "what is a?", 0 
	bprompt byte "what is b?", 0
	delta dword ? 
.code

main PROC
	call clrscr
	mov eax, 0
	call reada
	call readb
	call createdelta
	call drawline
	
exit
	 
main ENDP

;put methods here
createdelta proc
	mov eax,b 
	mov eax,a
	inc eax
	mov delta, eax
	ret
createdelta endp	
		
drawline proc
	mov ebx,a 
	mov dl,bl
	mov dh,10
	mov ecx, delta

	printdot:
		call gotoxy
		push edx
		mov edx, offset delta
		call writestring
			
		pop edx
		inc dl
		mov eax, 500
		call delay
	loop printdot
	ret
drawline endp	

	
reada proc
	mov edx, offset aprompt
	call writestring
	call readint
	mov a, eax ; all inputs go into eax
	ret
reada endp

readb proc
	mov edx, offset bprompt
	call writestring
	call readint
	mov b, eax ; all inputs go into eax
	ret
readb endp
	
end main