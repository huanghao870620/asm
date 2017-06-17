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
  mov hInstance, eax
  invoke GetCommandLine
  mov CommandLine, eax
  invoke WinMain, hInstance, NULL, CommandLine, SW_SHOWDEFAULT
  invoke ExitProcess, eax


WinMain proc hInst:HINSTANCE, hPrevInst:HINSTANCE, CmdLine:LPSTR, CmdShow:DWORD
 LOCAL wc:WNDCLASSEX
 LOCAL msg:MSG
 LOCAL hwnd:HWND
 mov wc.cbSize, SIZEOF WNDCLASSEX
 mov wc.style, CS_HREDRAW or CS_VREDRAW
 mov wc.lpfnWndProc, OFFSET WndProc
 mov wc.cbClsExtra, NULL
 mov wc.cbWndExtra, NULL
 push hInst
 pop wc.hInstance
 mov wc.hbrBackground, COLOR_WINDOW+1
 mov wc.lpszMenuName, NULL
 mov wc.lpszClassName, OFFSET ClassName
 invoke LoadIcon,  NULL, IDI_APPLICATION
 mov wc.hIcon, eax
 mov wc.hIconSm, eax
 invoke LoadCursor, NULL, IDC_ARROW
 mov wc.hCursor, eax
 invoke RegisterClassEx, addr wc
 invoke CreateWindowEx, NULL, ADDR ClassName, addr AppName, \
   WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, \
   CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, NULL, NULL, \
   hInst, NULL

 mov hwnd, eax
 invoke ShowWindow, hwnd, SW_SHOWNORMAL
 invoke UpdateWindow, hwnd

  .WHILE TRUE
     invoke GetMessage, addr msg, NULL, 0, 0
     .break .if (!eax)
     invoke TranslateMessage, addr msg
     invoke DispatchMessage, addr msg
  .ENDW
  mov eax, msg.wParam
  ret

WinMain endp

WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
   LOCAL hdc:HDC
   LOCAL ps:PAINTSTRUCT
   LOCAL rect:RECT

    .IF uMsg==WM_DESTROY
       invoke PostQuitMessage, NULL
    .ELSEIF uMsg==WM_PAINT
        invoke BeginPaint, hWnd, ADDR ps
        mov hdc, eax
        invoke GetClientRect, hWnd, ADDR rect
        invoke DrawText, hdc, ADDR OurText, -1, ADDR rect, \
           DT_SINGLELINE or DT_CENTER or DT_VCENTER
        invoke EndPaint, hWnd, ADDR ps
    .ELSE
       invoke DefWindowProc, hWnd, uMsg, wParam, lParam
       ret
    .ENDIF
   xor eax, eax
   ret


WndProc endp

end start

