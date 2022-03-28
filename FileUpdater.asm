;%include "io64.inc"
;
;SECTION .data
;filename2 db '/home/zuckerberg/Escritorio/Github/TextGenerator/1file.bin', 0h    ; the filename to create
;contents  db '0', 0h     ; the contents to write at the start of the file
;
;section .bss
;fileContents resb 255,
; 
;SECTION .text
;global  CMAIN
;
;CMAIN:
;    mov rbp, rsp; for correct debugging
;    call writeFile

;Lección 27
writeFile:
    mov rcx, 1              ; flag for writeonly access mode (O_WRONLY)
    mov rbx, filename2      ; filename of the file to open
    mov rax, 5              ; invoke SYS_OPEN (kernel opcode 5)
    int 80h                 ; call the kernel
    mov rsi, r10
    imul rsi, 250
    add rsi, r8
    mov rdx, 1
    mov rcx, rsi
    mov rbx, rax
    mov rax, 19
    int 80h
    mov rdx, 1
    mov rcx, contents
    mov rbx, rbx
    mov rax, 4
    int 80h
    mov rbx, rbx            ; El descriptor del archivo se utiliza
    mov rax, 6              ; Cierra el archivo
    int 80h                 ; Llama el kernel 
    ret
;    call quit                ; call our quit function
;
;quit:
;    mov     ebx, 0
;    mov     eax, 1
;    int     80h
;    ret