%include "io64.inc"

section .data
filename db '/home/zuckerberg/Enemy.txt', 0h    ; El archivo para leer
len equ 483 ; Cantidad de bytes en el archivo creado

section .bss
fileContents resb 255,

section .text
global CMAIN
CMAIN:
    mov rcx, 0              ; Entra en modo de lectura del archivo
    mov rbx, filename       ; Nombre del archivo creado
    mov rax, 5              ; Abre el archivo con la OP (kernel opcode 5)
    int 80h                 ; Llama al Kernel
    mov rdx, len            ; Número de bytes por leer
    mov rcx, fileContents   ; Mueve el contenido del archivo al registro ECX
    mov rbx, rax            ; Mueve el descriptor del archivo al registro EBX
    mov rax, 3              ; Lee el archivo con la OP (kernel opcode 3)
    int 80h                 ; Llama al Kernel
    mov rsi, fileContents
    mov rdi, rdx
    mov r14, 0x0
    mov r15, 0x0

FirstLoop:
    mov rcx, rsi
    mov cl, byte [rsi]
    call comparator
    inc rsi
    add r14, 0x7
    cmp r14, 246
    add r15, 0x7
    dec rdi
    cmp rdi, 0
    jge FirstLoop
    call quit

comparator:
    cmp cl, 'A'
    jmp letterA
    cmp cl, 'B'
    jmp letterB
    cmp cl, 'C'
    jmp letterC
    cmp cl, 'D'
    jmp letterD
    cmp cl, 'E'
    jmp letterE
    cmp cl, 'F'
    jmp letterF
    cmp cl, 'G'
    jmp letterG
    cmp cl, 'H'
    jmp letterH
    cmp cl, 'I'
    jmp letterI
    cmp cl, 'J'
    jmp letterJ
    cmp cl, 'K'
    jmp letterK
    cmp cl, 'L'
    jmp letterL
    cmp cl, 'M'
    jmp letterM
    cmp cl, 'N'
    jmp letterN
    cmp cl, 'O'
    jmp letterO
    cmp cl, 'P'
    jmp letterP
    cmp cl, 'Q'
    jmp letterQ
    cmp cl, 'R'
    jmp letterR
    cmp cl, 'S'
    jmp letterS
    cmp cl, 'T'
    jmp letterT
    cmp cl, 'U'
    jmp letterU
    cmp cl, 'V'
    jmp letterV
    cmp cl, 'W'
    jmp letterW
    cmp cl, 'X'
    jmp letterX
    cmp cl, 'Y'
    jmp letterY
    cmp cl, 'Z'
    jmp letterZ
    cmp cl, "'"
    jmp letterAp
    cmp cl, ','
    jmp letterColon
    ret

letterA:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, [r15 + 2]
    mov r10, [r15 + 2]
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, [r14 + 5]
    mov r10, r15
    mov r12, [r15 + 5]
    call Bresenham
    ret   
    
letterB:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, [r15 + 2]
    mov r10, [r15 + 2]
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, [r14 + 5]
    mov r10, r15
    mov r12, [r15 + 5]
    call Bresenham
    mov r8, r14
    mov r10, [r15 + 5]
    mov r13, [r14 + 5] 
    call Bresenham
    ret
    
letterC:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r10, [r15 + 5]
    mov r13, [r14 + 5] 
    call Bresenham
    ret  
    
letterD:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, [r15 + 1]
    mov r10, r15
    call Bresenham
    mov r10, [r15 + 5]
    mov r13, [r14 + 5]
    mov r12, [r15 + 4] 
    call Bresenham
    mov r10, [r15 + 1]
    mov r13, [r14 + 5]
    mov r12, [r15 + 4] 
    call Bresenham
    ret  

letterE:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r10, [r15 + 5]
    mov r12, r10 
    call Bresenham
    mov r10, [r15 + 2]
    mov r12, r10
    ret 
    
letterF:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r10, [r15 + 2]
    mov r12, r10
    ret
    
letterG:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r10, [r15 + 5]
    mov r13, [r14 + 5] 
    call Bresenham
    mov r8, [r14 + 5]
    mov r13, r8
    mov r10, [r15 + 3]
    mov r12, [r15 + 5]
    call Bresenham
    ret 
    
letterH:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, [r15 + 2]
    mov r10, [r15 + 2]
    call Bresenham
    mov r8, [r14 + 5]
    mov r10, r15
    mov r12, [r15 + 5]
    call Bresenham
    ret  
    
letterI:
    mov r13, [r14 + 3]
    mov r12, [r15 + 5]
    mov r8, [r14 + 3]
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r10, [r15 + 5]
    mov r12, r10
    mov r13, [r14 + 5] 
    call Bresenham
    ret
    
