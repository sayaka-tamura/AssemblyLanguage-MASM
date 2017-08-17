TITLE lengthof operator practice (lengthOf.asm)

;Last updated 92.15.2016 Written by Sayaka Tamura

INCLUDE Irvine32.inc
.data 
	byte1 BYTE 10,20,30
	array1 WORD 30 DUP(?),0,0 
	array2 WORD 5 DUP(3 DUP(?))
	array3 DWORD 1,2,3,4 
	digitStr BYTE "12345678",0

	myArray1 BYTE 10,20,30,40,50
			 BYTE 60,70,80,90,100

	myArray2 BYTE 10,20,30,40,50,
				  60,70,80,90,100
.code
main PROC
	lenArray1 = LENGTHOF byte1 ;result:3  
	lenArray2 = LENGTHOF array1 ;result30+2 
	lenArray3 = LENGTHOF array2 ;result5*3
	lenArray4 = LENGTHOF array3 ;result4
	lenArray5 = LENGTHOF digitStr;result 9

	lenArray6 = LENGTHOF myArray1;result 5
	lenArray7 = LENGTHOF myArray2;result 10

	mov eax,lenArray1
	call showLengthOfArray
	mov eax,lenArray2
	call showLengthOfArray
	mov eax,lenArray3
	call showLengthOfArray
	mov eax,lenArray4
	call showLengthOfArray
	mov eax,lenArray5
	call showLengthOfArray
	mov eax,lenArray6
	call showLengthOfArray
	mov eax,lenArray7
	call showLengthOfArray

	
exit
main ENDP

showLengthOfArray PROC
		call writedec
		call crlf
		call crlf
		ret
showLengthOfArray endp

end main