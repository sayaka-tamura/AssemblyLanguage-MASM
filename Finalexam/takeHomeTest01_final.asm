TITLE Finite State Machine (TakeHomeTest_final01.asm) 

;class: CSC310-1945
;date: 5/22/2017
;author: Sayaka Tamura
;made a program for #1

INCLUDE Irvine32.inc 

;ENTER_KEY = 13 

.data 
InvalidInputMsg BYTE "Invalid input",13,10,0 

askInput byte "Enter a place number 0 or 1, or '+' for exit",0
tellDone byte "You finished your program, bye.",0
tellOutput byte "Outputs by your typing are... ",0

array4Output byte 20 DUP(?)
decNum byte ?

tellPositonS0 byte "You now is on S0.",0
tellPositonS1 byte "You now is on S1.",0
tellPositonS2 byte "You now is on S2.",0
tellPositonS3 byte "You now is on S3.",0

aa byte "a",0	;for output S0
bb byte "b",0	;for output S1,S2	
cc byte "c",0	;for output S3

.code 
main PROC 
	call Clrscr

	mov esi,OFFSET array4Output		; set the start of array 

	StateS0: 
		mov  edx,OFFSET tellPositonS0	 ;This is for writestring
		call WriteString				 ;"You now is on S0."
		call crlf

		mov al, aa						; store "a" to al
		;call writechar
		mov [esi],al					; store char in array for output 
		add esi,TYPE byte				; go to next char 

		call Getnext					; read next unsigned decimal integer into al 
		
		.if	decNum=='0'		  ; if user-input is 0
			jmp StateS1       ; go to State S1
		.elseif decNum=='1'	  ; if user-input is 1
			jmp StateS2		  ; go to State S2
		.elseif decNum=='+'  ; if user-input is +
			jmp StateExit	  ; go to Exit
		.endif
		
		call DisplayErrorMsg  ; invalid input found 
		jmp Quit 	

	StateS1:
		mov  edx,OFFSET tellPositonS1	 ;This is for writestring
		call WriteString				 ;"You now is on S1."
		call crlf

		mov al, bb						; store "b" to eax
		;call writechar
		mov [esi],al					; store char in array for output 
		add esi,TYPE byte				; go to next char 

		call Getnext     ; read next unsigned  into AL 

		.if	decNum=='0'		  ; if user-input is 0
			jmp StateS2       ; go to State S2
		.elseif decNum=='1'	  ; if user-input is 1
			jmp StateS3		  ; go to State S3
		.elseif decNum=='+'  ; if user-input is +
			jmp StateExit	  ; go to Exit
		.endif

		call DisplayErrorMsg     ; no: invalid input found 
		jmp Quit

	StateS2: 
		mov  edx,OFFSET tellPositonS2	 ;This is for writestring
		call WriteString				 ;"You now is on S2."
		call crlf

		mov al, cc						; store "a" to al
		;call writechar
		mov [esi],al					; store char in array for output 
		add esi,TYPE byte				; go to next char 

		call Getnext					; read next unsigned decimal integer into al 
		
		.if	decNum=='0'		  ; if user-input is 0
			jmp StateS2       ; go to State S2
		.elseif decNum=='1'	  ; if user-input is 1
			jmp StateS1		  ; go to State S1
		.elseif decNum=='+'  ; if user-input is +
			jmp StateExit	  ; go to Exit
		.endif
		
		call DisplayErrorMsg  ; invalid input found 
		jmp Quit

	StateS3: 
		mov  edx,OFFSET tellPositonS3	 ;This is for writestring
		call WriteString				 ;"You now is on S3."
		call crlf

		mov al, bb						; store "a" to al
		;call writechar
		mov [esi],al					; store char in array for output 
		add esi,TYPE byte				; go to next char 

		call Getnext					; read next unsigned decimal integer into al 
		
		.if	decNum=='0'		  ; if user-input is 0
			jmp StateS2       ; go to State S2
		.elseif decNum=='1'	  ; if user-input is 1
			jmp StateS3		  ; go to State S3
		.elseif decNum=='+'  ; if user-input is +
			jmp StateExit	  ; go to Exit
		.endif
		
		call DisplayErrorMsg  ; invalid input found 
		jmp Quit

	StateExit: 
		mov  edx,OFFSET tellDone	 ;This is for next writestring
		call WriteString             ;"You finished your program, bye."
		mov  edx,OFFSET tellOutput	 ;This is for next writestring
		call WriteString             ;"Outputs by your typing are... "
		call DisplayArray			 ;print outputs in array
		jmp Quit 

	Quit:
		call Crlf 
		
	exit 
main ENDP
;----------------------------------------------

	Getnext PROC 
	; 
	; Reads a unsigned decimal integer from standard input. 
	; Receives: nothing 
	; Returns: eax contains the character to array
	;----------------------------------------------
		mov  edx,OFFSET askInput ; This is for writestring
		call WriteString         ; "Enter your command"
		call crlf

		call ReadChar	; input from keyboard
		mov  decNum,al  ; store the unsigned decimal number

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

	DisplayArray PROC
		mov ecx,lengthof array4Output
		mov esi,OFFSET array4Output		; set the start of array 

		display:
			mov al,[esi]		; set a string in array for WriteString
			call Writechar		; display the string
			add esi,TYPE byte	; next integer
		loop display

		ret
	DisplayArray ENDP

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