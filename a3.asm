include masm32rt.inc

include msvcrt.inc

includelib msvcrt.lib

.data
fileop SHFILEOPSTRUCT<>
Dir db "c:\Users\Alex\AppData\Local\Temp", 0

format byte '%s', 0


.code


a0 proc

 local @buffer[1024] : byte
 

 lea eax, @buffer
 push eax
 push offset format
 call crt_scanf

 

 lea eax, @buffer
 mov fileop.wFunc, FO_DELETE
 mov fileop.pFrom, eax
 mov fileop.fFlags, FOF_NOCONFIRMATION
 invoke SHFileOperation, addr fileop
 invoke ExitProcess,0
 

a0 endp


start:
  call a0

end start