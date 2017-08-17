   TITLE random          (randm1.asm)
 
;This  
;Last updated 92.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc
.data
     number dword ?
.code

main PROC
    call randomize   ;new numbers every run
    call clrscr
    mov eax,153    ;whole numbers 0---152  
    mov ecx,15

    printrand:
       push eax
       call randomrange
       add eax,7
       call writedec
       pop eax
       call crlf
    loop printrand
     
	exit
	 
main ENDP
 
end main