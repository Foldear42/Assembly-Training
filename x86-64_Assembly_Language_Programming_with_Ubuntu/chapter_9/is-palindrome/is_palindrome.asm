section .data
    EXIT_SUCCESS        equ         0
    SYS_exit            equ         60
    TRUE                equ         1
    FALSE               equ         0
    var_palindrome      db          "kayak", 0
    var_notPalindrome   db          "canoe", 0
    result              db          2
   
section .text
    global _start

_start:
    mov rcx, 5
    mov r12, 0
    mov rax, 0
pushOnStack:
    mov al, byte [var_palindrome+r12]
    movzx rax, al ; Convert into qword for push 
    push rax
    inc r12
    loop pushOnStack
    mov rcx, 5
    mov r12, 0
    mov rax, 0
comparaisonLoop:
    pop rax
    mov bl, byte [var_palindrome+r12]
    movzx rbx, bl
    inc r12
    cmp rax, rbx
    jne notPalindrome
    loop comparaisonLoop
    mov byte [result], TRUE
    jmp last
notPalindrome:
    mov byte [result], FALSE
    jmp last

last:
    mov rax, SYS_exit ; Call code for exit
    mov rdi, EXIT_SUCCESS ; Exit program with success
    syscall
