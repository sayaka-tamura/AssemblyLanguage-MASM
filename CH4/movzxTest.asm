TITLE movezx practice         (movezxTest.asm)                     
   
;Last updated 2.15.2016 Written by dr Sayaka Tamura
INCLUDE Irvine32.inc
.data
	byte1 BYTE 9Bh 
	word1 WORD 0A69Bh
.code
main PROC
	mov bx,0A69Bh 
	movzx eax,bx ; EAX = 0000A69Bh 
	movzx edx,bl ; EDX = 0000009Bh 
	movzx cx,bl ; CX  = 009Bh

	movzx eax,word1 ; EAX = 0000A69Bh 
	movzx edx,byte1 ; EDX = 0000009Bh 
	movzx cx,byte1 ; CX  = 009Bh

exit

main ENDP

end main