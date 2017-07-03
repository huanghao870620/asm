.386
.model flat, stdcall
option casemap: none

include windows.inc
include kernel32.inc  
include user32.inc  
include gdi32.inc
  
includelib kernel32.lib  
includelib user32.lib  
includelib gdi32.lib
includelib  msvcrt.lib

printf proto c :ptr sbyte, :vararg


.data


.code


main proc
 call a0
main endp

a0 proc
 ;db  s "3"
 
a0 endp

a1 proc
a1 endp

a2 proc
a2 endp

a3 proc
a3 endp

a4 proc
a4 endp

end main


