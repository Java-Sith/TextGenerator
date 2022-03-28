;%include "io64.inc"
;
;SECTION .data
;;filename1 db '/home/zuckerberg/Escritorio/Github/TextGenerator/Enemy.txt', 0h    ; El archivo para leer
;filename2 db '/home/zuckerberg/Escritorio/Github/TextGenerator/1file.bin', 0h    ; the filename to create
;;contents  db '0', 0h ; the contents to write at the start of the file
;endFile equ 250 ;Cantidad de caracteres en una fila del archivo
;;len1 equ 483 ; Cantidad de bytes en el archivo creado
;ones db '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', 0ah
;len2 equ  $-ones
;
;section .bss
;;fileContents resb 255,
;descriptor resb 1
;
;section .text
;global CMAIN
;CMAIN:
;    ;write your code here
;    call OnesFile

OnesFile:
    mov rcx, 0777o          ; Crea el archivo a escribir
    mov rbx, filename2      ; Nombre del archivo por crear
    mov rax, 8              ; Crea el archivo con la OP (kernel opcode 8)
    int 80h                 ; Llama al Kernel
    mov r9, 0
    mov [descriptor], rax
    call OneLoop   
            
OneLoop:
    mov rdx, len2
    mov rbx, [descriptor]
    mov rcx, ones
    mov rax, 4
    int 80h
    inc r9
    cmp r9, endFile
    jle OneLoop
    jmp OneDone
    
OneDone:
    mov rbx, [descriptor]
    mov rax, 6
    int 80h
    ret
    
;quit:
;    mov rbx, 0
;    mov rax, 1
;    int 80h
;    ret