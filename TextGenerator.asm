;%include "io64.inc"
%include "/home/zuckerberg/Escritorio/Github/TextGenerator/Bresenham.asm"
%include "/home/zuckerberg/Escritorio/Github/TextGenerator/OnesFile.asm"

SECTION .data
filename1 db '/home/zuckerberg/Escritorio/Github/TextGenerator/Song.txt', 0h    ; El archivo para leer
filename2 db '/home/zuckerberg/Escritorio/Github/TextGenerator/Song.bin', 0h    ; El archivo para crear
contents  db '0', 0h ; El contenido que se le escribe al archivo
len equ 250 ; Cantidad de caracteres en una fila del archivo
endFile equ 667 ; Cantidad de bytes en el archivo creado
ones db '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', 0ah

section .bss
fileContents resb 255,
iden resb 1

section .text
global _start
_start:   
    call OnesFile
    mov rcx, 0              ; Entra en modo de lectura del archivo
    mov rbx, filename1      ; Nombre del archivo creado
    mov rax, 5              ; Abre el archivo con la OP (kernel opcode 5)
    int 80h                 ; Llama al Kernel
    mov rdx, endFile        ; Número de bytes por leer
    mov rcx, fileContents   ; Mueve el contenido del archivo al registro RCX
    mov rbx, rax            ; Mueve el descriptor del archivo al registro RBX
    mov rax, 3              ; Lee el archivo con la OP (kernel opcode 3)
    int 80h                 ; Llama al Kernel
    mov rsi, fileContents   ; Escribe el contenido del archivo en RSI
    mov rdi, 0x1            ; Inicializa un contador de caracteres ya escritos
    mov rax, 6              ; Cierra el archivo
    int 80h                 ; Llama al Kernel
    mov r14, 0x0            ; Cantidad de posiciones recorridas en las columnas
    mov r15, 0x0            ; Cantidad de posiciones recorridas en las columnas

FirstLoop:
    mov rcx, rsi    ; Mueve los contenidos del archivo
    mov cl, byte [rsi]  ; Extrae el caracter actual del archivo
    call comparator ; Llama a la función general de comparación
    mov rsi, fileContents ; Mueve los contenidos del archivo
    add rsi, rdi ; Actualiza el registro con la posición actual del caracter escrito
    add r14, 0x6 ; Mueve el contador de columnas a la siguiente palabra
    cmp r14, 245 ; Compara si llegó al final del archivo
    jge incY    ; Salta al incremento en Y
    inc rdi ; Incrementa el contador
    cmp rdi, endFile ; Lo compara con la cantidad de caracteres
    jl FirstLoop ; Si es menor, repite el ciclo
    call Signature ; Realiza la firma
    
incY:
    add r15, 0x6 ; Mueve el contador de filas a la siguiente palabra
    mov r14, 0x0 ; Reinicia el contador de columnas
    inc rdi ; Incrementa el contador
    jmp FirstLoop ; Repite el ciclo

comparator:
    cmp cl, 'A'
    je letterA
    cmp cl, 'B'
    je letterB
    cmp cl, 'C'
    je letterC
    cmp cl, 'D'
    je letterD
    cmp cl, 'E'
    je letterE
    cmp cl, 'F'
    je letterF
    cmp cl, 'G'
    je letterG
    cmp cl, 'H'
    je letterH
    cmp cl, 'I'
    je letterI
    cmp cl, 'J'
    je letterJ
    cmp cl, 'K'
    je letterK
    cmp cl, 'L'
    je letterL
    cmp cl, 'M'
    je letterM
    cmp cl, 'N'
    je letterN
    cmp cl, 'O'
    je letterO
    cmp cl, 'P'
    je letterP
    cmp cl, 'Q'
    je letterQ
    cmp cl, 'R'
    je letterR
    cmp cl, 'S'
    je letterS
    cmp cl, 'T'
    je letterT
    cmp cl, 'U'
    je letterU
    cmp cl, 'V'
    je letterV
    cmp cl, 'W'
    je letterW
    cmp cl, 'X'
    je letterX
    cmp cl, 'Y'
    je letterY
    cmp cl, 'Z'
    je letterZ
    cmp cl, "'"
    je letterAp
    cmp cl, ','
    je letterColon
    cmp cl, 20h
    je letterSpace
    ret

