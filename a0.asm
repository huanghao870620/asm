.386
.model flat, stdcall
option casemap:none


WinMain proto :DWORD, :DWORD, :DWORD, :DWORD


include windows.inc  
include kernel32.inc  
include user32.inc  
include gdi32.inc
  
includelib kernel32.lib  
includelib user32.lib  
includelib gdi32.lib


.data
ClassName db "SimpleWinClass",0
AppName db "Our First Window", 0
OurText db "Win32 assembly is great and easy!",0


.data?
hInstance HINSTANCE ?
CommandLine LPSTR ?


.code
start:
  invoke GetModuleHandle, NULL



WinMain proc hInst:HINSTANCE, hPrevInst:HINSTANCE, CmdLine:LPSTR, CmdShow:DWORD

WinMain endp

WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM

WndProc endp

end start

