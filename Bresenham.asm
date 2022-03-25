%include "io.inc"

;section .text
;global CMAIN
;CMAIN:
;    mov r12, y2 ;r12 = y2
;    mov r13, x2 ;r13 = x2
;    mov r8, x1 ;Guardar el valor de x2
;    mov r10, y1 ;Guardar el valor de y1
;    jmp Bresenham ;Salta al algoritmo de Bresenham

Vertical:
    inc r10
    cmp r12, r10
    jle Vertical
    jmp EndAlgo

Bresenham:
    cmp r13, r8 ;Compare el valor de x2 y x1
    je Vertical ;Si es menor salta al algoritmo Vertical
    sub r12, y1 ;r12 = y2 - y1
    imul r12, 2h ;r12 = m = 2(y2 - y1)
    mov r11, r12 ;Guarda el m
    sub r13, x1 ;r13 = x2 - x1
    sub r12, r13 ;r12 = r12 - (x2 - x1) = m - (x2 - x1) = slope error
    mov r9, x2 ;Guardar el valor de x1
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
        add r12, r11 ;Se actualiza el slope error, slope error + m
        cmp r12, 0h
        jge increment
        inc r8
        cmp r8, r9 ;Comparar para ejecutar el for, x1 <= x2
        jle forLoop
        ret
        
    increment:
        inc r10 ;Se incrementa la y, y++
        imul r13, 2h ;r11 = 2(x2 - x1)
        sub r12, r13 ;Se actualiza el slope error, slope error - 2(x2 - x1)
        jmp forLoop

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
        
        
    
    