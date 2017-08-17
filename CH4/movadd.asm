TITLE move adds          (movadd.asm)                     
   
;Last updated 2.15.2016 Written by Sayaka Tamura
INCLUDE Irvine32.inc
.data
   array word  111,2345,4095,1,5
   plus byte "+",0
   equals byte "=",0
   
.code
main PROC
	mov eax, lengthof array
	call writedec
	call crlf
	mov eax, sizeof array ;tells the leghth times element(index) size
	call writedec
	call crlf
	mov eax, type array ;tells dword->4, word-> 2, byte ->1 
	call crlf

	;start to show a expression using "array"
	mov eax,0
	mov ecx, 4
	mov esi, 0
	mov edx, offset plus

	printing: ;loop named printing starts
		movzx eax, array[esi]
		call writedec ;print decimal number
		call writestring ;print String in edx register

		add esi,2 ;mov to 2 in [esi]
	loop printing ;loop(printing) end 

	movzx eax,array [esi]
	call writedec
	mov edx, offset equals
	call writestring

	mov ecx,5 ; for calculating sum (add # 5 times)
	mov eax,0
	mov esi,0 ;reset to the beginning
	

	printing1: ;loop named printing1 starts for calculate the sum of array
		add ax, array [esi]
		add esi,2
	loop printing1 ;end loop(printing1)

	call writedec
      
	exit
	 
main ENDP
 
end main