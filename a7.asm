 EOF=065
 
 desg segment
 desg ends
 
 cseg segment
   assume cs:cseg, ds:dseg
   
   start: mov ax, dseg
         mov ds,ax
		 mov dx, offset fname
		 mov ax, 3d00h
		 int 21h
		 jnc open_ok
		 mov si, offset error1
		 call dmess
		 jmg over
		 
		 open_ok: mov bx, ax
		  cont: call readch
		        jc readerr
				cmp al, eof
				jz type_ok
				call putch
				jmp cont
				
		readerr: mov si, offset error2
		call demss
		
		type_ok:  mov ah, 3eh
		  int 21h
		  over: mov ah,07
		  int 21h
		  mov ah, 4ch
		  int 21h
		  
		  readch proc
		       mov cx,1
			   mov dx, offset buffer
     mov ah, 3fh
      int 21h
	   jc readch2
	   cmp ax, cx
	    mov al, eof
		
		jb readch1
		mov al, buffer
		
		readch1:clc
		readch2:ret
		readch endp
		
		dmess proc
		dmess1: mov dl, [si]
		 inc si
		 or dl,dl
		 jz dmess2
		 mov ah,2 
		 int 21h
		 jmp dmess1
		 
		 dmess2:ret
		 dmess endp
		 
		 putch proc
		   push dx
		   mov dl, al
		   mov ah,2
		   int 21h
		   pop dx
		   ret
		  
		 putch endp
		 cseg ends
		  end start