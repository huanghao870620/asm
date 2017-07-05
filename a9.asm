 assume cs:code, ds:data, ss:stack
 
 data segment
  file db 'd:\l.txt', 0
  buf db 256 dup(0)
  error_message db 0ah, 'error!', '$'
  handle dw ?  
 data ends
 
 stack segment stack
  
 stack ends
 
 code segment
 
 start:
  mov ax, data
  mov ds, ax
  mov dx, offset file
  mov al, 0
  mov ah, 3dh
  int 21h
  jc error
  mov handle, ax
  mov bx, ax
  mov buf[bx], '$'
  mov dx, offset buf
  mov ah,9
  int 21h
  mov bx, handle
  mov ah, 3eh
  int 21h
  jnc end1
  
  error:
   mov dx, offset error_message
   mov ah,9
   int 21h
   
 end1:
   mov ah, 4ch
   int 21h
  
 code ends
 
 
 
 
 end start