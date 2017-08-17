TITLE method demo       (methoddemo5.asm)
 
;for a making line in reverse order
;Last updated 92.15.2016 Written by Sayaka Tamura

INCLUDE Irvine32.inc
.data
  a dword ?
  b dword ?
  aprompt byte "what is a?",0
  bprompt byte "what is b?",0 
  delta dword ? 
  count dword ?

.code

main PROC
    call clrscr
    mov eax,0
    call reada
    call readb
    call createdelta
    mov ecx,5
    
    mov dh,5
    box:
      push ecx
      mov count ,ecx
      call drawline
      call crlf
      inc dh
      pop ecx
    loop box
         
 exit
	 
main ENDP
; put methods here

createdelta proc
	mov eax,b
	sub eax,a
	inc eax
	mov delta,eax
	ret
createdelta endp

drawline proc
	mov ebx,a
	mov dl,bl
     
	mov ecx, count

	printdot:
		call gotoxy
		mov al,'*'
		call writechar
		inc dl
		mov eax,500
		call delay
	loop printdot

	ret
drawline endp

reada proc
	mov edx,offset aprompt
	call writestring
	call readint
	mov a,eax  ; all inputs go into eax
	ret
reada endp

	readb proc
	mov edx,offset bprompt
	call writestring
	call readint
	mov b,eax  ; all inputs go into eax
	ret
readb endp 

end main