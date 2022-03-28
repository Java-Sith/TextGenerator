;%include "io64.inc"
;
;SECTION .data
;filename db '/home/zuckerberg/Escritorio/Github/TextGenerator/Song.bin', 0h    ; the filename to create
;endFile equ 250 ;Cantidad de caracteres en una fila del archivo
;ones db '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', 0ah
;len equ  $-ones
;
;section .text
;global CMAIN
;CMAIN:
;    mov rbp, rsp; for correct debugging
;    ;write your code here
;    call OnesFile

OnesFile:
    mov rcx, 0777o          ; Crea el archivo a escribir
    mov rbx, filename2      ; Nombre del archivo por crear
    mov rax, 8              ; Crea el archivo con la OP (kernel opcode 8)
    int 80h                 ; Llama al Kernel
    mov r12, 0x0            ; Declara un contador
    mov [iden], rax
    call OneLoop   
            
OneLoop:
    mov rdx, len
    mov rbx, [iden] ;rax ;valor
    mov rcx, ones
    mov rax, 4
    int 80h ; Llama al Kernel
    inc r12
    cmp r12, rdx
    jle OneLoop
    jmp OneDone
    
OneDone:
    mov rbx, rbx
    mov rax, 6
    int 80h
    ret
    
;quit:
;    mov rbx, 0
;    mov rax, 1
;    int 80h
;    ret