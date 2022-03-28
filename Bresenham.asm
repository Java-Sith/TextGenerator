;%include "io.inc"
%include "/home/zuckerberg/Escritorio/Github/TextGenerator/FileUpdater.asm"

;section .text
;global CMAIN
;CMAIN:
;    mov r12, y2 ;r12 = y2
;    mov r13, x2 ;r13 = x2
;    mov r8, x1 ;Guardar el valor de x2
;    mov r10, y1 ;Guardar el valor de y1
;    jmp Bresenham ;Salta al algoritmo de Bresenham

Vertical:
    call writeFile
    inc r10
    cmp r10, r12 ;Si r10 es menor que r12
    jl Vertical
    ret
    
Diagonal:
    call writeFile
    dec r10
    inc r8
    cmp r12, r10
    jle Diagonal
    ret

Bresenham:
    cmp r13, r8 ;Compare el valor de x2 y x1
    je Vertical ;Si es igual salta al algoritmo Vertical
    cmp r10, r12 ;Compare el valor de y2 y y1
    jg Diagonal ;Si es mayor salta al algoritmo Diagonal
    sub r12, r10 ;r12 = y2 - y1
    imul r12, 2h ;r12 = m = 2(y2 - y1)
    mov r11, r12 ;Guarda el m
    mov r9, r13 ;Guardar el valor de x2
    sub r13, r8 ;r13 = x2 - x1
    sub r12, r13 ;r12 = r12 - (x2 - x1) = m - (x2 - x1) = slope error
    cmp r8, r9 ;Comparar para ejecutar el for, x1 <= x2
    jle forLoop
    ret
    
    forLoop:
;        mov [diffX], r8
;        mov rdx, 5
;        mov rcx, diffX
;        mov rbx, rax
;        mov rax, 4
;        int 80h
;        mov [diffY], r10
;        mov rdx, 5
;        mov rcx, diffY
;        mov rbx, rax
;        mov rax, 4
;        int 80h
        call writeFile
        add r12, r11 ;Se actualiza el slope error, slope error + m
        cmp r12, 0h
        jl increment
        inc r10 ;Se incrementa la y, y++
        imul r13, 2h ;r13 = 2(x2 - x1)
        sub r12, r13 ;Se actualiza el slope error, slope error - 2(x2 - x1)
        jmp increment
        
    increment:
        inc r8
        cmp r8, r9 ;Comparar para ejecutar el for, x1 <= x2
        jle forLoop
        ret

BresenhamCircle:
    imul r10, 0x2
    mov r11, 0x3
    sub r11, r10
    
;EndAlgo:
;    mov     rbx, rbx            ; El descriptor del archivo se utiliza
;    mov     rax, 6              ; Cierra el archivo
;    int     80h                 ; Llama el kernel
;    call quit
;
;quit:
;    mov     rbx, 0
;    mov     rax, 1
;    int     80h
;    ret
        
        
    
    
