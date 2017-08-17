TITLE  mybinary finite state problem  (mybinaryfinite.asm)

; Last update: may 10 2017
; Programmed by dr scheiman
; finite machine
;  
;-----------------------------------------------------
;		         DATA
;-----------------------------------------------------
 
 
 

INCLUDE Irvine32.inc
.data
firstdigit byte  "Enter first digit 0 or 1 (other entries will stop) ",0
seconddigit byte  "Enter second digit 0 or 1 ",0
newstate0 byte "You are in state so ",0
newstate1 byte "You are in state s1 ",0
newstate2 byte "You are in state s2 ",0
newstate3 byte "You are in state s3 ",0
 output byte " The output is  ",0
x dword ?
y dword ?
	
			
.code    

;-----------------------------------------------------
;		        MAIN
;-----------------------------------------------------
     
 
main proc
                    call clrscr
                    mov x,0
                    mov y,0     ; initial condition are no in and start in so
                    call s0
                     
	
 
        exit
main ENDP


;-----------------------------------------------------
;		     PROCEDURES
;-----------------------------------------------------
 input proc
    mov edx,offset firstdigit
   call writestring
   call readint
   mov x, eax
  call crlf
  mov edx,offset seconddigit
   call writestring
      call readint
   mov y, eax
  ret
input endp





s0 proc
     mov edx, offset newstate0
     call writestring
     call crlf
     mov edx, offset  output
     call writestring
     mov eax,0
    call writedec
call crlf
   mov ebx,x
   .if ((x!=1)&&(x!=0))
        exit
 .endif
   call input
   .if (x==0&&y==0) 
        call s0
  .endif
   .if(x==0&&y==1)
       call s2
   .endif
    .if(x==1&&y==0)
      call s2
   .endif
  .if(x==1&&y==1)
     call s1
   .else 
    call s0
  .endif
    ret
s0 endp


s1 proc
     mov edx, offset newstate1
     call writestring
     call crlf
     mov edx, offset     output
     call writestring
     mov eax,0
    call writedec
    call crlf
      
   mov ebx,x
   .if ((x!=1)&&(x!=0))
        exit
 .endif
   call input
   .if (x==0&&y==0) 
        call s2
  .endif
   .if(x==0&&y==1)
       call s1
   .endif
    .if(x==1&&y==0)
      call s1
   .endif
  .if(x==1&&y==1)
     call s3
   .else 
    call s2
  .endif
    ret
s1 endp

s2 proc
     mov edx, offset newstate2
     call writestring
     call crlf
     mov edx, offset     output
     call writestring
     mov eax,1
    call writedec
   mov ebx,x
    call crlf
   .if ((x!=1)&&(x!=0))
        exit
 .endif
   call input
   .if (x==0&&y==0) 
        call s0
  .endif
   .if(x==0&&y==1)
       call s2
   .endif
    .if(x==1&&y==0)
      call s2
   .endif
  .if(x==1&&y==1)
     call s1
   .else 
    call s0
  .endif
    ret
s2 endp

s3 proc
     mov edx, offset newstate3
     call writestring
     call crlf
     mov edx, offset     output
     call writestring
     mov eax,1
    call writedec
    call crlf
   mov ebx,x
   .if ((x!=1)&&(x!=0))
        exit
 .endif
   call input
   .if (x==0&&y==0) 
        call s2
  .endif
   .if(x==0&&y==1)
       call s1
   .endif
    .if(x==1&&y==0)
      call s1
   .endif
  .if(x==1&&y==1)
     call s3
   .else 
    call s2
  .endif
    ret
s3 endp
end main
