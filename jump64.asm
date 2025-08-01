section .data
    msg_equal db "Numbers are equal!", 0xA, 0
    msg_greater db "First number is greater!", 0xA, 0
    msg_less db "First number is less!", 0xA, 0
    num1 dq 42         ; First number to compare
    num2 dq 42         ; Second number to compare

section .text
global _start

_start:
    ; Load numbers into registers for comparison
    mov rax, [num1]    
    mov rbx, [num2]    

    ; Compare the numbers
    cmp rax, rbx

    ; Unconditional jump example
    jmp check_equal    ; Jump to check_equal label

check_equal:
    je equal           
    jg greater         
    jl less            

equal:
    ; Print "Numbers are equal!"
    mov rax, 1         ; Syscall number for write
    mov rdi, 1         ; File descriptor 1 (stdout)
    mov rsi, msg_equal ; Address of message
    mov rdx, 17        ; Length of message
    syscall
    jmp exit           ; Unconditional jump to exit

greater:
    ; Print "First number is greater!"
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_greater
    mov rdx, 22
    syscall
    jmp exit

less:
    ; Print "First number is less!"
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_less
    mov rdx, 20
    syscall
    jmp exit

exit:
    ; Exit the program
    mov rax, 60        ; Syscall number for exit
    mov rdi, 0         ; Exit status 0
    syscall