include masm32rt.inc

.data
fileop SHFILEOPSTRUCT<>
Dir db "c:\Users\Alex\AppData\Local\Temp", 0

.code


start:
 mov fileop.wFunc, FO_DELETE
 mov fileop.pFrom, offset Dir
 mov fileop.fFlags, FOF_NOCONFIRMATION
 invoke SHFileOperation, addr fileop
 invoke ExitProcess,0

end start