letterA:
    mov r13, r14
    mov r12, r15
    add r12, 0x5
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    mov r12, r15
    add r12, 0x2
    mov r10, r12
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    mov r10, r15
    mov r8, r14
    call Bresenham
    mov r8, r14
    add r8, 0x4
    mov r13, r8
    mov r12, r15
    add r12, 0x5
    mov r10, r15
    call Bresenham
    ret   
    
letterB:
    mov r13, r14
    mov r12, r15
    add r12, 0x4
    mov r8, r13
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    add r12, 0x2
    mov r10, r12
    mov r8, r14
    call Bresenham
    mov r13, r14
    add r13, 0x3
    mov r8, r14
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    add r8, 0x3
    mov r10, r15
    mov r12, r10
    add r12, 0x2
    mov r13, r8
    call Bresenham
    mov r8, r14
    add r8, 0x4
    mov r10, r15
    add r10, 0x2
    mov r12, r10
    add r12, 0x3
    mov r13, r8
    call Bresenham
    mov r8, r14
    mov r10, r15
    add r10, 0x4 
    mov r13, r14
    add r13, 0x4
    mov r12, r10
    call Bresenham
    ret
    
letterC:
    mov r13, r14
    mov r12, r15
    add r12, 0x4
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r10, r15
    add r10, 0x4 
    mov r13, r14
    add r13, 0x4
    mov r12, r10
    call Bresenham
    ret  
    
letterD:
    mov r13, r14
    mov r12, r15
    add r12, 0x4
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r13, r14
    add r13, 0x3
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r10, r15
    add r10, 0x4
    mov r13, r14
    add r13, 0x3
    mov r8, r14 
    mov r12, r10
    call Bresenham
    mov r10, r15
    add r10, 0x1
    mov r13, r14
    add r13, 0x4
    mov r8, r13
    mov r12, r15
    add r12, 0x4
    call Bresenham
    ret  

letterE:
    mov r13, r14
    mov r12, r15
    add r12, 0x4
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    mov r12, r15
    add r12, 0x4
    mov r10, r12
    call Bresenham
    mov r10, r15
    add r10, 0x2
    mov r12, r10
    mov r8, r14
    mov r13, r14
    add r13, 0x4
    call Bresenham
    ret 
    
letterF:
    mov r13, r14
    mov r12, r15
    add r12, 0x5
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r10, r15
    add r10, 0x2
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    mov r12, r10
    call Bresenham
    ret
    
letterG:
    mov r13, r14
    mov r12, r15
    add r12, 0x4
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r12, r15
    mov r10, r15
    add r10, 0x4
    mov r13, r14
    add r13, 0x4
    mov r12, r10
    call Bresenham
    mov r8, r14
    add r8, 0x4
    mov r13, r8
    mov r10, r15
    add r10, 0x2
    mov r12, r15
    add r12, 0x4
    call Bresenham
    mov r8, r14
    add r8, 0x2
    mov r13, r14
    add r13, 0x4
    mov r10, r15
    add r10, 0x2
    mov r12, r10
    call Bresenham
    ret 
    
letterH:
    mov r13, r14
    mov r12, r15
    add r12, 0x5
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    add r12, 0x2
    mov r10, r12
    mov r8, r14
    call Bresenham
    mov r8, r14
    add r8, 0x4
    mov r10, r15
    mov r12, r15
    add r12, 0x5
    mov r13, r8
    call Bresenham
    ret  
    
letterI:
    mov r13, r14
    add r13, 0x2
    mov r12, r15
    add r12, 0x4
    mov r8, r13
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r10, r15
    add r10, 0x4
    mov r12, r10 
    mov r13, r14
    add r13, 0x4
    call Bresenham
    ret
    
letterJ:
    mov r13, r14
    add r13, 0x2
    mov r12, r15
    add r12, 0x4
    mov r8, r13
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r10, r15
    add r10, 0x4
    mov r12, r10 
    mov r13, r14
    add r13, 0x2
    call Bresenham
    ret 
    
