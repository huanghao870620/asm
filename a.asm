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
  
.data  
szCaption   db  "Hello", 0  
szText      db  "Hello World!", 0  
a db "dd", 0
b db "bb", 0
ccc db "eclipse",0
a0  WNDCLASSEX {}
a1 dword 0
a2 dword 0
a3 db "My Class",0
  
.code  
  
main PROC  

 push MB_OK
 mov eax, offset szCaption
 push eax
 mov eax, offset szText
 push eax
 push NULL
 call MessageBox

 call ab

main ENDP  

ab proc
  mov bx,0
  

  nop
  nop

 mov eax, 0
 push eax
 call GetModuleHandleA
 mov a1, eax



mov a2, sizeof WNDCLASSEX
mov ebx,offset a2
mov a0.cbSize, ebx
mov ebx,CS_HREDRAW
or ebx,CS_VREDRAW
mov a0.style, ebx 
mov ebx, offset WndProc
mov a0.lpfnWndProc, ebx
mov a0.cbClsExtra,0
mov a0.cbWndExtra,0
mov a0.hInstance,offset a1

push IDI_APPLICATION
push 0
call LoadIcon

mov a0.hIcon, eax

push IDC_ARROW
push NULL
call LoadCursor
mov a0.hCursor, eax

push WHITE_BRUSH
call GetStockObject
mov a0.hbrBackground, eax
mov a0.lpszMenuName,offset a3
mov a0.lpszClassName, offset a3

push IDI_WINLOGO
push 0
call LoadIcon
mov a0.hIconSm,eax



 mov ebx,offset a0
 push ebx
 call RegisterClassA
; call GetStockObject



  push 0
  push a1
  push 0
  push 0
  push 100
  push 100
  push 200
  push 200
  push WS_BORDER
  push offset ccc
  push 0
  push WS_EX_ACCEPTFILES
  call CreateWindowEx


  ret
ab endp


WndProc proc
  ret
WndProc endp



Employee struct
 IdNum  byte "0000000"
 Lastname byte 30 dup(0)
 Years word ?
 SalaryHistory  dword 0,0,0,0
Employee ends



END main 