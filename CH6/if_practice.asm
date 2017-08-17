TITLE if statement practice          (if_practice.asm)

;Last updated 2.15.2016 Written by Sayaka Tamura

;Using jump commands we can tell if x>,<, or == to y
;//.if //.elseif //.else // .endif // No {}

INCLUDE Irvine32.inc

.data
.code

main PROC
	mov al,x
		.if al>y ;.if (al>x):could work / () are not needed
			 mov al,x
			 mov edx, offset promptia
			 call writedec
			 call writestring
			 mov al,y
			 call writedec
			 call crlf
	   .elseif y>al
			 mov al,y
			 mov edx, offset promptia
			 call writedec
			 call writestring
			 mov al,x
			 call writedec
			 call crlf
	   .else
		 mov al,y
		 mov edx, offset promptjla
		 call writedec
		 call writestring
		 mov al,x
		 call writedec
		 call crlf
	   .endif
	exit

	main ENDP

end main