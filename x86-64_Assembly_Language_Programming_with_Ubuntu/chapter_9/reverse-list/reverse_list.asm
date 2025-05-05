section .data
    EXIT_SUCCESS    equ         0
    SYS_exit        equ         60
    lst             dq          1, 2, 3, 4, 5
    len_lst         dq          5
section .text
    global _start

_start:
    mov rsi, 0
    mov rcx, qword [len_lst]
lp1: 
    push qword [lst+rsi*8]
    inc rsi
    loop lp1
    mov rsi, 0
    mov rcx, qword [len_lst]
lp2:
    pop qword [lst+rsi*8]
    inc rsi
    loop lp2
    mov rbx, qword [lst]

last:
    mov rax, SYS_exit ; Call code for exit
    mov rdi, EXIT_SUCCESS ; Exit program with success
    syscall
