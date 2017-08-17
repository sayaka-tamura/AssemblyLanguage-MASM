TITLE Reversing a String           (RevStr.asm) 
INCLUDE Irvine32.inc 
.data 
aName BYTE "Abraham Lincoln",0 
nameSize = ($ - aName) - 1 ;nameSize = subtracting the offset of list from $
.code 
main PROC 
	; Push the name on the stack. 
	mov ecx,nameSize ;for loop counter
	mov esi,0 
	L1: 
		movzx eax,aName[esi] ; get character (show the first value of the esi)
		push eax ; push on stack 
		inc esi ;increment by 1
	loop L1
	
	; Pop the name from the stack, in reverse, 
	; and store in the aName array. 
	mov ecx,nameSize 
	mov esi,0 
	L2: 
		pop eax ; get character 
		mov aName[esi],al ; store in string 
		inc esi 
	loop L2 
	
	; Display the name. 
	mov edx,OFFSET aName ;edx -> for print string
	call WriteString 
	call Crlf 
	exit 
main ENDP 
END main 