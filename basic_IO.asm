;    Basic input/output 


.model small
.stack 100h
.data

main proc
    mov ah,1
    int 21h
    mov bl,al  ; by default in al, but for future purpose we store al into bl
    
    mov ah,2
    mov dl,10 ; for printing a new line
    int 21h
    mov dl,13 ; for carrige return 
    int 21h
    
    mov ah,2
    mov dl,bl ; output function
    int 21h                    
    
    exit:      ;replace return 0 
    mov ah,4ch
    int 21h
    main endp
end main