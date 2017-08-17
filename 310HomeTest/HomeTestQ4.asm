TITLE TakeHomeQ4 (Sayaka_TakeHomeQ4.asm)

INCLUDE Irvine32.inc

.data
array DB "i used to bite my tongue and hold my breath scared to rock the boat and make a mess so i say quietly agreed politely i guess i forgot that i had a choice",0
counters DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
is DB " is ",0
s=115
times DB " times.",0
.code
main PROC

   mov eax,0
   mov ecx,0
   mov ebx,0
   mov esi,offset array
   mov ecx,lengthof array
   l1:
   push ecx
	mov ecx,0
        mov bl,[esi]
	sub bl,97
	mov cl,bl	
	mov edi,0
	mov edi,offset Counters
	l2:
		inc edi
		loop l2
	mov al,[edi]
 	inc al
        mov [edi],al
   pop ecx
   inc esi
   loop l1



   mov edx,0
   mov esi,offset Counters
   mov ecx,lengthof Counters
   mov bl,97
   printCounter:
        mov eax,0
        mov al,bl				
	call writechar


	mov edx,0
        mov edx,offset is			
	call writeString
	
	mov eax,0
	mov al,[esi]
	call writedec				
 	
	mov eax,0
	mov al,s
	call writechar				
	
	mov edx,0
	mov edx,offset times			
	call writeString

	call crlf
	inc esi
	inc bl	   
   loop printCounter
 exit
main ENDP
END main