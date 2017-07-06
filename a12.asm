.386
.model flat, stdcall
option casemap :none


include windows.inc  
include user32.inc  
include kernel32.inc  
include ole32.inc  
include shell32.inc  


includelib user32.lib  
includelib kernel32.lib  
includelib ole32.lib  
includelib shell32.lib


IDC_NOWFILE  equ  40000


.data
 hInstance dd ?
 hWinMain dd ?
 
 dwFileSizeHigh dd ?
 dwFileSizeLow dd ?
 dwFileCount dd ?
 dwFolderCount dd ? 
 
 ;szPath db MAX_PATH dup (?)
 dwOption db ?
 ;F_SEARCHING equ0001h
 F_STOP equ 0002h


.code


_ProcDlgMain proc uses edi esi hWnd, wMsg, wParam, lParam 
 local @dwTemp, @szBuffer[MAX_PATH]:byte

 mov eax, wMsg
  .if eax == WM_CLOSE
 ;  .if ! (dwOption & F_SEARCHING)
 ;   mov eax,1
 ;  .endif
  .endif

_ProcDlgMain endp


main proc
 invoke GetModuleHandle, NULL
 mov hInstance, eax
; invoke DialogBoxParam, hInstance, IDD_DIALOG, NULL, offset _ProcDlgMain, NULL
 ret;
main endp


_ProcessFile proc _lpszFile
 local @hFile
 inc dwFileCount
 invoke SetDlgItemText, hWinMain, IDC_NOWFILE, _lpszFile
_ProcessFile endp

end main


