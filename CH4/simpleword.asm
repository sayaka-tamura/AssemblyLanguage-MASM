   TITLE   simpleword          (simpleword.asm)
   
;Last updated 2.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc
.data
   array byte "Sayaka Tamura",0
   star byte "*"
.code

main PROC
    mov eax,0 ;if this line is a comment, still this asm works

	mov al,array
	call writechar
	mov al,array+1
	call writechar
	mov al,array+2
	call writechar
	mov al,array+3
	call writechar
	mov al,array+4
	call writechar
	mov al,array+5
	call writechar
	mov al,array+6
	call writechar
	mov al,array+7
	call writechar
	mov al,array+8
	call writechar
	mov al,array+9
	call writechar
	mov al,array+10
	call writechar
	mov al,array+11
	call writechar
	mov al,array+12
	call writechar
	call crlf
	call crlf
	; you finish

	mov al, array+12
    call writechar
    mov al, array+11
    call writechar
    mov al, array+10
    call writechar
    mov al, array+9
    call writechar
    mov al, array+8
    call writechar
    mov al, array+7
    call writechar
	mov al, star
	call writechar
    mov al, array+6
    call writechar
    mov al, array+5
    call writechar
    mov al, array+4
    call writechar
    mov al, array+3
    call writechar
    mov al, array+2
    call writechar
    mov al, array+1
    call writechar
    mov al, array
    call writechar

	call crlf
	mov edx, offset array ; offset is the memory locaton of the start of array, 0 is the end
	call writestring

	exit
	 
main ENDP
 
end main

COMMENT !
      print my name going down (use crlf: go to next output line)
      print it backwards  no crlf until the last call writechar
      after the backwards part use  mov edx, offset array
      and call writestring
!