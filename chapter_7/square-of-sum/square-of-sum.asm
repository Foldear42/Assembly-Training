section .data
    EXIT_SUCCESS equ 0 ; successful operation
    SYS_exit equ 60 ; call code for terminate
    n dd 10
    sum dq 0

section .text
    global _start ; Entry point for the linker

_start:
    ; -------
    ; Compute sum of integers from 1 to n and square the value
    ; Approach :
    ;   for (i=1 ; i<=n ; i++)
    ;       sum += i
    ;   sum = sum^2

    mov rbx, 1 ; i
    mov ecx, dword [n]
loopSum:
    mov rax, rbx
    add qword [sum], rax 
    inc rbx 
    loop loopSum
last:
    mov rax, 0
    mov rax, qword [sum]
    mul rax
    mov qword [sum], rax
    mov rax, SYS_exit ; Call code for exit
    mov rdi, EXIT_SUCCESS ; Exit program with success
    syscall