letterK:
    mov r13, r14
    mov r12, r15
    add r12, 0x5
    mov r8, r13
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x2
    mov r10, r15
    add r10, 0x2
    mov r12, r10
    mov r8, r14
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    add r8, 0x2
    mov r12, r15
    mov r10, r15
    add r10, 0x2
    call Bresenham
    mov r13, r14 ;r13 = x2, r14 = puntero X
    add r13, 0x4
    mov r8, r14 ;r8 = x1, r14 = puntero X
    add r8, 0x2
    mov r12, r15 ;r12 = y2, r15 = puntero Y
    add r12, 0x4
    mov r10, r15 ;r10 = y1, r15 = puntero Y
    add r10, 0x2
    call Bresenham 
    ret
    
letterL:
    mov r13, r14
    mov r12, r15
    add r12, 0x4
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r10, r15
    add r10, 0x4
    mov r13, r14
    add r13, 0x4
    mov r12, r10
    call Bresenham
    ret  
    
letterM:
    mov r13, r14
    mov r12, r15
    add r12, 0x5
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    add r12, 0x5
    mov r8, r13
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    add r8, 0x2
    mov r10, r15
    mov r12, r15
    add r12, 0x5
    mov r13, r8
    call Bresenham
    ret  
    
letterN:
    mov r13, r14
    mov r12, r15
    add r12, 0x5
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    add r12, 0x5
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, r14
    add r8, 0x4
    mov r10, r15
    mov r13, r8
    mov r12, r15
    add r12, 0x5
    call Bresenham
    ret 
    
letterO:
    mov r13, r14
    mov r12, r15
    add r12, 0x4
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r12, r15
    add r12, 0x4
    mov r10, r12 
    mov r13, r14
    add r13, 0x4
    call Bresenham
    mov r12, r15
    add r12, 0x4
    mov r13, r14
    add r13, 0x4
    mov r8, r13
    mov r10, r15
    call Bresenham
    ret
    
letterP:
    mov r13, r14
    mov r12, r15
    add r12, 0x5
    mov r8, r13
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    mov r12, r15
    mov r10, r12
    call Bresenham
    mov r8, r14
    mov r12, r15
    add r12, 0x2
    mov r10, r12
    mov r13, r14
    add r13, 0x4 
    call Bresenham
    mov r12, r15
    add r12, 0x2
    mov r13, r14
    add r13, 0x4
    mov r8, r13
    mov r10, r15 
    call Bresenham
    ret

letterQ:
    mov r13, r14
    mov r12, r15
    add r12, 0x4
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r12, r15
    add r12, 0x4
    mov r10, r12 
    mov r13, r14
    add r13, 0x4
    call Bresenham
    mov r12, r15
    add r12, 0x4
    mov r13, r14
    add r13, 0x4
    mov r8, r13
    mov r10, r15
    call Bresenham
    mov r12, r15
    add r12, 0x5
    mov r10, r15
    add r10, 0x3
    mov r13, r14
    add r13, 0x5
    mov r8, r14
    add r8, 0x3
    call Bresenham
    ret  
    
letterR:
    mov r13, r14
    mov r12, r15
    add r12, 0x5
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r12, r15
    add r12, 0x2
    mov r10, r12 
    mov r13, r14
    add r13, 0x4 
    call Bresenham
    mov r12, r15
    add r12, 0x2
    mov r13, r14
    add r13, 0x4
    mov r8, r13
    mov r10, r15 
    call Bresenham
    mov r10, r15
    add r10, 0x3
    mov r8, r14
    add r8, 0x3 
    mov r12, r15
    add r12, 0x4
    mov r13, r14
    add r13, 0x4
    call Bresenham
    ret  
    
letterS:
    mov r13, r14
    mov r12, r15
    add r12, 0x2
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    mov r12, r15
    add r12, 0x2
    mov r10, r12
    call Bresenham
    mov r12, r15
    mov r10, r15
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    call Bresenham
    mov r8, r14
    add r8, 0x4
    mov r10, r15
    add r10, 0x2
    mov r12, r15
    add r12, 0x4
    mov r13, r14
    add r13, 0x4
    call Bresenham
    mov r12, r15
    add r12, 0x4
    mov r10, r12
    mov r13, r14
    add r13, 0x4
    mov r8, r14
    call Bresenham
    ret    

letterT:
    mov r13, r14
    add r13, 0x2
    mov r12, r15
    add r12, 0x5
    mov r8, r14
    add r8, 0x2
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    mov r10, r15
    call Bresenham
    ret 

