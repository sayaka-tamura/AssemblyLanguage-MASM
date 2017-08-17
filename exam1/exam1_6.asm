;Last updated 2.15.2016 Written by Sayaka Tamura

;Write a program to read the elements in arrayA
;ArrayA byte 10,20,30,10
;and then output 10+30+20+10=80

TITLE TEST Question(exam1_6.asm)
INCLUDE Irvine32.inc

.data
	Array byte 10,20,30,10 
	plus byte "+", 0
	equal byte "=", 0

.code
main PROC

	mov	esi, 0

	movzx eax, Array[esi] ;array,esi ->show the memory location for the esi
						  ;array,[esi] -> show the first value of the esi 
	call writedec		  ;-> to use "writedec", have to use eax register
	mov edx, offset plus 
	call WriteString	  ;-> to use "writeString", have to use edx register (ref:line 21)

	movzx eax, Array[esi+1] ;movzx it is used put smaller byte to bigger space (8bit)
	call writedec
	call writestring

	movzx eax,Array[esi+2]
	call writedec
	call writestring

	movzx eax,Array[esi+3]
	call writedec

	mov edx,offset equal
	call writestring

	movzx eax, Array[esi] 
	movzx ebx, Array[esi] ;convert 8->32bit
	add eax, ebx
	movzx ebx, Array[esi+2]
	add eax, ebx
	movzx ebx, Array[esi+3]
	add eax, ebx
	call writedec

	exit
	main endp
END main
