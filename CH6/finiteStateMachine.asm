TITLE Finite State Machine (finiteStateMachine.asm) 

INCLUDE Irvine32.inc 

ENTER_KEY = 13 

.data 
InvalidInputMsg BYTE "Invalid input",13,10,0 

askInput byte "Enter your command by a number 0-9",0
tellPosition byte "You now typed  ",0

charIn BYTE ?



.code 
main PROC 
	call Clrscr

	mov  edx,OFFSET askInput ;This is for writestring
	call WriteString         ;"Enter your command"
	call crlf

	StateA: 
		call Getnext         ; read next char into AL 
		cmp al,'+'           ; leading + sign? 
		je StateB            ; go to State B 
		cmp al,'-'           ; leading - sign? 
		je StateB            ; go to State B 
		call IsDigit         ; ZF = 1 if AL contains a digit 
		jz StateC            ; go to State C 
		call DisplayErrorMsg  ; invalid input found 
		jmp Quit 
	
	StateB: 
		call Getnext         ; read next char into AL 
		call IsDigit         ; ZF = 1 if AL contains a digit 
		jz StateC 
		call DisplayErrorMsg  ; invalid input found 
		jmp Quit 
	
	StateC: call Getnext     ; read next char into AL 
		call IsDigit             ; ZF = 1 if AL contains a digit 
		jz StateC 
		cmp al,ENTER_KEY         ; Enter key pressed? 
		je Quit                  ; yes: quit 
		call DisplayErrorMsg     ; no: invalid input found 
		jmp Quit
		
	Quit: 
		call Crlf 
		
	exit 
main ENDP
;----------------------------------------------

	Getnext PROC 
	; 
	; Reads a character from standard input. 
	; Receives: nothing 
	; Returns: AL contains the character
	;----------------------------------------------
		call ReadChar  ; input from keyboard

		mov  edx,OFFSET tellPosition ;This is for writestring
		call WriteString             ;"Your positon now is "

		call WriteChar ; echo on screen
		;mov  charIn,al ;store user-input to "charIn"

		call crlf
		ret 
	Getnext ENDP 
	;----------------------------------------------
	DisplayErrorMsg PROC 
	; 
	; Displays an error message indicating that 
	; the input stream contains illegal input. 
	; Receives: nothing. 
	; Returns: nothing 
	;----------------------------------------------
		push edx 
		mov edx,OFFSET InvalidInputMsg 
		call WriteString 
		pop edx 
		ret 
	DisplayErrorMsg ENDP 

	comment!
	;it belongs to the book’s link library already
	;--------------------------------------------------------------------
	IsDigit PROC 
		; 
		; Determines whether the character in AL is a valid decimal digit. 
		; Receives: AL = character 
		; Returns: ZF = 1 if AL contains a valid decimal digit
		; otherwise, ZF = 0. 
		;--------------------------------------------------------------------
		cmp al,'0' 
		jb ID1      ; ZF = 0 when jump taken 
		cmp al,'9' 
		ja ID1      ; ZF = 0 when jump taken 
		test ax,0   ; set ZF = 1 
	
		ID1: ret 
	IsDigit ENDP
	!
END main