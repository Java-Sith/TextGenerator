%include "io.inc"
%include '/home/zuckerberg/functions.asm'

section .data
filename db '/home/zuckerberg/readme.txt', 0h    ; the filename to create
;msg db '29ak49'

section .bss
fileContents resb 255,

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov     ecx, 0              ; flag for readonly access mode (O_RDONLY)
    mov     ebx, filename       ; filename we created above
    mov     eax, 5              ; invoke SYS_OPEN (kernel opcode 5)
    int     80h                 ; call the kernel
    mov     edx, 8             ; number of bytes to read - one for each letter of the file contents
    mov     ecx, fileContents   ; move the memory address of our file contents variable into ecx
    mov     ebx, eax            ; move the opened file descriptor into EBX
    mov     eax, 3              ; invoke SYS_READ (kernel opcode 3)
    int     80h                 ; call the kernel
    mov     eax, fileContents   ; move the memory address of our file contents variable into eax for printing
    ;call    sprintLF            
    ;call    quit     

splitString:
    mov esi, fileContents
    ;add ecx, 1
    mov edi, edx
    .loop:
    mov ecx, esi
    call print32Char
    mov cl, byte [esi]
    inc esi
    dec edi
    cmp edi, 0
    jne .loop
    call quit

print32Char:
    mov edx, 1              ; PRINT
    mov ebx, 1              ;
    mov eax, 4              ;
    int 80h                 ;
    ret

;halt:
;    mov eax, 1              ; EXIT
;    int 80h                 ;
;    jmp halt
