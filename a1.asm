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
szCaption db  '��ϲ', 0
szText  db  '�������������Ϣ��ʱ�����Ѿ����Ա���Win32��������!', 0
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
