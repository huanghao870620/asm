.386
.model flat, stdcall
option casemap: none

include windows.inc
include kernel32.inc
include user32.inc
include gdi32.inc
include masm32.inc

includelib kernel32.lib
includelib user32.lib
includelib gdi32.lib
includelib masm32.lib

.data
 szText db "hello world!", 0 

.code

main PROC
  
  call a0
main endp

a0 proc
; push ebp
; mov ebp, esp
; sub esp, 0ah
;  invoke StdOut, addr szText
;  invoke StdOut, eax
a0 endp

a1 proc
a1 endp



end main