letterU:
    mov r13, r14
    mov r12, r15
    add r12, 0x4
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r12, r15
    add r12, 0x4
    mov r10, r12
    mov r13, r14
    add r13, 0x4
    call Bresenham
    mov r12, r15
    add r12, 0x4
    mov r13, r14
    add r13, 0x4
    mov r8, r13
    mov r10, r15
    call Bresenham
    ret
    
letterW:
    mov r13, r14
    mov r12, r15
    add r12, 0x4
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r12, r15
    add r12, 0x4
    mov r10, r12
    mov r13, r14
    add r13, 0x4
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    add r12, 0x4
    mov r8, r13
    mov r10, r15
    call Bresenham
    mov r13, r14
    add r13, 0x2
    mov r8, r13
    mov r10, r15
    mov r12, r15
    add r12, 0x4
    call Bresenham
    ret
    
letterV:
    mov r13, r14
    mov r8, r13
    mov r10, r15
    mov r12, r15
    add r12, 0x2
    call Bresenham
    mov r13, r14
    add r13, 0x4
    mov r8, r13
    mov r10, r15
    mov r12, r15
    add r12, 0x2
    call Bresenham
    mov r13, r14
    add r13, 0x1
    mov r8, r13
    mov r10, r15
    add r10, 0x2
    mov r12, r15
    add r12, 0x4
    call Bresenham
    mov r13, r14
    add r13, 0x3
    mov r8, r13
    mov r10, r15
    add r10, 0x2
    mov r12, r15
    add r12, 0x4
    call Bresenham
    mov r8, r14
    add r8, 0x1
    mov r13, r14
    add r13, 0x2 
    mov r10, r15
    add r10, 0x3
    mov r12, r15
    add r12, 0x4
    call Bresenham
    ret
    
letterX:
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    add r12, 0x4
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    mov r10, r15
    add r10, 0x4
    call Bresenham
    ret
    
letterY:
    mov r13, r14
    add r13, 0x2
    mov r12, r15
    add r12, 0x2
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, r14
    add r8, 0x2
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    mov r10, r15
    add r10, 0x2
    call Bresenham
    mov r10, r15
    add r10, 0x2
    mov r8, r14
    add r8, 0x2
    mov r13, r8
    mov r12, r15
    add r12, 0x5
    call Bresenham
    ret
    
letterZ:
    mov r8, r14
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    add r12, 0x4
    mov r10, r12
    call Bresenham
    mov r8, r14
    mov r13, r14
    add r13, 0x4
    mov r12, r15
    mov r10, r15
    add r10, 0x4
    call Bresenham
    ret 
    
letterAp:
    mov r8, r14
    mov r13, r14
    mov r10, r15
    mov r12, r15
    add r12, 0x1
    call Bresenham 
    ret
    
letterColon:
    mov r8, r14
    mov r13, r14
    add r13, 0x1
    mov r10, r15
    add r10, 0x5
    mov r12, r15
    add r12, 0x4
    call Bresenham 
    ret 
    
letterSpace:
;    mov r9, 0x6
;    mov r8, rdi
;    inc r8
;    jmp counter
    add r14, 0x0
    add r15, 0x0
    ret
    
;counter:
;    mov r10, fileContents
;    add r10, r8
;    mov bl, byte[r10]
;    add r14, r8
;    cmp r14, endFile
;    jge Signature
;    sub r14, r8
;    cmp bl, 20h
;    je verEndLine
;    add r9, 0x6
;    inc r8
;    jmp counter
;    
;verEndLine:
;    mov r11, r14
;    add r11, r9
;    cmp r11, 250
;    jge endLine
;    ret
;    
;endLine:
;    mov r14, 0x0
;    sub r14, 0x6
;    add r15, 0x6
;    jmp FirstLoop

