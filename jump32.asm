section .data
    msg_equal db "Numbers are equal!", 0xA, 0
    msg_greater db "First number is greater!", 0xA, 0
    msg_less db "First number is less!", 0xA, 0
    num1 dd 42         ; First number to compare (32-bit)
    num2 dd 42         ; Second number to compare (32-bit)

section .text
global _start

_start:
    ; Load numbers into registers for comparison
    mov eax, [num1]    ; Load first number
    mov ebx, [num2]    ; Load second number

    ; Compare the numbers
    cmp eax, ebx

    ; Unconditional jump example
    jmp check_equal    ; Jump to check_equal label

check_equal:
    je equal          
    jg greater         
    jl less           

equal:
    ; Print "Numbers are equal!"
    mov eax, 4         ; Syscall number for write (32-bit)
    mov ebx, 1         ; File descriptor 1 (stdout)
    mov ecx, msg_equal ; Address of message
    mov edx, 17        ; Length of message
    int 0x80           ; Invoke syscall
    jmp exit

greater:
    ; Print "First number is greater!"
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_greater
    mov edx, 22
    int 0x80
    jmp exit

less:
    ; Print "First number is less!"
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_less
    mov edx, 20
    int 0x80
    jmp exit

exit:
    ; Exit the program
    mov eax, 1         ; Syscall number for exit (32-bit)
    mov ebx, 0         ; Exit status 0
    int 0x80           ; Invoke syscall