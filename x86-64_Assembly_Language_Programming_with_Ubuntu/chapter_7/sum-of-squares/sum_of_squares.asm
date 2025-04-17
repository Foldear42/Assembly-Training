section .data
    EXIT_SUCCESS equ 0 ; successful operation
    SYS_exit equ 60 ; call code for terminate
    n dd 10
    sum dq 0

section .text
    global _start ; Entry point for the linker

_start:
    ; -------
    ; Compute sum of squares from 1 to n (inclusive)
    ; Approach :
    ;   for (i=1 ; i<=n ; i++)
    ;       sum += i^2

    mov rbx, 1 ; i
    mov ecx, dword [n]
loopSum:
    mov rax, rbx
    mul rax ; i^2
    add qword [sum], rax 
    inc rbx 
    loop loopSum         
    ; dec ecx 
    ; cmp ecx, 0
    ; jne loopSum (jump to <label> if ecx != 0)
last:
    mov rax, SYS_exit ; Call code for exit
    mov rdi, EXIT_SUCCESS ; Exit program with success
    syscall

