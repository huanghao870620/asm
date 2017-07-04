.386
.model flat, stdcall
option casemap: none
include windows.inc
include kernel32.inc
include masm32.inc
include user32.inc
include msvcrt.inc

includelib kernel32.lib
includelib masm32.lib
includelib user32.lib
includelib msvcrt.lib

.data
  Password byte '1234567',0
  PasswordLength byte $ - Password
  Welcome byte 'Please input password', 0Ah, 0Dh, 0
  format byte '%s', 0
  OK  byte 'OK!', 0
  WRONG byte 'No!',0


.code


main proc
  local @valid_flag : dword
  local @buffer[1024] : byte
  local @authenticated : dword
  local @small_buffer[8] : byte
  
  mov @valid_flag, 0
  
   .while 1
     push offset Welcome
	 call crt_printf
	 add esp, 4
	 
	 lea eax, @buffer
	 push eax
	 push offset format
	 call crt_scanf
	 add esp, 8
	 jmp check
	 
	 
	 begin:
	   .if eax == 0
	     push offset OK
		 call crt_printf
		 add esp, 4
		 jmp exit
	   .else
	     push offset WRONG
		 call crt_printf
		 add esp,4
	   .endif
	 
   .endw
   
   check:
     lea eax, @buffer
	 push eax
	 push offset Password
	 call crt_strcmp
	 add esp,8
	 jmp begin
   
   exit:
      invoke ExitProcess, 0

 
main endp 

end main
