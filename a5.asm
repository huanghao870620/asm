 .386
 .model flat, stdcall
 option casemap: none
 
 include windows.inc
 include kernel32.inc
 include user32.inc
 include masm32.inc
 include debug.inc
 
 includelib kernel32.lib
 includelib user32.lib
 includelib masm32.lib
 includelib debug.lib
 
 .data
  val db 2,1,5,7,3,6,4
 
 .code
 start:
  ; mov al, val[0]
;   PrintDec eax
 ;  mov al, val[4]
 ;  PrintDec eax
 ;  mov al, val[8]
 ;  PrintDec eax


 ;mov ecx,3
 ;lea eax, val
 ;add eax,4

 ;lea eax, val 
 ;nop
 ;nop
 ;nop
 ;PrintDec al
 ;PrintDec ah
 ;mov eax,[eax+4]
 
 ;s:
; invoke StdOut, val
 ;loop s


 lea eax, val
; mov esi,0
; mov edi,0
; mov si,0
; mov di,0

; ds:si ==>  es:di   rep movsb   movsw
; rep movsb
; rep movsw
 
 ;mov eax,[eax]
 mov esi,0
 mov ecx,6

s: 
 mov bl, byte ptr [eax+esi]
 PrintDec bl
 inc esi
 sub ecx,1
 cmp ecx,0
 jnz s

 ;mov bl, byte ptr [eax+esi]
 ;PrintDec bl
 ;inc esi
 ;mov bl, byte ptr [eax+2]
 ;PrintDec bl
 ;mov bl, byte ptr [eax+3]

   ret
 
 end start