letterJ:
    mov r13, r14
    mov r12, [r15 + 3]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r10, [r15 + 5]
    mov r12, r10
    mov r13, [r14 + 3] 
    call Bresenham
    ret 
    
letterK:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, [r15 + 3]
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, [r15 + 5]
    mov r10, [r15 + 3]
    call Bresenham 
    
letterL:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r10, [r15 + 5]
    mov r13, [r14 + 5] 
    call Bresenham
    ret  
    
letterM:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 3]
    mov r12, [r15 + 5]
    mov r8, r13
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, [r14 + 5]
    mov r10, r15
    mov r12, [r15 + 5]
    call Bresenham
    ret  
    
letterN:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, [r14 + 5]
    mov r10, r15
    mov r12, [r15 + 5]
    call Bresenham
    ret 
    
letterO:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r12, [r15 + 5]
    mov r10, r12
    mov r13, [r14 + 5] 
    call Bresenham
    mov r12, [r15 + 5]
    mov r8, r13
    mov r10, r15
    call Bresenham
    ret
    
letterP:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r12, [r15 + 5]
    mov r10, r12
    mov r13, [r14 + 5]  
    call Bresenham
    mov r12, [r15 + 3´]
    mov r8, r13
    mov r10, r15 
    call Bresenham
    ret

letterQ:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r12, [r15 + 5]
    mov r10, r12
    mov r13, [r14 + 5] 
    call Bresenham
    mov r12, [r15 + 5]
    mov r8, r13
    mov r10, r15
    call Bresenham
    mov r12, [r15 + 6]
    mov r10, [r15 + 4]
    mov r13, [r14 + 6]
    mov r8, [r14 + 4]
    call Bresenham
    ret  
    
letterR:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r12, [r15 + 5]
    mov r10, r12
    mov r13, [r14 + 5]  
    call Bresenham
    mov r12, [r15 + 3]
    mov r8, r13
    mov r10, r15 
    call Bresenham
    mov r10, [r15 + 3]
    mov r8, r14
    mov r12, [r15 + 5] 
    mov r13, [r14 + 5]
    call Bresenham
    ret  
    
letterS:
    mov r13, r14
    mov r12, [r15 + 3]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 5]
    mov r12, [r15 + 3]
    mov r10, r12
    call Bresenham
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, [r14 + 5]
    mov r10, [r15 + 3]
    mov r12, [r15 + 5]
    call Bresenham
    mov r12, [r15 + 5]
    mov r10, r12
    mov r13, [r14 + 5]
    mov r8, r14
    call Bresenham
    ret    

letterT:
    mov r13, [r14 + 3]
    mov r12, [r15 + 5]
    mov r8, [r14 + 3]
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    ret 

letterU:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r12, [r15 + 5]
    mov r10, r12
    mov r13, [r14 + 5] 
    call Bresenham
    mov r12, [r15 + 5]
    mov r8, r13
    mov r10, r15
    call Bresenham
    ret
    
letterW:
    mov r13, r14
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r12, [r15 + 5]
    mov r10, r12
    mov r13, [r14 + 5] 
    call Bresenham
    mov r12, [r15 + 5]
    mov r8, r13
    mov r10, r15
    call Bresenham
    mov r13, [r14 + 3]
    mov r8, r13
    ret
    
letterV:
    mov r13, [r14 + 3]
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, [r14 + 3]
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, [r15 + 5]
    call Bresenham
    ret
    
letterX:
    mov r13, [r14 + 5]
    mov r12, [r15 + 5]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, [r14 + 5]
    mov r13, r14
    call Bresenham
    ret
    
letterY:
    mov r13, [r14 + 3]
    mov r12, [r15 + 3]
    mov r8, r14
    mov r10, r15
    call Bresenham
    mov r8, [r14 + 3]
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, [r15 + 3]
    call Bresenham
    mov r13, r8
    mov r12, [r15 + 5]
    call Bresenham
    ret
    
letterZ:
    mov r8, r14
    mov r13, [r14 + 5]
    mov r12, r15
    mov r10, r15
    call Bresenham
    mov r8, r14
    mov r13, [r14 + 5]
    mov r12, [r15 + 5]
    mov r10, r12
    call Bresenham
    mov r8, [r14 + 5]
    mov r13, r14
    mov r12, r15
    mov r10, [r15 + 5]
    call Bresenham
    ret 
    
letterAp:
    mov r8, r14
    mov r13, r14
    mov r10, r15
    mov r12, [r15 + 1]
    call Bresenham 
    ret
    
letterColon:
    mov r8, [r14 + 5]
    mov r13, [r14 + 5]
    mov r10, [r15 + 5]
    mov r12, [r15 + 6]
    call Bresenham 
    ret 
            
quit:
    mov rbx, 0
    mov rax, 1
    int 80h
    ret