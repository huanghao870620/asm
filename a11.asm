 assume cs:code, ds:data,  ss:stack
 
 
 data segment
  str db 'hello world$', 0
  ;str db 0ah, 'error!', '$'
 data ends
 
 
 stack segment stack
 stack ends
 
 
 code segment
  start:
  
   mov ax, data
   mov ds, ax
  
  
   mov cx, 5
   
  d:
   
   mov dx, offset str
   mov ah, 9
   int 21h
   loop d
  
  mov ah, 4ch
   int 21h
  
 code ends
 
 end start