section .data
    EXIT_SUCCESS equ 0 ; successful operation
    SYS_exit equ 60 ; call code for terminate
    list dd 2, 1, 3, 4, 6, 5
    listSize dd 6
    sumTot dd 0
    currNum dd 0
    max dd 0
    min dd 0
    avg dd 0

section .text
    global _start ; Entry point for the linker

_start:
    mov rbx, list
    mov rsi, 0 ; index 
    mov ecx, dword [listSize]
    mov eax, 0
    ; Initilize actual max to be the first element of the list
    mov edx, dword [rbx]
    mov dword [max], edx
    mov dword [min], edx
loopSum:
    ; Add to total
    add eax, dword [rbx+(rsi*4)]
    ; Move the current number into the edx register
    mov edx, dword [rbx+(rsi*4)]
    inc rsi
    mov dword [currNum], edx
    ; Compare the current number with the actual max
    cmp edx, dword [max] ; if currNum <= max
    jle notNewMax ; skip set new max
    mov dword [max], edx
    loop loopSum         
    ; dec ecx 
    ; cmp ecx, 0
    ; jne loopSum (jump to <label> if ecx != 0)
    mov dword [sumTot], eax
    ; Calcul average
    cdq
    idiv dword [listSize]
    mov dword [avg], eax

notNewMax:
    mov dword [min], edx ; set new min
    jmp loopSum

last:
    mov rax, SYS_exit ; Call code for exit
    mov rdi, EXIT_SUCCESS ; Exit program with success
    syscall

