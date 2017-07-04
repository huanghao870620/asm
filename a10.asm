.386
.model flat, stdcall
option casemap: none

include windows.inc
include kernel32.inc
include user32.inc
include gdi32.inc
include masm32.inc
include debug.inc

includelib kernel32.lib
includelib user32.lib
includelib gdi32.lib
includelib masm32.lib
includelib debug.lib

.data
 szText db "hello world!", 0 

.code

main PROC
  LOCAL v1:dword
  mov eax,4
  mov eax,5
  mov eax, offset szText
  ;mov v1, eax
  PrintDec v1

  mov ecx,2
  ;d:
  ;invoke StdOut, addr szText
  ;loop d  


  invoke ExitProcess,0
main endp

a0 proc
 push ebp
 mov ebp, esp
a0 endp

a1 proc
a1 endp


end main


