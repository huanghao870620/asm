.386

.model flat, stdcall
option casemap: none

include windows.inc
include user32.inc
include masm32.inc
include debug.inc
include kernel32.inc

includelib masm32.lib
includelib debug.lib
includelib user32.lib
includelib kernel32.lib

.data
  a db 1,2,3,4
  a0 db "222"
.code



main proc
  mov ecx,5
  lea ebx, a
  d:
   mov eax,[ebx]
   inc ebx
   loop d

 mov eax, offset a0
 mov ebx, eax
 nop
 nop

 ret;
main endp

end main