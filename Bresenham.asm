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
    call writeFile ;Llama a la función que escribe el archivo
    inc r10 ;Incrementa la posición en y
    cmp r10, r12 ;Si r10 es menor que r12
    jl Vertical ;Retorna al ciclo
    ret
    
Diagonal:
    call writeFile ;Llama a la función que escribe el archivo
    dec r10 ;Decrementa la posición inicial en y para dibujar la diagonal
    inc r8 ;Incrementa la posición en x
    cmp r12, r10 ;Si r12 es menor que r10
    jle Diagonal ;Retorna al ciclo
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
    mov r13, r10
    mov r12, 0x0
    imul r9, 0x2 ;Se duplica el radio, 2r
    neg r9 ;Se convierte el valor de r en un negativo, -2r
    add r9, 0x3 ;Se obtiene la d, d = 3 - 2r
    call drawCircle ;Llama a la función para escribir el círculo
    cmp r13, r12 ;Cumple el condicional del ciclo, x <= y
    jge circleLoop ;Salta al ciclo del círculo
    ret
    
    circleLoop: ;Ciclo for
        inc r12 ;x++
        cmp r9, 0x0 ;Revisa la condición de incremento, 0 < d  
        jle incrementD ;Salta el procedimiento de la condición
        mov r11, r12 ;Guarda el valor de x para operarlo
        sub r11, r13 ;x = x - y
        imul r11, 0x4 ;x - y = 4(x - y)
        add r9, r11 ;d = d + 4(x - y)
        add r9, 0x10 ;d = d + 4(x- y) + 10
        dec r13 ;y--
        call drawCircle
        cmp r13, r12 ;Cumple el condicional del ciclo, x <= y
        jge circleLoop ;Salta al ciclo del círculo
        ret
        
    incrementD:
        mov r11, r12 ;Guarda el valor de x para operarlo
        imul r11, 0x4 ;x = 4x
        add r9, r11 ;d = d + 4x
        add r9, 0x10 ;d = d + 4x + 10
        call drawCircle
        cmp r13, r12 ;Cumple el condicional del ciclo, x <= y
        jge circleLoop ;Salta al ciclo del círculo
        ret
        
    drawCircle:
        add r8, r12 ;x = x + xc
        add r10, r13 ;y = y + yc
        call writeFile
        sub r8, r12 ;x = x - xc
        sub r8, r12 ;x = x - xc
        call writeFile
        add r8, r12 ;x = x + xc
        add r8, r12 ;x = x + xc
        sub r10, r13 ;y = y - yc
        sub r10, r13 ;y = y - yc
        call writeFile
        sub r8, r12 ;x = x - xc
        sub r8, r12 ;x = x - xc
        call writeFile
        add r8, r12 ;x = xc + x
        add r8, r13 ;x = xc + y
        add r10, r13 ;y = y + yc
        add r10, r12 ;y = x + yc
        call writeFile
        sub r8, r12 ;x = xc - y
        sub r8, r12 ;x = xc - y
        call writeFile
        
        
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
        
        
    
    
