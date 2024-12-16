.model small
.stack 100h
.code      ; text segment / simplified text segment,  how function works define on it

main proc  ; main procedure
    
    mov ah,1  ;input func
    int 21h   ;interrupt 21h
    mov bl,al ;by default in al reg, but for future purpose we store in bl 
    
    mov ah,2
    mov dl,10 
    int 21h
    mov dl,13
    int 
    
    mov ah,2
    mov dl,bl ; dl = to print output
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main