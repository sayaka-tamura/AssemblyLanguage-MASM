TITLE methoddemo3         (methoddemo3.asm)                     

;make a line repeating strings that is set in a program
;Last updated 92.15.2016 Written by Sayaka Tamura

INCLUDE Irvine32.inc
.data
	a dword ? 
   	b dword ?
	symbol byte ? 
	delta dword ?
.code
main PROC
	call clrscr
	mov eax, 0
 	mov dl,10 ;column for gotoxy (position 10 right)(starting from 0)

	;mov ecx, 5 ; loop counter for 5 times
	mov dh, 5 ;row for gotoxy (position 5 down)(starting from 0)
	
	mov symbol, 'x'
	mov delta, 5
	call drawline
	
	mov symbol, 'c'
	mov delta, 7
	call drawline
	
	mov symbol, 'L'
	mov delta, 4
	call drawline

	mov symbol, 'x'
	mov delta, 5
	call drawline 
exit
	 
main ENDP
;put methods here	
		
drawline proc

	mov ecx, delta ;loop counter for "delta" times
	printdot:
		call gotoxy ; Locate the cursor on dh, dl
		mov al, symbol ;mov symbol to print the string
		call writechar ;print the al(String)
		inc dl ;dl increases by 1
		mov eax, 200 ;for delay the current process (0.2 sec)
		call delay
	loop printdot
	ret
drawline endp	

	
end main

;HW 1. draw a line going down -->answer: change "inc dl" to "inc dh"
; 2. draw a line going up  -->answer: change "inc dl" to "dec dl" 
									;and start position appropreately "mov dl,10" -> "mov dl,20"

; 3. draw horizontal line going from b to a
; and CH4 no.1-8 
; array byte '5','x','4','c','7','l','4','x'
;put this into the program brokeline

j     rrrr
j     r  r
j     rrrr
j     rr
j    j   r  r
 jjjj    r  r

;