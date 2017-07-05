 assume cs:code, ds:data,  ss:stack
 
 
 data segment
 data ends
 
 
 stack segment stack
 stack ends
 
 
 code segment
  start:
  mov ax,1
 code ends
 
 end start