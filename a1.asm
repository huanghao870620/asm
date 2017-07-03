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
szCaption db  '恭喜', 0
szText  db  '当您看到这个信息的时候，您已经可以编译Win32汇编程序了!', 0
szMsg  db  'yes',0
szFormat db  'ISR messageID %d %s (serviced=0x%2x)', 0


.code


main proc
    push ebp
    mov ebp, esp
    mov ecx, 0
    mov edx, 1
    push offset szFormat 
    push ecx
    push offset szMsg
    push edx
    call myPrint
    add esp, 10h
    pop ebp
    ret
main endp

myPrint proc
  push ebp
  mov ebp, esp
  mov eax, dword ptr [ebp+08h]
  push eax
  mov ebx, dword ptr [ebp+0ch]
  push ebx
  mov ecx, dword ptr [ebp+10h]
  push ecx
  mov edx, dword ptr [ebp+14h]
  push edx
  call printf
  add esp, 10h
  pop ebp
  ret
myPrint endp


end main
