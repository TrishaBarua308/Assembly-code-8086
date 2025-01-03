.model small
.stack 100h
.data
    sum dw 0          ; Variable to store the sum
    message db "Sum is: $"
.code
main proc
    ; Initialize DS segment
    mov ax, @data
    mov ds, ax

    ; Prompt user for input
    mov ah, 1          ; DOS interrupt to read a single character
    int 21h
    sub al, '0'        ; Convert ASCII to integer
    mov cl, al         ; Store input number in cl 
   

    ; Initialize registers
    xor bx, bx         ; Clear bx (used as sum)
    mov al, 1          ; Start with 1

sum_loop:
    add bl, al         ; Add current number to sum
    inc al             ; Increment number
    cmp al, cl         ; Compare with input number
    ja end_sum         ; Exit loop if al > input number
    jmp sum_loop       ; Repeat loop

end_sum:
    mov sum, bx        ; Store the sum in memory

    ; Display result message
    lea dx, message    ; Load message address
    mov ah, 9          ; DOS interrupt to display string
    int 21h

    ; Convert sum to ASCII and display it
    mov ax, sum        ; Load sum into ax
    xor dx, dx         ; Clear dx (used for remainder)
    mov cx, 10         ; Divisor for division

print_digits:
    xor dx, dx         ; Clear dx before division
    div cx             ; ax / 10 (quotient in ax, remainder in dx)
    add dl, '0'        ; Convert remainder to ASCII
    push dx            ; Push remainder on stack
    test ax, ax        ; Check if quotient is zero
    jnz print_digits   ; Repeat if there are more digits

print_stack:
    pop dx             ; Pop digit from stack
    mov ah, 2          ; DOS interrupt to print character
    int 21h
    cmp sp, 100h       ; Check if stack is empty
    jne print_stack    ; Repeat if more digits

    ; Exit program
    mov ah, 4Ch        ; DOS interrupt for program exit
    int 21h

main endp
end main
