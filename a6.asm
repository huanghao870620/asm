 .386
 .model flat, stdcall
 option casemap: none
 
 
 .data
 strFileName byte "D:\2.txt",0
 strOpenFailed byte "the file open failed", 0
 strOpenFailedSize word $-strOpenFailed
 FileHandle word ?
 FileHi word ?
 FileLo word ?
 strBufferSize word ?
 strBuffer word ?
 
 
 .code
 
 
 
 main proc
;  lea ax, .data
  mov ds, ax
  
  ;mov ax, 716ch
  ;mov bx, 0
  ;mov dx, 1
  ;mov si, offset strFileName
  int 21h
  ;jc OpenFailed
  ;mov FileHandle, ax
  ;mov ah, 42h
  ;mov bx, FileHandle
  ;mov al,0
  ;mov cx,0
 ; mov dx,0
  int 21h
  
  ret
 main endp
 
 end main