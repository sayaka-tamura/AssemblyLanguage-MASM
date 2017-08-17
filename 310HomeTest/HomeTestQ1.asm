TITLE Graphing Movement (Sayaka_TakeHomeQ1.asm)

INCLUDE Irvine32.inc
.data
array1 DB 1,'x',1,' ',2,'x',3,' ',3,'x',1,' '
array2 DB 2,'x',2,' ',1,'x',1,' ',1,'x',3,' ',1,'x'
array3 DB 1,'x',5,' ',1,'x',3,' ',1,'x'
array4 DB 1,'x',5,' ',1,'x',3,' ',1,'x'
array5 DB 1,'x',6,' ',3,'x',1,' '
l DB 5
lengthOfArray1 = lengthof array1
lengthOfArray2 = lengthof array2
lengthOfArray3 = lengthof array3
lengthOfArray4 = lengthof array4
lengthOfArray5 = lengthof array5
grandarray DD 10 dup(?) 	

.code
main PROC
call QuestionB
call QuestionC
exit
main ENDP

;*******************************************Answer for a****************************

QuestionA PROC
 mov esi,offset grandarray
 sub esi,4 ;we start a dword back.
 mov ecx,5                      
outer:                          
 push ecx                          
 ;get each array from grandarray data
 add esi,4
 mov edi,[esi]                 
 add esi,4			
 mov ecx,[esi]			
 
 inner:				
    push ecx			
    mov ecx,0			;ecx=0       clear ecx for cl.
    mov cl,[edi] 		
    inc edi			;edi==*
    mov al,[edi]		
    call drawlineForA
    inc edi			
     
    pop ecx			
 loop inner
 inc dh				
 mov dl,l			
 
 pop ecx			
 call gotoxy 			
 loop outer
ret
QuestionA ENDP

drawlineForA PROC     
    lineloop:   
       call writechar
       inc dl
    loop lineloop
    ret
drawlineForA ENDP

fill proc
  mov esi,offset grandarray
  mov [esi],offset array1
  add esi,4
  mov ebx, lengthOfArray1/2
  mov [esi],ebx
  add esi,4
  mov [esi],  offset array2
  add esi,4
  mov ebx, lengthOfArray2/2
  mov [esi],ebx
  add esi,4
  mov [esi],   offset array3
  add esi,4
  mov ebx, lengthOfArray3/2
  mov [esi],ebx
  add esi,4
  mov [esi],   offset array4
  add esi,4
  mov ebx, lengthOfArray4/2
  mov [esi],ebx
  add esi,4
  mov [esi],   offset array5
  add esi,4
  mov ebx, lengthOfArray5/2
  mov [esi],ebx

  ret
fill endp

;*******************************************Answer for b******************************************

QuestionB PROC
mov eax,50
mov ecx,16
Right:
 call delay
 push ecx
 call clrscr
 mov dh,10
 mov dl,l
 call gotoxy
 call fill
 mov eax,red
 call settextcolor
 call QuestionA
 mov bl,l
 inc bl
 mov [l],bl
 pop ecx
 loop Right
ret
QuestionB ENDP 

;*******************************************Answer for c****************************

QuestionC PROC
mov eax,50
mov ecx,7
left:
 call delay
 push ecx
 call clrscr
 mov dh,10
 mov dl,l
 call gotoxy
 call fill
 mov eax,blue
 call settextcolor
 call QuestionD
 mov bl,l
 dec bl
 mov [l],bl
 pop ecx
 loop left
ret
QuestionC ENDP 

;*******************************************Answer for d. ******************************************

QuestionD PROC
 mov esi,offset grandarray
 sub esi,4 ;we start a dword back.
 mov ecx,5                      ;ecx=5
outer:                          
 push ecx                          
 add esi,4
 mov edi,[esi]                  ;edi=arr1
 add esi,4			
 mov ecx,[esi]			
 
 inner:			
    push ecx			
    mov ecx,0			;ecx=0      
    mov cl,[edi] 		
    inc edi			  ;edi==*
    mov al,[edi]		
    call drawlineForD
    inc edi		
     
    pop ecx		
 loop inner
 inc dh				
 mov dl,l			
 
 pop ecx			
 call gotoxy 		
 loop outer
ret
QuestionD ENDP 

drawlineForD PROC     
    lineloop:   
       call writechar
       dec dl
       call gotoxy 
    loop lineloop
    ret
drawlineForD ENDP

END main