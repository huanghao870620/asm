 .386
 .model flat, stdcall
 
 include windows.inc
 include kernel32.inc
 include masm32.inc
 include debug.inc
 
 includelib kernel32.lib
 includelib masm32.lib
 includelib debug.lib
 
 .data
  val dd 11,22,33
 
 .code
 start:
   mov eax, val
   PrintDec eax
   mov eax, val[4]
   PrintDec eax
   mov eax, val[8]
   PrintDec eax
   ret
 
 end start