.model small
.stack 100h
.code

main proc

mov cl,'5'

for:
cmp cl,'0'
je exit:

mov ah,2
mov dl,cl
int 21h

dec cl
jmp for

exit:
mov ah,4ch
int 21h
main endp
end main