;Vertical:
;    call writeFile
;    inc r10
;    cmp r10, r12 ;Si r10 es menor que r12
;    jl Vertical
;    ret
;    
;Diagonal:
;    call writeFile
;    dec r10
;    inc r8
;    cmp r12, r10
;    jle Diagonal
;    ret
;
;Bresenham:
;    cmp r13, r8 ;Compare el valor de x2 y x1
;    je Vertical ;Si es igual salta al algoritmo Vertical
;    cmp r10, r12 ;Compare el valor de y2 y y1
;    jg Diagonal ;Si es mayor salta al algoritmo Diagonal
;    sub r12, r10 ;r12 = y2 - y1
;    imul r12, 2h ;r12 = m = 2(y2 - y1)
;    mov r11, r12 ;Guarda el m
;    mov r9, r13 ;Guardar el valor de x2
;    sub r13, r8 ;r13 = x2 - x1
;    sub r12, r13 ;r12 = r12 - (x2 - x1) = m - (x2 - x1) = slope error
;    cmp r8, r9 ;Comparar para ejecutar el for, x1 <= x2
;    jle forLoop
;    ret
;    
;    forLoop:
;;        mov [diffX], r8
;;        mov rdx, 5
;;        mov rcx, diffX
;;        mov rbx, rax
;;        mov rax, 4
;;        int 80h
;;        mov [diffY], r10
;;        mov rdx, 5
;;        mov rcx, diffY
;;        mov rbx, rax
;;        mov rax, 4
;;        int 80h
;        call writeFile
;        add r12, r11 ;Se actualiza el slope error, slope error + m
;        cmp r12, 0h
;        jl increment
;        inc r10 ;Se incrementa la y, y++
;        imul r13, 2h ;r13 = 2(x2 - x1)
;        sub r12, r13 ;Se actualiza el slope error, slope error - 2(x2 - x1)
;        jmp increment
;        
;    increment:
;        inc r8
;        cmp r8, r9 ;Comparar para ejecutar el for, x1 <= x2
;        jle forLoop
;        ret
;
;writeFile:
;    mov rcx, 1              ; flag for writeonly access mode (O_WRONLY)
;    mov rbx, filename2      ; filename of the file to open
;    mov rax, 5              ; invoke SYS_OPEN (kernel opcode 5)
;    int 80h                 ; call the kernel
;    mov rsi, r10
;    imul rsi, 250
;    add rsi, r8
;    mov rdx, 1
;    mov rcx, rsi
;    mov rbx, rax
;    mov rax, 19
;    int 80h
;    mov rdx, 1
;    mov rcx, contents
;    mov rbx, rbx
;    mov rax, 4
;    int 80h
;    mov rbx, rbx            ; El descriptor del archivo se utiliza
;    mov rax, 6              ; Cierra el archivo
;    int 80h                 ; Llama el kernel 
;    ret
;       
;OnesFile:
;    mov rcx, 0777o          ; Crea el archivo a escribir
;    mov rbx, filename2      ; Nombre del archivo por crear
;    mov rax, 8              ; Crea el archivo con la OP (kernel opcode 8)
;    int 80h                 ; Llama al Kernel
;    mov r12, 0x0            ; Declara un contador
;    mov [iden], rax
;    call OneLoop   
;            
;OneLoop:
;    mov rdx, len
;    mov rbx, [iden]
;    mov rcx, ones
;    mov rax, 4
;    int 80h
;    inc r12
;    cmp r12, rdx
;    jle OneLoop
;    jmp OneDone
;    
;OneDone:
;    mov rbx, rbx
;    mov rax, 6
;    int 80h
;    ret

Signature:
    mov r13, 230
    mov r12, 230
    add r12, 0x4
    mov r8, 230
    mov r10, 230
    call Bresenham
    mov r8, 230
    mov r10, 230
    add r10, 0x4
    mov r13, 230
    add r13, 0x4
    mov r12, r10
    call Bresenham
    mov r13, 232
    mov r12, 232
    add r12, 0x2
    mov r8, 232
    mov r10, 232
    call Bresenham
    mov r8, 232
    mov r13, 232
    add r13, 0x2
    mov r12, 232
    mov r10, 232
    call Bresenham
    mov r10, 232
    add r10, 0x2
    mov r13, 232
    add r13, 0x2
    mov r8, 232 
    mov r12, r10
    call Bresenham
    mov r10, 232
    mov r13, 232
    add r13, 0x2
    mov r8, 232
    mov r12, 232
    add r12, 0x1
    call Bresenham
             
quit:
    mov rbx, 0
    mov rax, 1
    int 80h
    ret
