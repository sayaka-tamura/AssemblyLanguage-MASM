TITLE TakeHomeQ2 (Sayaka_TakeHomeQ2.asm)

INCLUDE Irvine32.inc
.data
RUNS DB 2,1,9,2,7,4,4,0,7,3,10,4,2,1,14,5,10,4,10,7
     DB 3,7,6,8,0,5,2,5,4,0,7,6,1,0,5,7,3,5,3,2,4,3,5,9,1,1,8,8,3,1,5,2,4

Comma=44
code1 DB "Print RUNS using offset and esi",0
code2 DB "Print RUNS using PTR",0
code3 DB "Runs totals to ",0
CountStateMent DB "There were  ",0
titleHorizontal DB "Horizontal Bar graph.",0
empty DB "                   ",0
bar DB "--------------------------",0
line=124
star=42
s=115
Counters DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
space=32
.code
main PROC
   mov dl,10
   mov dh,10
   call gotoxy
   call clrscr

;******************1. Print the arrray using esi and offset.***************

   mov eax,0
   mov edx,offset code1
   call writeString
   call crlf
   mov ecx,53
   mov esi,offset RUNS
Print:
   mov al,[esi]
   call writeDec
   mov al,Comma
   call writechar
   inc esi
   loop Print
   call crlf

;*******************2. Redo 1 With PTR.*****************************

   mov eax,0
   mov esi,offset RUNS
   mov edx,offset code2
   call writeString
   call crlf
   mov ecx,53
PrintWithPRT:
   mov al,BYTE PTR [esi]
   call writeDec
   mov al,Comma
   call writeChar
   inc esi
   loop PrintWithPRT
   call crlf

;*******************3. Add the lements in the array and print out the output(Runs totals to______).*****************************

   mov ebx,0
   mov ecx,53
   mov esi,offset RUNS
SumElements:
   add bl,[esi]
   inc esi
   loop SumElements
   mov edx,offset code3 
   call writeString
   mov al,bl
   call writeDec
   call crlf

;*******************4. Count how many times each numbers occurred.*****************************

   mov eax,0
   mov ecx,0
   mov ebx,0
   mov esi,offset RUNS
   mov ecx,53
   l1:
   push ecx
	mov ecx,0
	mov cl,[esi]	
	mov edi,0
	mov edi,offset Counters
	counting:
		inc edi
		loop counting
	mov al,[edi]
 	inc al
        mov [edi],al
   pop ecx
   inc esi
   loop l1


   mov edx,0
   mov esi,offset Counters
   mov ecx,lengthof Counters
   mov bl,0
   Count4print:
	mov edx,0
	mov edx,offset CountStateMent
	call writeString
	mov al,[esi]
	call writedec
	mov al,space
	call writechar
	mov al,bl
	call writedec
	mov al,s
	call writechar
	mov edx,offset empty 
	call writeString
	call crlf
	inc esi
	inc bl	   
   loop Count4print


;*******************5. Print a horizontal bar graph of the counts for the numbers 0-10 only.*****************************

   mov edx,offset titleHorizontal
   call writeString
   mov edx,offset empty 
   call writeString
   call crlf
   mov edx,offset bar
   call writeString
   call crlf   

   mov ebx,0
   mov ecx,11
   mov esi,offset Counters
   loop4row:
   mov eax,ebx
   call writedec
   mov eax,0
   mov al,line
   call writechar 
   push ecx
	mov ecx,0
	mov cl,[esi]
	colmns:
		mov al,star
		call writechar	
	loop colmns
   mov edx,offset empty 
   call writeString
   call crlf
   inc ebx
   inc esi
   pop ecx
   loop loop4row
exit
main ENDP
END main