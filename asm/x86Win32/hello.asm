; This program displays "Hello, World!" in a windows messagebox and then quits.
;
; Written by Stewart Moss - May 2006
;
; Assemble using TASM 5.0 and TLINK32
;
; The output EXE is standard 4096 bytes long.
; It is possible to produce really small windows PE exe files, but that
; is outside of the scope of this demo.
 
         .486p
         .model  flat,STDCALL
include  win32.inc
 
extrn            MessageBoxA:PROC
extrn            ExitProcess:PROC
 
.data
 
HelloWorld db "Hello, world!",0
msgTitle db "Hello world program",0
 
.code
Start:
         push    MB_ICONQUESTION + MB_APPLMODAL + MB_OK
         push    offset msgTitle
         push    offset HelloWorld
         push    0
         call    MessageBoxA
 
         push 0
         call ExitProcess
ends
end Start