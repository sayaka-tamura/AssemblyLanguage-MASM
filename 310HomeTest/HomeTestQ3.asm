TITLE TakeHomeQ3 (Sayaka_TakeHomeQ3.asm)

INCLUDE Irvine32.inc
.data
array SDWORD 100 DUP (?)
target SDWORD LENGTHOF array DUP (?)

code1 DB "Print the array out.",0
code2 DB "Print the array out backwards.",0
code3 DB "Print out the copied array called target.",0
.code
main PROC
;******************1. Create an array.**********************
   mov esi,offset array
   mov ecx,LENGTHOF array
ArrayCreate:
   mov eax,0
   mov eax,21               ; [0,20]
   call randomRange
   sub eax,10               
   mov [esi], eax
   add esi,4
   Loop ArrayCreate

;******************2. Print the array out.**********************

   mov edx,offset code1
   call writeString
   call crlf
   mov ecx,LENGTHOF array
   mov esi,offset array
Print:
   mov eax,[esi]
   call writeint
   add esi,4
   call crlf
   loop print

;******************3. Print the array out backwards.****************** 

   mov edx,offset code2
   call writeString
   call crlf
   mov ecx,LENGTHOF array
   mov esi,offset array+396
PrintBackward:
   mov eax,[esi]
   call writeint
   sub esi,4
   call crlf
   loop PrintBackward

;****************4.Copy to the array to an array called target ****************

   mov edx,offset code3
   call writeString
   call crlf
   mov esi,offset array
   mov ecx,LENGTHOF array
   mov ebx,0
doACOPY:
   mov eax,[esi]
   mov [target+ebx],eax
   add esi,4
   add ebx,4
   loop doACOPY   

;****************4. Print Target out.************************************

   mov ecx,LENGTHOF target
   mov esi,offset target 
Target4Print:
   mov eax,[esi]
   call writeint
   add esi,4
   call crlf
   loop Target4Print


exit
main ENDP
END main