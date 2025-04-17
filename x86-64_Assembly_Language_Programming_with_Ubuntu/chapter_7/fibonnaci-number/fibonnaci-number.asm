section .data
    EXIT_SUCCESS equ 0 ; successful operation
    SYS_exit equ 60 ; call code for terminate
    n dd 10
    ans dq 0
    ppn dq 0
    pn dq 0
    cn dq 1
section .text
    global _start ; Entry point for the linker

_start:
    ; -------
    ; Compute the fibonnaci formula
    ; Approach :
    ;       for(i=1 ; i<n ; i++)
    ;           ppn = pn
    ;           pn = cn
    ;           cn = ppn + pn
    ;       ans = cn
    mov rbx, 1
    mov ecx, dword [n]
fibonnaciFormula:
    mov rax, qword [pn]
    mov qword [ppn], rax
    mov rax, qword [cn]
    mov qword [pn], rax
    mov rax, qword [pn]
    add rax, qword [ppn]
    mov qword [cn], rax
    loop fibonnaciFormula
last:
    mov qword [ans], rax
    mov rax, SYS_exit ; Call code for exit
    mov rdi, EXIT_SUCCESS ; Exit program with success
    syscall

